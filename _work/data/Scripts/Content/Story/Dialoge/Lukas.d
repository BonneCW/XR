INSTANCE Info_Mod_Lukas_Hi (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Hi_Condition;
	information	= Info_Mod_Lukas_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist dein Beruf?";
};

FUNC INT Info_Mod_Lukas_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lukas_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Hi_15_00"); //Was ist dein Beruf?
	AI_Output(self, hero, "Info_Mod_Lukas_Hi_06_01"); //Schlosser, Schreiner, Schankmädchen ... ich mache alles, wofür ich gebraucht werde.
	AI_Output(self, hero, "Info_Mod_Lukas_Hi_06_02"); //Aber am liebsten ist mir das Handwerk.
};

INSTANCE Info_Mod_Lukas_Lernen (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Lernen_Condition;
	information	= Info_Mod_Lukas_Lernen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich von dir lernen?";
};

FUNC INT Info_Mod_Lukas_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Lernen_15_00"); //Kann ich von dir lernen?
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_06_01"); //Bestimmt. (lacht) Willst du für mich arbeiten oder wie?

	Info_ClearChoices	(Info_Mod_Lukas_Lernen);

	Info_AddChoice	(Info_Mod_Lukas_Lernen, "Nein.", Info_Mod_Lukas_Lernen_B);
	Info_AddChoice	(Info_Mod_Lukas_Lernen, "Ja. Hast du was?", Info_Mod_Lukas_Lernen_A);
};

FUNC VOID Info_Mod_Lukas_Lernen_B()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Lernen_B_15_00"); //Nein.

	Info_ClearChoices	(Info_Mod_Lukas_Lernen);
};

FUNC VOID Info_Mod_Lukas_Lernen_A()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Lernen_A_15_00"); //Ja. Hast du was?
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_A_06_01"); //Ha, du gefällst mir. Kommst gleich zur Sache.
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_A_06_02"); //Nur, bevor ich dir Arbeit gebe, will ich mir sicher sein, dass du 'n ganzer Mann bist.
	AI_Output(hero, self, "Info_Mod_Lukas_Lernen_A_15_03"); //Wie kann ich dir meine ... Männlichkeit unter Beweis stellen?
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_A_06_04"); //Hab gehört, die alljährliche Rattenjagd in Khorata soll bald beginnen. Dort treten Männer im Wettstreit gegeneinander an.
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_A_06_05"); //Wenn du da teilnimmst und einigermaßen gut abschneidest, reden wir weiter.
	AI_Output(self, hero, "Info_Mod_Lukas_Lernen_A_06_06"); //Sprich mit Friedel, er weist die Teilnehmer ein. Du findest ihn in einem der Häuser am Seeufer.

	Mod_REL_Wettstreit = 1;

	Mod_REL_Wettstreit_Tag = Wld_GetDay()-1;

	Log_CreateTopic	(TOPIC_MOD_KHORATA_WETTSTREIT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_WETTSTREIT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_WETTSTREIT, "Der Handwerker Lukas in Khorata hat mir Arbeit in Aussicht gestellt, wenn ich meinen Mut bei der Rattenjagd beweise. Dazu soll ich Friedel am Seeufer aufsuchen.");

	Info_ClearChoices	(Info_Mod_Lukas_Lernen);
};

INSTANCE Info_Mod_Lukas_Wettstreit (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Wettstreit_Condition;
	information	= Info_Mod_Lukas_Wettstreit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe bei der Rattenjagd gewonnen.";
};

