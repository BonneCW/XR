INSTANCE Info_Mod_HofstaatHofnarr_Hi (C_INFO)
{
	npc		= Mod_7328_HS_Hofnarr_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHofnarr_Hi_Condition;
	information	= Info_Mod_HofstaatHofnarr_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatHofnarr_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_OrakelTermin))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatHofnarr_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_00"); //Ich grüße euch, werter Kehrwisch. Der Arsch hat mir von eurem Kommen berichtet.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_01"); //Du bist das Orakel? Ich dachte du bist der Hofnarr.
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_02"); //Der bin ich auch.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_03"); //Du bist der Hofnarr und das Orakel?
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_04"); //Der Einäugige ist unter den Blinden der König, doch der Weiße ist unter den Spinnern ein Narr.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_05"); //Was soll das heißen?
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_06"); //Das jede Münze zwei Seiten hat, du nicht erwarten kannst, nur weil die Zahl oben liegt, die Zahl unten vorzufinden.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_07"); //Ist das schon dein Orakelspruch?
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_08"); //Natürlich nicht, zuerst musst du immerhin deine Frage stellen.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_09"); //Klar ... Meine Frage. Ich suche etwas, das den König wieder glücklich macht.
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_10"); //Und hier ist deine Antwort.

	B_GiveInvItems	(self, hero, ItMi_Orakelpille, 1);

	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Hi_15_11"); //Ein Bonbon?
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Hi_04_12"); //Nennen wir es eine Orakelpille. Wenn du mich jetzt entschuldigen würdest.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Das Orakel hat mir eine Orakelpille gegeben. Ich sollte sie schlucken und sehen, wie mir das bei meinem Problem hilft.");
};

INSTANCE Info_Mod_HofstaatHofnarr_KingSorge (C_INFO)
{
	npc		= Mod_7328_HS_Hofnarr_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHofnarr_KingSorge_Condition;
	information	= Info_Mod_HofstaatHofnarr_KingSorge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatHofnarr_KingSorge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Meer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatHofnarr_KingSorge_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_KingSorge_04_00"); //Ich sehe Ihr hattet kein Glück beim König.
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_KingSorge_15_01"); //Glaubst du, der Sumpf war gar nicht die Antwort?
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_KingSorge_04_02"); //Ich mag vielleicht ein Narr sein, doch meine Aufgabe als Orakel nehme ich sehr ernst, werter Kehrwisch.
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_KingSorge_04_03"); //Wenn Ihr den Sumpf gesehen habt, so ist er auch die Antwort. Das Problem ist, dass Ihr ihn eben gesehen habt, der König nur davon hörte.
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_KingSorge_04_04"); //Ich gebe Euch einen Hinweis, für den Ihr keine Orakelpillen zu schlucken braucht. Geht in die Gemächer des Königs, dort werdet Ihr die Antwort finden.

	AI_StopProcessInfos	(self);

	Wld_InsertItem	(ItWr_DMBildNotiz, "FP_ITEM_KOENIG_DMNACHRICHT");

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Das Problem scheint zu sein, dass der König den Sumpf nicht gesehen hat. Die Lösung befindet sich im Gemach des Königs, sagt der Hofnarr.");
};

INSTANCE Info_Mod_HofstaatHofnarr_Transportsystem (C_INFO)
{
	npc		= Mod_7328_HS_Hofnarr_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHofnarr_Transportsystem_Condition;
	information	= Info_Mod_HofstaatHofnarr_Transportsystem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche einen angenehmen Weg in die Sümpfe.";
};

FUNC INT Info_Mod_HofstaatHofnarr_Transportsystem_Condition()
{
	if (Mod_SL_Meer == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatHofnarr_Transportsystem_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatHofnarr_Transportsystem_15_00"); //Ich suche einen angenehmen Weg in die Sümpfe.
	AI_Output(self, hero, "Info_Mod_HofstaatHofnarr_Transportsystem_04_01"); //Ich bin nur ein einfacher Narr, niemand der dir weiterhelfen könnte, werter Kehrwisch.
};

INSTANCE Info_Mod_HofstaatHofnarr_Pickpocket (C_INFO)
{
	npc		= Mod_7328_HS_Hofnarr_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHofnarr_Pickpocket_Condition;
	information	= Info_Mod_HofstaatHofnarr_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatHofnarr_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatHofnarr_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatHofnarr_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatHofnarr_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatHofnarr_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);

		Info_AddChoice	(Info_Mod_HofstaatHofnarr_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_HofstaatHofnarr_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_HofstaatHofnarr_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_HofstaatHofnarr_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_HofstaatHofnarr_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_HofstaatHofnarr_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_HofstaatHofnarr_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_HofstaatHofnarr_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_HofstaatHofnarr_EXIT (C_INFO)
{
	npc		= Mod_7328_HS_Hofnarr_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatHofnarr_EXIT_Condition;
	information	= Info_Mod_HofstaatHofnarr_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatHofnarr_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatHofnarr_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};