INSTANCE Info_Mod_Sinbad_Hi (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Hi_Condition;
	information	= Info_Mod_Sinbad_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. Ich soll mich bei dir melden.";
};

FUNC INT Info_Mod_Sinbad_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malik_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_00"); //Hallo. Ich soll mich bei dir melden.
	AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_01"); //Aha, der Neue. Ganz recht. Sag, wie steht's mit deinen Kampfkünsten? Du willst doch Assassinenkrieger werden.
	AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_02"); //Ich bin eigentlich ganz zufrieden.
	AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_03"); //Ob ich das auch sagen kann, wird sich zeigen.
	AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_04"); //Und wie kann ich dich beeindrucken?
	AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_05"); //Ich hörte, die Stadtgarde veranstaltet einen Wettkampf. Gehe hin, melde dich und komme als Sieger zurück.

	if (Mod_AndreTurnier == 1)
	{
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_06"); //Ich habe bereits teilgenommen und gewonnen.
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_07"); //Das ist schon mal sehr gut. Sicher hast du eine Auszeichnung bekommen. Zeig mal her.
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_08"); //Eigentlich nicht. Lord Andre wollte mich bei der Miliz aufnehmen, aber ich habe abgelehnt.
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_09"); //Hm ... das mag stimmen oder auch nicht. Gehe hin und bringe mir einen Beweis.
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_10"); //Ich werde es versuchen.
	}
	else if (Mod_AndreTurnier == 2)
	{
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_11"); //Ich habe schon mal teilgenommen, aber leider verloren.
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_12"); //Hm ... das gefällt mir nun gar nicht.
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_13"); //(hastig) Aber das ist schon länger her. Ich war damals noch nicht so richtig durchtrainiert. Ich könnte versuchen, nochmal anzutreten.
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_14"); //Wenn´s nicht klappt, schick ich dich in die Wüste. Mach hin!

		B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW, "SHADOWBEAST");

		CreateInvItems	(Mod_1723_MIL_Gidan_NW, ItMi_TurnierPokal, 1);
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Andre_Miliz))
	{
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_15"); //Ich habe bereits teilgenommen, aber das Turnier noch nicht abgeschlossen.
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_16"); //Dann spute dich. Möglicherweise ist der Wettkampf schon abgeschlossen.
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_17"); //Ich eile.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_18"); //Wo findet es statt?
		AI_Output(self, hero, "Info_Mod_Sinbad_Hi_13_19"); //In der Kaserne, meine ich.
		AI_Output(hero, self, "Info_Mod_Sinbad_Hi_15_20"); //Der Gewinner werde ich sein. Bis später.
	};

	Log_CreateTopic	(TOPIC_MOD_ASS_WETTKAMPF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_WETTKAMPF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_WETTKAMPF, "Ich soll am Wettkampf in der Kaserne teilnehmen und natürlich siegen. Mal sehen ...");
};

INSTANCE Info_Mod_Sinbad_Urkunde (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Urkunde_Condition;
	information	= Info_Mod_Sinbad_Urkunde_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist meine Urkunde.";
};

FUNC INT Info_Mod_Sinbad_Urkunde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
	&& (Npc_HasItems(hero, ItWr_TurnierUrkunde) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Urkunde_Info()
{
	AI_Output(hero, self, "Info_Mod_Sinbad_Urkunde_15_00"); //Hier ist meine Urkunde.

	B_GiveInvItems	(hero, self, ItWr_TurnierUrkunde, 1);

	B_UseFakescroll ();

	AI_Output(self, hero, "Info_Mod_Sinbad_Urkunde_13_01"); //Sehr schön. Du hast schon paar Punkte bei mir. Aber etwas Training kann nie schaden.
	AI_Output(self, hero, "Info_Mod_Sinbad_Urkunde_13_02"); //Ich gehe morgen mit einigen Anwärtern auf unseren Übungsplatz. Du kannst dich uns anschließen.
	AI_Output(hero, self, "Info_Mod_Sinbad_Urkunde_15_03"); //Werde ich machen.

	B_SetTopicStatus	(TOPIC_MOD_ASS_WETTKAMPF, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_SinbadTraining = Wld_GetDay();
};

INSTANCE Info_Mod_Sinbad_Pokal (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Pokal_Condition;
	information	= Info_Mod_Sinbad_Pokal_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schau mal, was ich hier habe!";
};

FUNC INT Info_Mod_Sinbad_Pokal_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Hi))
	&& (Npc_HasItems(hero, ItMi_TurnierPokal) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Pokal_Info()
{
	AI_Output(hero, self, "Info_Mod_Sinbad_Pokal_15_00"); //Schau mal, was ich hier habe!

	B_GiveInvItems	(hero, self, ItMi_TurnierPokal, 1);

	AI_Output(self, hero, "Info_Mod_Sinbad_Pokal_13_01"); //Der Turnierpokal? Ehrlich erworben?
	AI_Output(hero, self, "Info_Mod_Sinbad_Pokal_15_02"); //Gewiss doch. Kannst Lord Andre fragen.
	AI_Output(self, hero, "Info_Mod_Sinbad_Pokal_13_03"); //Ich werde mich hüten, da aufzutauchen. Also gut. Du hast schon paar Punkte bei mir. Aber etwas Training kann nie schaden.
	AI_Output(self, hero, "Info_Mod_Sinbad_Urkunde_13_02"); //Ich gehe morgen mit einigen Anwärtern auf unseren Übungsplatz. Du kannst dich uns anschließen.
	AI_Output(hero, self, "Info_Mod_Sinbad_Urkunde_15_03"); //Werde ich machen.

	B_SetTopicStatus	(TOPIC_MOD_ASS_WETTKAMPF, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_SinbadTraining = Wld_GetDay();
};

INSTANCE Info_Mod_Sinbad_Training (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Training_Condition;
	information	= Info_Mod_Sinbad_Training_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sinbad_Training_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Sinbad_Urkunde))
	|| (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Pokal)))
	&& (Wld_GetDay() > Mod_SinbadTraining)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Training_Info()
{
	AI_Output(self, hero, "Info_Mod_Sinbad_Training_13_00"); //Wir gehen trainieren. Kommst mit.
	AI_Output(hero, self, "Info_Mod_Sinbad_Training_15_01"); //Klar doch. Wer rastet, der rostet.

	Log_CreateTopic	(TOPIC_MOD_ASS_TRAINING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_TRAINING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_TRAINING, "Ich habe zugestimmt mit Sinbad und einigen Anwärtern trainieren zu gehen.");

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self,	"TRAINING");
	B_StartOtherRoutine	(Mod_7118_ASS_Anwaerter_NW,	"TRAINING");
	B_StartOtherRoutine	(Mod_7124_ASS_Anwaerter_NW,	"TRAINING");
};