FUNC INT Info_Mod_Lukas_Wettstreit_Condition()
{
	if (Mod_REL_Wettstreit == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Wettstreit_15_00"); //Ich habe bei der Rattenjagd gewonnen.
	AI_Output(self, hero, "Info_Mod_Lukas_Wettstreit_06_01"); //Das hat sich schon herumgesprochen! Es wäre mir eine Ehre, wenn du mir zu Hand gehen könntest.
	AI_Output(hero, self, "Info_Mod_Lukas_Wettstreit_15_02"); //Was gibt es zu tun?
	AI_Output(self, hero, "Info_Mod_Lukas_Wettstreit_06_03"); //Ich bin mitten in der Arbeit, und mir gehen langsam die Nägel aus.
	AI_Output(self, hero, "Info_Mod_Lukas_Wettstreit_06_04"); //Du kannst mir vom Marktplatz drei Pakete mit Nägeln bringen, das würde mir helfen.
	AI_Output(self, hero, "Info_Mod_Lukas_Wettstreit_06_05"); //Frag einfach bei den Händlern dort herum, wer die Dinger verkauft.
	AI_Output(hero, self, "Info_Mod_Lukas_Wettstreit_15_06"); //Wird erledigt.

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_WETTSTREIT, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;

	Log_CreateTopic	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Ich soll Lukas drei Pakete Nägel vom Marktplatz in Khorata besorgen.");
};

INSTANCE Info_Mod_Lukas_Nagelnachschub (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Nagelnachschub_Condition;
	information	= Info_Mod_Lukas_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description	= "Drei Pakete gefüllt mit Nägeln, wie bestellt.";
};

FUNC INT Info_Mod_Lukas_Nagelnachschub_Condition()
{
	if (Npc_HasItems(hero, ItMi_Nagelpaket) == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Nagelnachschub_15_00"); //Drei Pakete gefüllt mit Nägeln, wie bestellt.

	B_GiveInvItems	(hero, self, ItMi_Nagelpaket, 3);

	AI_Output(self, hero, "Info_Mod_Lukas_Nagelnachschub_06_01"); //Sehr gut gemacht! Dafür lasse ich auch was springen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Lukas_NochWasZuTun (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_NochWasZuTun_Condition;
	information	= Info_Mod_Lukas_NochWasZuTun_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du sonst noch was zu tun für mich?";
};

FUNC INT Info_Mod_Lukas_NochWasZuTun_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Nagelnachschub))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_NochWasZuTun_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_NochWasZuTun_15_00"); //Hast du sonst noch was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Lukas_NochWasZuTun_06_01"); //Nein, ich komme gut zurecht und bin wirklich dankbar für deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Lukas_NochWasZuTun_06_02"); //Frag doch mal meinen Lehrling, ob er Probleme hat, wenn du das noch nicht getan hast.
};

INSTANCE Info_Mod_Lukas_Unruhen (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Unruhen_Condition;
	information	= Info_Mod_Lukas_Unruhen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Würdest du Anselm beerben wollen?";
};

FUNC INT Info_Mod_Lukas_Unruhen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Unruhen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen_15_00"); //Würdest du Anselm beerben wollen?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen_06_01"); //Hmm, klar. Ich würd einige Fehler, die Anselm gemacht hat, wieder ausbügeln.
};

INSTANCE Info_Mod_Lukas_Unruhen2 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Unruhen2_Condition;
	information	= Info_Mod_Lukas_Unruhen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für Fehler?";
};

FUNC INT Info_Mod_Lukas_Unruhen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Unruhen))
	&& (Mod_REL_Kandidat < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Unruhen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen2_15_00"); //Was für Fehler?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen2_06_01"); //Na, die Freudenspender-Gesetze für Stadtbewohner zu lockern, zum Beispiel. Gibt doch kaum noch einen, der richtig arbeitet.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen2_06_02"); //Anselm hat die Zügel schleifen lassen. Einmal pro Monat hat er jemanden willkürlich einbuchten lassen und ihm später gnädig die Freiheit geschenkt.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen2_06_03"); //Das Diebespack läuft auf offener Straße herum.
};

INSTANCE Info_Mod_Lukas_Unruhen3 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Unruhen3_Condition;
	information	= Info_Mod_Lukas_Unruhen3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie stehst du zum Buddler-Konflikt?";
};

