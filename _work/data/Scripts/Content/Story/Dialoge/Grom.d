INSTANCE Info_Mod_Grom_Hi (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_Hi_Condition;
	information	= Info_Mod_Grom_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Grom_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grom_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Grom_Hi_08_01"); //Hi.
};

INSTANCE Info_Mod_Grom_WhoAreYou (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_WhoAreYou_Condition;
	information	= Info_Mod_Grom_WhoAreYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du Grom?";
};

FUNC INT Info_Mod_Grom_WhoAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grom_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_WhoAreYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_WhoAreYou_15_00"); //Bist du Grom?
	AI_Output(self, hero, "Info_Mod_Grom_WhoAreYou_08_01"); //Ja ... was willst du?
};

INSTANCE Info_Mod_Grom_Dragomir (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_Dragomir_Condition;
	information	= Info_Mod_Grom_Dragomir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dragomir schickt mich.";
};

FUNC INT Info_Mod_Grom_Dragomir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grom_WhoAreYou))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_Dragomir_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_Dragomir_15_00"); //Ich soll dich von Dragomir fragen, ob du Neues über die Gegend hier herausgefunden hast.
	AI_Output(self, hero, "Info_Mod_Grom_Dragomir_08_01"); //Jetzt lässt der auch noch Anfänger durch die Wälder laufen, unglaublich. Aber wenn es unbedingt sein muss ...
	AI_Output(hero, self, "Info_Mod_Grom_Dragomir_15_02"); //Ja, es muss sein. Und jetzt erzähl mir, was du weisst. Ich möchte heute noch weiter.
	AI_Output(self, hero, "Info_Mod_Grom_Dragomir_08_03"); //Nein, bisher gibt es nicht viel Neues. Die faulen Söldner lungern hier beständig rum und verteiben jegliches Wild im Umkreis von ein paar Meilen.
	AI_Output(self, hero, "Info_Mod_Grom_Dragomir_08_04"); //In letzter Zeit scheinen allerdings die Feldräuber viel aggressiver zu sein als normalerweise.
	AI_Output(self, hero, "Info_Mod_Grom_Dragomir_08_05"); //Sie gehen viel weiter in die Felder rein und greifen auch Bauern an, zum Leidwesen der Söldner.
	AI_Output(self, hero, "Info_Mod_Grom_Dragomir_08_06"); //(lacht dreckig) Da kriegen die ihren Arsch auch mal wieder hoch.

	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Bei Grom gibt es nichts neues, außer, dass die Feldräuber aggressiver zu sein scheinen als gewöhnlich.");
};

INSTANCE Info_Mod_Grom_WerBistDu (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_KeinBock_Condition;
	information	= Info_Mod_Grom_KeinBock_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dir gefällts hier wohl nicht sonderlich.";
};

FUNC INT Info_Mod_Grom_KeinBock_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grom_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_KeinBock_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_KeinBock_15_00"); //Dir gefällts hier wohl nicht sonderlich.
	AI_Output(self, hero, "Info_Mod_Grom_KeinBock_08_01"); //Nein, kann man nicht behaupten. Diese ignoranten Großkotze können doch nur ihr Maul aufreissen und trampeln wie eine Herde fetter Molerats alles nieder, was sie antreffen.
	AI_Output(self, hero, "Info_Mod_Grom_KeinBock_08_02"); //Hast du schon einmal eine ihrer Höhlen gesehen? Wiederlich!
};

INSTANCE Info_Mod_Grom_Sauhaufen (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_Sauhaufen_Condition;
	information	= Info_Mod_Grom_Sauhaufen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ja, ein echter Sauhaufen hier.";
};

FUNC INT Info_Mod_Grom_Sauhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grom_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_Sauhaufen_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_Sauhaufen_15_00"); //Ja, ein echter Sauhaufen hier.
	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_08_01"); //Hm, sag mal, hast du nicht an 'ner kleinen Aufgabe Interesse?
	AI_Output(hero, self, "Info_Mod_Grom_Sauhaufen_15_02"); //Kommt darauf an.
	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_08_03"); //Ich wollte mir mal die geheimen Lagerräume der Söldner ansehen, allerdings wachen die davor wie ein Drache vor seinem Hort. Ich möchte, dass du sie etwas ... ablenkst.

	Info_ClearChoices	(Info_Mod_Grom_Sauhaufen);

	Info_AddChoice	(Info_Mod_Grom_Sauhaufen, "Nein, besser nicht.", Info_Mod_Grom_Sauhaufen_Nein);
	Info_AddChoice	(Info_Mod_Grom_Sauhaufen, "Klingt gefährlich.", Info_Mod_Grom_Sauhaufen_Ja);
};

