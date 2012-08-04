INSTANCE Info_Mod_Bobo_Unheil (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_Unheil_Condition;
	information	= Info_Mod_Bobo_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Irgendwelche besonderen Vorkommnisse und Auffälligkeiten in letzter Zeit?";
};

FUNC INT Info_Mod_Bobo_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bobo_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Bobo_Unheil_15_00"); //Irgendwelche besonderen Vorkommnisse und Auffälligkeiten in letzter Zeit?
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_01"); //Du bist mir gut. Alle spielen verrückt, seit dem diese Ungetüme auf den Bauernhöfen ihr Unwesen treiben.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_02"); //Dazu noch dieses Rudel schwarzer Wölfe, welches sich immer wieder nachts  in der Nähe unseres Hofes im Wald herumtreibt. Das kann schon manchem ordentlich zusetzen.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_03"); //Vorallem die Frauen auf dem Hof leiden darunter. Maria ist ziemlich krank geworden – die ganzen Sorgen wahrscheinlich – und Elena geht jeden Abend, wenn es dunkel wird wohl zu Cord, um vermutlich Schutz zu suchen.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_04"); //Er ist ja ein zäher Kämpfer. Naja, wo soll das ganze nur enden ...

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Von Bobo erfuhr ich, dass ein Rudel schwarzer Wölfe nachts seit einiger Zeit in der Nähe des Hofes sein Unwesen treibt.");
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Elena sucht nachts immer Schutz bei Cord.");

	if (!Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Maria ist seit einigen Tagen stark erkrankt.");
	};

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Bobo_Pickpocket (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_Pickpocket_Condition;
	information	= Info_Mod_Bobo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bobo_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 55);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

	Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_BACK, Info_Mod_Bobo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bobo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

		Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bobo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bobo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bobo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bobo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bobo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bobo_EXIT (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_EXIT_Condition;
	information	= Info_Mod_Bobo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bobo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bobo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};