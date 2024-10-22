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
	AI_Output(self, hero, "Info_Mod_Anna_Hi_12_01"); //Es geht schon. Danke, dass du mir geholfen hast.
	AI_Output(self, hero, "Info_Mod_Anna_Hi_12_02"); //Wenn du die Fähigkeiten einer Hexe in Anspruch nehmen magst, komm in Zukunft zu mir, ja?

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
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anna_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 21);
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
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anna_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anna_Pickpocket);

		Info_AddChoice	(Info_Mod_Anna_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anna_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anna_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anna_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anna_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anna_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anna_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anna_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anna_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anna_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Anna_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anna_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anna_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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