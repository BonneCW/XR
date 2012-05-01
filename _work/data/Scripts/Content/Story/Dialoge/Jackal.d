INSTANCE Info_Mod_Jackal_Hi (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Hi_Condition;
	information	= Info_Mod_Jackal_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jackal_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_Hi_07_00"); //(schlecht gelaunt) Na, sieht mal einer an. Da hat man schon einen schlechten Tag, und dann kommst auch noch du.
};

INSTANCE Info_Mod_Jackal_WoProblem (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_WoProblem_Condition;
	information	= Info_Mod_Jackal_WoProblem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo ist das Problem?";
};

FUNC INT Info_Mod_Jackal_WoProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_WoProblem_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_WoProblem_15_00"); //Wo ist das Problem?
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_01"); //Ich kann dich einfach nicht leiden.
	AI_Output(hero, self, "Info_Mod_Jackal_WoProblem_15_02"); //Nein, ich meine, abgesehen von mir.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_03"); //Ach, ist halt scheiße. Ich könnte mir in den Arsch beißen.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_04"); //Gestern Abend hab ich mit den Jungs am Lagerfeuer in der Burg gesoffen, und als sie dann ihre Sumpfkrautstängel ausgepackt haben, hab ich angefangen, von meinem Kästchen mit Varant-Tabak zu schwärmen.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_05"); //Das ist wirklich eine der besten Sorten, die es gibt, und natürlich wollten alle das Kästchen sehen.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_06"); //Betrunken wie ich war, hab ich es geholt und gezeigt, und eh ich mich versah, hatte ich den ganzen Tabak verschenkt, bis auf den letzten Krümel.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_07"); //Heute morgen wusste natürlich niemand mehr was davon, und ich hab auch keine Ahnung, wem ich alles was gegeben habe.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_07_08"); //Der Tabak ist jetzt sicher in der ganzen Burg und im ganzen Lager verteilt.

	Info_ClearChoices	(Info_Mod_Jackal_WoProblem);

	Info_AddChoice	(Info_Mod_Jackal_WoProblem, "Den Tabak wirst du wohl nie wiedersehen.", Info_Mod_Jackal_WoProblem_B);
	Info_AddChoice	(Info_Mod_Jackal_WoProblem, "Ich könnte ja mal die Augen offen halten.", Info_Mod_Jackal_WoProblem_A);
};

FUNC VOID Info_Mod_Jackal_WoProblem_B()
{
	AI_Output(hero, self, "Info_Mod_Jackal_WoProblem_B_15_00"); //(übertrieben mitfühlend) Den Tabak wirst du wohl nie wiedersehen.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_B_07_01"); //Deswegen wäre ich auch gerade in der richtigen Laune, dir mit meinem Schwert ein zweites Arschloch zu stechen.

	Info_ClearChoices	(Info_Mod_Jackal_WoProblem);
};