FUNC INT Info_Mod_Lukas_Unruhen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Unruhen))
	&& (Mod_REL_Kandidat < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Unruhen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen3_15_00"); //Wie stehst du zum Buddler-Konflikt?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen3_06_01"); //Da gibt's ja wohl nur eine Position! Die Buddler müssen für ihren Verrat büßen.
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen3_15_02"); //Wie stellst du dir das vor?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen3_06_03"); //Wir stellen einen ordentlichen Trupp zusammen und gehen gegen sie vor. Wenn sie sich wehren, werden sie getötet.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen3_06_04"); //Die übrigen verbringen den Rest ihres Lebens mit 'ner dicken Steinkugel am Fuß.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen3_06_05"); //Jedenfalls kann ich solchen Störenfrieden meinen Lebtag kein Vertrauen mehr entgegen bringen.

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Lukas ist der Ansicht, dass die Bergleute mit Gewalt zur Ruhe gebracht werden sollten.");
};

INSTANCE Info_Mod_Lukas_Unruhen4 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Unruhen4_Condition;
	information	= Info_Mod_Lukas_Unruhen4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die ehrenvolle Aufgabe ...";
};

FUNC INT Info_Mod_Lukas_Unruhen4_Condition()
{
	if (Mod_REL_Kandidat == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Unruhen4_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen4_15_00"); //Ich habe die ehrenvolle Aufgabe ...
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen4_06_01"); //Ja, schon gut. Wollen wir den verfluchten Aufständischen ordentlich Feuer unterm Hintern machen, was?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen4_06_02"); //Gut, hier ist der Plan: Ich gebe dir einen kleinen Trupp guter Männer, und ihr räuchert das Ungeziefernest bis auf den letzten Mann aus.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen4_06_03"); //Wenn sich welche ergeben ... nehmt sie fest. Aber seid nicht zu zimperlich.
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen4_15_04"); //Wen soll ich mitnehmen?
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen4_06_05"); //Drei harte Kerle: Friedel, Davon und den Henker. Die haben 'ne Portion Zunder im Arsch; musst sie nur in Brand setzen.
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen4_15_06"); //Bin schon unterwegs.

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Ich soll mir Friedel, Davon und den Henker abholen und dann die Bergleute gewaltsam aus ihrem Bollwerk vertreiben.");

	B_StartOtherRoutine	(self, "STADTHALTER");

	Mod_7618_OUT_Norman_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7618_OUT_Norman_REL, GIL_STRF);

	Mod_7613_OUT_Schuerfer_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7613_OUT_Schuerfer_REL, GIL_STRF);

	Mod_7614_OUT_Schuerfer_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7614_OUT_Schuerfer_REL, GIL_STRF);

	Mod_7615_OUT_Schuerfer_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7615_OUT_Schuerfer_REL, GIL_STRF);

	Mod_7616_OUT_Schuerfer_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7616_OUT_Schuerfer_REL, GIL_STRF);

	Mod_7617_OUT_Schuerfer_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7617_OUT_Schuerfer_REL, GIL_STRF);

	Mod_7492_OUT_Roman_REL.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7492_OUT_Roman_REL, GIL_STRF);
};

INSTANCE Info_Mod_Lukas_Unruhen5 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Unruhen5_Condition;
	information	= Info_Mod_Lukas_Unruhen5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Bergarbeiter sind alle tot.";
};

