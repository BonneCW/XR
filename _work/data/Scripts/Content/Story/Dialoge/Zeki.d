INSTANCE Info_Mod_Zeki_Hi (C_INFO)
{
	npc		= Mod_7102_ASS_Zeki_NW;
	nr		= 1;
	condition	= Info_Mod_Zeki_Hi_Condition;
	information	= Info_Mod_Zeki_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Zeki_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zeki_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Zeki_Hi_05_00"); //Mein Name ist Zeki. Ich gehöre zu diesem traurigen Verein von Gaunern.
	AI_Output(hero, self, "Info_Mod_Zeki_Hi_15_01"); //Wieso trauriger Verein?
	AI_Output(self, hero, "Info_Mod_Zeki_Hi_05_02"); //Sieh dich doch mal um. Würdest du dich wohl fühlen, wenn du nie die Chance bekommst, einen höheren Rang ergreifen?
	AI_Output(hero, self, "Info_Mod_Zeki_Hi_15_03"); //Das wäre nicht toll. Heißt das, ihr könnt NICHT innerhalb der Gilde auftsiegen?
	AI_Output(self, hero, "Info_Mod_Zeki_Hi_05_04"); //Nein, nicht alle. Manche, wie ich, werden dazu verdonnert als Gauner geringere Dienste, wie zum Beispiel das Jagen, auszuüben.
	AI_Output(self, hero, "Info_Mod_Zeki_Hi_05_05"); //Was willst du eigentlich von mir?
};

INSTANCE Info_Mod_Zeki_Aufgabe (C_INFO)
{
	npc		= Mod_7102_ASS_Zeki_NW;
	nr		= 1;
	condition	= Info_Mod_Zeki_Aufgabe_Condition;
	information	= Info_Mod_Zeki_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte mich euch anschließen.";
};

FUNC INT Info_Mod_Zeki_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zeki_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zeki_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Zeki_Aufgabe_15_00"); //Ich möchte mich euch anschließen. Shakir sagte mir, dass ich euch Gauner dafür überzeugen muss.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_01"); //Und wieder einer, der sich in den Mist hier reiten will und ...
	AI_Output(hero, self, "Info_Mod_Zeki_Aufgabe_15_02"); //Hast du keine Aufgabe für mich?
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_03"); //Doch ich habe da etwas zu tun.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_04"); //Ich spiele leidenschaftlich gerne Laute, aber ich Trottel habe meine alte Laute versehentlich auf den Boden fallen lassen, so dass diese zerbrochen ist.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_05"); //Ich würde gerne eine neue haben, aber ich habe keine Zeit in die Stadt zu gehen und mir eine Anfertigen zu lassen.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_06"); //Bitte geh' für mich zu Thorben, einem der Handwerksmeister.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_07"); //Sage ihm, dass du eine neue Laute haben möchtest.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_08"); //Hier sind 250 Goldmünzen, damit du ihn bezahlen kannst.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_09"); //Wenn du die Laute hast werde ich dir meine Stimme geben.
	AI_Output(hero, self, "Info_Mod_Zeki_Aufgabe_15_10"); //Alles Klar, dann werde ich Thorben gleich aufsuchen.
	AI_Output(self, hero, "Info_Mod_Zeki_Aufgabe_05_11"); //Vielen dank, ich werde hier auf dich warten.

	Log_CreateTopic	(TOPIC_MOD_ASS_ZEKI_LAUTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_ZEKI_LAUTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Der Gauner Zeki ist ein sehr pessimistischer Mensch. Er spielt sehr gerne Laute, um sich bei Laune zu halten, doch hat er sein altes Instrument versehentlich zerbrochen und bläst seit dem nur Trübsal. Da er keine Zeit hat beim Handwerksmeister Thorben eine neue Laute bauen zu lassen, soll ich zu ihm gehen und diesen Job übernehmen. Wenn ich das erledigt habe, winkt mir vielleicht eine Belohnung und eine Stimme für die Aufnahme bei den Gaunern.");
};

INSTANCE Info_Mod_Zeki_Laute (C_INFO)
{
	npc		= Mod_7102_ASS_Zeki_NW;
	nr		= 1;
	condition	= Info_Mod_Zeki_Laute_Condition;
	information	= Info_Mod_Zeki_Laute_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist deine neue Laute.";
};

FUNC INT Info_Mod_Zeki_Laute_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LauteFertig))
	&& (Npc_HasItems(hero, ItMi_Lute_Zeki) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zeki_Laute_Info()
{
	AI_Output(hero, self, "Info_Mod_Zeki_Laute_15_00"); //Hier ist deine neue Laute.

	B_GiveInvItems	(hero, self, ItMi_Lute_Zeki, 1);

	AI_Output(self, hero, "Info_Mod_Zeki_Laute_05_01"); //(erfreut) Danke, ich bin dir nun etwas schuldig.
	AI_Output(hero, self, "Info_Mod_Zeki_Laute_15_02"); //Wie wäre es mit deiner Stimme für die Aufnahme bei euch?
	AI_Output(self, hero, "Info_Mod_Zeki_Laute_05_03"); //Ja, wie versprochen bekommst du sie.
	AI_Output(self, hero, "Info_Mod_Zeki_Laute_05_04"); //Wenn Shakir nach dir fragt, werde ich ihm nur das Beste über dich berichten.
	AI_Output(hero, self, "Info_Mod_Zeki_Laute_15_05"); //Danke, das wollte ich hören.
	AI_Output(self, hero, "Info_Mod_Zeki_Laute_05_06"); //Nun werde ich mich wieder völlig dem Lautenspiel widmen können.

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Ich habe Zeki seine neue Laute gebracht und er war sehr glücklich darüber. Nun ist mir eine Stimme für die Aufnahme sicher und ich kann mich nun weiteren Dingen widmen.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_ZEKI_LAUTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Zeki_Pickpocket (C_INFO)
{
	npc		= Mod_7102_ASS_Zeki_NW;
	nr		= 1;
	condition	= Info_Mod_Zeki_Pickpocket_Condition;
	information	= Info_Mod_Zeki_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Zeki_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Zeki_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);

	Info_AddChoice	(Info_Mod_Zeki_Pickpocket, DIALOG_BACK, Info_Mod_Zeki_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Zeki_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Zeki_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Zeki_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);
};

FUNC VOID Info_Mod_Zeki_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);

		Info_AddChoice	(Info_Mod_Zeki_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Zeki_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Zeki_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Zeki_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Zeki_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Zeki_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Zeki_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Zeki_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Zeki_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Zeki_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Zeki_EXIT (C_INFO)
{
	npc		= Mod_7102_ASS_Zeki_NW;
	nr		= 1;
	condition	= Info_Mod_Zeki_EXIT_Condition;
	information	= Info_Mod_Zeki_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Zeki_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zeki_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};