FUNC VOID Info_Mod_Jackal_WoProblem_A()
{
	AI_Output(hero, self, "Info_Mod_Jackal_WoProblem_A_15_00"); //Ich könnte ja mal die Augen offen halten.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_A_07_01"); //Das wird dir nichts bringen. Den Tabak findest du nur mit deiner Nase. Er riecht durchdringend nach herber Vanille mit einem Hauch Safran.
	AI_Output(self, hero, "Info_Mod_Jackal_WoProblem_A_07_02"); //Wenn du tatsächlich auf Reste meines Tabaks stößt, bring sie sofort zu mir!

	Info_ClearChoices	(Info_Mod_Jackal_WoProblem);

	Log_CreateTopic	(TOPIC_MOD_JACKAL_TABAK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JACKAL_TABAK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JACKAL_TABAK, "Jackal hat bei einem Besäufnis seinen ganzen Vorrat an Varant-Tabak verschenkt, will ihn jetzt aber um jeden Preis zurückhaben. Mittlerweile ist er sicher in der ganzen Burg verstreut. Ich erkenne ihn an seinem markanten Duft aus Vanille und Safran.");

	Wld_InsertItem	(ItMi_JackalTabak_01, "FP_ITEM_JACKALTABAK_01");
	Wld_InsertItem	(ItMi_JackalTabak_02, "FP_ITEM_JACKALTABAK_02");
	Wld_InsertItem	(ItMi_JackalTabak_03, "FP_ITEM_JACKALTABAK_03");
	Wld_InsertItem	(ItMi_JackalTabak_04, "FP_ITEM_JACKALTABAK_04");
	Wld_InsertItem	(ItMi_JackalTabak_05, "FP_ITEM_JACKALTABAK_05");
	Wld_InsertItem	(ItMi_JackalTabak_06, "FP_ITEM_JACKALTABAK_06");
	Wld_InsertItem	(ItMi_JackalTabak_07, "FP_ITEM_JACKALTABAK_07");
	Wld_InsertItem	(ItMi_JackalTabak_08, "FP_ITEM_JACKALTABAK_08");
	Wld_InsertItem	(ItMi_JackalTabak_09, "FP_ITEM_JACKALTABAK_09");
	Wld_InsertItem	(ItMi_JackalTabak_10, "FP_ITEM_JACKALTABAK_10");
	Wld_InsertItem	(ItMi_JackalTabak_11, "FP_ITEM_JACKALTABAK_11");
	Wld_InsertItem	(ItMi_JackalTabak_12, "FP_ITEM_JACKALTABAK_12");
	Wld_InsertItem	(ItMi_JackalTabak_13, "FP_ITEM_JACKALTABAK_13");
};

INSTANCE Info_Mod_Jackal_HabTabak (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_HabTabak_Condition;
	information	= Info_Mod_Jackal_HabTabak_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe hier etwas für dich ...";
};

FUNC INT Info_Mod_Jackal_HabTabak_Condition()
{
	if (Npc_HasItems(hero, ItMi_JackalTabak) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_HabTabak_Info()
{
	var int goldamount; goldamount = Npc_HasItems(hero, ItMi_JackalTAbak);
	var int epamount; epamount = goldamount;

	AI_Output(hero, self, "Info_Mod_Jackal_HabTabak_15_00"); //Ich habe hier etwas für dich ...

	B_GiveInvItems	(hero, self, ItMi_JackalTabak, goldamount);

	if (Npc_HasItems(self, ItMi_JackalTabak) == 13)
	{
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_01"); //Ich fass es nicht! Das Kästchen ist wieder voll! Du hast mir meinen ganzen Tabak zurückgebracht.
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_02"); //Ich ... weiß gar nicht, was ich sagen soll. Aber dafür lass ich noch was springen.

		if (Mod_Jackal_Tabak_1 == FALSE)
		&& (Mod_Jackal_Tabak_7 == FALSE)
		{
			goldamount += 6;

			Mod_Jackal_Tabak_1 = TRUE;
		}
		else if (Mod_Jackal_Tabak_1 == TRUE)
		&& (Mod_Jackal_Tabak_7 == FALSE)
		{
			goldamount += 5;

			Mod_Jackal_Tabak_1 = TRUE;
		}
		else if (Mod_Jackal_Tabak_1 == FALSE)
		&& (Mod_Jackal_Tabak_7 == TRUE)
		{
			goldamount += 1;

			Mod_Jackal_Tabak_1 = TRUE;
		};

		goldamount += 12;

		epamount += 10;

		CurrentNQ += 1;

		B_SetTopicStatus	(TOPIC_MOD_JACKAL_TABAK, LOG_SUCCESS);
	}
	else if (Npc_HasItems(self, ItMi_JackalTabak) >= 7)
	&& (Mod_Jackal_Tabak_7 == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_03"); //Das müsste mittlerweile schon mehr als Hälfte des Tabaks sein. Gute Arbeit. Das gibt einen kleinen Bonus.

		if (Mod_Jackal_Tabak_1 == FALSE)
		{
			goldamount += 6;

			Mod_Jackal_Tabak_1 = TRUE;
		}
		else
		{
			goldamount += 5;
		};

		Mod_Jackal_Tabak_7 = TRUE;
	}
	else if (Npc_HasItems(self, ItMi_JackalTabak) >= 1)
	&& (Mod_Jackal_Tabak_1 == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_04"); //Du hast ja tatsächlich was von meinem Tabak gefunden. Jetzt hab ich wenigstens ein bisschen zurück.
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_05"); //Hier, das ist mir was wert.

		goldamount += 1;

		Mod_Jackal_Tabak_1 = TRUE;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Jackal_HabTabak_07_06"); //Du hast noch mehr? Danke, Mann.
	};

	B_GiveInvItems	(self, hero, ItMi_Gold, goldamount*20);

	B_GivePlayerXP	(epamount*30);
};

INSTANCE Info_Mod_Jackal_Dieb (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Dieb_Condition;
	information	= Info_Mod_Jackal_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört ...";
};

FUNC INT Info_Mod_Jackal_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Jackal_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_Dieb_15_00"); //Ich habe gehört, dass bei den Erzbaronen gestohlen wird, und du stehst auf der Verdächtigenliste.
	AI_Output(self, hero, "Info_Mod_Jackal_Dieb_07_01"); //Nun, man hört viel und nicht immer das Richtige.
	AI_Output(hero, self, "Info_Mod_Jackal_Dieb_15_02"); //Du sagst mir jetzt, was du weißt, sonst wirst du dir wünschen, du wärst tot auf die Welt gekommen.
	AI_Output(self, hero, "Info_Mod_Jackal_Dieb_07_03"); //Dann komm doch her!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Jackal_Frage (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Frage_Condition;
	information	= Info_Mod_Jackal_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Ahnung ...";
};

FUNC INT Info_Mod_Jackal_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Jackal_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_Frage_15_00"); //Hast du eine Ahnung, wer für den Diebstahl bei den Erzbarone verantwortlich sein könnte?
	AI_Output(self, hero, "Info_Mod_Jackal_Frage_07_01"); //Nein, aber wenn ich wüsste wer es ist, würde ich es dir nicht erzählen.
	AI_Output(hero, self, "Info_Mod_Jackal_Frage_15_02"); //Du sagst mir jetzt, was du weißt, sonst wirst du dir wünschen, du wärst tot auf die Welt gekommen.
	AI_Output(self, hero, "Info_Mod_Jackal_Frage_07_03"); //Dann komm doch her!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Jackal_Dealer (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Dealer_Condition;
	information	= Info_Mod_Jackal_Dealer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wenn ich ...";
};

