INSTANCE Info_Mod_Balthasar_Hi (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Hi_Condition;
	information	= Info_Mod_Balthasar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Balthasar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balthasar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Balthasar_Hi_05_01"); //Ich bin Balthasar und hier der Schafshirte.
};

INSTANCE Info_Mod_Balthasar_Untier (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Untier_Condition;
	information	= Info_Mod_Balthasar_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hattest nicht zufällig in letzter Zeit eine Begegnung mit einem Raubtier, welches ...";
};

FUNC INT Info_Mod_Balthasar_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balthasar_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Untier_15_00"); //Du hattest nicht zufällig in letzter Zeit eine Begegnung mit einem Raubtier, welches ...
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_05_01"); //(aufgeregt) Ja, das will ich aber meinen. Erst vor zwei Tagen konnte ich mich nur mit Mühe meiner Haut erwähren.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_05_02"); //Es war früh morgens, ich war gerade aufgestanden und hatte die Schafe auf die Weide getrieben, als ich ein Geräusch hinter der Scheune hörte.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_05_03"); //Neugierig und beunruhigt zog ich meine Waffe und ging nachsehen.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_05_04"); //Als ich jedoch hinter die Scheune trat, stockte mir der Atem: Da stand ein mannshohes Untier auf allen Vieren und fauchte mich an.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_05_05"); //Noch  bevor ich zum Schlag ausholen konnte sprang es mich an und meine Waffe fiel zu Boden.

	Info_ClearChoices	(Info_Mod_Balthasar_Untier);

	Info_AddChoice	(Info_Mod_Balthasar_Untier, "Für ausschweifende Erklärungen habe ich jetzt keine Zeit.", Info_Mod_Balthasar_Untier_B);
	Info_AddChoice	(Info_Mod_Balthasar_Untier, "(weiter)", Info_Mod_Balthasar_Untier_A);
};

FUNC VOID Info_Mod_Balthasar_Untier_C()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Untier_C_15_00"); //Danke, das war alles, was ich wissen wollte.
	
	Info_ClearChoices	(Info_Mod_Balthasar_Untier);

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Balthasar berichtete, dass er von einer Bestie überfallen worden sei, die dann Richtung Taverne weiterlief.");

	B_GivePlayerXP	(100);
};

FUNC VOID Info_Mod_Balthasar_Untier_B()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Untier_B_15_00"); //Für ausschweifende Erklärungen habe ich jetzt keine Zeit. Es ist wieder entschwunden? Wenn ja, wohin.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_B_05_01"); //Öhh, ja, zum Schluss lief es Richtung Orlans Taverne.
	
	Info_Mod_Balthasar_Untier_C();
};

FUNC VOID Info_Mod_Balthasar_Untier_A()
{
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_A_05_00"); //Es stand über mich gebeugt und wollte zum Biss ausholen, als ich schnell seinen Kopf umklammerte und fest zudrückte.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_A_05_01"); //Ja, als Hirte muss man nämlich schnell handeln können, wenn es drauf ankommt.
	AI_Output(self, hero, "Info_Mod_Balthasar_Untier_A_05_02"); //Mit der anderen Hand erteilte ich ihm Faustschläge und drückte ihm zuletzt mit den Fingern in die Augen, worauf es sich fauchend losriss und in Richtung Orlans Taverne lief.
	
	Info_Mod_Balthasar_Untier_C();
};

INSTANCE Info_Mod_Balthasar_Unheil (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Unheil_Condition;
	information	= Info_Mod_Balthasar_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist in letzter Zeit etwas Ungewöhnliches passiert?";
};

