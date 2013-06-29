INSTANCE Info_Mod_Lobart_Hi (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Hi_Condition;
	information	= Info_Mod_Lobart_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_Hi_Condition()
{
	if (Mod_LobartAlwin != 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_00"); //(misstrauisch) Ein weiterer frisch entflohener Gefangener? Oder warum treibst du dich hier herum?
	AI_Output(hero, self, "Info_Mod_Lobart_Hi_15_01"); //Ersteres.
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_02"); //Da wird Lord Hagen wohl wieder ein Jährchen altern, wenn er dich sieht.
	AI_Output(hero, self, "Info_Mod_Lobart_Hi_15_03"); //Wieso? Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_04"); //Er scheint nicht gerade versessen darauf, euch Knastis in seiner Stadt aufzunehmen.
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_05"); //Man überlegt schon, wie man euch wieder vertreiben kann.
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_06"); //Ist natürlich nur das, was man so hört. Mir ist es egal.
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_07"); //So viel kann man mir nicht klauen, und ihr seid ja auch bestimmt nicht alle schlecht.
	AI_Output(self, hero, "Info_Mod_Lobart_Hi_26_08"); //Wenn du ein bisschen Arbeit suchst - ich brauche noch jemanden, der für mich anpackt.
};

INSTANCE Info_Mod_Lobart_Knastis (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Knastis_Condition;
	information	= Info_Mod_Lobart_Knastis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie viele ehemalige Sträflinge sind denn in Khorinis?";
};

FUNC INT Info_Mod_Lobart_Knastis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Knastis_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Knastis_15_00"); //Wie viele ehemalige Sträflinge sind denn in Khorinis?
	AI_Output(self, hero, "Info_Mod_Lobart_Knastis_26_01"); //Nicht viele. Die meisten bleiben dort nicht lange, ist ihnen wohl zu anständig dort (lacht).
	AI_Output(self, hero, "Info_Mod_Lobart_Knastis_26_02"); //Aber in den umliegenden Lagern und Gehöften wirst du einige finden.
};

INSTANCE Info_Mod_Lobart_Arbeit (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Arbeit_Condition;
	information	= Info_Mod_Lobart_Arbeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du sagtest etwas von Arbeit?";
};

FUNC INT Info_Mod_Lobart_Arbeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Arbeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Arbeit_15_00"); //Du sagtest etwas von Arbeit?
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_01"); //Richtig. Nur habe ich vorher noch ein dringenderes Anliegen ...
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_02"); //Mein Hund Sherome ist ausgebüxt und dort hinten in den dichten Wald gelaufen.
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_03"); //Hat wohl einen Hasen gesehen oder so.
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_04"); //Jedenfalls wollte keiner meiner Arbeiter hinterher, selbst die Jäger betreten ja nur den vordersten Teil des Waldes.
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_05"); //Aber du musst doch ein harter Kerl sein, wenn du die Kolonie überlebt hast.
	AI_Output(self, hero, "Info_Mod_Lobart_Arbeit_26_06"); //Deshalb bitte ich dich, nach Sherome zu suchen.

	Info_ClearChoices	(Info_Mod_Lobart_Arbeit);

	Info_AddChoice	(Info_Mod_Lobart_Arbeit, "Frag jemand anderen.", Info_Mod_Lobart_Arbeit_B);
	Info_AddChoice	(Info_Mod_Lobart_Arbeit, "Ich werde mich mal umsehen.", Info_Mod_Lobart_Arbeit_A);
};

FUNC VOID Info_Mod_Lobart_Arbeit_B()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Arbeit_B_15_00"); //Frag jemand anderen.

	Info_ClearChoices	(Info_Mod_Lobart_Arbeit);
};

FUNC VOID Info_Mod_Lobart_Arbeit_A()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Arbeit_A_15_00"); //Ich werde mich mal umsehen.

	Info_ClearChoices	(Info_Mod_Lobart_Arbeit);

	Log_CreateTopic	(TOPIC_MOD_LOBART_HUND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LOBART_HUND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LOBART_HUND, "Lobarts Hund Sherome ist weggelaufen. Ich soll ihn im Wald suchen und zurückbringen.");

	Mod_SheromeSuche = 1;

	B_GetNextRuebe();
};

