INSTANCE Info_Mod_Anna_Hi (C_INFO)
{
	npc		= Mod_7376_OUT_Anna_REL;
	nr		= 1;
	condition	= Info_Mod_Anna_Hi_Condition;
	information	= Info_Mod_Anna_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht es dir?";
};

FUNC INT Info_Mod_Anna_Hi_Condition()
{
	if (Mod_AnnaQuest == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anna_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Anna_Hi_15_00"); //Wie geht es dir?
	AI_Output(self, hero, "Info_Mod_Anna_Hi_16_01"); //Es geht schon. Danke, dass du mir geholfen hast.
	AI_Output(self, hero, "Info_Mod_Anna_Hi_16_02"); //Wenn du die Fähigkeiten einer Hexe in Anspruch nehmen magst, komm in Zukunft zu mir, ja?

	B_GivePlayerXP	(50);

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Anna kann mir Alchemiezubehör verkaufen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Anna_Trade (C_INFO)
{
	npc		= Mod_7376_OUT_Anna_REL;
	nr		= 1;
	condition	= Info_Mod_Anna_Trade_Condition;
	information	= Info_Mod_Anna_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anna_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anna_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anna_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anna_Pickpocket (C_INFO)
{
	npc		= Mod_7376_OUT_Anna_REL;
	nr		= 1;
	condition	= Info_Mod_Anna_Pickpocket_Condition;
	information	= Info_Mod_Anna_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Anna_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Anna_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anna_Pickpocket);

	Info_AddChoice	(Info_Mod_Anna_Pickpocket, DIALOG_BACK, Info_Mod_Anna_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anna_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anna_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anna_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anna_Pickpocket);
};

FUNC VOID Info_Mod_Anna_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Anna_Pickpocket);
};

INSTANCE Info_Mod_Anna_EXIT (C_INFO)
{
	npc		= Mod_7376_OUT_Anna_REL;
	nr		= 1;
	condition	= Info_Mod_Anna_EXIT_Condition;
	information	= Info_Mod_Anna_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anna_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anna_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};