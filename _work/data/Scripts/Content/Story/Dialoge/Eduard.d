var int Bel_SteinReparieren;

INSTANCE Info_Mod_Eduard_Hi (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Hi_Condition;
	information	= Info_Mod_Eduard_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. Ich bin neu hier.";
};

FUNC INT Info_Mod_Eduard_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Hi_15_00"); //Hallo. Ich bin neu hier.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_01"); //So viele neue Gesichter in letzter Zeit ... Wie soll man sich das alles bloß merken?
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_02"); //Vor ein paar Wochen noch war das hier ein lauschiges Plätzchen - und dann macht's Peng!, die Barriere ist weg und hier tanzen lauter wildfremde Menschen an.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_03"); //Seitdem mangelt's an allem, und ich komm mit den Waffen nicht mehr hinterher. Dabei hasse ich Schmieden.
};

INSTANCE Info_Mod_Eduard_SchmiedenLehren (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SchmiedenLehren_Condition;
	information	= Info_Mod_Eduard_SchmiedenLehren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir beibringen zu schmieden?";
};

FUNC INT Info_Mod_Eduard_SchmiedenLehren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_SchmiedenLehren_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SchmiedenLehren_15_00"); //Kannst du mir beibringen zu schmieden?
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_01"); //Versuchen kann ich's. Aber erwarte nicht zu viel.
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_02"); //Ich selbst hatte nie eine Ausbildung und bin schon ganz froh, wenn ich die Dinger irgendwie gerade bekomme.
};

INSTANCE Info_Mod_Eduard_Haendler (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Haendler_Condition;
	information	= Info_Mod_Eduard_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du auch Schmiedezubehör?";
};

FUNC INT Info_Mod_Eduard_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Haendler_15_00"); //Verkaufst du auch Schmiedezubehör?
	AI_Output(self, hero, "Info_Mod_Eduard_Haendler_32_01"); //Ein bisschen kann ich dir von meinen Sachen verkaufen, aber nicht alles. Nachschub ist immer teuer und kommt nur stockend.
};

INSTANCE Info_Mod_Eduard_Belagerung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Belagerung_Condition;
	information	= Info_Mod_Eduard_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles klar bei dir?";
};

FUNC INT Info_Mod_Eduard_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_HabBauanleitung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_00"); //Alles klar bei dir?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_01"); //Mir ging es schon besser! Was willst du wieder?
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_02"); //Ich soll euch doch helfen, damit hier wieder alles in Gang kommt. Ich wollte fragen, ob du etwas für mich zu tun hast.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_03"); //Allerdings.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_04"); //Um was geht es?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_05"); //Ich stelle gerade die neuen Kampfstäbe her, die ich für Scar machen soll. Jedoch steht in der Bauanleitung, dass die Waffe um einiges härter wird, wenn man vier Trollhauer mit einarbeitet. Ich will, dass du mir diese bringst.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_06"); //Wo soll ich denn Trollhauer finden?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_07"); //Unten im Tal befindet sich ein verlassenes Jägerlager. Wenn du Glück hast, dann sind dort welche zu finden.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_08"); //Aber da unten wimmelt es von untoten Novizen, also nimm dich in acht.

	Mob_CreateItems	("JAEGERTRUHE", ItAt_TrollTooth, 4);
	
	Log_CreateTopic	(TOPIC_MOD_BEL_TROLLHAUER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_TROLLHAUER, "Eduard braucht für die Stäbe von Scar noch vier Trollhauer. Im Tal ist ein verlassenes Jägerlager, wo noch welche sein könnten. Jedoch wimmelt es dort vor untoten Novizen.");
};

INSTANCE Info_Mod_Eduard_Trolle (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trolle_Condition;
	information	= Info_Mod_Eduard_Trolle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du die vier Trollhauer.";
};

FUNC INT Info_Mod_Eduard_Trolle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Belagerung))
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trolle_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Trolle_15_00"); //Hier hast du die vier Trollhauer.

	B_GiveInvItems	(hero, self, ItAt_TrollTooth, 4);

	AI_Output(self, hero, "Info_Mod_Eduard_Trolle_32_01"); //Danke. Du hast uns damit sehr geholfen. Hier, nimm diese 200 Goldstücke.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_GivePlayerXP	(300);
	
	B_LogEntry_More	(TOPIC_MOD_BEL_TROLLHAUER, TOPIC_MOD_BEL_BELAGERUNG, "Ich habe Eduard die Trollhauer gegeben.", "Ich hab nun auch Eduard geholfen.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Eduard_MagischerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_MagischerDietrich_Condition;
	information	= Info_Mod_Eduard_MagischerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gomez schickt mich!";
};

