INSTANCE Info_Mod_Woron_Hey (C_INFO)
{
	npc		= Mod_7521_JG_Woron_JL;
	nr		= 1;
	condition	= Info_Mod_Woron_Hey_Condition;
	information	= Info_Mod_Woron_Hey_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Woron_Hey_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Woron_Hey_Info()
{
	AI_Output(self, hero, "Info_Mod_Woron_Hey_06_00"); //Neu hier?
	AI_Output(hero, self, "Info_Mod_Woron_Hey_15_01"); //Sieht so aus ...
	AI_Output(self, hero, "Info_Mod_Woron_Hey_06_02"); //Nun, wenn du Waldläufer bist, kann ich dir einige unserer Waffen verkaufen.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_WALDIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_WALDIS, "Woron wird mir Waffen verkaufen, sobald ich Waldläufer bin.");
};

INSTANCE Info_Mod_Woron_Trade (C_INFO)
{
	npc		= Mod_7521_JG_Woron_JL;
	nr		= 1;
	condition	= Info_Mod_Woron_Trade_Condition;
	information	= Info_Mod_Woron_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Woron_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Woron_Hey))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Woron_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Woron_Pickpocket (C_INFO)
{
	npc		= Mod_7521_JG_Woron_JL;
	nr		= 1;
	condition	= Info_Mod_Woron_Pickpocket_Condition;
	information	= Info_Mod_Woron_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Woron_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Woron_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Woron_Pickpocket);

	Info_AddChoice	(Info_Mod_Woron_Pickpocket, DIALOG_BACK, Info_Mod_Woron_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Woron_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Woron_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Woron_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Woron_Pickpocket);
};

FUNC VOID Info_Mod_Woron_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Woron_Pickpocket);
};

INSTANCE Info_Mod_Woron_EXIT (C_INFO)
{
	npc		= Mod_7521_JG_Woron_JL;
	nr		= 1;
	condition	= Info_Mod_Woron_EXIT_Condition;
	information	= Info_Mod_Woron_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Woron_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Woron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};