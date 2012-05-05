INSTANCE Info_Mod_Masut_Hi (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Hi_Condition;
	information	= Info_Mod_Masut_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Ich hab mich bei den Gaunern bewährt und möchte nun zu den Kriegern aufsteigen.";
};

FUNC INT Info_Mod_Masut_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden2))
	&& (Assassinen_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Masut_Hi_15_00"); //Hallo! Ich hab mich bei den Gaunern bewährt und möchte nun zu den Kriegern aufsteigen.
	AI_Output(self, hero, "Info_Mod_Masut_Hi_13_01"); //Wir haben von dir gehört. Du hast Erstaunliches in kurzer Zeit geleistet.
	AI_Output(self, hero, "Info_Mod_Masut_Hi_13_02"); //Aber auch bei uns musst du dich erst noch bewähren.
	AI_Output(hero, self, "Info_Mod_Masut_Hi_15_03"); //Was soll ich tun?
	AI_Output(self, hero, "Info_Mod_Masut_Hi_13_04"); //Im Moment liegt nichts an. Komm später wieder. Du hast sicher noch anderes zu tun.
	AI_Output(hero, self, "Info_Mod_Masut_Hi_15_05"); //Gewiss. Bis dann.

	B_LogEntry	(TOPIC_MOD_ASS_VERTRAUEN, "Masut hat im Moment nichts für mich. Ich soll später wiederkommen.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERTRAUEN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Masut_Later (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Later_Condition;
	information	= Info_Mod_Masut_Later_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Masut_Later_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Masut_Hi))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_Later_Info()
{
	AI_Output(self, hero, "Info_Mod_Masut_Later_13_00"); //Halt. Nur für Fortgeschrittene!
	AI_Output(hero, self, "Info_Mod_Masut_Later_15_01"); //Ich bin fortgeschritten. Du hast mich letztens weggeschickt, weil du nichts zu tun hattest für mich.
	AI_Output(self, hero, "Info_Mod_Masut_Later_13_02"); //Ach ja. Also ich habe da was, aber erst muss ich dir erklären, was hier so abgeht.
	AI_Output(hero, self, "Info_Mod_Masut_Later_15_03"); //Ich höre.
	AI_Output(self, hero, "Info_Mod_Masut_Later_13_04"); //Du musst dich jetzt entscheiden, welchen Weg du gehst.
	AI_Output(self, hero, "Info_Mod_Masut_Later_13_05"); //Willst du Krieger werden, bist du bei mir an der richtigen Adresse.
	AI_Output(self, hero, "Info_Mod_Masut_Later_13_06"); //Möchtest du aber Magier werden, dann wende dich an Aadel. Du findest ihn weiter hinten.

	Info_ClearChoices	(Info_Mod_Masut_Later);

	Info_AddChoice	(Info_Mod_Masut_Later, "Ich will Magier werden.", Info_Mod_Masut_Later_B);
	Info_AddChoice	(Info_Mod_Masut_Later, "Ich will zu den Kriegern.", Info_Mod_Masut_Later_A);
};

FUNC VOID Info_Mod_Masut_Later_B()
{
	AI_Output(hero, self, "Info_Mod_Masut_Later_B_15_00"); //Ich will Magier werden.
	AI_Output(self, hero, "Info_Mod_Masut_Later_B_13_01"); //Wie du willst. Gehe zu Aadel, er wird dich einweisen.

	Mod_ASS_Magier = 1;

	Log_CreateTopic	(TOPIC_MOD_ASS_MAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MoD_ASS_MAGIER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "Wenn ich Magier werden will, muss ich zu Aadel gehen. Er ist weiter hinten in der Höhle.");

	Info_ClearChoices	(Info_Mod_Masut_Later);
};

