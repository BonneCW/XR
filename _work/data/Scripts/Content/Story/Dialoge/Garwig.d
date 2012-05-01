INSTANCE Info_Mod_Garwig_Hi (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Hi_Condition;
	information	= Info_Mod_Garwig_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Garwig_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garwig_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Garwig_Hi_06_01"); //Ich bin Garwig, Novize hier im Kloster und Schützer des Heiligen Hammers.
};

INSTANCE Info_Mod_Garwig_Genehmigung (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Genehmigung_Condition;
	information	= Info_Mod_Garwig_Genehmigung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll den Hammer holen.";
};

FUNC INT Info_Mod_Garwig_Genehmigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garwig_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Hammer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garwig_Genehmigung_Info()
{
	AI_Output(hero, self, "Info_Mod_Garwig_Genehmigung_15_00"); //Ich soll den Hammer holen.
	AI_Output(self, hero, "Info_Mod_Garwig_Genehmigung_06_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Garwig_Genehmigung_15_02"); //Pyrokar schickt mich.
	AI_Output(self, hero, "Info_Mod_Garwig_Genehmigung_06_03"); //Gut, nimm ihn.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Ich habe Garwig Bescheid gesagt und kann den heiligen Hammer nun mitnehmen.");
};

INSTANCE Info_Mod_Garwig_HammerKlau (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_HammerKlau_Condition;
	information	= Info_Mod_Garwig_HammerKlau_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Garwig_HammerKlau_Condition()
{
	if (Npc_HasItems(hero, Holy_Hammer_MIS) == 1)
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garwig_HammerKlau_Info()
{
	AI_Output(self, hero, "Info_Mod_Garwig_HammerKlau_06_00"); //Hey, so geht das aber nicht. Gib den Hammer her.

	B_GiveInvItems	(hero, self, Holy_Hammer_MIS, 1);
	
	Wld_RemoveItem	(Holy_Hammer_MIS);
	Wld_InsertItem	(Holy_Hammer_MIS, "FP_HAMMER");
	Wld_RemoveItem	(Holy_Hammer_MIS);

	B_Göttergefallen(3, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Garwig_Pickpocket (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Pickpocket_Condition;
	information	= Info_Mod_Garwig_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Garwig_Pickpocket_Condition()
{
	C_Beklauen	(120, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Garwig_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garwig_Pickpocket);

	Info_AddChoice	(Info_Mod_Garwig_Pickpocket, DIALOG_BACK, Info_Mod_Garwig_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garwig_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garwig_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garwig_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garwig_Pickpocket);
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

INSTANCE Info_Mod_Garwig_EXIT (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_EXIT_Condition;
	information	= Info_Mod_Garwig_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garwig_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garwig_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};