FUNC INT Info_Mod_Lukas_Unruhen5_Condition()
{
	if (Mod_REL_LukasS == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Unruhen5_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Unruhen5_15_00"); //Die Bergarbeiter sind alle tot.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen5_06_01"); //Recht so, das haben sie verdient. Ich bin mit dir zufrieden.
	AI_Output(self, hero, "Info_Mod_Lukas_Unruhen5_06_02"); //Ab jetzt wird in Khorata härter durchgegriffen werden, dafür sorge ich schon. Diese Stadt wird nicht so enden wie der Hofstaat!

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Die Opfer der Bergleute waren wohl nötig, um den Konflikt zu lösen. Ab jetzt sollte ich mir aus der Politik heraushalten können.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	Mod_REL_Stadthalter = 3;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Lukas_Theodorus (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Theodorus_Condition;
	information	= Info_Mod_Lukas_Theodorus_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lukas_Theodorus_Condition()
{
	if (Mod_REL_TheodorusS == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Theodorus_Info()
{
	AI_Output(self, hero, "Info_Mod_Lukas_Theodorus_06_00"); //So ein verlogener Strauchdieb soll unser neuer Stadthalter sein, mit einem ortsfremden Lakaien, der uns nicht einmal kennt?
	AI_Output(self, hero, "Info_Mod_Lukas_Theodorus_06_01"); //Lieber sterbe ich, als dass ich eine solche Schmach hinnehme!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Lukas_Plagenquest (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Plagenquest_Condition;
	information	= Info_Mod_Lukas_Plagenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mir scheint, ihr braucht einen Kammerjäger.";
};

FUNC INT Info_Mod_Lukas_Plagenquest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Plagenquest))
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Plagenquest_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST01");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_01"); //Ja, wir hatten schon einen ganzen Trupp Hammerjäger durch die Stadt geschickt.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_02"); //Aber auch mit ihren Hämmern konnten sie dem Ungeziefer keinen Einhalt gebieten.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_03"); //Egal wie oft man drauf schlägt, sie kommen wieder und in Gesellschaft vieler ihrer Artgenossen.
	B_Say	(hero, self, "$PLAGENQUEST02");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_05"); //In der Tat, ich forsche gerade in den Chroniken der Stadt nach und bin da tatsächlich auf etwas gestoßen ...
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_06"); //Es wird aber noch ein Weilchen dauern, bis ich mir den Text vollständig erschlossen habe.
	B_Say	(hero, self, "$PLAGENQUEST03");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_08"); //Ja, du kannst mal dein Glück als Hammerjäger im Gerichtsgebäude versuchen, wo sich im Moment besonders viele Drecksviecher tummeln.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_06_09"); //Vielleicht hast du ja mehr Erfolg.

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Lukas scheint in den Chroniken der Stadt auf Anhaltspunkte gestoßen zu sein. Bis er sie vollständig ergründet hat, soll ich mich im Gerichtsgebäude im Insektenjagen erproben.");

	Wld_InsertNpc	(Insekt_01, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_341");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_341");
};

INSTANCE Info_Mod_Lukas_Plagenquest_02 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Plagenquest_02_Condition;
	information	= Info_Mod_Lukas_Plagenquest_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lukas_Plagenquest_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richter_Plagenquest))
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Plagenquest_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_00"); //Ahh, gut, dass du vorbeikommst, ich habe etwas wichtiges entdeckt.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_01"); //Die Plage, die zurzeit die Stadt heimsucht, hatte es bereits vor vielen Jahrhunderten gegeben – nicht lange, nach der Stadtgründung.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_02"); //Um der Stadt und ihrer Umgebung den Segen der Götter zu sichern, wurde damals den Göttern mit Tieropfern gehuldigt.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_03"); //Jeder hatte die Pflicht eine bestimmte Anzahl an Tieren zu opfern.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_04"); //Einer ihrer Gründerväter war jedoch so geizig, dass er nicht Schafe oder Molerat, sondern Insekten opferte.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_05"); //Die Götter waren darüber so erzürnt, dass sie den Wunsch der Menschen nach reicher Tierpopulation vor allem auf die Insekten der Umgebung übertrugen.
	B_Say	(hero, self, "$PLAGENQUEST04");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_07"); //Nun, mit der chemischen Keule.
	B_Say	(hero, self, "$PLAGENQUEST05");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_09"); //Ja, lange Zeit war man völlig ratlos und es schien so, als müsse man die Stadt aufgeben.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_10"); //Doch dann wurde einem rechtschaffenden und ehrbaren Bürger namens Chemos ein Traum gesandt.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_11"); //Er erhielt die Anleitung zum Bau einer Waffe, welche die Plagegeister bannen konnte.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_12"); //Daher muss auch unser Brauch mit den Stadthämmern zum Kampf gegen die Insekten kommen.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_13"); //Damals unterschieden sich Hämmer und Keulen nämlich noch nicht grundlegend.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_14"); //Unser Gesetz dazu stammt erst aus etwas späterer Zeit, als die Hämmer ihre charakteristische Form erhielten und die Keulen aus praktischen Gründen ablösten.
	B_Say	(hero, self, "$PLAGENQUEST06");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_16"); //Nein, leider nicht mehr. Und die Anfertigung einer solchen Waffe ist nicht ganz unkompliziert. Ich habe die Anleitung gefunden ...
	B_Say	(hero, self, "$PLAGENQUEST07");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_18"); //Hier hast du eine Abschrift davon.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_ChemischeKeule, 1);

	B_Say	(hero, self, "$PLAGENQUEST08");

	B_HeroFakeScroll ();

	B_Say	(hero, self, "$PLAGENQUEST09");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_21"); //(erfreut) Wirklich? Du würdest uns allen einen großen Dienst damit erweisen.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_22"); //Sobald du alles zusammen hast, begib dich wieder hier her und händige die Materialien unserem Schmied aus.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_02_06_23"); //Und eine Keule werden wir schon irgendwo in der Stadt auftreiben. Ich danke dir.

	B_LogEntry_More	(TOPIC_MOD_ADANOS_PLAGE, TOPIC_MOD_ADANOS_DRECKSVIECHER, "Aha, die Insektenplage beruht also auf einer Strafe der Götter für einen Frevel, der begangen wurde.", "Ok, ich darf mich jetzt auf die Suche nach dem Material für die chemische Keule begeben, welche die Mistviecher bannen kann. Eine Keule müssten sie in Khorata schon selbst auftreiben können ...");

	B_GivePlayerXP	(200);

	Mod_WM_Plage_PartInsekt = 1;
};

