INSTANCE Info_Mod_HSBauer_02_Hi (C_INFO)
{
	npc		= Mod_7016_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_02_Hi_Condition;
	information	= Info_Mod_HSBauer_02_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Na, wie geht's?";
};

FUNC INT Info_Mod_HSBauer_02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_02_Hi_15_00"); //Na, wie geht's?
	AI_Output(self, hero, "Info_Mod_HSBauer_02_Hi_05_01"); //Ich und meine kleinen Zwergenfreunde spielen eine Runde Poker.
	AI_Output(hero, self, "Info_Mod_HSBauer_02_Hi_15_02"); //Und ... wer gewinnt?
	AI_Output(self, hero, "Info_Mod_HSBauer_02_Hi_05_03"); //Der mächtige Alien-Zwerg. Er blufft am besten ...
};

INSTANCE Info_Mod_HSBauer_02_Pickpocket (C_INFO)
{
	npc		= Mod_7016_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_02_Pickpocket_Condition;
	information	= Info_Mod_HSBauer_02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBauer_02_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_HSBauer_02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBauer_02_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBauer_02_Pickpocket, DIALOG_BACK, Info_Mod_HSBauer_02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBauer_02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBauer_02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBauer_02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBauer_02_Pickpocket);
};

FUNC VOID Info_Mod_HSBauer_02_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HSBauer_02_Pickpocket);
};

INSTANCE Info_Mod_HSBauer_02_EXIT (C_INFO)
{
	npc		= Mod_7016_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_02_EXIT_Condition;
	information	= Info_Mod_HSBauer_02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBauer_02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};