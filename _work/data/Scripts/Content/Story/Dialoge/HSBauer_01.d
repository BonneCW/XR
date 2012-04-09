INSTANCE Info_Mod_HSBauer_01_Hi (C_INFO)
{
	npc		= Mod_7015_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_01_Hi_Condition;
	information	= Info_Mod_HSBauer_01_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was baut ihr da an?";
};

FUNC INT Info_Mod_HSBauer_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_01_Hi_15_00"); //Was baut ihr da an?
	AI_Output(self, hero, "Info_Mod_HSBauer_01_Hi_05_01"); //Oma?
	AI_Output(hero, self, "Info_Mod_HSBauer_01_Hi_15_02"); //War das eine Antwort oder eine Frage?
	AI_Output(self, hero, "Info_Mod_HSBauer_01_Hi_05_03"); //Zu fuﬂ ...
	AI_Output(hero, self, "Info_Mod_HSBauer_01_Hi_15_04"); //...
};

INSTANCE Info_Mod_HSBauer_01_Pickpocket (C_INFO)
{
	npc		= Mod_7015_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_01_Pickpocket_Condition;
	information	= Info_Mod_HSBauer_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBauer_01_Pickpocket_Condition()
{
	C_Beklauen	(13, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_HSBauer_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBauer_01_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBauer_01_Pickpocket, DIALOG_BACK, Info_Mod_HSBauer_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBauer_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBauer_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBauer_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBauer_01_Pickpocket);
};

FUNC VOID Info_Mod_HSBauer_01_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HSBauer_01_Pickpocket);
};

INSTANCE Info_Mod_HSBauer_01_EXIT (C_INFO)
{
	npc		= Mod_7015_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_01_EXIT_Condition;
	information	= Info_Mod_HSBauer_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBauer_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};