INSTANCE Info_Mod_Lukas_Plagenquest_03 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Plagenquest_03_Condition;
	information	= Info_Mod_Lukas_Plagenquest_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lukas_Plagenquest_03_Condition()
{
	if (Npc_HasItems(hero, ItMw_Chemo) == 1)
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Plagenquest_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_03_06_00"); //Ich habe gehört, du hast die Keule. Jetzt ist es an der Zeit die Plagegeister aus der Stadt zu verjagen.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_03_06_01"); //Am Marktplatz haben sich besonders viele von den Viechern gesammelt. Nimm die chemische Keule und vernichte sie.

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Jetzt ist es an der Zeit zu testen, ob die chemische Keule etwas taugt. Ich soll die ganzen Drecksplagen erledigen, die sich am Marktplatz gesammelt haben.");

	Wld_InsertNpc	(Insekt_04, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_04, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_04, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_04, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_04, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_05, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_05, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_05, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_05, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_06, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_06, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_06, "REL_CITY_102");
	Wld_InsertNpc	(Insekt_06, "REL_CITY_102");
};

INSTANCE Info_Mod_Lukas_Plagenquest_04 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Plagenquest_04_Condition;
	information	= Info_Mod_Lukas_Plagenquest_04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Keule konnte den Insekten Einhalt gebieten. Ich habe sie alle bezwungen.";
};