FUNC INT Info_Mod_Jackal_Dealer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_Dieb))
	&& (Mod_PDV_Jackal_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_Dealer_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_Dealer_15_00"); //Wenn ich "besondere" Waren kaufen möchte, an wen sollte ich mich da wenden?
	AI_Output(self, hero, "Info_Mod_Jackal_Dealer_07_01"); //An deiner Stelle würde ich es bei Fisk versuchen.
	AI_Output(hero, self, "Info_Mod_Jackal_Dealer_15_02"); //Verstehe, vieleicht kann der mir helfen.

	Mod_PDV_Jackal_Infos = 1;

	Mod_PDV_Genug_Infos += 1;

	B_LogEntry	(TOPIC_MOD_PDV, "Jackal weiß anscheinend etwas, aber die einzige Information, die ich bekommen habe, war, dass ich es bei Fisk versuchen sollte.");
};

INSTANCE Info_Mod_Jackal_Umgehauen (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Umgehauen_Condition;
	information	= Info_Mod_Jackal_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_Umgehauen_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Jackal_Dieb))
	|| (Npc_KnowsInfo(hero, Info_Mod_Jackal_Frage)))
	&& (Mod_PDV_Jackal_Infos == 0)
	&& (Mod_PDV_Fisk_Infos == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Jackal_Umgehauen_07_00"); //Ok, OK, du hast gewonnen. Aber ich bin der falsche dafür, geh lieber zu Fisk.

			Mod_PDV_Jackal_Infos	=	1;

			Mod_PDV_Genug_Infos += 1;

			B_LogEntry	(TOPIC_MOD_PDV, "Jackal weiß anscheinend etwas, aber die einzige Information, die ich bekommen habe, war, dass ich es bei Fisk versuchen sollte.");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Jackal_Umgehauen_07_01"); //Verzieh dich, beim nächsten mal bring ich dich um!
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Jackal_Fluchthilfe (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Fluchthilfe_Condition;
	information	= Info_Mod_Jackal_Fluchthilfe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_Fluchthilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gardist1_Hi))
	&& (Npc_IsDead(Mod_1895_GRD_Gardist_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_Fluchthilfe_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_Fluchthilfe_07_00"); //Nimm diese Spruchrolle und verschwinde hier.

	CreateInvItems	(self, ItSc_TeleportVorAL, 1);
	B_GiveInvItems	(self, hero, ItSc_TeleportVorAL, 1);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Jackal_KillMission (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_KillMission_Condition;
	information	= Info_Mod_Jackal_KillMission_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört, du kannst mir bei meinem Auftrag helfen.";
};

FUNC INT Info_Mod_Jackal_KillMission_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Makanius_KillMission))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_KillMission_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_KillMission_15_00"); //Ich habe gehört, du kannst mir bei meinem Auftrag helfen.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_01"); //Ja, kann ich. Eigentlich hätte ich ihn ausführen sollen, aber Bartholo verdächtigt mich.
	AI_Output(hero, self, "Info_Mod_Jackal_KillMission_15_02"); //Also, wie kannst du mir helfen?
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_03"); //Ich habe Informationen zu den Zielpersonen gesammelt.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_04"); //Fletcher steht meisten vor dem Innenring, allerdings erstattet er Bloodwyn Nachts um 22 Uhr Bericht.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_05"); //Ian ist meistens im Aussenring bei der ehemaligen Hütte von Diego, allerdings geht er einmal mittags zu den Arenakämpfen und kommt erst Abend wieder, wonach er in seine bewachte Hütte geht und sich schlafen legt.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_06"); //Cathran geht vom Lager der königlichen Garde jeden Morgen in das alte Lager, wo er Bloodwyn Neues berichtet.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_07"); //Danach ist er bis zu Abend im Haus der Gardisten, wo er sich in der Kneipe besauft und geht danach wieder zurück zur königlichen Garde, wo er sie ausspioniert.
	AI_Output(self, hero, "Info_Mod_Jackal_KillMission_07_08"); //Allerdings kannst du das Lager nicht verlassen.

	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Jackal hat mir Informationen zu den Ziele gegeben: Fletcher geht um 22 Uhr über den Innenring, da könnte ich ihn erwischen.");
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Ian geht mittags zu den Arenakämpfen und kommt erst Abend wieder zurück. Ein guter Moment um ihn auszuschalten.");
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Cathran kommt Morgens in das alte Lager und verlässt es Abends wieder, Abends dürfte eine gute Chance sein um ihn zu töten.");

	Wld_SendTrigger	("EVT_OC_MAINGATE01_01");
};

