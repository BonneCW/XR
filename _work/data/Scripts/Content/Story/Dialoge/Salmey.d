INSTANCE Info_Mod_Salmey_Hi (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Hi_Condition;
	information	= Info_Mod_Salmey_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es denn hier für Bier?";
};

FUNC INT Info_Mod_Salmey_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salmey_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Salmey_Hi_15_00"); //Was gibt es denn hier für Bier?
	AI_Output(self, hero, "Info_Mod_Salmey_Hi_16_01"); //Restbestände vom Khorataer Lagerbier. Unser Brauer hat gerade Probleme, will aber bald wieder liefern.
	AI_Output(self, hero, "Info_Mod_Salmey_Hi_16_02"); //Ansonsten reichlich herkömmliches Klosterbier, mit frischem Quellwasser verdünnt.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Salmey in der Kneipe kann mir Bier verkaufen.");
};

INSTANCE Info_Mod_Salmey_Trade (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Trade_Condition;
	information	= Info_Mod_Salmey_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Dann lass mal das Angebot sehen.";
};

FUNC INT Info_Mod_Salmey_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salmey_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salmey_Trade_Info()
{
	Backup_Questitems();

	//B_GiveTradeInv (self);
	AI_Output(hero, self, "Info_Mod_Salmey_Trade_15_00"); //Dann lass mal das Angebot sehen.
};

INSTANCE Info_Mod_Salmey_Pickpocket (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Pickpocket_Condition;
	information	= Info_Mod_Salmey_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Salmey_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Salmey_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Salmey_Pickpocket);

	Info_AddChoice	(Info_Mod_Salmey_Pickpocket, DIALOG_BACK, Info_Mod_Salmey_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Salmey_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Salmey_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Salmey_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Salmey_Pickpocket);
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

INSTANCE Info_Mod_Salmey_EXIT (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_EXIT_Condition;
	information	= Info_Mod_Salmey_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Salmey_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salmey_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};