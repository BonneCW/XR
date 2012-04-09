INSTANCE Info_Mod_Ferros_Hi (C_INFO)
{
	npc		= Mod_7523_JG_Ferros_JL;
	nr		= 1;
	condition	= Info_Mod_Ferros_Hi_Condition;
	information	= Info_Mod_Ferros_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ein Schmied hier im Lager? Braucht´s das?";
};

FUNC INT Info_Mod_Ferros_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferros_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferros_Hi_15_00"); //Ein Schmied hier im Lager? Braucht´s das?
	AI_Output(self, hero, "Info_Mod_Ferros_Hi_06_01"); //Eigentlich nicht. Ich richte ab und zu ein Schwert oder schärfe eins.
	AI_Output(self, hero, "Info_Mod_Ferros_Hi_06_02"); //Manchmal mache ich  Sachen aus Metall oder repariere sie.
	AI_Output(hero, self, "Info_Mod_Ferros_Hi_15_03"); //Und das ist alles?
	AI_Output(self, hero, "Info_Mod_Ferros_Hi_06_04"); //Na ja, manchmal kommt einer und sagt: Ferros, ich hab nix zu tun, laß uns trainieren.
	AI_Output(self, hero, "Info_Mod_Ferros_Hi_06_05"); //Dann zeig ich ihm, wie er stärker wird.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(hero, self, "Info_Mod_Ferros_Hi_15_06"); //Könntest du mir auch zeigen, wie ich stärker werde?
		AI_Output(self, hero, "Info_Mod_Ferros_Hi_06_07"); //Sicher kann ich das.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_WALDIS, "Bei Ferros kann ich meine Stärke verbessern.");
	};
};

INSTANCE Info_Mod_Ferros_Lernen (C_INFO)
{
	npc		= Mod_7523_JG_Ferros_JL;
	nr		= 1;
	condition	= Info_Mod_Ferros_Lernen_Condition;
	information	= Info_Mod_Ferros_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will stärker werden!";
};

FUNC INT Info_Mod_Ferros_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferros_Hi))
	&& (hero.attribute[ATR_STRENGTH] < 150)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ferros_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Ferros_Lernen_15_00"); //Ich will stärker werden!

	Info_ClearChoices	(Info_Mod_Ferros_Lernen);

	Info_AddChoice	(Info_Mod_Ferros_Lernen, DIALOG_BACK, Info_Mod_Ferros_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_5);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_1);
};

FUNC VOID Info_Mod_Ferros_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Ferros_Lernen);
};

FUNC VOID Info_Mod_Ferros_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 150);
	
	Info_ClearChoices	(Info_Mod_Ferros_Lernen);

	Info_AddChoice	(Info_Mod_Ferros_Lernen, DIALOG_BACK, Info_Mod_Ferros_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_5);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_1);
};

FUNC VOID Info_Mod_Ferros_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 150);
	
	Info_ClearChoices	(Info_Mod_Ferros_Lernen);

	Info_AddChoice	(Info_Mod_Ferros_Lernen, DIALOG_BACK, Info_Mod_Ferros_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_5);
	Info_AddChoice	(Info_Mod_Ferros_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Ferros_Lernen_1);
};

INSTANCE Info_Mod_Ferros_Pickpocket (C_INFO)
{
	npc		= Mod_7523_JG_Ferros_JL;
	nr		= 1;
	condition	= Info_Mod_Ferros_Pickpocket_Condition;
	information	= Info_Mod_Ferros_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ferros_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Ferros_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ferros_Pickpocket);

	Info_AddChoice	(Info_Mod_Ferros_Pickpocket, DIALOG_BACK, Info_Mod_Ferros_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ferros_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ferros_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ferros_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ferros_Pickpocket);
};

FUNC VOID Info_Mod_Ferros_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ferros_Pickpocket);
};

INSTANCE Info_Mod_Ferros_EXIT (C_INFO)
{
	npc		= Mod_7523_JG_Ferros_JL;
	nr		= 1;
	condition	= Info_Mod_Ferros_EXIT_Condition;
	information	= Info_Mod_Ferros_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ferros_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ferros_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};