FUNC INT Info_Mod_Eduard_MagischerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_TruheMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_MagischerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_MagischerDietrich_15_00"); //Gomez schickt mich! Du sollst mir einen speziellen Dietrich anfertigen, den man dann zu einem magischen Dietrich umwandeln kann!
	AI_Output(self, hero, "Info_Mod_Eduard_MagischerDietrich_32_01"); //(jammert) Hören die Aufträge denn nie auf? (seufzt) Gut, bring mir zwei Rohstahl und eine alte Goldmünze, dann fertige ich dir das Ding an.

	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMiSwordRaw, 2);
	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMi_OldCoin, 5);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Eduard braucht für den Dietrich zwei Rohstahl und eine alte Goldmünze. Hoffentlich hat Scar die Sachen im Angebot.");
};

INSTANCE Info_Mod_Eduard_ZutatenFuerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZutatenFuerDietrich_Condition;
	information	= Info_Mod_Eduard_ZutatenFuerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du das Zeug!";
};

FUNC INT Info_Mod_Eduard_ZutatenFuerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_MagischerDietrich))
	&& (Npc_HasItems(hero, ItMiSwordRaw) >= 2)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZutatenFuerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZutatenFuerDietrich_15_00"); //Hier hast du das Zeug!

	Npc_RemoveInvItems	(hero, ItMiSwordRaw, 2);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 1);

	B_ShowGivenThings	("Zwei Rohstahl und eine alte Goldmünze gegeben");

	AI_Output(self, hero, "Info_Mod_Eduard_ZutatenFuerDietrich_32_01"); //Komm morgen wieder und hol den Dietrich ab.

	EduardDietrich_Day = Wld_GetDay();

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Die Herstellung des Dietrichs dauert eine Nacht. Ich soll morgen wieder kommen.");
};

INSTANCE Info_Mod_Eduard_DietrichFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_DietrichFertig_Condition;
	information	= Info_Mod_Eduard_DietrichFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist der Dietrich fertig?";
};

FUNC INT Info_Mod_Eduard_DietrichFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_ZutatenFuerDietrich))
	&& (EduardDietrich_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_DietrichFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_DietrichFertig_15_00"); //Ist der Dietrich fertig?
	AI_Output(self, hero, "Info_Mod_Eduard_DietrichFertig_32_01"); //Ja, hier. Nun geh und lass mich in Ruhe!

	B_GiveInvItems	(self, hero, ItKe_Lockpick_Mage_Unloaded, 1);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Ich hab den Dietrich. Jetzt auf zu Gomez.");
};

INSTANCE Info_Mod_Eduard_Beliarstein (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Beliarstein_Condition;
	information	= Info_Mod_Eduard_Beliarstein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauch deine Hilfe.";
};

FUNC INT Info_Mod_Eduard_Beliarstein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_HabStein))
	&& (Npc_HasItems(hero, ItMi_Beliarstein_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Beliarstein_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_00"); //Ich brauch deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_01"); //(seufzt) Was ist denn?
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_02"); //Sieh dir mal diesen Stein an.

	B_GiveInvItems	(hero, self, ItMi_Beliarstein_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_03"); //Hmm ... der ist sehr in Mitleidenschaft gezogen worden.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_04"); //Kann man ihn reparieren?
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_05"); //So was hab ich noch nie gemacht, aber vielleicht schon.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_06"); //Ich brauche zwei Brocken schwarzes Erz, um dem Stein seine Kraft zurück zu geben.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_07"); //Hier gibt es aber kein schwarzes Erz.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_08"); //Wende dich an Raven, der kennt sich mit so etwas aus!

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Eduard kann den Stein reparieren, benötigt dafür allerdings zwei Brocken schwarzes Erz. Raven weiß vielleicht, woher ich das bekomme.");
};

INSTANCE Info_Mod_Eduard_HabErz (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_HabErz_Condition;
	information	= Info_Mod_Eduard_HabErz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du das gewünschte Material!";
};

