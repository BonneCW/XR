INSTANCE Info_Mod_Jason_Aabid (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_Aabid_Condition;
	information	= Info_Mod_Jason_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Aabid wegen ...";
};

FUNC INT Info_Mod_Jason_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jason_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_00"); //Ich komme von Aabid wegen ...
	AI_Output(self, hero, "Info_Mod_Jason_Aabid_06_01"); //(wütend) Psssssssssst!
	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_02"); //(verwirrt) Was ...?
	AI_Output(self, hero, "Info_Mod_Jason_Aabid_06_03"); //(verärgert) Hier ist es und nun verschwinde!

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Jason_Aabid_15_04"); //Ähm ... ok.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Jason war ziemlich komisch drauf und gab mir ohne viele Worte sein Paket. Woran liegt's nur?");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Jason_Pickpocket (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_Pickpocket_Condition;
	information	= Info_Mod_Jason_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Jason_Pickpocket_Condition()
{
	C_Beklauen	(65, ItMi_Joint, 2);
};

FUNC VOID Info_Mod_Jason_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

	Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_BACK, Info_Mod_Jason_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jason_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jason_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);
};

FUNC VOID Info_Mod_Jason_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Jason_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

		Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Jason_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Jason_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Jason_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Jason_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Jason_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Jason_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Jason_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Jason_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Jason_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Jason_EXIT (C_INFO)
{
	npc		= Mod_1178_MIL_Jason_NW;
	nr		= 1;
	condition	= Info_Mod_Jason_EXIT_Condition;
	information	= Info_Mod_Jason_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jason_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jason_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};