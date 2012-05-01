INSTANCE Info_Mod_Baecker_August (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_August_Condition;
	information	= Info_Mod_Baecker_August_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast Fladenbrot? (10 Gold)";
};

FUNC INT Info_Mod_Baecker_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baecker_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Baecker_August_15_00"); //Du hast Fladenbrot?
	AI_Output(self, hero, "Info_Mod_Baecker_August_01_01"); //Gewiss. Eine Spezialität meines Hauses.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 10);

	CreateInvItems	(hero, ItFo_Fladenbrot, 1);

	B_ShowGivenThings	("10 Gold gegeben und Fladenbrot erhalten");

	B_LogEntry	(TOPIC_MOD_JG_AUGUST, "Ich hab das Fladenbrot vom Bäcker.");
};

INSTANCE Info_Mod_Baecker_Pickpocket (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_Pickpocket_Condition;
	information	= Info_Mod_Baecker_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Baecker_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Baecker_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baecker_Pickpocket);

	Info_AddChoice	(Info_Mod_Baecker_Pickpocket, DIALOG_BACK, Info_Mod_Baecker_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baecker_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baecker_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baecker_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baecker_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Baecker_EXIT (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_EXIT_Condition;
	information	= Info_Mod_Baecker_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baecker_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baecker_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};