INSTANCE Info_Mod_Sinbad_Training2 (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Training2_Condition;
	information	= Info_Mod_Sinbad_Training2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sinbad_Training2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Training))
	&& (Npc_GetDistToWP(self, "WP_ASSASSINENTRAINING") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Training2_Info()
{
	AI_Output(self, hero, "Info_Mod_Sinbad_Training2_13_00"); //So. Dann will ich mal sehen, was du drauf hast.
	AI_Output(hero, self, "Info_Mod_Sinbad_Training2_15_01"); //Nur zu. Ich werde dir 'ne Beule verpassen.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training2_13_02"); //Pass auf, dass du nicht die Hose verlierst!

	B_LogEntry	(TOPIC_MOD_ASS_TRAINING, "Sinbad will sehen, was ich drauf habe.");

	self.flags = 2;

	self.npctype = NPCTYPE_FRIEND;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Sinbad_Training3 (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Training3_Condition;
	information	= Info_Mod_Sinbad_Training3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sinbad_Training3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Training2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Training3_Info()
{
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_00"); //Na?
	AI_Output(hero, self, "Info_Mod_Sinbad_Training3_15_01"); //Mein Kopf! Aahh.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_02"); //Siehst du, doch nicht unschlagbar. Aber dein Kampfstil hat was. Bist wohl besser, als mancher der anderen Krieger.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_03"); //Allerdings vermisse ich etwas Wendigkeit. Kannst den Feind ruhig mal an der Flanke angreifen. Hast ja gesehen, wie ich das mache.
	AI_Output(hero, self, "Info_Mod_Sinbad_Training3_15_04"); //(mürrisch) Werde dran denken.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_05"); //Das hat mal wieder gut getan. Ich wollte, wir müssten nicht die ganze Zeit in der Höhle rumstehen.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_06"); //Unsere Situation ist einfach beschissen. Kein vernünftiger Platz für uns auf Khorinis.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training3_13_07"); //Und Norek fällt auch nichts vernünftiges ein. Au Mann! Wäre ich nur auf dem Festland geblieben.

	self.flags = 0;

	self.npctype = NPCTYPE_MAIN;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sinbad_Training4 (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Training4_Condition;
	information	= Info_Mod_Sinbad_Training4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sinbad_Training4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sinbad_Training2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sinbad_Training4_Info()
{
	AI_Output(self, hero, "Info_Mod_Sinbad_Training4_13_00"); //(laut) Genug für heute. Alle Mann zurück.
	AI_Output(hero, self, "Info_Mod_Sinbad_Training4_15_01"); //Kann ich mit deiner Stimme rechnen?
	AI_Output(self, hero, "Info_Mod_Sinbad_Training4_13_02"); //Ich denke ja. Hast dich ganz wacker geschlagen.
	AI_Output(self, hero, "Info_Mod_Sinbad_Training4_13_03"); //Wenn du jetzt noch mit Karim sprichst, sollte es bald zum Anwärter reichen. Wenn nicht für mehr.

	self.flags = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self,	"START");
	B_StartOtherRoutine	(Mod_7118_ASS_Anwaerter_NW,	"START");
	B_StartOtherRoutine	(Mod_7124_ASS_Anwaerter_NW,	"START");

	B_LogEntry	(TOPIC_MOD_ASS_TRAINING, "Das Training war wohl auch zufriedenstellend.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_TRAINING, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sinbad_Pickpocket (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_Pickpocket_Condition;
	information	= Info_Mod_Sinbad_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Sinbad_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 420);
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);

	Info_AddChoice	(Info_Mod_Sinbad_Pickpocket, DIALOG_BACK, Info_Mod_Sinbad_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sinbad_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sinbad_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);

		Info_AddChoice	(Info_Mod_Sinbad_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sinbad_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sinbad_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sinbad_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sinbad_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sinbad_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sinbad_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sinbad_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sinbad_EXIT (C_INFO)
{
	npc		= Mod_7133_ASS_Sinbad_NW;
	nr		= 1;
	condition	= Info_Mod_Sinbad_EXIT_Condition;
	information	= Info_Mod_Sinbad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sinbad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sinbad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};