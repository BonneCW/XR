INSTANCE Info_Mod_Raeuber01_Hi (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Hi_Condition;
	information	= Info_Mod_Raeuber01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft die Arbeit?";
};

FUNC INT Info_Mod_Raeuber01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber01_Hi_15_00"); //Wie läuft die Arbeit?
	AI_Output(self, hero, "Info_Mod_Raeuber01_Hi_08_01"); //Beschissen. Hab noch nie so einen dummen Anführer gehabt.
};

INSTANCE Info_Mod_Raeuber01_Frauenkleider (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Frauenkleider_Condition;
	information	= Info_Mod_Raeuber01_Frauenkleider_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hälst du von Melvins Kleidern?";
};

FUNC INT Info_Mod_Raeuber01_Frauenkleider_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber01_Frauenkleider_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber01_Frauenkleider_15_00"); //Was hälst du von Melvins Kleidern?
	AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider_08_01"); //Hab noch nie so was Dummes gesehen. Passt zu ihm.
	AI_Output(hero, self, "Info_Mod_Raeuber01_Frauenkleider_15_02"); //Hast du ihm das schon gesagt?
	AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider_08_03"); //Nee. Ist mir zu dumm.
};

INSTANCE Info_Mod_Raeuber01_Frauenkleider2 (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Frauenkleider2_Condition;
	information	= Info_Mod_Raeuber01_Frauenkleider2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sagst du es ihm für 10 Goldmünzen?";
};

FUNC INT Info_Mod_Raeuber01_Frauenkleider2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Frauenkleider))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 10)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Frauenkleider3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber01_Frauenkleider2_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber01_Frauenkleider2_15_00"); //Sagst du es ihm für 10 Goldmünzen?
	AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider2_08_01"); //Mach ich glatt.

	B_GiveInvItems	(hero, self, ItMi_Gold, 10);

	AI_StandUP	(self);

	AI_GotoNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_TurnToNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider2_08_02"); //Weißt du, wie bescheuert du in den Kleidern aussiehst?

	Mod_REL_Frauenkleider01 = 1;

	if (Mod_REL_Frauenkleider01 == 1)
	&& (Mod_REL_Frauenkleider02 == 1)
	&& (Mod_REL_Frauenkleider03 == 1)
	{
		B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Nun sollte Melvin weichgeklopft sein.");
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber01_Frauenkleider3 (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Frauenkleider3_Condition;
	information	= Info_Mod_Raeuber01_Frauenkleider3_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Feilschen) Würdest du ihm das sagen?";
};

FUNC INT Info_Mod_Raeuber01_Frauenkleider3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Frauenkleider))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Frauenkleider2))
	&& (Mod_REL_Frauenkleider01 == 0)
	&& (Mod_Verhandlungsgeschick > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber01_Frauenkleider3_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber01_Frauenkleider3_15_00"); //Würdest du ihm das sagen?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider3_08_01"); //Joa, klar.

		AI_GotoNpc	(self, Mod_7505_BDT_Melvin_REL);

		AI_TurnToNpc	(self, Mod_7505_BDT_Melvin_REL);

		AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider2_08_02"); //Weißt du, wie bescheuert du in den Kleidern aussiehst?

		Mod_REL_Frauenkleider01 = 1;

		B_RaiseHandelsgeschick (3);

		if (Mod_REL_Frauenkleider01 == 1)
		&& (Mod_REL_Frauenkleider02 == 1)
		&& (Mod_REL_Frauenkleider03 == 1)
		{
			B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Nun sollte Melvin weichgeklopft sein.");
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Raeuber01_Frauenkleider3_08_02"); //Wenn du so ein Interesse daran hast, zahlst du doch sicher auch.
	};
};

INSTANCE Info_Mod_Raeuber01_Bierhexen (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Bierhexen_Condition;
	information	= Info_Mod_Raeuber01_Bierhexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raeuber01_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Melvin_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber01_Bierhexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Raeuber01_Bierhexen_08_00"); //Ich war's nicht!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber01_Pickpocket (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_Pickpocket_Condition;
	information	= Info_Mod_Raeuber01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Raeuber01_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 25);
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);

	Info_AddChoice	(Info_Mod_Raeuber01_Pickpocket, DIALOG_BACK, Info_Mod_Raeuber01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raeuber01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raeuber01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);

		Info_AddChoice	(Info_Mod_Raeuber01_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raeuber01_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raeuber01_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raeuber01_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raeuber01_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raeuber01_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raeuber01_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raeuber01_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raeuber01_EXIT (C_INFO)
{
	npc		= Mod_7510_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber01_EXIT_Condition;
	information	= Info_Mod_Raeuber01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raeuber01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};