FUNC VOID Info_Mod_Masut_Later_A()
{
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_00"); //Ich will zu den Kriegern.
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_01"); //Das höre ich gerne, gute Leute brauchen wir immer. Ich hoffe, du enttäuschst mich nicht ...
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_02"); //Ich werde mich bemühen. Was liegt an?
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_03"); //Du willst sicher weiterkommem und brauchst dafür Stimmen.
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_04"); //Deswegen frage ich, was anliegt.
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_05"); //Das will ich dir sagen. Oben im Leuchtturm haust doch dieser Jack.
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_06"); //Ja ...?
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_07"); //Den sollst du beseitigen. Wir wollen den Turm besetzen, damit wir Ausschau auf die Stadt haben.
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_08"); //Hier drinnen bekommen wir zu wenig mit. Und wir haben nur Amir draußen. Der sieht auch nicht alles.
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_09"); //Das wird kein Problem sein. Mit seinem Degen werde ich schon fertig.
	AI_Output(self, hero, "Info_Mod_Masut_Later_A_13_10"); //Dann mach hin.
	AI_Output(hero, self, "Info_Mod_Masut_Later_A_15_11"); //Schon unterwegs.

	Mod_ASS_Krieger = 1;

	Log_CreateTopic	(TOPIC_MOD_ASS_KRIEGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MoD_ASS_KRIEGER, LOG_RUNNING);

	Log_CreateTopic	(TOPIC_MOD_ASS_JACK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MoD_ASS_JACK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_JACK, "Als erstes soll ich Jack im Leuchtturm umbringen. Hm ... armer Kerl. Ist eigentlich ganz harmlos.");

	Info_ClearChoices	(Info_Mod_Masut_Later);
};

INSTANCE Info_Mod_Masut_Jack (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Jack_Condition;
	information	= Info_Mod_Masut_Jack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Auftrag ausgeführt. Dieser Jack ist Geschichte.";
};

FUNC INT Info_Mod_Masut_Jack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Masut_Later))
	&& (Mod_ASS_Jack > 0)
	&& (Npc_HasItems(hero, ItMw_Degen_Jack) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_Jack_Info()
{
	AI_Output(hero, self, "Info_Mod_Masut_Jack_15_00"); //Auftrag ausgeführt. Dieser Jack ist Geschichte.
	AI_Output(self, hero, "Info_Mod_Masut_Jack_13_01"); //Das ging aber schnell.
	AI_Output(hero, self, "Info_Mod_Masut_Jack_15_02"); //Ein alter Mann. Es war nicht schwer. Hier, sein Degen als Beweis.

	B_GiveInvItems	(hero, self, ItMw_Degen_Jack, 1);

	AI_Output(hero, self, "Info_Mod_Masut_Jack_15_03"); //Ihn selbst habe ich über die Klippe geworfen.
	AI_Output(self, hero, "Info_Mod_Masut_Jack_13_04"); //Saubere Arbeit. Dich kann man brauchen.
	AI_Output(hero, self, "Info_Mod_Masut_Jack_15_05"); //Das will ich meinen. Ich kriege also deine Stimme?
	AI_Output(self, hero, "Info_Mod_Masut_Jack_13_06"); //Natürlich. Und Malik hat wahrscheinlich auch was für dich. Der ist dauernd am Jammern.
	AI_Output(hero, self, "Info_Mod_Masut_Jack_15_07"); //Aha. Wo finde ich den?
	AI_Output(self, hero, "Info_Mod_Masut_Jack_13_08"); //Weiter vorn. Bei den Anwärtern steht er rum.

	B_SetTopicStatus	(TOPIC_MoD_ASS_JACK, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_ASS_KRIEGER, "Es scheint so, als könne Malik Hilfe gebrauchen. Er soll weiter vorne bei den Anwärtern zu finden sein.");
};

INSTANCE Info_Mod_Masut_GotoAzhar (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_GotoAzhar_Condition;
	information	= Info_Mod_Masut_GotoAzhar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Masut_GotoAzhar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Azhar_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Azhar_Later))
	&& (Mod_ASS_Krieger == 1)
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_GotoAzhar_Info()
{
	AI_Output(self, hero, "Info_Mod_Masut_GotoAzhar_13_00"); //Wo steckst du denn? Azhar wartet auf dich.
	AI_Output(hero, self, "Info_Mod_Masut_GotoAzhar_15_01"); //Was willst du? Letzthin hat mich der Kerl weggeschickt.
	AI_Output(self, hero, "Info_Mod_Masut_GotoAzhar_13_02"); //Aber jetzt braucht er dich.
	AI_Output(hero, self, "Info_Mod_Masut_GotoAzhar_15_03"); //Ich schaue mal.
};

