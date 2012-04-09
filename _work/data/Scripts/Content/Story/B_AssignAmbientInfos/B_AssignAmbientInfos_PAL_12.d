// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_PAL_12_EXIT_12_00"); //Möge Innos Feuer uns zum Sieg führen!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will ein Paladin werden!";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_PAL_12_JOIN_15_00"); //Ich will ein Paladin werden!
	AI_Output (self, hero, "DIA_PAL_12_JOIN_12_01"); //Du? Dass ich nicht lache! Du gehörst ja noch nicht einmal der Stadtwache an.
	AI_Output (self, hero, "DIA_PAL_12_JOIN_12_02"); //Wenn ich nicht sehen würde, was für ein dummer Bursche du bist, würde ich annehmen, dass du mich beleidigen willst.
	AI_Output (self, hero, "DIA_PAL_12_JOIN_12_03"); //Als Paladine werden nur die Besten der Besten unter den Getreuen des Königs und unseres Herrn Innos aufgenommen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Kommando?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (Mod_Gilde != 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_PAL_12_PEOPLE_15_00"); //Wer hat hier das Kommando?
	AI_Output (self, hero, "DIA_PAL_12_PEOPLE_12_01"); //Das ist der ehrenwerte Lord Hagen. Aber für alle Belange des einfachen Volkes ist Lord Andre zuständig.
	AI_Output (self, hero, "DIA_PAL_12_PEOPLE_12_02"); //Du findest ihn in der Kaserne. Vielleicht hast du Glück und er widmet dir ein paar Minuten seiner kostbaren Zeit.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "Was macht ihr Paladine hier in Khorinis?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_PAL_12_LOCATION_15_00"); //Was macht ihr Paladine hier in Khorinis?
	AI_Output (self, hero, "DIA_PAL_12_LOCATION_12_01"); //Wer solche Fragen stellt, endet ziemlich schnell am Galgen.
	AI_Output (self, hero, "DIA_PAL_12_LOCATION_12_02"); //Wenn Lord Hagen sich EINE Sache nicht leisten kann, dann ist dies, das Wissen über unsere Mission in die Hände von Spionen fallen zu lassen.
	AI_Output (self, hero, "DIA_PAL_12_LOCATION_12_03"); //Also pass besser auf, wonach du fragst.
};

INSTANCE Info_Mod_PAL_12_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PAL_12_Pickpocket_Condition;
	information	= Info_Mod_PAL_12_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_PAL_12_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 700);
};

FUNC VOID Info_Mod_PAL_12_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PAL_12_Pickpocket);

	Info_AddChoice	(Info_Mod_PAL_12_Pickpocket, DIALOG_BACK, Info_Mod_PAL_12_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PAL_12_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PAL_12_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PAL_12_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PAL_12_Pickpocket);
};

FUNC VOID Info_Mod_PAL_12_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_PAL_12_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_12_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
