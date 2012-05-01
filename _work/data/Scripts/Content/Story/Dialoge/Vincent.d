INSTANCE Info_Mod_Vincent_Hi (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Hi_Condition;
	information	= Info_Mod_Vincent_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Vincent_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vincent_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Vincent_Hi_13_01"); //Hehe, ich bin Vincent, Jäger von Beruf.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Vincent_Hi_13_02"); //Wenn du willst, kannst du von mir lernen, geschickter den Bogen zu führen.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_RELENDEL, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_RELENDEL, "Der Jäger Vincent kann mir beim Umgang mit dem Bogen helfen.");
	};
};

INSTANCE Info_Mod_Vincent_Landvermessung (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Landvermessung_Condition;
	information	= Info_Mod_Vincent_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Anselm schickt mich.";
};

FUNC INT Info_Mod_Vincent_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vincent_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Anselm_Landvermessung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vincent_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Vincent_Landvermessung_15_00"); //Anselm schickt mich. Ich soll für ihn in Erfahrung bringen, was für eine Fläche Khoratas Umland hat.
	AI_Output(self, hero, "Info_Mod_Vincent_Landvermessung_13_01"); //(leise) Hihihihihi ...
	AI_Output(hero, self, "Info_Mod_Vincent_Landvermessung_15_02"); //Was ist?
	AI_Output(self, hero, "Info_Mod_Vincent_Landvermessung_13_03"); //(lauter) Hahahaha ...
	AI_Output(hero, self, "Info_Mod_Vincent_Landvermessung_15_04"); //WAS IST???
	AI_Output(self, hero, "Info_Mod_Vincent_Landvermessung_13_05"); //Nichts, nein, gar nichts ... hohoho ... (unterdrückt mühsam einen Lachanfall) Du kannst ... hehe ... sag ihm, Khoratas Umland hat eine Fläche von fünf Quadratmeilen. (Pause, dann prustet er los)
	AI_Output(hero, self, "Info_Mod_Vincent_Landvermessung_15_06"); //Na schön.

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Fünf Quadratmeilen. Wie lustig.");
};

INSTANCE Info_Mod_Vincent_Schweine (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Schweine_Condition;
	information	= Info_Mod_Vincent_Schweine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, du arbeitest nicht mehr richtig.";
};

FUNC INT Info_Mod_Vincent_Schweine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Henrik_Hi))
	&& (Mod_Henrik_Schweine == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vincent_Schweine_Info()
{
	AI_Output(hero, self, "Info_Mod_Vincent_Schweine_15_00"); //Ich habe gehört, du arbeitest nicht mehr richtig.
	AI_Output(self, hero, "Info_Mod_Vincent_Schweine_13_01"); //Kann sein. Egal! Hihihi.
	AI_Output(hero, self, "Info_Mod_Vincent_Schweine_15_02"); //Irgendjemand muss aber deine Arbeit übernehmen.
	AI_Output(self, hero, "Info_Mod_Vincent_Schweine_13_03"); //Ja, wirklich? (Pause) Ich hab' 'ne tolle Idee: Du übernimmst das!
	AI_Output(self, hero, "Info_Mod_Vincent_Schweine_13_04"); //Hier!

	B_GiveInvItems	(self, hero, ItRw_Bow_L_03, 1);

	AI_Output(self, hero, "Info_Mod_Vincent_Schweine_13_05"); //Und hier!

	B_GiveInvItems	(self, hero, ItRw_Arrow, 30);

	AI_Output(self, hero, "Info_Mod_Vincent_Schweine_13_06"); //Und keine Widerrede! Lass mich in Ruhe! (kichert)
};

INSTANCE Info_Mod_Vincent_Freudenspender (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Freudenspender_Condition;
	information	= Info_Mod_Vincent_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Du brauchst doch sicher noch Freudenspender-Nachschub.";
};                       

FUNC INT Info_Mod_Vincent_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Vincent_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Vincent_Freudenspender_15_00"); //Du brauchst doch sicher noch Freudenspender-Nachschub.
	AI_Output(self, hero, "Info_Mod_Vincent_Freudenspender_13_01"); //Richtig - Haha! Dann muss ich ja heute gar nicht mehr in die Stadt.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Vincent_Lernen_Bogen (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Lernen_Bogen_Condition;
	information	= Info_Mod_Vincent_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich, geschickter im Umgang mit dem Bogen zu werden.";
};

FUNC INT Info_Mod_Vincent_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vincent_Hi))
	&& (hero.hitchance[NPC_TALENT_BOW] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vincent_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Vincent_Lernen_Bogen_15_00"); //Lehre mich, geschickter im Umgang mit dem Bogen zu werden.

	Info_ClearChoices	(Info_Mod_Vincent_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, "Zurück.", Info_Mod_Vincent_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Vincent_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Vincent_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Vincent_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Vincent_Lernen_Bogen);
};

FUNC VOID Info_Mod_Vincent_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 100);

	Info_ClearChoices	(Info_Mod_Vincent_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, "Zurück.", Info_Mod_Vincent_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Vincent_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Vincent_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Vincent_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 100);

	Info_ClearChoices	(Info_Mod_Vincent_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, "Zurück.", Info_Mod_Vincent_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Vincent_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Vincent_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Vincent_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Vincent_Pickpocket (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_Pickpocket_Condition;
	information	= Info_Mod_Vincent_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Vincent_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Vincent_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Vincent_Pickpocket);

	Info_AddChoice	(Info_Mod_Vincent_Pickpocket, DIALOG_BACK, Info_Mod_Vincent_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Vincent_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Vincent_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Vincent_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Vincent_Pickpocket);
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

INSTANCE Info_Mod_Vincent_EXIT (C_INFO)
{
	npc		= Mod_7379_OUT_Vincent_REL;
	nr		= 1;
	condition	= Info_Mod_Vincent_EXIT_Condition;
	information	= Info_Mod_Vincent_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vincent_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vincent_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};