INSTANCE Info_Mod_Masut_Zeremoniendolch (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Zeremoniendolch_Condition;
	information	= Info_Mod_Masut_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Masut_Zeremoniendolch_Condition()
{
	if (Npc_HasItems(hero, ItMw_Avaquar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_Zeremoniendolch_Info()
{
	AI_Output(self, hero, "Info_Mod_Masut_Zeremoniendolch_13_00"); //Wo treibst du dich wieder rum? Sofort zu Mustafa!
	AI_Output(hero, self, "Info_Mod_Masut_Zeremoniendolch_15_01"); //Dann halte mich nicht auf.
	AI_Output(self, hero, "Info_Mod_Masut_Zeremoniendolch_13_02"); //Reiß bloß das Maul nicht so weit auf, Anwärter!
};

INSTANCE Info_Mod_Masut_Blutkelch (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Blutkelch_Condition;
	information	= Info_Mod_Masut_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Soviel zum Anwärter. Mustafa sagt, dir ist etwas aufgefallen.";
};

FUNC INT Info_Mod_Masut_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Zeremoniendolch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Masut_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Masut_Blutkelch_15_00"); //Soviel zum Anwärter. Mustafa sagt, dir ist etwas aufgefallen.
	AI_Output(self, hero, "Info_Mod_Masut_Blutkelch_13_01"); //Wie hast du das so schnell zum Krieger geschafft?
	AI_Output(hero, self, "Info_Mod_Masut_Blutkelch_15_02"); //Zur Sache. Was weißt du?
	AI_Output(self, hero, "Info_Mod_Masut_Blutkelch_13_03"); //In letzter Zeit schleichen nachts öfter Magier hier durch.
	AI_Output(hero, self, "Info_Mod_Masut_Blutkelch_15_04"); //Wen meinst du genau?
	AI_Output(self, hero, "Info_Mod_Masut_Blutkelch_13_05"); //Kann ich so nicht sagen. Bei unserer Rüstung, wenn da einer nicht erkannt werden will, ist das einfach.
	AI_Output(hero, self, "Info_Mod_Masut_Blutkelch_15_06"); //Du hast also keinen Namen?
	AI_Output(self, hero, "Info_Mod_Masut_Blutkelch_13_07"); //Nein, leider nicht.
	AI_Output(hero, self, "Info_Mod_Masut_Blutkelch_15_08"); //Hmm ... schauen wir mal. Vielleicht hat Shakir was bemerkt.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Masut hat Magier rumschleichen sehen, weiß aber keinen Namen. Ich sollte mal Shakir fragen.");
};

INSTANCE Info_Mod_Masut_Pickpocket (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_Pickpocket_Condition;
	information	= Info_Mod_Masut_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Masut_Pickpocket_Condition()
{
	C_Beklauen	(97, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Masut_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Masut_Pickpocket);

	Info_AddChoice	(Info_Mod_Masut_Pickpocket, DIALOG_BACK, Info_Mod_Masut_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Masut_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Masut_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Masut_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Masut_Pickpocket);
};

FUNC VOID Info_Mod_Masut_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Masut_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Masut_Pickpocket);

		Info_AddChoice	(Info_Mod_Masut_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Masut_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Masut_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Masut_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Masut_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Masut_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Masut_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Masut_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Masut_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Masut_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Masut_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Masut_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Masut_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Masut_EXIT (C_INFO)
{
	npc		= Mod_7119_ASS_Masut_NW;
	nr		= 1;
	condition	= Info_Mod_Masut_EXIT_Condition;
	information	= Info_Mod_Masut_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Masut_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Masut_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};