FUNC VOID Info_Mod_Grom_Sauhaufen_Nein()
{
	AI_Output(hero, self, "Info_Mod_Grom_Sauhaufen_Nein_15_00"); //Nein, besser nicht.
	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_Nein_08_01"); //Dann halte mich nicht länger auf.

	Info_ClearChoices	(Info_Mod_Grom_Sauhaufen);
};

FUNC VOID Info_Mod_Grom_Sauhaufen_Ja()
{
	AI_Output(hero, self, "Info_Mod_Grom_Sauhaufen_Ja_15_00"); //Klingt gefährlich.
	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_Ja_08_01"); //Ist es nicht. Hör zu. Schütte einfach, wenn gerade keine hinschaut, diesen Scavangerdung in Theklas Eintopf.

	B_GiveInvItems	(self, hero, ItMi_Scavengerdung, 1);

	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_Ja_08_02"); //Die Söldner essen jeden Abend davon und werden dadurch ziemliche Magenkrämpfe kriegen, darauf kannst du dich verlassen.
	AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_Ja_08_03"); //Wie du das anstellst, ist mir egal, sie dürfen nur nichts mitbekommen. Notfalls versuchs halt nachts, dem Dung schadet es nicht, wenn er lange ziehen kann.

	if (Npc_HasItems(hero, ItMi_Pan) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Grom_Sauhaufen_Ja_08_04"); //Hier hast du noch eine Pfanne, damit sollte es leichter gehen.

		B_GiveInvItems	(self, hero, ItMi_Pan, 1);
	};

	AI_Output(hero, self, "Info_Mod_Grom_Sauhaufen_Ja_15_05"); //Ist klar, ich bin bald wieder zurück.

	Log_CreateTopic	(TOPIC_MOD_JG_DUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_DUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_DUNG, "Der Jäger Grom will sich in der Vorratskammer der Söldner umsehen. Dazu soll ich Scavengerdung in Theklas Eintopf mischen.");

	Info_ClearChoices	(Info_Mod_Grom_Sauhaufen);
};

INSTANCE Info_Mod_Grom_DungDrin (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_DungDrin_Condition;
	information	= Info_Mod_Grom_DungDrin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dieses mal dürftest du keine Probleme bekommen.";
};

FUNC INT Info_Mod_Grom_DungDrin_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_DungDrin_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_DungDrin_15_00"); //Dieses mal dürftest du keine Probleme bekommen.
	AI_Output(self, hero, "Info_Mod_Grom_DungDrin_08_01"); //Hehe, dank dir. Vielleicht habe ich mich in dir getäuscht. Du bist echt in Ordnung.
	AI_Output(self, hero, "Info_Mod_Grom_DungDrin_08_02"); //Hier hast du etwas Gold als Belohnung.

	B_GivePlayerXP	(100);

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_Göttergefallen(3, 1);

	B_LogEntry	(TOPIC_MOD_JG_DUNG, "Ich habe Grom gesagt, dass er sich jetzt in den Lagerräumen umsehen kann.");
	B_SetTopicStatus	(TOPIC_MOD_JG_DUNG, LOG_SUCCESS);
};

INSTANCE Info_Mod_Grom_Untier (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_Untier_Condition;
	information	= Info_Mod_Grom_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir in letzter Zeit etwas Ungewöhnliches begegnet?";
};

FUNC INT Info_Mod_Grom_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grom_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Grom_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Grom_Untier_15_00"); //Ist dir in letzter Zeit etwas Ungewöhnliches begegnet?
	AI_Output(self, hero, "Info_Mod_Grom_Untier_08_01"); //Hmm, nein, nur das Übliche. Jede Menge Holz zum Bearbeiten und zwei Trolle.
};

INSTANCE Info_Mod_Grom_Pickpocket (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_Pickpocket_Condition;
	information	= Info_Mod_Grom_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Grom_Pickpocket_Condition()
{
	C_Beklauen	(60, ItAt_LurkerSkin, 2);
};

FUNC VOID Info_Mod_Grom_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Grom_Pickpocket);

	Info_AddChoice	(Info_Mod_Grom_Pickpocket, DIALOG_BACK, Info_Mod_Grom_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Grom_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Grom_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Grom_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Grom_Pickpocket);
};

FUNC VOID Info_Mod_Grom_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Grom_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Grom_Pickpocket);

		Info_AddChoice	(Info_Mod_Grom_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Grom_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Grom_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Grom_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Grom_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Grom_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Grom_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Grom_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Grom_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Grom_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Grom_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Grom_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Grom_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Grom_EXIT (C_INFO)
{
	npc		= Mod_766_NONE_Grom_NW;
	nr		= 1;
	condition	= Info_Mod_Grom_EXIT_Condition;
	information	= Info_Mod_Grom_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Grom_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Grom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};