INSTANCE Info_Mod_Schoeppe_01_Hi (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_Hi_Condition;
	information	= Info_Mod_Schoeppe_01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Magst du deinen Beruf?";
};

FUNC INT Info_Mod_Schoeppe_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Schoeppe_01_Hi_15_00"); //Magst du deinen Beruf?
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_01"); //Beruf? Nein, ich mache das ehrenamtlich, um dem größeren Wohl zu dienen.
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_02"); //Ich persönlich hasse ja diese stinkenden Menschen, die stinkenden Verbrechen und die stinkenden Ausreden.
	AI_Output(self, hero, "Info_Mod_Schoeppe_01_Hi_09_03"); //Aber ich muss dafür sorgen, dass wir in Zukunft von solchem Pack verschont bleiben.
};

INSTANCE Info_Mod_Schoeppe_01_Pickpocket (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_Pickpocket_Condition;
	information	= Info_Mod_Schoeppe_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Schoeppe_01_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);

	Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_BACK, Info_Mod_Schoeppe_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Schoeppe_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Schoeppe_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);
};

FUNC VOID Info_Mod_Schoeppe_01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Schoeppe_01_Pickpocket);
};

INSTANCE Info_Mod_Schoeppe_01_EXIT (C_INFO)
{
	npc		= Mod_7372_OUT_Schoeppe_REL;
	nr		= 1;
	condition	= Info_Mod_Schoeppe_01_EXIT_Condition;
	information	= Info_Mod_Schoeppe_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schoeppe_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schoeppe_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};