FUNC INT Info_Mod_Lukas_Plagenquest_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Plagenquest_03))
	&& (Npc_IsDead(Insekt_04))
	&& (Npc_IsDead(Insekt_05))
	&& (Npc_IsDead(Insekt_06))
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Plagenquest_04_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST10");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_01"); //Das ist großartig und der erste Schritt um das Übel endgültig zu bannen.
	B_Say	(hero, self, "$PLAGENQUEST11");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_03"); //Ja, leider mussten wir feststellen, dass weiterhin neue Parasiten aus den umliegenden Wäldern kommen.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_04"); //Irgendwo dort muss die Wurzel des Übels sein ... der ominöse Riesenbug, von dem die Quellen sprachen.
	B_Say	(hero, self, "$PLAGENQUEST12");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_06"); //Es gibt da aber etwas, besser gesagt jemanden, der dir dabei helfen könnte.
	B_Say	(hero, self, "$PLAGENQUEST13");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_08"); //Ein Bürger unserer Stadt. Sein Name ist Axon und er trägt das chemische Blut in sich, wie ich vor ein paar Stunden herausgefunden habe.
	B_Say	(hero, self, "$PLAGENQUEST14");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_10"); //Nun, zum einen geben die Stammbäume klare Hinweise darauf und dann ... nun ...
	B_Say	(hero, self, "$PLAGENQUEST15");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_12"); //... dann haben wir noch die chemische Keule bei ihm gefunden. Sie hing die ganze Zeit im Wohnzimmer seines Hauses.
	B_Say	(hero, self, "$PLAGENQUEST16");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_04_06_14"); //Jedenfalls sollte er dir dabei helfen können das Käfergetier zu erspüren, den Riesenbug zu entdecken und zu vernichten. Er wartet bereits vor der Stadt auf dich.

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Grmpf, das wird ja immer besser. Die ganze Zeit hing die chemische Keule bei Axon, einem Nachfahren des Chemos ... Nun denn, jetzt darf ich also mit ihm den Riesenbug im Wald erlegen. Axon erwartet mich vor der Stadt.");

	B_StartOtherRoutine	(Mod_7415_OUT_Axon_REL, "VORSTADT");
	AI_Teleport	(Mod_7415_OUT_Axon_REL, "REL_CITY_001");
};

INSTANCE Info_Mod_Lukas_Plagenquest_05 (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Plagenquest_05_Condition;
	information	= Info_Mod_Lukas_Plagenquest_05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es ist vollbracht. Der Riesenbug ist bezwungen.";
};

FUNC INT Info_Mod_Lukas_Plagenquest_05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest_02))
	&& (Npc_IsDead(Riesenbug))
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Plagenquest_05_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST17");
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_05_06_01"); //Das ist großartig. Du hast unserer Stadt einen Dienst von unschätzbarem Wert erwiesen und das Übel gebannt.
	AI_Output(self, hero, "Info_Mod_Lukas_Plagenquest_05_06_02"); //Nimm, dieses Gold und den Stadthammer zum Dank. Der Segen der Götter möge dich begleiten.

	B_ShowGivenThings	("1000 Gold und Stadthammer erhalten");

	CreateInvItems	(hero, ItMw_Stadthammer, 1);
	CreateInvItems	(hero, ItMi_Gold, 1000);

	B_SetTopicStatus	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	if (!Npc_IsDead(Mod_7415_OUT_Axon_REL))
	{
		B_StartOtherRoutine	(Mod_7415_OUT_Axon_REL, "START");
	};

	B_Göttergefallen (2, 1);
};

INSTANCE Info_Mod_Lukas_Andre (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Andre_Condition;
	information	= Info_Mod_Lukas_Andre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lukas_Andre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Herold))
	&& (Mod_PAL_HeroBot == 17)
	&& (Mod_REL_Stadthalter == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lukas_Andre_Info()
{
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_00"); //Guten Morgen, Soldat. Oder sollte ich dich lieber Hauptmann nennen?
	B_Say	(hero, self, "$HEROBOTQUEST01");
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_02"); //Lord Andres Plan hat funktioniert, allerdings gab es keine Möglichkeit einen Ausgang in den Hochofen zu implementieren, deshalb hat er dich überwältigt, selbst das Kostüm angezogen und den Roboter in den Hochofen gelockt.
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_03"); //Wir haben einen versiegelten Umschlag neben dir gefunden. Darin erklärte Andre die ganze Angelegenheit und hat dich zu seinem Nachfolger ernannt.
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_04"); //Aber hier ... die Details kannst du selbst nachlesen.

	B_GiveInvItems	(self, hero, ItWr_AndreAbschied, 1);

	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_05"); //Und diesen Schlüssel soll ich dir geben. Vermutlich zu seiner Kiste im Hauptmannzimmer.

	B_GiveInvItems	(self, hero, ItKe_Andre, 1);

	B_Say	(hero, self, "$HEROBOTQUEST02");
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_06"); //Genau. Die Trauerfeier hast du verpasst, du hast geschlagene 32 Stunden durchgeschlafen. Der alte Haudegen scheint in ganz guter Form gewesen zu sein.
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_07"); //Wenn du dich verabschieden willst, Andre liegt mittlerweile am Friedhof. Zumindest seine Asche. Aber ruh' dich zuerst aus, er läuft dir schon nicht weg.
	AI_Output(self, hero, "Info_Mod_Lukas_Andre_06_08"); //Ach ja, bevor ich's vergesse: Der Betreiber des Hochofens hat nach dir gefragt, schau mal bei ihm vorbei.

	B_Göttergefallen(1, 5);

	B_GivePlayerXP	(1000);

	Log_CreateTopic	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_PAL_BOT, TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, "Der Roboter ist besiegt, jedoch musste sich Lord Andre opfern, um dies zu erreichen. Nun hat er mich zu seinem Nachfolger ernannt.", "Andre hat sich tatsächlich geopfert um den Roboter zu vernichten. In einem Schreiben hat er mich zu seinem Nachfolger ernannt und mir einen Schlüssel hinterlegt, der wahrscheinlich zu seiner Truhe in der Kaserne führt.");
	B_SetTopicStatus	(TOPIC_MOD_PAL_BOT, LOG_SUCCESS);

	B_LogEntry_NS	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, "Der Betreiber des Hochofens Robert will mich sprechen. Ich sollte dort mal vorbeischauen und fragen, worum es geht.");
};

