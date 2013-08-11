INSTANCE Info_Mod_Raeuber02_Hi (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Hi_Condition;
	information	= Info_Mod_Raeuber02_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's?";
};

FUNC INT Info_Mod_Raeuber02_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber02_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber02_Hi_15_00"); //Wie geht's?
	AI_Output(self, hero, "Info_Mod_Raeuber02_Hi_06_01"); //Verpiss dich bloß.
};

INSTANCE Info_Mod_Raeuber02_Frauenkleider (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Frauenkleider_Condition;
	information	= Info_Mod_Raeuber02_Frauenkleider_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du schon Melvins Kleider gesehen?";
};

FUNC INT Info_Mod_Raeuber02_Frauenkleider_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber02_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber02_Frauenkleider_Info()
{
	AI_Output(hero, self, "Info_Mod_Raeuber02_Frauenkleider_15_00"); //Hast du schon Melvins ...
	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_01"); //... neue Kleidung bemerkt, Witzbold? Hab ich etwa so schlechte Augen wie Hans?
	AI_Output(hero, self, "Info_Mod_Raeuber02_Frauenkleider_15_02"); //Was meinst du dazu?
	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_03"); //Das werd ich ihm gleich mal persönlich sagen.

	AI_StandUp	(self);

	AI_GotoNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_TurnToNpc	(self, Mod_7505_BDT_Melvin_REL);

	AI_Output(self, hero, "Info_Mod_Raeuber02_Frauenkleider_06_04"); //Du bist eine Schande für alle Räuber!

	Mod_REL_Frauenkleider02 = 1;

	if (Mod_REL_Frauenkleider01 == 1)
	&& (Mod_REL_Frauenkleider02 == 1)
	&& (Mod_REL_Frauenkleider03 == 1)
	{
		B_LogEntry	(TOPIC_MOD_KHORATA_FRAUENKLEIDER, "Nun sollte Melvin weichgeklopft sein.");
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber02_Bierhexen (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Bierhexen_Condition;
	information	= Info_Mod_Raeuber02_Bierhexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raeuber02_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raeuber01_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raeuber02_Bierhexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Raeuber02_Bierhexen_06_00"); //Bist du dumm?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raeuber02_Pickpocket (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_Pickpocket_Condition;
	information	= Info_Mod_Raeuber02_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Raeuber02_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

	Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_BACK, Info_Mod_Raeuber02_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raeuber02_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

		Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raeuber02_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raeuber02_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raeuber02_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raeuber02_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raeuber02_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raeuber02_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raeuber02_EXIT (C_INFO)
{
	npc		= Mod_7511_OUT_Raeuber_REL;
	nr		= 1;
	condition	= Info_Mod_Raeuber02_EXIT_Condition;
	information	= Info_Mod_Raeuber02_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raeuber02_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raeuber02_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};