INSTANCE Info_Mod_Bronko_Hi (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Hi_Condition;
	information	= Info_Mod_Bronko_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bronko_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bronko_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bronko_Hi_06_00"); //Du da, hast du mal kurz Zeit?
	AI_Output(hero, self, "Info_Mod_Bronko_Hi_15_01"); //Natürlich.
	AI_Output(self, hero, "Info_Mod_Bronko_Hi_06_02"); //Sag Till mal, dass er seinen Arsch auf das Feld bewegen soll. Er macht jetzt schon den ganzen Tag Pause.

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_BRONKO_STREIT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRONKO_STREIT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Anscheinend drückt sich Till vor der Arbeit. Mal sehen, was er dazu zu sagen hat.");
};

INSTANCE Info_Mod_Bronko_Streit02 (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Streit02_Condition;
	information	= Info_Mod_Bronko_Streit02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Till meinte, du sollst das selbst machen.";
};

FUNC INT Info_Mod_Bronko_Streit02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_Bronko))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Streit02_Info()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Streit02_15_00"); //Till meinte, du sollst das selbst machen.
	AI_Output(self, hero, "Info_Mod_Bronko_Streit02_06_01"); //Der sollte sich erstmal die Nase putzen!

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Till soll sich erstmal die Nase putzen.");
};

INSTANCE Info_Mod_Bronko_Streit03 (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Streit03_Condition;
	information	= Info_Mod_Bronko_Streit03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Till fragt sich, ob du Eins und Eins zusammenzählen kannst.";
};

FUNC INT Info_Mod_Bronko_Streit03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_Bronko02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Streit03_Info()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Streit03_15_00"); //Till fragt sich, ob du Eins und Eins zusammenzählen kannst.
	AI_Output(self, hero, "Info_Mod_Bronko_Streit03_06_01"); //Natürlich kann ich das! Das sind ... ähm Elf. Sag ihm das.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Bronko hat eins und eins zusammen gezählt und elf herausbekommen");
};

INSTANCE Info_Mod_Bronko_Streit04 (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Streit04_Condition;
	information	= Info_Mod_Bronko_Streit04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir noch sagen, dass du ein Mistkerl bist.";
};

FUNC INT Info_Mod_Bronko_Streit04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_Bronko03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Streit04_Info()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Streit04_15_00"); //Ich soll dir noch sagen, dass du ein Mistkerl bist.
	AI_Output(self, hero, "Info_Mod_Bronko_Streit04_06_01"); //So? Kommt das von Till? Der kann was erleben. Sag ihm das.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Ich soll Till sagen, dass er was erleben kann.");
};

INSTANCE Info_Mod_Bronko_Ambient (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Ambient_Condition;
	information	= Info_Mod_Bronko_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du denn heute schon gearbeitet?";
};

FUNC INT Info_Mod_Bronko_Ambient_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_Bronko04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Ambient_15_00"); //Was hast du denn heute schon gearbeitet?
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient_06_01"); //Ich sorge hier allgemein für Ruhe und Sicherheit. Das erfordert meine ständige Aufmerksamkeit.
};

INSTANCE Info_Mod_Bronko_Ambient01 (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Ambient01_Condition;
	information	= Info_Mod_Bronko_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bronko_Ambient01_Condition()
{
	if ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_VLK))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_06_00"); //(schleimend) Es ist uns eine Ehre, so rechtgläubigen Besuch auf unserem bescheidenen Bauernhof begrüßen zu dürfen.
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_06_01"); //Vielleicht hättest du die Güte, uns gegen die räuberischen Söldner zu verteidigen?

	Info_ClearChoices	(Info_Mod_Bronko_Ambient01);

	Info_AddChoice	(Info_Mod_Bronko_Ambient01, "Betet zu Innos, und er wird euch helfen.", Info_Mod_Bronko_Ambient01_B);
	Info_AddChoice	(Info_Mod_Bronko_Ambient01, "Wo liegt das Problem?", Info_Mod_Bronko_Ambient01_A);
};

FUNC VOID Info_Mod_Bronko_Ambient01_B()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Ambient01_B_15_00"); //Betet zu Innos, und er wird euch helfen.

	Info_ClearChoices	(Info_Mod_Bronko_Ambient01);
};

