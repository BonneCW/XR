// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will ein Magier werden!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (Mod_Gilde == 6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_NOV_3_JOIN_15_00"); //Ich will ein Magier werden!
	AI_Output (self, hero, "DIA_NOV_3_JOIN_03_01"); //Das wollen viele der Novizen. Aber nur den wenigsten ist es bestimmt, als Erwählte die Chance zu bekommen, in den Kreis des Feuers aufgenommen zu werden.
	AI_Output (self, hero, "DIA_NOV_3_JOIN_03_02"); //Ein Magier vom Kreis des Feuers zu sein, ist die höchste Ehre, die dir in unserem Orden zuteil werden kann.
	AI_Output (self, hero, "DIA_NOV_3_JOIN_03_03"); //Du wirst hart dafür arbeiten müssen, um deine Chance zu bekommen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer führt dieses Kloster?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_NOV_3_PEOPLE_15_00"); //Wer führt dieses Kloster?
	AI_Output (self, hero, "DIA_NOV_3_PEOPLE_03_01"); //Wir Novizen dienen den Magiern vom Kreis des Feuers. Diese wiederum werden angeführt vom hohen Rat der Feuermagier, der aus den drei mächtigsten Feuermagiern von Khorinis besteht.
	AI_Output (self, hero, "DIA_NOV_3_PEOPLE_03_02"); //Aber für alle Belange der Novizen ist Parlan zuständig. Er ist immer im Hof und überwacht die Arbeit der Novizen.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Was kannst du mir über dieses Kloster erzählen?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_NOV_3_LOCATION_15_00"); //Was kannst du mir über dieses Kloster erzählen?
	AI_Output (self, hero, "DIA_NOV_3_LOCATION_03_01"); //Wir bauen uns hier unsere bescheidene Verpflegung selbst an. Wir züchten Schafe und keltern Wein.
	AI_Output (self, hero, "DIA_NOV_3_LOCATION_03_02"); //Es gibt eine Bibliothek, aber deren Nutzung ist den Magiern und den ausgesuchten Novizen vorbehalten.
	AI_Output (self, hero, "DIA_NOV_3_LOCATION_03_03"); //Wir anderen Novizen kümmern uns in erster Linie darum, dass es den Magiern vom Kreis des Feuers an nichts fehlt.
};

INSTANCE Info_Mod_NOV_3_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_NOV_3_Pickpocket_Condition;
	information	= Info_Mod_NOV_3_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_NOV_3_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_NOV_3_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_NOV_3_Pickpocket);

	Info_AddChoice	(Info_Mod_NOV_3_Pickpocket, DIALOG_BACK, Info_Mod_NOV_3_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_NOV_3_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_NOV_3_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_NOV_3_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_NOV_3_Pickpocket);
};

FUNC VOID Info_Mod_NOV_3_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_NOV_3_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_NOV_3_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