INSTANCE Info_Mod_Lobart_SheromeDa (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_SheromeDa_Condition;
	information	= Info_Mod_Lobart_SheromeDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_SheromeDa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Schaeferhund_Lobart_Hi))
	&& (Npc_GetDistToNpc(self, Schaeferhund_Lobart_01) < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_SheromeDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_00"); //Du hast meinen Hund zurückgebracht! Wie kann ich dir nur danken!
	AI_Output(hero, self, "Info_Mod_Lobart_SheromeDa_15_01"); //Das ist mein Job!
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_02"); //Trotzdem, nimm das hier, das ist alles, was ich dir geben kann!

	CreateInvItems	(hero, ItMi_Gold, 50);
	CreateInvItems	(hero, ItMi_Nugget, 1);

	B_ShowGivenThings	("Ein Erzbrocken und 50 Gold erhalten");

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_LOBART_HUND, "Ich habe Lobart seinen Hund zurückgebracht.");
	B_SetTopicStatus	(TOPIC_MOD_LOBART_HUND, LOG_SUCCESS);

	CurrentNQ += 1;

	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_03"); //Ich stehe in deiner Schuld, Bursche. Na, was hab ich gesagt?
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_04"); //Deinesgleichen ist doch wirklich nicht so schlecht, wie man glaubt.
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_05"); //Deine Hilfe wäre mir auch auf dem Rübenfeld willkommen.
	AI_Output(hero, self, "Info_Mod_Lobart_SheromeDa_15_06"); //Ich soll Rüben ziehen?!
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_07"); //Stell dir das mal nicht zu einfach vor!
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_08"); //Wenn es normale Rüben wäre, könnten wir sie selbst problemlos ziehen.
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_09"); //Aber dieses Jahr haben die Dinger so enorme Wurzeln gebildet, dass sie untereinander fest verhakt sind.
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_10"); //Die kleben zusammen wie die Kletten!
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_11"); //Meine Arbeiter haben schon kapituliert, vielleicht findest du ja eine Möglichkeit, die Rüben zu lockern.
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_26_12"); //Etwa, indem du immer die schwächste Rübe findest.

	Info_ClearChoices	(Info_Mod_Lobart_SheromeDa);

	Info_AddChoice	(Info_Mod_Lobart_SheromeDa, "Das ist mir doch zu blöd.", Info_Mod_Lobart_SheromeDa_B);
	Info_AddChoice	(Info_Mod_Lobart_SheromeDa, "Wird erledigt.", Info_Mod_Lobart_SheromeDa_A);
};

FUNC VOID Info_Mod_Lobart_SheromeDa_B()
{
	AI_Output(hero, self, "Info_Mod_Lobart_SheromeDa_B_15_00"); //Das ist mir doch zu blöd.
	AI_Output(self, hero, "Info_Mod_Lobart_SheromeDa_B_26_01"); //Das ist unsere tägliche Arbeit.

	Info_ClearChoices	(Info_Mod_Lobart_SheromeDa);
};

FUNC VOID Info_Mod_Lobart_SheromeDa_A()
{
	AI_Output(hero, self, "Info_Mod_Lobart_SheromeDa_A_15_00"); //Wird erledigt.

	Info_ClearChoices	(Info_Mod_Lobart_SheromeDa);

	Log_CreateTopic	(TOPIC_MOD_RUEBENZIEHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_RUEBENZIEHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_RUEBENZIEHEN, "Für Lobart soll ich Rüben vom Feld holen. Er hat mich allerdings vorgewarnt, dass sich durch das starke Wurzelgeflecht das Ziehen schwerer gestalten könnte als vermutet. Ich sollte versuchen immer die lockerste Rübe zu finden.");

	Mod_LobartRuebinator = 1;
};