INSTANCE Info_Mod_Lukas_Judith (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Judith_Condition;
	information	= Info_Mod_Lukas_Judith_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wie geht's eigentlich dir und deiner Frau?";
};                       

FUNC INT Info_Mod_Lukas_Judith_Condition()
{
	if (Mod_JudithNacht == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lukas_Judith_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Judith_15_00"); //Wie geht's eigentlich dir und deiner Frau?
	AI_Output(self, hero, "Info_Mod_Lukas_Judith_06_01"); //Mir geht's gut. Aber komisch, dass du das gerade fragst.
	AI_Output(self, hero, "Info_Mod_Lukas_Judith_06_02"); //Judith hat mir erst vor Kurzem gebeichtet, dass sie eine Weile fremdgegangen ist.
	AI_Output(self, hero, "Info_Mod_Lukas_Judith_06_03"); //Aber sie meint, das wird nicht wieder vorkommen.
	AI_Output(hero, self, "Info_Mod_Lukas_Judith_15_04"); //Und du hast ihr verziehen?
	AI_Output(self, hero, "Info_Mod_Lukas_Judith_06_05"); //Na ja, 'ne neue Alte krieg ich in meinem Alter nicht mehr.
	AI_Output(self, hero, "Info_Mod_Lukas_Judith_06_06"); //Da behalt ich lieber die, die ich schon hab.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Lukas_Freudenspender (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Freudenspender_Condition;
	information	= Info_Mod_Lukas_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Lust auf Freudenspender?";
};                       

FUNC INT Info_Mod_Lukas_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lukas_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Lukas_Freudenspender_15_00"); //Lust auf Freudenspender?
	AI_Output(self, hero, "Info_Mod_Lukas_Freudenspender_06_01"); //So ein Teufelszeug! Hau ab!
};

INSTANCE Info_Mod_Lukas_Pickpocket (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_Pickpocket_Condition;
	information	= Info_Mod_Lukas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Lukas_Pickpocket_Condition()
{
	C_Beklauen	(66, ItMi_Hammer, 1);
};

FUNC VOID Info_Mod_Lukas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);

	Info_AddChoice	(Info_Mod_Lukas_Pickpocket, DIALOG_BACK, Info_Mod_Lukas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lukas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lukas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lukas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);
};

FUNC VOID Info_Mod_Lukas_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);

		Info_AddChoice	(Info_Mod_Lukas_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lukas_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lukas_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lukas_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lukas_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lukas_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lukas_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lukas_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lukas_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lukas_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lukas_EXIT (C_INFO)
{
	npc		= Mod_7516_OUT_Lukas_REL;
	nr		= 1;
	condition	= Info_Mod_Lukas_EXIT_Condition;
	information	= Info_Mod_Lukas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lukas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lukas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};