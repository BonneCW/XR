// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_8_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_8_EXIT_Condition;
	information	= DIA_NOV_8_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_8_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_8_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_8_JOIN_Condition;
	information	= DIA_NOV_8_JOIN_Info;
	permanent	= TRUE;
	description = "Was muß ich tun, um Magier zu werden?";
};                       

FUNC INT DIA_NOV_8_JOIN_Condition()
{
	if (Mod_Gilde == 6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_8_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_NOV_8_JOIN_15_00"); //Was muß ich tun, um Magier zu werden?
	AI_Output (self, hero, "DIA_NOV_8_JOIN_08_01"); //Ein Erwählter Innos' wirst du erst, wenn die Hohen Magier des Feuers es zulassen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_8_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_8_PEOPLE_Condition;
	information	= DIA_NOV_8_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer leitet das Kloster?";
};                       

FUNC INT DIA_NOV_8_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_NOV_8_PEOPLE_15_00"); //Wer leitet das Kloster?
	AI_Output (self, hero, "DIA_NOV_8_PEOPLE_08_01"); //Der hohe Rat der Feuermagier. Er wird gebildet von den drei mächtigsten Magiern unseres Ordens. Sie beraten sich täglich in der Kirche.
	AI_Output (self, hero, "DIA_NOV_8_PEOPLE_08_02"); //Die Erwählten Innos' sind allesamt Magier. Innos hat sie mit dieser Gabe ausgestattet, damit sie seinen Willen auf Erden durchsetzen können.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_8_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_8_LOCATION_Condition;
	information	= DIA_NOV_8_LOCATION_Info;
	permanent	= TRUE;
	description = "Erzähl mir etwas über dieses Kloster.";
};                       

FUNC INT DIA_NOV_8_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_8_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_NOV_8_LOCATION_15_00"); //Erzähl mir etwas über dieses Kloster.
	AI_Output (self, hero, "DIA_NOV_8_LOCATION_08_01"); //Es ist uralt. Es stammt noch aus der Zeit vor Rhobar, dem Ersten.
	AI_Output (self, hero, "DIA_NOV_8_LOCATION_08_02"); //Unter dem Kloster sind die Katakomben. Sie erstrecken sich bis tief in den Berg hinein.
	AI_Output (self, hero, "DIA_NOV_8_LOCATION_08_03"); //Aber zur untersten Ebene haben nur die höchsten Geweihten Innos' Zutritt.
};

INSTANCE Info_Mod_NOV_8_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_NOV_8_Pickpocket_Condition;
	information	= Info_Mod_NOV_8_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_NOV_8_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_NOV_8_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_NOV_8_Pickpocket);

	Info_AddChoice	(Info_Mod_NOV_8_Pickpocket, DIALOG_BACK, Info_Mod_NOV_8_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_NOV_8_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_NOV_8_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_NOV_8_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_NOV_8_Pickpocket);
};

FUNC VOID Info_Mod_NOV_8_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_NOV_8_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_8 (var c_NPC slf)
{
	DIA_NOV_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_8_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_8_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_NOV_8_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
