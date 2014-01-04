INSTANCE Info_Mod_Raeuber03_Hi (C_INFO)
{
	npc		= Mod_7512_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber03_Hi_Condition;
	information	= Info_Mod_Raeuber03_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Raeuber03_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber03_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber03_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Raeuber03_Hi_06_01"); //Zieh Leine!
};

INSTANCE Info_Mod_Raeuber03_Frauenkleider (C_INFO)
{
	npc		= Mod_7512_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber03_Frauenkleider_Condition;
	information	= Info_Mod_Raeuber03_Frauenkleider_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, dass Melvin verrückt ist?";
};

FUNC INT Info_Mod_Raeuber03_Frauenkleider_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber03_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber03_Frauenkleider_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber03_Frauenkleider_15_00"); //Weißt du, dass Melvin verrückt ist?
	AI_Output(self, hero, "Info_Mod_Raeuber03_Frauenkleider_06_01"); //Wegen seinem Kleid? Ich find's eigentlich ganz gut.
	AI_Output(hero, self, "Info_Mod_Raeuber03_Frauenkleider_15_02"); //Du weißt aber, dass Kleider normalerweise von Frauen getragen werden?
	AI_Output(self, hero, "Info_Mod_Raeuber03_Frauenkleider_06_03"); //Laber nich! Das würd ja bedeuten ...
	AI_Output(hero, self, "Info_Mod_Raeuber03_Frauenkleider_15_04"); //Du solltest ihn sofort davon abbringen.
	AI_Output(self, hero, "Info_Mod_Raeuber03_Frauenkleider_06_05"); //Und wie!

	AI_StandUp	(self);

	AI_GotoNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_TurnToNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_Output(self, hero, "Info_Mod_Raeuber03_Frauenkleider_06_06"); //Normalerweise tragen Frauen Kleider!

	Mod_REL_Frauenkleider03 = 1;

	if (Mod_REL_Frauenkleider01 == 1)
	&& (Mod_REL_Frauenkleider02 == 1)
	&& (Mod_REL_Frauenkleider03 == 1)
	{
		B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Nun sollte Melvin weichgeklopft sein.");
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber03_Bierhexen (C_INFO)
{
	npc		= Mod_7512_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber03_Bierhexen_Condition;
	information	= Info_Mod_Raeuber03_Bierhexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raeuber03_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber02_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber03_Bierhexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Raeuber03_Bierhexen_06_00"); //Das war doch Leonhard.
	AI_Output(hero, self, "Info_Mod_Raeuber03_Bierhexen_15_01"); //Leonhard?
	AI_Output(self, hero, "Info_Mod_Raeuber03_Bierhexen_06_02"); //Hat's mir jedenfalls stolz erzählt. Als ob das so was Besonderes wäre.
	AI_Output(hero, self, "Info_Mod_Raeuber03_Bierhexen_15_03"); //Wo finde ich Leonhard?
	AI_Output(self, hero, "Info_Mod_Raeuber03_Bierhexen_06_04"); //Der lungert in den Gassen von Khorata rum. Hat halt nicht so ein tolles Versteck wie wir.

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Nach Angaben eines Kumpanen von Melvin ist Leonhard in Khorata der Übeltäter.");
};

INSTANCE Info_Mod_Raeuber03_Pickpocket (C_INFO)
{
	npc		= Mod_7512_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber03_Pickpocket_Condition;
	information	= Info_Mod_Raeuber03_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Raeuber03_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);

	Info_AddChoice	(Info_Mod_Raeuber03_Pickpocket, DIALOG_BACK, Info_Mod_Raeuber03_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raeuber03_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raeuber03_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);

		Info_AddChoice	(Info_Mod_Raeuber03_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raeuber03_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raeuber03_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raeuber03_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raeuber03_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raeuber03_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raeuber03_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raeuber03_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raeuber03_EXIT (C_INFO)
{
	npc		= Mod_7512_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber03_EXIT_Condition;
	information	= Info_Mod_Raeuber03_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raeuber03_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber03_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};