FUNC INT Info_Mod_Eduard_HabErz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_ErzFertig))
	&& (Npc_HasItems(hero, ItMi_Zeitspalt_Addon) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_HabErz_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_HabErz_15_00"); //Hier hast du das gewünschte Material!

	B_GiveInvItems	(hero, self, ItMi_Zeitspalt_Addon, 2);

	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_01"); //Das ist gut. Ich werde das schwarze Erz nun mit dem Stein verbinden.
	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_02"); //Warte bis morgen und komm dann wieder!

	Bel_SteinReparieren = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Eduard repariert jetzt den Stein. Morgen ist er fertig.");
};

INSTANCE Info_Mod_Eduard_SteinFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SteinFertig_Condition;
	information	= Info_Mod_Eduard_SteinFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und?";
};

FUNC INT Info_Mod_Eduard_SteinFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_HabErz))
	&& (Wld_GetDay() > Bel_SteinReparieren)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_SteinFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_00"); //Und?
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_01"); //Ich hab zwar die ganze Nacht gebraucht, aber der Stein pulsiert wieder voller Energie!
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_02"); //Hier hast du ihn!

	B_GiveInvItems	(self, hero, ItMi_Beliarstein, 1);

	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_03"); //Ich werde nun zu Fahim zurückkehren.
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_04"); //Tu das.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Der Stein ist repariert und pulsiert wieder voll Energie. Jetzt sollte ich zu Fahim zurückkehren.");
};

INSTANCE Info_Mod_Eduard_ToteNovizen (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ToteNovizen_Condition;
	information	= Info_Mod_Eduard_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab ein paar Fragen an dich.";
};

FUNC INT Info_Mod_Eduard_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_00"); //Ich hab ein paar Fragen an dich.
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_01"); //(völlig fertig) Wa ... Wa ... Was willst du denn? Mir reicht es schon, was passiert ist! Diese Schatten ...
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_02"); //Was für Schatten?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_03"); //(schaudert) Ich habe einen großen Schatten gesehen gestern Nacht ... Flügel flatterten ... ein Schrei ...
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_04"); //Was war es?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_05"); //Dämon ... Ich glaube, es war ein ... Dämon!

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Eduard hat einen Schatten gesehen. Er denkt, es sei ein Dämon gewesen. Ich sollte zu Raven gehen.");
};

INSTANCE Info_Mod_Eduard_Skinner (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Skinner_Condition;
	information	= Info_Mod_Eduard_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe die Traumrufe von Skinner.";
};

FUNC INT Info_Mod_Eduard_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 8)
	&& (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Skinner_15_00"); //Ich bringe die Traumrufe von Skinner. 80 Gold das Stück.

	B_GiveInvItems	(hero, self, ItMi_Traumruf, 8);

	B_UseItem	(self, ItMi_Traumruf);

	AI_Output(self, hero, "Info_Mod_Eduard_Skinner_32_01"); //(benebelt) Ahh, traumhaft und so günstig. Habe gerade genug Goldmünzen für acht Stück.

	B_GiveInvItems	(self, hero, ItMi_Gold, 600);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Ich war bei Eduard. Die Traumrufe scheinen ihn ziemlich zu vernebeln.");

	Mod_EduardZuWenigGoldCounter = 3600;
	
	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_ZuWenigGold (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZuWenigGold_Condition;
	information	= Info_Mod_Eduard_ZuWenigGold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, 600 Goldmünzen sind zu wenig.";
};

FUNC INT Info_Mod_Eduard_ZuWenigGold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Skinner))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Mod_EduardZuWenigGoldCounter > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_15_00"); //Hey, 600 Goldmünzen sind zu wenig.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_32_01"); //Tatsächlich? Habe es seit dem Rauchen nicht mehr so mit dem Rechnen. Wie viel schulde ich dir noch?

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "120 Gold.", Info_Mod_Eduard_ZuWenigGold_C);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "80 Gold.", Info_Mod_Eduard_ZuWenigGold_B);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "40 Gold.", Info_Mod_Eduard_ZuWenigGold_A);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_C()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_C_15_00"); //120 Gold.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_C_32_01"); //Augenblick mal. Da fehlen mir leider ein paar Münzen. Ich gebe dir stattdessen 3 Erzbrocken, ja?

	B_GiveInvItems	(self, hero, ItMi_Nugget, 3);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_E()
{
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_E_32_00"); //Oh, habe doch noch gerade so viel.
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_B()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_B_15_00"); //80 Gold.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_A()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_A_15_00"); //40 Gold.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_00"); //Ja, ja, ich arbeite dran. Aber dieses komische Erzgemisch aus der Mine ist echt hart.
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_01"); //Ich brauch noch mindestens einen halben Tag.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 60);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest2_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_AlteMineQuest))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_00"); //Hier. Ein echt krasses Stück Handwerkskunst, sage ich dir. Ich werde immer besser.

	if (hero.guild == GIL_KDF)
	{
		B_GiveInvItems	(self, hero, ItAr_FinsternisPanzerhandschuh, 1);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItAr_BoeserBlickAbwender, 1);
	};

	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_01"); //Ich weiß zwar nicht, welche verborgenen Eigenschaften in diesem veränderten Erz stecken, aber dieses gute Stück wird dir bestimmt irgendwie nützlich sein.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Eduard_Ruestung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Ruestung_Condition;
	information	= Info_Mod_Eduard_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Rüstung bekommen?";
};

