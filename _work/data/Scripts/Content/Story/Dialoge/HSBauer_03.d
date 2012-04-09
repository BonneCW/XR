INSTANCE Info_Mod_HSBauer_03_Hi (C_INFO)
{
	npc		= Mod_7017_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_03_Hi_Condition;
	information	= Info_Mod_HSBauer_03_Hi_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie geht's voran?";
};

FUNC INT Info_Mod_HSBauer_03_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_03_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_03_Hi_15_00"); //Wie geht's voran?
	AI_Output(self, hero, "Info_Mod_HSBauer_03_Hi_05_01"); //ICH BIN NICHT VERRÜCKT!
	AI_Output(hero, self, "Info_Mod_HSBauer_03_Hi_15_02"); //Das habe ich auch nie behauptet ...
	AI_Output(self, hero, "Info_Mod_HSBauer_03_Hi_05_03"); //Dann ... bist du mein Freund?

	Info_ClearChoices	(Info_Mod_HSBauer_03_Hi);

	Info_AddChoice	(Info_Mod_HSBauer_03_Hi, "ICH BIN NICHT VERRÜCKT!", Info_Mod_HSBauer_03_Hi_C);
	Info_AddChoice	(Info_Mod_HSBauer_03_Hi, "Nein.", Info_Mod_HSBauer_03_Hi_B);
	Info_AddChoice	(Info_Mod_HSBauer_03_Hi, "Ja.", Info_Mod_HSBauer_03_Hi_A);
};

FUNC VOID Info_Mod_HSBauer_03_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_03_Hi_C_15_00"); //ICH BIN NICHT VERRÜCKT!
	AI_Output(self, hero, "Info_Mod_HSBauer_03_Hi_C_05_01"); //Das versteh' ich jetzt nicht ...

	Info_ClearChoices	(Info_Mod_HSBauer_03_Hi);
};

FUNC VOID Info_Mod_HSBauer_03_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_03_Hi_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_HSBauer_03_Hi_B_05_01"); //EISBEIN!

	Info_ClearChoices	(Info_Mod_HSBauer_03_Hi);
};

FUNC VOID Info_Mod_HSBauer_03_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_HSBauer_03_Hi_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_HSBauer_03_Hi_A_05_01"); //SAUERKRAUT!

	Info_ClearChoices	(Info_Mod_HSBauer_03_Hi);
};

INSTANCE Info_Mod_HSBauer_03_Pickpocket (C_INFO)
{
	npc		= Mod_7017_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_03_Pickpocket_Condition;
	information	= Info_Mod_HSBauer_03_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBauer_03_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_HSBauer_03_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBauer_03_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBauer_03_Pickpocket, DIALOG_BACK, Info_Mod_HSBauer_03_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBauer_03_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBauer_03_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBauer_03_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBauer_03_Pickpocket);
};

FUNC VOID Info_Mod_HSBauer_03_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HSBauer_03_Pickpocket);
};

INSTANCE Info_Mod_HSBauer_03_EXIT (C_INFO)
{
	npc		= Mod_7017_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBauer_03_EXIT_Condition;
	information	= Info_Mod_HSBauer_03_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBauer_03_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBauer_03_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};