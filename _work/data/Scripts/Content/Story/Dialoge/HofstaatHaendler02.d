INSTANCE Info_Mod_HofstaatHaendler02_Hi (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_Hi_Condition;
	information	= Info_Mod_HofstaatHaendler02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gehört dieser Laden dir?";
};

FUNC INT Info_Mod_HofstaatHaendler02_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatHaendler02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatHaendler02_Hi_15_00"); //Gehört dieser Laden dir?
	AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_01"); //Ja.
	AI_Output(hero, self, "Info_Mod_HofstaatHaendler02_Hi_15_02"); //Gib ihn mir.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_03"); //Okay.

		Mod_Sekte_TraderHaus02 = 1;

		Mod_HS_DarfZuKing = 1;

		B_StartOtherRoutine	(Mod_7020_HS_Tuersteher_REL, "DARFREIN");

		Mod_7020_HS_Tuersteher_REL.aivar[AIV_Passgate] = TRUE;

		B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Ich habe jetzt das Haus eines Händlers. Ich sollte nun am Türsteher vorbei kommen.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_HofstaatHaendler02_Hi_01_04"); //Nein, lieber nicht.
	};
};

INSTANCE Info_Mod_HofstaatHaendler02_Pickpocket (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_Pickpocket_Condition;
	information	= Info_Mod_HofstaatHaendler02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_HofstaatHaendler02_Pickpocket_Condition()
{
	C_Beklauen	(69, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatHaendler02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatHaendler02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatHaendler02_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatHaendler02_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatHaendler02_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatHaendler02_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatHaendler02_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatHaendler02_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatHaendler02_EXIT (C_INFO)
{
	npc		= Mod_7273_HS_Haendler_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHaendler02_EXIT_Condition;
	information	= Info_Mod_HofstaatHaendler02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatHaendler02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatHaendler02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};