INSTANCE Info_Mod_Jackal_AllDead (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AllDead_Condition;
	information	= Info_Mod_Jackal_AllDead_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alle drei sind tot.";
};

FUNC INT Info_Mod_Jackal_AllDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_KillMission))
	&& (Npc_IsDead(Mod_1113_GRD_Fletcher_MT))
	&& (Npc_IsDead(Mod_1902_STT_Ian_MT))
	&& (Npc_IsDead(Mod_1025_KGD_Cathran_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AllDead_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_AllDead_15_00"); //Alle drei sind tot.
	AI_Output(self, hero, "Info_Mod_Jackal_AllDead_07_01"); //Gut, geh und lass dich zurück in das Bergkastell zu Alissandro teleportieren.

	AI_Teleport	(Mod_1876_EBR_Bloodwyn_MT, "WP_LAUSCH_BLOODWYN");
	B_StartOtherRoutine	(Mod_1876_EBR_Bloodwyn_MT, "BELAUSCHEN");
	AI_Teleport	(Mod_1876_EBR_Bloodwyn_MT, "WP_LAUSCH_BLOODWYN");
};

INSTANCE Info_Mod_Jackal_AngriffBloodwyn (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AngriffBloodwyn_Condition;
	information	= Info_Mod_Jackal_AngriffBloodwyn_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_AngriffBloodwyn_Condition()
{
	if (Mod_AL_BloodwynBartholoGefangen == 2)
	&& (Npc_GetDistToWP(self, "CASTLE_MOVEMENT_STRAIGHT") < 10000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AngriffBloodwyn_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_AngriffBloodwyn_07_00"); //Angriff!

	B_StartOtherRoutine	(Mod_1145_GRD_Gardist_MT, "FLUCHT");

	AI_StopProcessInfos	(self);

	B_Attack	(self, Mod_1876_EBR_Bloodwyn_MT, AR_Kill, 0);
};

INSTANCE Info_Mod_Jackal_BloodwynDead (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_BloodwynDead_Condition;
	information	= Info_Mod_Jackal_BloodwynDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_BloodwynDead_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Jackal_AngriffBloodwyn))
	|| (Mod_AL_BloodwynBartholoGefangen == 2))
	&& (Npc_IsDead(Mod_1876_EBR_Bloodwyn_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_BloodwynDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_BloodwynDead_07_00"); //Nun müssen wir Alissandro warnen.
	
	B_LogEntry	(TOPIC_MOD_AL_KillMission, "Mit der Hilfe von Jackal konnte ich Bloodwyn außerhalb des Lagers töten. Wir müssen allerdings Alissandro warnen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jackal_AtZuflucht (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AtZuflucht_Condition;
	information	= Info_Mod_Jackal_AtZuflucht_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_AtZuflucht_Condition()
{
	if (Mod_AL_EnteredGobboCaveFirstTime == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AtZuflucht_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_AtZuflucht_07_00"); //Verdammt, zum Glück habe ich dich rechtzeitig gefunden.
	AI_Output(hero, self, "Info_Mod_Jackal_AtZuflucht_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Jackal_AtZuflucht_07_02"); //Ich habe Alissandro so weit wie möglich beschützt, allerdings kamen wir in einen Kampf mit Gardisten.
	AI_Output(self, hero, "Info_Mod_Jackal_AtZuflucht_07_03"); //Wir konnten sie besiegen, allerdings hat mich Alissandro danach weggeschickt. Er meinte, es würde zuviel Aufmerksamkeit erregen wenn wir zusammen sind.
	AI_Output(hero, self, "Info_Mod_Jackal_AtZuflucht_15_04"); //Und wo liegt das Problem?
	AI_Output(self, hero, "Info_Mod_Jackal_AtZuflucht_07_05"); //Alissandro meinte, wenn er sich nicht sofort meldet, wenn er die Zuflucht erreicht, soll ich nach ihm suchen.
	AI_Output(hero, self, "Info_Mod_Jackal_AtZuflucht_15_06"); //Gut, wo sollen wir suchen?
	AI_Output(self, hero, "Info_Mod_Jackal_AtZuflucht_07_07"); //Wir haben uns bei dem versunkenen Turm verloren.
	AI_Output(hero, self, "Info_Mod_Jackal_AtZuflucht_15_08"); //Gut, dann sollten wir uns da mal umsehen.
	
	B_StartOtherRoutine	(Mod_1141_GRD_Gardist_MT, "ATTURM");

	Log_CreateTopic	(TOPIC_MOD_AL_WhereAlissandro, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_WhereAlissandro, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_WhereAlissandro, "Jackal meinte, Alissandro könnte in Gefahr sein. Ich sollte zu Xardas' versunkenen Turm gehen, an dem er Alissandro verloren hat.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATTURM");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "GEFANGEN");
};

INSTANCE Info_Mod_Jackal_AtTurm (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AtTurm_Condition;
	information	= Info_Mod_Jackal_AtTurm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_AtTurm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gardist2_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AtTurm_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_AtTurm_07_00"); //Ihr habt Alissandro gefangen?
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jackal_WeHaveToGoToOC (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_WeHaveToGoToOC_Condition;
	information	= Info_Mod_Jackal_WeHaveToGoToOC_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_WeHaveToGoToOC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gardist2_Jackal))
	&& (Npc_IsDead(Mod_1141_GRD_Gardist_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_WeHaveToGoToOC_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_WeHaveToGoToOC_07_00"); //Er hat gesagt, sie haben Alissandro gefangen und wollen ihn hinrichten, aber damit kommen sie nicht durch. Wir müssen in das alte Lager!

	B_LogEntry	(TOPIC_MOD_AL_WhereAlissandro, "Am Turm griff uns ein Gardist an. Er meinte, Alissandro wurde gefangen genommen und soll hingerichtet werden.");
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOOLDCAMP");
};

INSTANCE Info_Mod_Jackal_AtOC (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AtOC_Condition;
	information	= Info_Mod_Jackal_AtOC_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_AtOC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_WeHaveToGoToOC))
	&& (Npc_GetDistToWP(self, "OC_ROUND_1") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AtOC_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_AtOC_07_00"); //Nimm diese Spruchrolle und öffne dann das Tor.

	CreateInvItems	(self, ItSc_TrfRabbit, 1);
	B_GiveInvItems	(self, hero, ItSc_TrfRabbit, 1);
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOOLDCAMP");
};

INSTANCE Info_Mod_Jackal_ComeIn (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_ComeIn_Condition;
	information	= Info_Mod_Jackal_ComeIn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Komm rein!";
};

FUNC INT Info_Mod_Jackal_ComeIn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_AtOC))
	&& (Npc_GetDistToWP(self, "OC_ROUND_1") < 500)
	&& (Mod_ALTor_01 == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_ComeIn_Info()
{
	AI_Output(hero, self, "Info_Mod_Jackal_ComeIn_15_00"); //Komm rein!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "INOLDCAMP");
};

INSTANCE Info_Mod_Jackal_InOC (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_InOC_Condition;
	information	= Info_Mod_Jackal_InOC_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_InOC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jackal_ComeIn))
	&& (Npc_GetDistToWP(self, "OCR_MAINGATE_INSIDE") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_InOC_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_InOC_07_00"); //Lenk du die Gardisten ab, ich werde Alissandro befreien.

	B_LogEntry	(TOPIC_MOD_AL_WhereAlissandro, "Ich bin mit Jackal zum alten Lager gegangen. Er will Alissandro befreien, während ich die Gardisten ablenke.");
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BEFREIUNG");
};

INSTANCE Info_Mod_Jackal_AtPC (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_AtPC_Condition;
	information	= Info_Mod_Jackal_AtPC_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jackal_AtPC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alissandro_GotoZufluchten))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_01_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_02_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_03_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_04_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_05_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_06_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gardist_Zuflucht_07_Hi))
	&& (Npc_GetDistToWP(self, "PSI_TEMPLE_STAIRS_1") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jackal_AtPC_Info()
{
	AI_Output(self, hero, "Info_Mod_Jackal_AtPC_07_00"); //Alissandro will, dass du in den Tempel gehst. Dort beraten sich die Gildenführer.

	B_LogEntry	(TOPIC_MOD_AL_EROBERUNG, "Ich soll in den Tempel zu den Gildenführern gehen, Alissandro erwartet mich bereits.");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jackal_Pickpocket (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_Pickpocket_Condition;
	information	= Info_Mod_Jackal_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Jackal_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 450);
};

FUNC VOID Info_Mod_Jackal_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);

	Info_AddChoice	(Info_Mod_Jackal_Pickpocket, DIALOG_BACK, Info_Mod_Jackal_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jackal_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jackal_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jackal_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);
};

FUNC VOID Info_Mod_Jackal_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);

		Info_AddChoice	(Info_Mod_Jackal_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Jackal_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Jackal_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Jackal_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Jackal_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Jackal_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Jackal_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Jackal_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Jackal_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Jackal_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Jackal_EXIT (C_INFO)
{
	npc		= Mod_1107_GRD_Jackal_MT;
	nr		= 1;
	condition	= Info_Mod_Jackal_EXIT_Condition;
	information	= Info_Mod_Jackal_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jackal_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};