INSTANCE Info_Mod_Lobart_Rueben (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Rueben_Condition;
	information	= Info_Mod_Lobart_Rueben_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind deine Rüben.";
};

FUNC INT Info_Mod_Lobart_Rueben_Condition()
{
	if (Npc_HasItems(hero, ItPl_Beet) >= 20)
	&& (Mod_LobartRuebinator == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Rueben_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Rueben_15_00"); //Hier sind deine Rüben.

	B_GiveInvItems	(hero, self, ItPl_Beet, 20);

	AI_Output(self, hero, "Info_Mod_Lobart_Rueben_26_01"); //Hätte nicht gedacht, dass du das schaffst. Vielen Dank! Nimm das als Lohn.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(hero, self, "Info_Mod_Lobart_Rueben_15_02"); //Gibt es noch mehr zu tun?
	AI_Output(self, hero, "Info_Mod_Lobart_Rueben_26_03"); //Nichts, womit wir nicht selbst fertig werden. Ich könnte dich auch gar nicht weiter bezahlen.
	AI_Output(self, hero, "Info_Mod_Lobart_Rueben_26_04"); //Du bist aber immer willkommen auf dem Hof! Mach's gut!

	B_LogEntry	(TOPIC_MOD_RUEBENZIEHEN, "Ich hab Lobart seine Rüben gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_RUEBENZIEHEN, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Lobart_Unkraut (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Unkraut_Condition;
	information	= Info_Mod_Lobart_Unkraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_Unkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Rueben))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Unkraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_Unkraut_26_00"); //He, du, wir könnten mal wieder deine Hilfe gebrauchen ...
	AI_Output(hero, self, "Info_Mod_Lobart_Unkraut_15_01"); //Wovon werdet ihr bedroht?
	AI_Output(self, hero, "Info_Mod_Lobart_Unkraut_26_02"); //Unkraut ... die Felder sind voll davon. Du hast uns schon damals bei der Rübenernte geholfen und bist genau der Richtige für die Aufgabe.

	Info_ClearChoices	(Info_Mod_Lobart_Unkraut);

	Info_AddChoice	(Info_Mod_Lobart_Unkraut, "Willst du mich verarschen?! Seh ich vielleicht aus wie ein mickriger Feldarbeiter?!", Info_Mod_Lobart_Unkraut_B);
	Info_AddChoice	(Info_Mod_Lobart_Unkraut, "Na gut ...", Info_Mod_Lobart_Unkraut_A);
};

FUNC VOID Info_Mod_Lobart_Unkraut_B()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Unkraut_B_15_00"); //Willst du mich veräppeln? Seh ich vielleicht aus wie ein mickriger Feldarbeiter?
	AI_Output(self, hero, "Info_Mod_Lobart_Unkraut_B_26_01"); //Ich meinte ja nur. Aber wenn du dir zu fein dafür bist, dann wird sich eben jemand anders die 20 Goldmünzen verdienen.

	Info_ClearChoices	(Info_Mod_Lobart_Unkraut);
};

FUNC VOID Info_Mod_Lobart_Unkraut_A()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Unkraut_A_15_00"); //Na gut ...
	AI_Output(self, hero, "Info_Mod_Lobart_Unkraut_A_26_01"); //Dann fang am besten gleich an.

	Info_ClearChoices	(Info_Mod_Lobart_Unkraut);

	Mod_Lobart_Unkraut = 1;

	Log_CreateTopic	(TOPIC_MOD_LOBART_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LOBART_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LOBART_UNKRAUT, "Lobart hat mir aufgetragen die Felder von Unkraut zu befreien.");

	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_01");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_02");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_03");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_04");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_05");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_06");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_07");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_08");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_09");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_10");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_11");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_12");
	Wld_InsertItem	(ItPl_Unkraut_Lobart, "FP_ITEM_RUEBE_LOBART_13");
};

INSTANCE Info_Mod_Lobart_Unkraut2 (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Unkraut2_Condition;
	information	= Info_Mod_Lobart_Unkraut2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Felder sind sauber.";
};

