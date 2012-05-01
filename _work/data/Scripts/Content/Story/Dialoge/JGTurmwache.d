INSTANCE Info_Mod_JGTurmwache_Felle (C_INFO)
{
	npc		= Mod_7469_OUT_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_JGTurmwache_Felle_Condition;
	information	= Info_Mod_JGTurmwache_Felle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_JGTurmwache_Felle_Condition()
{
	if (Mod_JG_TurmwaechterFelle == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_JGTurmwache_Felle_Info()
{
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_00"); //He, du!
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle_15_01"); //Ja, was ist?
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_02"); //Du kommst doch viel rum, oder?
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle_15_03"); //Das kannst du laut sagen.
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_04"); //Tu ich doch!
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_05"); //Hier oben zieht's wie Hechtsuppe. Ich brauch dringend ein warmes Fell.
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle_15_06"); //Dann besorg dir eins beim Händler!
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_07"); //Wie?
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle_15_08"); //Der Händler hat doch welche.
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_09"); //Schon. Aber die sind nach paar Tagen steif wie 'n Brett.
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle_13_10"); //Was warmes, weiches darf's schon sein.
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle_15_11"); //Gut. Mal sehen, was ich tun kann.

	Log_CreateTopic	(TOPIC_MOD_JG_TURMFELLE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TURMFELLE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Ein neues Fell für den Turmwächter. Mal sehen.");
};

INSTANCE Info_Mod_JGTurmwache_Felle2 (C_INFO)
{
	npc		= Mod_7469_OUT_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_JGTurmwache_Felle2_Condition;
	information	= Info_Mod_JGTurmwache_Felle2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier etwas für dich.";
};

FUNC INT Info_Mod_JGTurmwache_Felle2_Condition()
{
	if (Npc_HasItems(hero, ItMi_Kuschelfell) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_JGTurmwache_Felle2_Info()
{
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle2_15_00"); //Ich habe hier etwas für dich.
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle2_13_01"); //Ja, was ist es?
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle2_15_02"); //Nun, es ist flauschig weich und herrlich warm ...
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle2_13_03"); //Sag bloß du hast ein Fell für mich gefunden?
	AI_Output(hero, self, "Info_Mod_JGTurmwache_Felle2_15_04"); //Genau so ist es, hier hast du es.

	B_GiveInvItems	(hero, self, ItMi_Kuschelfell, 1);

	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle2_13_05"); //Das ist ja wunderbar weich. Vielen Dank.
	AI_Output(self, hero, "Info_Mod_JGTurmwache_Felle2_13_06"); //Hier nimm das.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_TURMFELLE, LOG_SUCCESS);
};

INSTANCE Info_Mod_JGTurmwache_Pickpocket (C_INFO)
{
	npc		= Mod_7469_OUT_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_JGTurmwache_Pickpocket_Condition;
	information	= Info_Mod_JGTurmwache_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_JGTurmwache_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_JGTurmwache_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_JGTurmwache_Pickpocket);

	Info_AddChoice	(Info_Mod_JGTurmwache_Pickpocket, DIALOG_BACK, Info_Mod_JGTurmwache_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_JGTurmwache_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_JGTurmwache_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_JGTurmwache_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_JGTurmwache_Pickpocket);
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

INSTANCE Info_Mod_JGTurmwache_EXIT (C_INFO)
{
	npc		= Mod_7469_OUT_Turmwache_MT;
	nr		= 1;
	condition	= Info_Mod_JGTurmwache_EXIT_Condition;
	information	= Info_Mod_JGTurmwache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_JGTurmwache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_JGTurmwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};