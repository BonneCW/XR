INSTANCE Info_Mod_Kuno_Hi (C_INFO)
{
	npc		= Mod_4026_NONE_Kuno_NW;
	nr		= 1;
	condition	= Info_Mod_Kuno_Hi_Condition;
	information	= Info_Mod_Kuno_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Handelst du?";
};

FUNC INT Info_Mod_Kuno_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kuno_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Kuno_Hi_15_00"); //Handelst du?
	AI_Output(self, hero, "Info_Mod_Kuno_Hi_09_01"); //(leicht verrückt) Nicht an allen Tagen, nicht mit jeder Ware. Hast du was Lustiges zum Spielen oder zum Essen? Hast du was Außergewöhnliches?
	AI_Output(self, hero, "Info_Mod_Kuno_Hi_09_02"); //Dann können wir handeln, verhandeln, aushandeln, behandeln ... (nuschelt Unverständliches vor sich hin)
};

INSTANCE Info_Mod_Kuno_Pickpocket (C_INFO)
{
	npc		= Mod_4026_NONE_Kuno_NW;
	nr		= 1;
	condition	= Info_Mod_Kuno_Pickpocket_Condition;
	information	= Info_Mod_Kuno_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Kuno_Pickpocket_Condition()
{
	C_Beklauen	(54, ItMi_Gold, 132);
};

FUNC VOID Info_Mod_Kuno_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kuno_Pickpocket);

	Info_AddChoice	(Info_Mod_Kuno_Pickpocket, DIALOG_BACK, Info_Mod_Kuno_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kuno_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kuno_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kuno_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kuno_Pickpocket);
};

FUNC VOID Info_Mod_Kuno_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kuno_Pickpocket);
};

INSTANCE Info_Mod_Kuno_EXIT (C_INFO)
{
	npc		= Mod_4026_NONE_Kuno_NW;
	nr		= 1;
	condition	= Info_Mod_Kuno_EXIT_Condition;
	information	= Info_Mod_Kuno_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kuno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};