FUNC INT Info_Mod_Lobart_Unkraut2_Condition()
{
	if (Mod_Lobart_Unkraut == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Unkraut2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Unkraut2_15_00"); //Die Felder sind sauber.
	AI_Output(self, hero, "Info_Mod_Lobart_Unkraut2_26_01"); //Gut gemacht. Dafür bekommst du auch einen Batzen Geld. Viel Spaß damit.

	B_GiveInvItems	(self, hero, ItMi_Gold, 20);

	B_SetTopicStatus	(TOPIC_MOD_LOBART_UNKRAUT, LOG_SUCCESS);

	B_GivePlayerXP	(50);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Lobart_Warentransport (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Warentransport_Condition;
	information	= Info_Mod_Lobart_Warentransport_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du wolltest Baltram deine Rüben verkaufen.";
};

FUNC INT Info_Mod_Lobart_Warentransport_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Warentransporte))
	&& (Mod_LobartsRuebenBaltram == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Warentransport_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Warentransport_15_00"); //Du wolltest Baltram deine Rüben verkaufen.

	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Rueben))
	{
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_01"); //Ja? Oh, verdammt, das hab ich ja schon wieder vergessen!
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_02"); //Wollte sie schon fast meiner Frau bringen, um Suppe daraus zu machen!
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_03"); //Hier hast du sie ...

		B_GiveInvItems	(self, hero, ItPl_Beet, 20);
	
		AI_Output(hero, self, "Info_Mod_Lobart_Warentransport_15_04"); //Was ist mit einer Bezahlung?
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_05"); //Ich habe eine Abmachung mit Baltram, wir rechnen monatlich ab. Musst dir also keinen Kopf drum machen.

		Mod_LobartsRuebenBaltram = 1;

		B_LogEntry	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, "Ich habe die Rüben von Lobart.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_06"); //Wie du siehst, stecken sie noch im Feld. Und wie sie stecken!
		AI_Output(self, hero, "Info_Mod_Lobart_Warentransport_26_07"); //Ich kann im Moment nichts für dich tun.
	};
};

