// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_BAU_16_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_BAU_16_EXIT_Condition;
	information	= DIA_BAU_16_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BAU_16_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_BAU_16_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_BAU_16_JOIN_Condition;
	information	= DIA_BAU_16_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will mehr über die Söldner wissen!";
};                       

FUNC INT DIA_BAU_16_JOIN_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_BAU_16_JOIN_15_00"); //Ich will mehr über die Söldner wissen!
	AI_Output (self, hero, "DIA_BAU_16_JOIN_16_01"); //Sie lungern den ganzen Tag auf dem Hof rum, prügeln sich hin und wieder mal und finden das auch noch lustig.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_BAU_16_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_BAU_16_PEOPLE_Condition;
	information	= DIA_BAU_16_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_BAU_16_PEOPLE_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_BAU_16_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, hero, "DIA_BAU_16_PEOPLE_16_01"); //Onar ist der Boss über die ganzen Höfe, aber jeder der kleinen Höfe hat nochmal einen Pächter, der dafür sorgt, dass auf seinem Hof alles funktioniert.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_BAU_16_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_BAU_16_LOCATION_Condition;
	information	= DIA_BAU_16_LOCATION_Info;
	permanent	= TRUE;
	description = "Was kannst du mir über die Gegend hier erzählen?";
};                       

FUNC INT DIA_BAU_16_LOCATION_Condition()
{
	if (Npc_GetDistToWP(self, "BIGFARM") < 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_BAU_16_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_BAU_16_LOCATION_15_00"); //Was kannst du mir über die Gegend hier erzählen?
	AI_Output (self, hero, "DIA_BAU_16_LOCATION_16_01"); //Es gibt drei Höfe hier. Onars im Osten und Sekobs im Norden das Tals.
	AI_Output (self, hero, "DIA_BAU_16_LOCATION_16_02"); //Im Südwesten gibt es einen Aufgang zur Hochebene. Dort liegt Bengars Hof.
};

INSTANCE Info_Mod_BAU_16_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BAU_16_Pickpocket_Condition;
	information	= Info_Mod_BAU_16_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20_Female;
};

FUNC INT Info_Mod_BAU_16_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);

	Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_BACK, Info_Mod_BAU_16_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BAU_16_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BAU_16_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);
};

FUNC VOID Info_Mod_BAU_16_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_BAU_16_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_BAU_16 (var c_NPC slf)
{
	DIA_BAU_16_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BAU_16_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