FUNC VOID Info_Mod_Bronko_Ambient01_A()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Ambient01_A_15_00"); //Wo liegt das Problem?
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_A_06_01"); //(jammernd) Diese Schurken fressen uns alles weg, was wir anbauen. Das muss doch mal ein Ende haben!
	AI_Output(hero, self, "Info_Mod_Bronko_Ambient01_A_15_02"); //Soll ich also Onars Bauernhof ausradieren?
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_A_06_03"); //Nein, nein, so weit müssen wir nicht gehen. Es reicht ja schon, wenn die Söldner keine Vorräte mehr bei uns finden.
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_A_06_04"); //Nördlich des Sees auf dem Weg zu Orlans Taverne findest du eine Höhle.
	AI_Output(self, hero, "Info_Mod_Bronko_Ambient01_A_06_05"); //In den großen Eingangsbereich stellst du dann diese fünf Mehlsäcke, und uns ist für die nächste Zeit geholfen.

	B_GiveInvItems	(self, hero, ItMi_Mehlsack_Bronko, 5);

	Log_CreateTopic	(TOPIC_MOD_BRONKO_MEHLSACK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRONKO_MEHLSACK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRONKO_MEHLSACK, "Bronko von Sekobs Hof hat mir Mehlsäcke anvertraut, die ich in den Eingangsbereich der Höhle nördlich des Sees auf dem Weg zu Orlans Taverne legen soll.");

	Mod_BronkoMehlsack = 1;

	Info_ClearChoices	(Info_Mod_Bronko_Ambient01);
};

INSTANCE Info_Mod_Bronko_Ambient02 (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Ambient02_Condition;
	information	= Info_Mod_Bronko_Ambient02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bronko_Ambient02_Condition()
{
	if (Mod_BronkoMehlsack > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Ambient02_Info()
{
	if (Mod_BronkoMehlsack == 2)
	{
		AI_Output(self, hero, "Info_Mod_Bronko_Ambient02_06_00"); //Bist du fertig? Jetzt können die Penner ruhig kommen. (lacht)
		AI_Output(self, hero, "Info_Mod_Bronko_Ambient02_06_01"); //Hast du gut gemacht.

		B_GivePlayerXP	(100);

		B_Göttergefallen (1, 1);

		B_SetTopicStatus	(TOPIC_MOD_BRONKO_MEHLSACK, LOG_SUCCESS);

		CurrentNQ += 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bronko_Ambient02_06_02"); //Was erlaubst du dir? Denkst du, ich seh nicht, wie du schnurstracks Richtung Onars Pennerhof rennst?
		AI_Output(self, hero, "Info_Mod_Bronko_Ambient02_06_03"); //Ist nicht einmal mehr auf Innos verlass?

		B_SetTopicStatus	(TOPIC_MOD_BRONKO_MEHLSACK, LOG_FAILED);
	};
};

INSTANCE Info_Mod_Bronko_Lehrer (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Lehrer_Condition;
	information	= Info_Mod_Bronko_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Bronko_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Bronko_Lehrer_06_00"); //Nun, ich hab 'nen ganz ordentlichen Schlag drauf. Vielleicht kann ich dir helfen ein wenig stärker zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BAUERN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BAUERN, "Bronko kann mir helfen stärker zu werden.");
};

INSTANCE Info_Mod_Bronko_Lernen (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Lernen_Condition;
	information	= Info_Mod_Bronko_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeig mir wie ich stärker werde.";
};

FUNC INT Info_Mod_Bronko_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Lehrer))
	&& (hero.attribute[ATR_STRENGTH] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bronko_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bronko_Lernen_15_00"); //Zeig mir wie ich Stärker werde.

	Info_ClearChoices	(Info_Mod_Bronko_Lernen);

	Info_AddChoice	(Info_Mod_Bronko_Lernen, DIALOG_BACK, Info_Mod_Bronko_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_5);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_1);
};

FUNC VOID Info_Mod_Bronko_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Bronko_Lernen);
};

FUNC VOID Info_Mod_Bronko_Lernen_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Bronko_Lernen);

	Info_AddChoice	(Info_Mod_Bronko_Lernen, DIALOG_BACK, Info_Mod_Bronko_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_5);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_1);
};

FUNC VOID Info_Mod_Bronko_Lernen_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 100);

	Info_ClearChoices	(Info_Mod_Bronko_Lernen);

	Info_AddChoice	(Info_Mod_Bronko_Lernen, DIALOG_BACK, Info_Mod_Bronko_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_5);
	Info_AddChoice	(Info_Mod_Bronko_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Bronko_Lernen_1);
};

INSTANCE Info_Mod_Bronko_Pickpocket (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_Pickpocket_Condition;
	information	= Info_Mod_Bronko_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Bronko_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Bronko_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);

	Info_AddChoice	(Info_Mod_Bronko_Pickpocket, DIALOG_BACK, Info_Mod_Bronko_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bronko_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bronko_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bronko_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);
};

FUNC VOID Info_Mod_Bronko_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);

		Info_AddChoice	(Info_Mod_Bronko_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bronko_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bronko_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bronko_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bronko_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bronko_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bronko_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bronko_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bronko_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bronko_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bronko_EXIT (C_INFO)
{
	npc		= Mod_103_BAU_Bronko_NW;
	nr		= 1;
	condition	= Info_Mod_Bronko_EXIT_Condition;
	information	= Info_Mod_Bronko_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bronko_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bronko_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};