INSTANCE Info_Mod_Lobart_Randolph (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Randolph_Condition;
	information	= Info_Mod_Lobart_Randolph_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_Randolph_Condition()
{
	if (Mod_Randolph_Started == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Randolph_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_Randolph_26_00"); //Was machst du hier? Locke uns bloß keine Dämonen ins Haus. Einen Landarbeiter haben wir schon verloren.
	AI_Output(self, hero, "Info_Mod_Lobart_Randolph_26_01"); //Und diese unheimliche Gestalt, die oben beim Steinkreis steht ...
	AI_Output(hero, self, "Info_Mod_Lobart_Randolph_15_02"); //Unheimliche Gestalt?
	AI_Output(self, hero, "Info_Mod_Lobart_Randolph_26_03"); //Ja, das alles hat angefangen, seitdem dieser finstere Geselle sich hier herumtreibt. Er hat ganz bestimmt etwas damit zu tun.
	AI_Output(self, hero, "Info_Mod_Lobart_Randolph_26_04"); //Jemand sollte am besten hingehen und ihn erschlagen.

	B_LogEntry	(TOPIC_MOD_AKIL_RANDOLPH, "Lobart macht einen finsteren Gesellen beim Steinkreis für das Unheil verantwortlich. Er äußerte den Wunsch ihn tot zu sehen.");
};

INSTANCE Info_Mod_Lobart_RandolphWeg (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_RandolphWeg_Condition;
	information	= Info_Mod_Lobart_RandolphWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Finsterling ist verschwunden.";
};

FUNC INT Info_Mod_Lobart_RandolphWeg_Condition()
{
	if ((Mod_Randolph_Started == 13)
	|| (Mod_Randolph_Started == 16))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lobart_Randolph))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_RandolphWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_RandolphWeg_15_00"); //Der Finsterling ist verschwunden. Das Gleiche müsste auch bald für die Dämonen gelten.
	AI_Output(self, hero, "Info_Mod_Lobart_RandolphWeg_26_01"); //Was, bist du sicher? Danke für die Mitteilung. Hier, nimm dieses Gold als Dank.
	
	B_GivePlayerXP	(200);

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Lobart_AlwinScene (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_AlwinScene_Condition;
	information	= Info_Mod_Lobart_AlwinScene_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_AlwinScene_Condition()
{
	if (Mod_LobartAlwin == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_AlwinScene_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_26_01"); //(dumpf) Ich weiß es auch nicht. Aber wer sollte es sonst tun?
	
	Info_ClearChoices	(Info_Mod_Lobart_AlwinScene);

	Info_AddChoice	(Info_Mod_Lobart_AlwinScene, "Stimmt, es gibt keinen anderen plausiblen Grund.", Info_Mod_Lobart_AlwinScene_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 300)
	{
		Info_AddChoice	(Info_Mod_Lobart_AlwinScene, "Es ist möglich, dass ich für den Tod einiger Schafe verantwortlich bin.", Info_Mod_Lobart_AlwinScene_A);
	};
};

FUNC VOID Info_Mod_Lobart_AlwinScene_B()
{
	AI_Output(hero, self, "Info_Mod_Lobart_AlwinScene_B_15_00"); //Stimmt, es gibt keinen anderen plausiblen Grund.
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_B_26_01"); //Jetzt hätte ich ihn fast umgebracht! Ich kann es gar nicht fassen ...
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_B_26_02"); //Ich, ich brauche Ruhe ... Sagt ihm, es tut mir Leid, er hat genug gebüßt.
	
	Info_ClearChoices	(Info_Mod_Lobart_AlwinScene);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_Göttergefallen(3, 1);

	Mod_LobartAlwin = 3;
};

FUNC VOID Info_Mod_Lobart_AlwinScene_A()
{
	AI_Output(hero, self, "Info_Mod_Lobart_AlwinScene_A_15_00"); //Es ist möglich, dass ich für den Tod einiger Schafe verantwortlich bin.
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_A_26_01"); //Was sagst du da?!
	AI_Output(hero, self, "Info_Mod_Lobart_AlwinScene_A_15_02"); //Es tut mir wirklich Leid ... Wie kann ich es gutmachen?
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_A_26_03"); //Nein, nein! Das kann ja nicht wahr sein! (Pause)
	AI_Output(self, hero, "Info_Mod_Lobart_AlwinScene_A_26_04"); //Den Verlust ihrer Seelen kannst du nicht ersetzen. Wohl aber ihren Wert. 300 Gold.
	AI_Output(hero, self, "Info_Mod_Lobart_AlwinScene_A_15_05"); //Entschuldige bitte.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);
	
	Info_ClearChoices	(Info_Mod_Lobart_AlwinScene);

	B_Göttergefallen(1, 1);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	Mod_LobartAlwin = 5;

	B_StartOtherRoutine	(Mod_597_NONE_Meldor_NW, "START");
	B_StartOtherRoutine	(Mod_1041_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_1039_VLK_Buergerin_NW, "START");
	B_StartOtherRoutine	(Mod_593_NONE_Lucy_NW, "START");
};

INSTANCE Info_Mod_Lobart_VinoBrennerei (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_VinoBrennerei_Condition;
	information	= Info_Mod_Lobart_VinoBrennerei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_VinoBrennerei_Condition()
{
	if (Kapitel >= 3)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Mika_VinoBrennerei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_VinoBrennerei_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_00"); //Warte mal kurz.. Du kommst doch viel in der Umgebung herum.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_01"); //Hast du vielleicht Vino irgendwo gesehen?
	AI_Output(hero, self, "Info_Mod_Lobart_VinoBrennerei_15_02"); //Nein, nicht in letzter Zeit.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_03"); //Schade. Wo könnte er bloß geblieben sein ...?
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_04"); //Wie ich von Mika erfahren habe, hat er vor einiger Zeit das Osttor passiert.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_05"); //Wohin er danach gegangen ist, weiß er leider auch nicht.
	AI_Output(hero, self, "Info_Mod_Lobart_VinoBrennerei_15_06"); //Der taucht schon wieder auf.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_07"); //Ich hoffe es. Ähnlich sieht es ihm ja gar nicht, dass er ohne was zu sagen so lange wegbleibt.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_08"); //Auch die anderen Bauern auf dem Feld wissen nichts ... das sagen sie zumindest.
	AI_Output(self, hero, "Info_Mod_Lobart_VinoBrennerei_26_09"); //(zu sich selbst) Aber komisch verhalten sie sich schon etwas. Wenn Vino bald nicht auftaucht, werde ich mit denen noch mal ein paar Worte wechseln.
	
	Log_CreateTopic	(TOPIC_MOD_VINO_WO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_VINO_WO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_VINO_WO, "Vino wird auf Lobarts Hof vermisst.");
	B_LogEntry_NS	(TOPIC_MOD_VINO_WO, "Mika hatte Vino zwar das Osttor passieren sehen, konnte sich jedoch nicht daran erinnern, wo er anschließend hinging.");
	B_LogEntry_NS	(TOPIC_MOD_VINO_WO, "Vielleicht sollte ich mal mit seinen Landarbeiterkollegen auf dem Feld sprechen.");
};

INSTANCE Info_Mod_Lobart_Leichengase (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Leichengase_Condition;
	information	= Info_Mod_Lobart_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du kurz Zeit?";
};

FUNC INT Info_Mod_Lobart_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase4))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Leichengase))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase_15_00"); //Hast du kurz Zeit?
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_01"); //Was gibt’s denn?
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase_15_02"); //Ich hab hier einen Sack voller Kräuter und muss den irgendwie in den Magen eines Trolls bringen.
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_03"); //Du willst WAS? Hast du Angst, dass er nicht genügend Vitamine bekommt oder was soll das?
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase_15_04"); //Das ist doch egal. Weißt du einen Weg oder nicht?
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_05"); //Doch, ich wüsste einen Weg. Wird allerdings nicht ganz billig.
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_06"); //Du müsstest dafür schon ein Schäfchen kaufen.
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase_15_07"); //Warum?
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_08"); //Ganz einfach. Du gibst mir den Sack, ich füttere ein Schaf damit.
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_09"); //Du kommst morgen wieder vorbei, schlachtest es und wirfst den Trollen seinen Magen zum Fraß vor.
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase_15_10"); //Wie viel willst du für ein Schaf?
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase_26_11"); //Wenn ich ihnen die Kräuter geben soll muss ich einen "Zucht-Aufschlag" berechnen, das macht dann insgesamt ... 300 Goldstücke.
};