FUNC INT Info_Mod_Eduard_Ruestung_Condition()
{
	if ((Mod_Gilde == 15)
	|| (Mod_Gilde == 12))
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_15_00"); //Kann ich bei dir eine bessere Rüstung bekommen?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 15)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_02"); //Ich hab gehört, dass auf dem Weg zur Ausgrabungsstätte der Wassermagier ein Nachtmahr sein soll. Mit dessen Fell könnte ich deine schwarze Kriegerrüstung sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Nightmare,	"FP_MAGICGOLEM");
	};

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	&& (Mod_Gilde == 12)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_03"); //Ich hab gehört, dass auf beim Pass ein Schattensnapper sein soll. Mit dessen Haut könnte ich deine schwarze Novizenrobe sicher ein wenig verbessern.
	
		Mod_ErsteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Schattensnapper,	"NW_PASS_06");
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
	Info_AddChoice	(Info_Mod_Eduard_Ruestung, DIALOG_BACK, Info_Mod_Eduard_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 15)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Schwarze Kriegerrüstung verbessern", Info_Mod_Eduard_Ruestung_SKR_S);
	};

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 12)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Schwarze Novizenrobe verbessern", Info_Mod_Eduard_Ruestung_SNOV_S);
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SKR_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SKR_S_15_00"); //Verbessere meine schwarze Kriegerrüstung.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, ItAr_SMK_L) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_SMK_L, 1);

		CreateInvItems	(self, ItAr_SKR_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SKR_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SKR_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_SMK_L) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_02"); //Du musst schon eine schwarze Kriegerrüstung haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_03"); //Wenn du das Nachtmahrfell nicht hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SNOV_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SNOV_S_15_00"); //Verbessere meine schwarze Novizenrobe.

	if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 1)
	&& (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_Schattensnapperhaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_NOV_DMB_01, 1);

		CreateInvItems	(self, ItAr_SNOV_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SNOV_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SNOV_S);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_02"); //Du musst schon eine schwarze Novizenrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_03"); //Wenn du die Schattensnapperhaut nicht hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

instance Info_Mod_Eduard_TeachCOMMON (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr          	= 1;
	condition	= Info_Mod_Eduard_TeachCOMMON_Condition;
	information	= Info_Mod_Eduard_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Schmieden lernen", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Eduard_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_SchmiedenLehren))
	{
		return TRUE;
	};
};

func void Info_Mod_Eduard_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Eduard_TeachCOMMON_15_00"); //Bring mir bei, wie man ein Schwert schmiedet!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_01"); //Ganz einfach: Besorge dir ein Stück Rohstahl, halte es ins Feuer, bis es glüht.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_02"); //Dann schlägst du am Amboss die Klinge zurecht.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_03"); //Achte vor allem darauf, dass die Klinge nicht zu kalt wird. Du hast immer nur wenige Minuten Zeit, an deiner Waffe zu arbeiten ...
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_04"); //Den Rest findest du schon raus - reine Übungssache.
	};
};

INSTANCE Info_Mod_Eduard_Trade (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trade_Condition;
	information	= Info_Mod_Eduard_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Eduard_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Eduard_Pickpocket (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Pickpocket_Condition;
	information	= Info_Mod_Eduard_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Eduard_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_BACK, Info_Mod_Eduard_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Eduard_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Eduard_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Eduard_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Eduard_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Eduard_EXIT (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_EXIT_Condition;
	information	= Info_Mod_Eduard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Eduard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};