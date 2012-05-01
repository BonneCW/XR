INSTANCE Info_Mod_HSBuerger_01_Orakel (C_INFO)
{
	npc		= Mod_7596_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_01_Orakel_Condition;
	information	= Info_Mod_HSBuerger_01_Orakel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin auf der Suche nach dem Orakel.";
};

FUNC INT Info_Mod_HSBuerger_01_Orakel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatRaufbold_KoenigHilfe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HSBuerger_01_Orakel_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBuerger_01_Orakel_15_00"); //Ich bin auf der Suche nach dem Orakel.
	AI_Output(self, hero, "Info_Mod_HSBuerger_01_Orakel_09_01"); //Orakel? Sowas gibt es hier nicht. Du solltest das königliche Orakel fragen, wo du eines findest, das ist ziemlich klug.
	AI_Output(hero, self, "Info_Mod_HSBuerger_01_Orakel_15_02"); //Und wo ist das königliche Orakel?
	AI_Output(self, hero, "Info_Mod_HSBuerger_01_Orakel_09_03"); //Da musst du einen Termin bei dem königlichen Arsch ausmachen.
};

INSTANCE Info_Mod_HSBuerger_01_Teleport (C_INFO)
{
	npc		= Mod_7596_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_01_Teleport_Condition;
	information	= Info_Mod_HSBuerger_01_Teleport_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich suche einen kurzen Weg in den Sumpf, kennst du einen?";
};

FUNC INT Info_Mod_HSBuerger_01_Teleport_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Gemaelde))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HSBuerger_01_Teleport_Info()
{
	AI_Output(hero, self, "Info_Mod_HSBuerger_01_Teleport_15_00"); //Ich suche einen kurzen Weg in den Sumpf, kennst du einen?
	AI_Output(self, hero, "Info_Mod_HSBuerger_01_Teleport_09_01"); //Lass mich in Ruhe mit deinem Psycho-Scheiß!
};

INSTANCE Info_Mod_HSBuerger_01_Pickpocket (C_INFO)
{
	npc		= Mod_7596_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_01_Pickpocket_Condition;
	information	= Info_Mod_HSBuerger_01_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_HSBuerger_01_Pickpocket_Condition()
{
	C_Beklauen	(13, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_HSBuerger_01_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HSBuerger_01_Pickpocket);

	Info_AddChoice	(Info_Mod_HSBuerger_01_Pickpocket, DIALOG_BACK, Info_Mod_HSBuerger_01_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HSBuerger_01_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HSBuerger_01_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HSBuerger_01_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HSBuerger_01_Pickpocket);
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

INSTANCE Info_Mod_HSBuerger_01_EXIT (C_INFO)
{
	npc		= Mod_7596_HS_Bauer_REL;
	nr		= 1;
	condition	= Info_Mod_HSBuerger_01_EXIT_Condition;
	information	= Info_Mod_HSBuerger_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HSBuerger_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HSBuerger_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};