INSTANCE Info_Mod_Lobart_Leichengase2 (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Leichengase2_Condition;
	information	= Info_Mod_Lobart_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na gut, hier. (300 Gold)";
};

FUNC INT Info_Mod_Lobart_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lobart_Leichengase2_15_00"); //Na gut, hier.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 300);
	Npc_RemoveInvItems	(hero, ItMi_Sumpfkraeuter, 1);

	B_ShowGivenThings	("300 Gold und Beutel mit Sumpfkräutern gegeben");

	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase2_26_01"); //Vielen Dank. Komm einfach morgen wieder vorbei.

	Mod_Leichengase_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Lobart_Leichengase3 (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Leichengase3_Condition;
	information	= Info_Mod_Lobart_Leichengase3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lobart_Leichengase3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase2))
	&& (Wld_GetDay() > Mod_Leichengase_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Leichengase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase3_26_00"); //Hier ist dein Schaf, viel Glück damit.
	AI_Output(self, hero, "Info_Mod_Lobart_Leichengase3_26_01"); //Wenn du es wirklich schlachtest, mach das bitte nicht in meiner Nähe, das mag ich immer nicht mit ansehen.

	Wld_InsertNpc	(Trollschaf, Npc_GetNearestWP(self));

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Lobart hat ein Schaf mit den Kräutern gefüttert. Ich sollte es jetzt schlachten und den Magen entnehmen.");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lobart_Anschlagtafel (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Anschlagtafel_Condition;
	information	= Info_Mod_Lobart_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Lobart_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Lobart == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lobart_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMW_Sense_02) >= Mod_Anschlagtafel_Khorinis_Lobart_Sense)
	&& (Npc_HasItems(hero, ItMw_Sense) >= Mod_Anschlagtafel_Khorinis_Lobart_KleineSense)
	&& (Npc_HasItems(hero, ItMi_Stuff_Barbknife_01) >= Mod_Anschlagtafel_Khorinis_Lobart_Rasiermesser)
	&& (Npc_HasItems(hero, ItMi_Pan) >= Mod_Anschlagtafel_Khorinis_Lobart_Pfanne)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Axe) >= Mod_Anschlagtafel_Khorinis_Lobart_Beil)
	&& (Npc_HasItems(hero, ItMi_Kerze) >= Mod_Anschlagtafel_Khorinis_Lobart_Kerze)
	&& (Npc_HasItems(hero, ItMi_Rake) >= Mod_Anschlagtafel_Khorinis_Lobart_Harke)
	&& (Npc_HasItems(hero, ItMi_Scoop) >= Mod_Anschlagtafel_Khorinis_Lobart_Kochloeffel)
	&& (Npc_HasItems(hero, ItMw_1h_Bau_Axe) >= Mod_Anschlagtafel_Khorinis_Lobart_Sichel)
	{
		Npc_RemoveInvItems	(hero, ItMW_Sense_02, Mod_Anschlagtafel_Khorinis_Lobart_Sense);
		Npc_RemoveInvItems	(hero, ItMw_Sense, Mod_Anschlagtafel_Khorinis_Lobart_KleineSense);
		Npc_RemoveInvItems	(hero, ItMi_Stuff_Barbknife_01, Mod_Anschlagtafel_Khorinis_Lobart_Rasiermesser);
		Npc_RemoveInvItems	(hero, ItMi_Pan, Mod_Anschlagtafel_Khorinis_Lobart_Pfanne);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Axe, Mod_Anschlagtafel_Khorinis_Lobart_Beil);
		Npc_RemoveInvItems	(hero, ItMi_Kerze, Mod_Anschlagtafel_Khorinis_Lobart_Kerze);
		Npc_RemoveInvItems	(hero, ItMi_Rake, Mod_Anschlagtafel_Khorinis_Lobart_Harke);
		Npc_RemoveInvItems	(hero, ItMi_Scoop, Mod_Anschlagtafel_Khorinis_Lobart_Kochloeffel);
		Npc_RemoveInvItems	(hero, ItMw_1h_Bau_Axe, Mod_Anschlagtafel_Khorinis_Lobart_Sichel);

		AI_Output(self, hero, "Info_Mod_Lobart_Anschlagtafel_26_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Lobart_Anschlagtafel_26_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Lobart_Gold);

		AI_Output(self, hero, "Info_Mod_Lobart_Anschlagtafel_26_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Lobart_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lobart_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lobart_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Lobart = 0;
		Mod_Anschlagtafel_Khorinis_Lobart_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Lobart, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Lobart_Pickpocket (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_Pickpocket_Condition;
	information	= Info_Mod_Lobart_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Lobart_Pickpocket_Condition()
{
	C_Beklauen	(53, ItPl_Beet, 12);
};

FUNC VOID Info_Mod_Lobart_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);

	Info_AddChoice	(Info_Mod_Lobart_Pickpocket, DIALOG_BACK, Info_Mod_Lobart_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lobart_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lobart_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lobart_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);
};

FUNC VOID Info_Mod_Lobart_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);

		Info_AddChoice	(Info_Mod_Lobart_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lobart_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lobart_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lobart_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lobart_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lobart_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lobart_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lobart_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lobart_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lobart_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lobart_EXIT (C_INFO)
{
	npc		= Mod_910_BAU_Lobart_NW;
	nr		= 1;
	condition	= Info_Mod_Lobart_EXIT_Condition;
	information	= Info_Mod_Lobart_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lobart_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lobart_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};