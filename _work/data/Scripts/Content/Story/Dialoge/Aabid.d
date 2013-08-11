INSTANCE Info_Mod_Aabid_Hi (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Hi_Condition;
	information	= Info_Mod_Aabid_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Aabid_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Aabid_Hi_09_00"); //Mein Name ist Aabid. Ich bin einer der Gauner hier und gleichzeitig Händler für außergewöhnliche Sorten von Tabak und Sumpfkrautstängeln.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_01"); //Interessant. Kann ich mal dein Angebot sehen?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_09_02"); //Nein, das geht leider nicht.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_03"); //Wieso nicht?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_09_04"); //Ich warte schon seit einiger Zeit auf die Lieferung von drei Sumpfkrautpaketen, aber die Kerle haben mich anscheinend vergessen und ich komme einfach nicht aus dem Versteck.
};

INSTANCE Info_Mod_Aabid_Aufgabe (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Aufgabe_Condition;
	information	= Info_Mod_Aabid_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Soll ich dir die Sumpfkrautpakte bringen?";
};

FUNC INT Info_Mod_Aabid_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_00"); //Soll ich dir die Sumpfkrautpakte bringen?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_09_01"); //Das wäre wirklich gut, wenn du das machen würdest. Aber warum willst du das machen?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_02"); //Ich möchte mich den Gaunern anschließen. Dazu brauche ich jedoch eure Stimmen.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_03"); //Würdest du mir nach dieser Aufgabe eventuell deine Stimme geben.
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_09_04"); //Wenn du alle Pakete bekommen kannst, dann werde ich dir natürlich meine Stimme geben.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_05"); //Abgemacht. Wo soll ich die Pakete abholen?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_09_06"); //Alle drei Händler findest du in der Stadt. Ihre Namen sind Meldor, Borka und zuletzt Jason, ein Milizionär.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_07"); //Jemand von der Miliz handelt mit Sumpfkraut?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_09_08"); //Meinst du die halten sich alle an ihre Regeln?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_09"); //Nein. Also gut, ich werde die drei mal aufsuchen.
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_09_10"); //Gut. Komm wieder, wenn du die Pakete hast.

	Log_CreateTopic	(TOPIC_MOD_ASS_AABID_PAKET, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Ich habe mit Aabid gesprochen, einem er Gauner der Assassinen. Er will mir seine Stimme geben, aber nur, wenn ich ihm drei Pakete voller Sumpfkraut bringe, die eigentlich von verschiedenen 'Händlern' der Stadt hätten geliefert werden müssen. Dieser Personen sind Meldor, Borka und Jason. Wenn ich von ihnen die Pakete erhalten habe, soll ich mich wieder bei Aabid melden.");
};

INSTANCE Info_Mod_Aabid_HabPakete (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_HabPakete_Condition;
	information	= Info_Mod_Aabid_HabPakete_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle Pakete erhalten können.";
};

FUNC INT Info_Mod_Aabid_HabPakete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_HabPakete_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_00"); //Ich habe alle Pakete erhalten können.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_09_01"); //(ungläubig) Du verarscht mich!
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_02"); //Nein, hier sind sie.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 3);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_09_04"); //Das sind tatsächlich alle, wie hast du das nur gemacht?
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_05"); //Reine Intuition, würde ich sagen.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_09_06"); //Ich kann dir nicht genug danken. Hier, nimm dieses Gold als Zeichen meiner Dankbarkeit.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_09_07"); //Außerdem bekommst du meine Stimme.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Ich habe Aabid alle Pakte gebracht und er war sehr zufrieden mit meiner Leistung. Anscheinend hat er damit nicht gerechnet. Nunja, mir soll's recht sein, denn ich bin nun eine Stimme und 500 Goldmünzen reicher.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_SUCCESS);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Aabid_Trade (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Trade_Condition;
	information	= Info_Mod_Aabid_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Aabid_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_HabPakete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Aabid_Pickpocket (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Pickpocket_Condition;
	information	= Info_Mod_Aabid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_27;
};

FUNC INT Info_Mod_Aabid_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 250);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_BACK, Info_Mod_Aabid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aabid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
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

INSTANCE Info_Mod_Aabid_EXIT (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_EXIT_Condition;
	information	= Info_Mod_Aabid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aabid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};