FUNC INT Info_Mod_Balthasar_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balthasar_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Unheil_15_00"); //Ist in letzter Zeit etwas Ungewöhnliches passiert?
	AI_Output(self, hero, "Info_Mod_Balthasar_Unheil_05_01"); //(etwas debil) Ja, allerdings. Da laufen ganz üble Untote auf dem Friedhof umher.
	AI_Output(self, hero, "Info_Mod_Balthasar_Unheil_05_02"); //Und meinen Schafen geht’s auch nicht so gut zur Zeit. Einige haben sogar angefangen zu lahmen.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Balthasars Schafe lahmen.");

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Balthasar_Hirte (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Hirte_Condition;
	information	= Info_Mod_Balthasar_Hirte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sekob meint du hättest was für mich zu tun.";
};

FUNC INT Info_Mod_Balthasar_Hirte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_Bauer))
	&& (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balthasar_Hirte_Info()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Hirte_15_00"); //Sekob meint du hättest was für mich zu tun.
	AI_Output(self, hero, "Info_Mod_Balthasar_Hirte_05_01"); //Du könntest mal kurz auf die Schafe aufpassen, ich muss nämlich mal.
	AI_Output(self, hero, "Info_Mod_Balthasar_Hirte_05_02"); //Sag bescheid wenn du bereit bist.

	Log_CreateTopic	(TOPIC_MOD_BALTHASAR_SCHAFE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BALTHASAR_SCHAFE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BALTHASAR_SCHAFE, "Ich soll für Balthasar kurz auf seine Schafe aufpassen während er sich erleichtert.");
};

INSTANCE Info_Mod_Balthasar_Bereit (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Bereit_Condition;
	information	= Info_Mod_Balthasar_Bereit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ok, ich bin bereit.";
};

FUNC INT Info_Mod_Balthasar_Bereit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Hirte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balthasar_Bereit_Info()
{
	AI_Output(hero, self, "Info_Mod_Balthasar_Bereit_15_00"); //Ok, ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Balthasar_Bereit_05_01"); //Gut, ich bin dann mal weg.

	AI_StopProcessInfos	(self);

	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");

	Npc_ExchangeRoutine	(self, "WOLF");
};

INSTANCE Info_Mod_Balthasar_Wolf (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Wolf_Condition;
	information	= Info_Mod_Balthasar_Wolf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Balthasar_Wolf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Bereit))
	&& (Mod_Balthasar_Wolf == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balthasar_Wolf_Info()
{
	AI_Output(self, hero, "Info_Mod_Balthasar_Wolf_05_00"); //Was ist denn hier passiert?
	AI_Output(hero, self, "Info_Mod_Balthasar_Wolf_15_01"); //Kurz nachdem du weg warst hat mich ein Rudel Wölfe angegriffen. Aber ich konnte sie aufhalten.
	AI_Output(self, hero, "Info_Mod_Balthasar_Wolf_05_02"); //Danke, was hätte ich nur ohne dich gemacht.
	AI_Output(self, hero, "Info_Mod_Balthasar_Wolf_05_03"); //Nimm diese Münzen als Dank.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BALTHASAR_SCHAFE, "Balthasar ist zufrieden mit mir.");
	B_SetTopicStatus	(TOPIC_MOD_BALTHASAR_SCHAFE, LOG_SUCCESS);

	Mdl_RemoveOverlayMDS (self,"HUMANS_FLEE.MDS");

	B_Göttergefallen(1, 1);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Balthasar_Pickpocket (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_Pickpocket_Condition;
	information	= Info_Mod_Balthasar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Balthasar_Pickpocket_Condition()
{
	C_Beklauen	(10, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Balthasar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Balthasar_Pickpocket);

	Info_AddChoice	(Info_Mod_Balthasar_Pickpocket, DIALOG_BACK, Info_Mod_Balthasar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Balthasar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Balthasar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Balthasar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Balthasar_Pickpocket);
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

INSTANCE Info_Mod_Balthasar_EXIT (C_INFO)
{
	npc		= Mod_101_BAU_Balthasar_NW;
	nr		= 1;
	condition	= Info_Mod_Balthasar_EXIT_Condition;
	information	= Info_Mod_Balthasar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Balthasar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};