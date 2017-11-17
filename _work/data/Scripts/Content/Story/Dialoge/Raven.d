var int BEL_Erzumwandlung;

INSTANCE Info_Mod_Raven_Hi (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Hi_Condition;
	information	= Info_Mod_Raven_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Raven_Hi_10_00"); //Bei Beliars behaartem Hintern! Dich habe ich doch schon mal gesehen!
	AI_Output(hero, self, "Info_Mod_Raven_Hi_15_01"); //(räuspert sich)
	AI_Output(self, hero, "Info_Mod_Raven_Hi_10_02"); //Oder warum habe ich das dringende Bedürfnis, dir die Fresse zu polieren?
};

INSTANCE Info_Mod_Raven_WerBistDu (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_WerBistDu_Condition;
	information	= Info_Mod_Raven_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, Rav... Äh, ich meine, wer bist du?";
};

FUNC INT Info_Mod_Raven_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_WerBistDu_15_00"); //Hallo, Rav... Äh, ich meine, wer bist du?
	AI_Output(self, hero, "Info_Mod_Raven_WerBistDu_10_01"); //Ich bin Raven, der oberste der Dämonenritter. Und dich Bürschchen werde ich von nun an ganz besonders im Auge behalten.
};

INSTANCE Info_Mod_Raven_WarumDaemonenritter (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_WarumDaemonenritter_Condition;
	information	= Info_Mod_Raven_WarumDaemonenritter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist so toll daran, Dämonenritter zu sein?";
};

FUNC INT Info_Mod_Raven_WarumDaemonenritter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_WarumDaemonenritter_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_WarumDaemonenritter_15_00"); //Was ist so toll daran, Dämonenritter zu sein?
	AI_Output(self, hero, "Info_Mod_Raven_WarumDaemonenritter_10_01"); //(lacht) Dass wir kleinen Würstchen wie dir das Maul stopfen können, wenn wir es wollen.
	AI_Output(self, hero, "Info_Mod_Raven_WarumDaemonenritter_10_02"); //Wir sind Beliars Streitkräfte, mit den mächtigsten Waffen, Rüstungen, Sprüchen und der Zustimmung des dunklen Gottes ausgestattet.
	AI_Output(self, hero, "Info_Mod_Raven_WarumDaemonenritter_10_03"); //In naher Zukunft wird unsere Armee unbezwingbar sein.
};

INSTANCE Info_Mod_Raven_Belagerung (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Belagerung_Condition;
	information	= Info_Mod_Raven_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordung?";
};

FUNC INT Info_Mod_Raven_Belagerung_Condition()
{
	if (GardeAnfangCutscene == 2)
	&& (Npc_IsDead(Mod_1999_UntoterNovize_04_MT))
	&& (Npc_IsDead(Mod_4000_UntoterNovize_05_MT))
	&& (Npc_IsDead(Mod_4001_UntoterNovize_05_MT))
	&& (Npc_IsDead(Mod_4002_UntoterNovize_06_MT))
	&& (Npc_IsDead(Mod_4003_UntoterNovize_07_MT))
	&& (Npc_IsDead(Mod_4004_UntoterNovize_08_MT))
	&& (Npc_IsDead(Mod_4005_UntoterNovize_09_MT))
	&& (Npc_IsDead(Mod_4006_UntoterMagier_01_MT))
	&& (Npc_IsDead(Mod_4007_UntoterMagier_02_MT))
	&& (Npc_IsDead(Mod_4008_UntoterMagier_03_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_Belagerung_15_00"); //Alles in Ordung?
	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_01"); //Ja, danke. Diese verdammten Innos-Bastarde. Was hat das zu bedeuten? Ich dachte es herrscht Frieden!
	AI_Output(hero, self, "Info_Mod_Raven_Belagerung_15_02"); //Dafür ist nicht das Kloster verantwortlich, sondern ein Amulett, in dem die sogenannte Garde Innos' gefangen war.
	AI_Output(hero, self, "Info_Mod_Raven_Belagerung_15_03"); //Durch die Öffnung des Amuletts ist diese frei und bedroht nun unsere Gottheit. Ich bin hierher gekommen, um euch zu unterstützen.
	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_04"); //(wütend) Dieses Dreckspack. Wir sitzen hier fest, und du als Einziger willst uns helfen?
	AI_Output(hero, self, "Info_Mod_Raven_Belagerung_15_05"); //Das hatte ich vor.
	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_06"); //(seufzt) Nun gut, dann wartet eine Menge Arbeit auf dich!

	B_Say	(hero, self, "$WASISTZUTUN");

	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_07"); //Nun, durch diesen Angriff sind wir arg geschwächt worden. Sprich mal mit den wichtigen Leuten hier, sie werden wohl genug zu tun haben für dich, um einen Gegenangriff zu starten.
	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_08"); //Ach ja, ich habe gehört, dass im Talkessel auf dem Weg zu Bengars Hof eine große Gruppe sein soll.
	AI_Output(self, hero, "Info_Mod_Raven_Belagerung_10_09"); //Die solltest du meiden. Darum werden wir uns später kümmern.

	B_LogEntry	(TOPIC_MOD_BEL_BELAGERUNG, "Wir haben die Angreifer abgewehrt, jedoch sind wir arg geschwächt worden. Raven meint, dass ich mich nützlich machen soll.");
};

INSTANCE Info_Mod_Raven_BelagerungAufgabe (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_BelagerungAufgabe_Condition;
	information	= Info_Mod_Raven_BelagerungAufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich für dich tun?";
};

FUNC INT Info_Mod_Raven_BelagerungAufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_BelagerungAufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungAufgabe_15_00"); //Was soll ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungAufgabe_10_01"); //Noch gar nichts! Hilf den anderen, damit wir uns auf einen Gegenangriff vorbereiten können. Dann sehen wir weiter.
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungAufgabe_15_02"); //Na schön.
};

INSTANCE Info_Mod_Raven_BelagerungHilfe (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_BelagerungHilfe_Condition;
	information	= Info_Mod_Raven_BelagerungHilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Habe ich genug geholfen?";
};

FUNC INT Info_Mod_Raven_BelagerungHilfe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_BelagerungAufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gomez_Durchbruch))
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_Trolle))
	&& (Npc_KnowsInfo(hero, Info_Mod_Scar_HabBauanleitung))
	&& (Npc_KnowsInfo(hero, Info_Mod_Abdi_DaemonTot))
	&& (Npc_KnowsInfo(hero, Info_Mod_Fahim_SchreinRepariert))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_BelagerungHilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungHilfe_15_00"); //Habe ich genug geholfen?
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungHilfe_10_01"); //Du hast Scar geholfen, den Novizen neue Waffen zu besorgen. Du hast für Fahim den Beliarschrein repariert. Du hast den Dämonen getötet. Du hast Eduard geholfen, die Waffen unserer Novizen zu verstärken, und du hast einen Großteil der Untoten besiegt. Gut, das genügt!
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungHilfe_15_02"); //Was sind nun die nächsten Schritte?
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungHilfe_10_03"); //Wir müssen versuchen die Banditen zu überzeugen, die restlichen Untoten auf dem Plateau anzugreifen. Ohne Unterstützung schaffen wir das nicht.
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungHilfe_10_04"); //Erst, wenn wir die Feinde getötet haben, können wir uns um die Garde Innos' selbst kümmern.
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungHilfe_15_05"); //Wie soll ich die Söldner überzeugen?
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungHilfe_10_06"); //Du hast doch gute Kontakte zum Neuen Lager. Überzeuge sie, uns Männer zur Verfügung zu stellen!
	AI_Output(hero, self, "Info_Mod_Raven_BelagerungHilfe_15_07"); //Ich werde gleich aufbrechen.
	AI_Output(self, hero, "Info_Mod_Raven_BelagerungHilfe_10_08"); //Beeile dich. Die Zeit ist nicht unser Verbündeter! Im Lager vor der Freien Mine wirst du sicher ein paar Unterstützer finden.

	B_GivePlayerXP	(800);

	Log_CreateTopic	(TOPIC_MOD_BEL_SOELDNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_SOELDNER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_SOELDNER, "Innerhalb unserer Festung sind wir nun wieder ziemlich sicher, doch gilt es nun, die Garde Innos' zu besiegen. Alleine haben wir jedoch gegen die Untoten keine Chance. Raven bat mich, die Söldner bei der Freien Mine um ihre Hilfe zu bitten.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_BELAGERUNG, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Raven_SoeldnerSold (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_SoeldnerSold_Condition;
	information	= Info_Mod_Raven_SoeldnerSold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt ein kleines Problem mit den Söldnern.";
};

FUNC INT Info_Mod_Raven_SoeldnerSold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_BelagerungHilfe))
	&& (Mod_GornsSold == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_SoeldnerSold_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_SoeldnerSold_15_00"); //Es gibt ein kleines Problem mit den Banditen.
	AI_Output(self, hero, "Info_Mod_Raven_SoeldnerSold_10_01"); //Was ist denn los?
	AI_Output(hero, self, "Info_Mod_Raven_SoeldnerSold_15_02"); //Bullco hat gemeint, dass seine Leute nur mit 10.000 Goldstücken bereit wären, einen Kampf mit uns zu führen!
	AI_Output(self, hero, "Info_Mod_Raven_SoeldnerSold_10_03"); //(ungläubig) Das ist ein Scherz, oder?
	AI_Output(hero, self, "Info_Mod_Raven_SoeldnerSold_15_04"); //Keineswegs.
	AI_Output(self, hero, "Info_Mod_Raven_SoeldnerSold_10_05"); //(wütend) Na gut. Hier hast du 10.000 Goldstücke.

	B_GiveInvItems	(self, hero, ItMi_Gold, 10000);

	AI_Output(self, hero, "Info_Mod_Raven_SoeldnerSold_10_06"); //Hoffentlich wollen die Söldner nicht mehr.

	B_LogEntry	(TOPIC_MOD_BEL_SOELDNER, "Raven hat mir das Gold gegeben. Jetzt sollte ich es zu Bullco bringen und dann kann die Schlacht beginnen.");
};

INSTANCE Info_Mod_Raven_SoeldnerDabei (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_SoeldnerDabei_Condition;
	information	= Info_Mod_Raven_SoeldnerDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Söldner werden uns unterstützen.";
};

FUNC INT Info_Mod_Raven_SoeldnerDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bullco_Sold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_SoeldnerDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_SoeldnerDabei_15_00"); //Die Banditen werden uns unterstützen. Heute Nacht werden sie angreifen. Wir sollen zum Talkessel kommen.
	AI_Output(self, hero, "Info_Mod_Raven_SoeldnerDabei_10_01"); //Sehr gut, komme gegen Mitternacht zum Plateau, dort werden wir warten.
	AI_Output(hero, self, "Info_Mod_Raven_SoeldnerDabei_15_02"); //In Ordnung.

	B_GivePlayerXP	(250);

	B_SetTopicStatus	(TOPIC_MOD_BEL_SOELDNER, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_517_DMR_Gomez_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_1030_SNOV_Abdi_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_518_SMK_Scar_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_1029_SMK_Fahim_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_1027_SMK_Eduard_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_779_SLD_Bullco_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_781_SLD_Cipher_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_784_SLD_Fester_MT, "AUFSTELLUNG");
	B_StartOtherRoutine	(Mod_798_SLD_Wolf_NW, "AUFSTELLUNG");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Raven_ArgibastDead (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_ArgibastDead_Condition;
	information	= Info_Mod_Raven_ArgibastDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_ArgibastDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argibast_Hi))
	&& (Npc_IsDead(GardeInnos_4050_Argibast))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_ArgibastDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Raven_ArgibastDead_10_00"); //Es ist vollbracht, die Belagerung ist gebrochen.
	AI_Output(hero, self, "Info_Mod_Raven_ArgibastDead_15_01"); //Es war nicht einfach.
	AI_Output(self, hero, "Info_Mod_Raven_ArgibastDead_10_02"); //Da hast du Recht. Melde dich nun bei Xardas und gib ihm Bescheid.
	AI_Output(hero, self, "Info_Mod_Raven_ArgibastDead_15_03"); //Das werde ich.

	B_GivePlayerXP	(1000);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_517_DMR_Gomez_MT, "START");
	B_StartOtherRoutine	(Mod_1030_SNOV_Abdi_MT, "START");
	B_StartOtherRoutine	(Mod_518_SMK_Scar_MT, "START");
	B_StartOtherRoutine	(Mod_1029_SMK_Fahim_MT, "START");
	B_StartOtherRoutine	(Mod_1027_SMK_Eduard_MT, "START");
	B_StartOtherRoutine	(Mod_779_SLD_Bullco_MT, "START");
	B_StartOtherRoutine	(Mod_781_SLD_Cipher_MT, "START");
	B_StartOtherRoutine	(Mod_784_SLD_Fester_MT, "START");
	B_StartOtherRoutine	(Mod_1269_SLD_Blade_MT, "START");
};

INSTANCE Info_Mod_Raven_SchwarzesErz (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_SchwarzesErz_Condition;
	information	= Info_Mod_Raven_SchwarzesErz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme um deinen Rat zu ersuchen.";
};

FUNC INT Info_Mod_Raven_SchwarzesErz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Beliarstein))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_SchwarzesErz_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_SchwarzesErz_15_00"); //Ich komme, um deinen Rat zu ersuchen.
	AI_Output(self, hero, "Info_Mod_Raven_SchwarzesErz_10_01"); //Um was geht es denn?
	AI_Output(hero, self, "Info_Mod_Raven_SchwarzesErz_15_02"); //Fahim hat vor, den Beliarschrein zu reparieren. Jedoch ist dessen Quelle zerstört und der neue Stein, den ich gefunden habe, benötigt die Kraft von schwarzem Erz, um ihn anzutreiben, und somit auch den Beliarschrein.
	AI_Output(hero, self, "Info_Mod_Raven_SchwarzesErz_15_03"); //Jedoch gibt es hier oben kein schwarzes Erz mehr. Wo kann ich welches herbekommen?
	AI_Output(self, hero, "Info_Mod_Raven_SchwarzesErz_10_04"); //Ich kenne eine Methode, um normales Erz in schwarzes Erz umzuwandeln. Jedoch benötige ich zwei Brocken Erz, um daraus schwarzes Erz machen zu können.

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Raven kann schwarzes Erz aus magischem Erz herstellen. Jetzt muss ich nur zwei Brocken davon auftreiben.");
};

INSTANCE Info_Mod_Raven_MagischesErz (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_MagischesErz_Condition;
	information	= Info_Mod_Raven_MagischesErz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Erz.";
};

FUNC INT Info_Mod_Raven_MagischesErz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_SchwarzesErz))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_MagischesErz_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_MagischesErz_15_00"); //Ich hab das Erz.

	B_GiveInvItems	(hero, self, ItMi_Nugget, 2);

	AI_Output(self, hero, "Info_Mod_Raven_MagischesErz_10_01"); //Das ist gut. Komm morgen wieder und hol das schwarze Erz ab.
	
	B_GivePlayerXP	(150);

	Bel_Erzumwandlung = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Ich hab Raven das Erz gegeben. Morgen kann ich das schwarze Erz abholen.");
};

INSTANCE Info_Mod_Raven_ErzFertig (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_ErzFertig_Condition;
	information	= Info_Mod_Raven_ErzFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig?";
};

FUNC INT Info_Mod_Raven_ErzFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_MagischesErz))
	&& (Wld_GetDay() > Bel_Erzumwandlung)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_ErzFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_ErzFertig_15_00"); //Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Raven_ErzFertig_10_01"); //Ja, hier sind vier Brocken schwarzes Erz.

	B_GiveInvItems	(self, hero, ItMi_Zeitspalt_Addon, 4);

	AI_Output(self, hero, "Info_Mod_Raven_ErzFertig_10_02"); //Ich habe durch einen Vervielfältigungszauber die Menge verdoppeln können!
	AI_Output(hero, self, "Info_Mod_Raven_ErzFertig_15_03"); //Danke.
	AI_Output(self, hero, "Info_Mod_Raven_ErzFertig_10_04"); //Gehe nun und verrichte weiter deine Aufgaben!
	
	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Ich hab jetzt das schwarze Erz. Jetzt auf zu Eduard.");
};

INSTANCE Info_Mod_Raven_ToteNovizen (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_ToteNovizen_Condition;
	information	= Info_Mod_Raven_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich glaube wir haben ein ernstes Problem.";
};

FUNC INT Info_Mod_Raven_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_ToteNovizen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_00"); //Ich glaube, wir haben ein ernstes Problem.
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_01"); //Was ist los?
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_02"); //Ich glaube, ein Dämon hat die Morde begangen!
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_03"); //(ungläubig) Ein Dämon? Den hätten wir längst bemerkt! Außerdem haben Innos' Anhänger nichts mit Dämonen zu tun!
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_04"); //Die Feuermagier lernen verbotenerweise Dämonen zu beschwören. Wieso sollten die Untoten das nicht können?
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_05"); //Selbst wenn, wir hätten die Anwesenheit eines Dämons schon längst bemerkt!
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_06"); //Gibt es irgendeine Außnahme?
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_07"); //Ja, es gibt Diener des Bösen, die Metarmorphosen anwenden können. Die Kraft, sich in ein anderes Wesen zu verwandeln.
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_08"); //Der Dämon müsste sich in einem unserer Novizen eingenistet haben!
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_09"); //Wie kann ich den Dämon erkennen?
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_10"); //Du müsstest ihm nachts auflauern und ihn töten.
	AI_Output(hero, self, "Info_Mod_Raven_ToteNovizen_15_11"); //Dann werde ich das tun.
	AI_Output(self, hero, "Info_Mod_Raven_ToteNovizen_10_12"); //Gut, aber sei vorsichtig! Der Dämon ist sicher gerissen,
	
	Wld_InsertNpc	(Mod_4015_SNOV_BesessenerNovize_MT, "TOT");

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Raven hält einen Dämon für äußerst unwahrscheinlich, es sei denn, er hat sich in einem von den Lagerangehörigen eingenistet. Ich soll mich nachts mal umsehen.");
};

INSTANCE Info_Mod_Raven_Befoerderung (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Befoerderung_Condition;
	information	= Info_Mod_Raven_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Schwarzer Krieger werden.";
};

FUNC INT Info_Mod_Raven_Befoerderung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_BefoerderungKrieger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_Befoerderung_15_00"); //Ich will Schwarzer Krieger werden.
	AI_Output(self, hero, "Info_Mod_Raven_Befoerderung_10_01"); //Du wählst also den Weg des Kampfes. Das war die richtige Entscheidung.
	AI_Output(self, hero, "Info_Mod_Raven_Befoerderung_10_02"); //Ich werde dich in den Rang des Schwarzen Kriegers erheben.
	AI_Output(self, hero, "Info_Mod_Raven_Befoerderung_10_03"); //Hier ist deine Rüstung.

	CreateInvItems	(self, ITAR_SMK_L, 1);
	B_GiveInvItems	(self, hero, ITAR_SMK_L, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_SMK_L);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 15;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Raven_GomezLebenLassen (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_GomezLebenLassen_Condition;
	information	= Info_Mod_Raven_GomezLebenLassen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_GomezLebenLassen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Gomez))
	&& (!Npc_IsInState(Mod_680_DMB_Xardas_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_GomezLebenLassen_Info()
{
	AI_Output(self, hero, "Info_Mod_Raven_GomezLebenLassen_10_00"); //Das stimmt. Lasst ihn am Leben. Ich werde den Truppen auch sofort befehlen euer Lager zu verlassen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raven_Oric (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Oric_Condition;
	information	= Info_Mod_Raven_Oric_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_Oric_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oric_Gomez))
	&& (!Npc_IsInState(Mod_7039_PAL_Oric_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Oric_Info()
{
	AI_TurnToNpc	(self, Mod_7039_PAL_Oric_MT);

	AI_Output(self, hero, "Info_Mod_Raven_Oric_10_00"); //Halt's Maul

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7039_PAL_Oric_MT, "DRAINED");
};

INSTANCE Info_Mod_Raven_GomezNervt (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_GomezNervt_Condition;
	information	= Info_Mod_Raven_GomezNervt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Raven_GomezNervt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_AtAL3))
	&& (!Npc_IsInState(Mod_517_DMR_Gomez_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_GomezNervt_Info()
{
	AI_TurnToNpc	(self, Mod_517_DMR_Gomez_MT);

	AI_Output(self, hero, "Info_Mod_Raven_GomezNervt_10_00"); //Ohne mich hätte dich hätte dich dieses Snapperrudel am Ausgang des Minentals doch zerfleischt und jetzt arbeitest du für mich.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Raven_GomezNervt_10_01"); //Als Entschädigung überreiche ich dir das Schwert namens Innos' Zorn, das Gomez zu Zeiten des alten Lagers benutzte.
	AI_Output(self, hero, "Info_Mod_Raven_GomezNervt_10_02"); //Möge es in deinen Händen ein Zeichen für die strahlende Zukunft des Alten Lagers sein.

	B_GiveInvItems	(self, hero, ItMw_1H_Blessed_03, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raven_Teacher (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Teacher_Condition;
	information	= Info_Mod_Raven_Teacher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Raven_Teacher_Condition()
{
	if(Npc_KnowsInfo(hero, Info_Mod_Raven_Hi))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Teacher_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Raven_Teacher_10_01"); //Ja, ich kann dir zeigen wie du stärker wirst.
	AI_Output(self, hero, "Info_Mod_Raven_Teacher_10_02"); //Außerdem kann ich dir den Umgang mit Zweihandwaffen beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Raven kann mir beibringen wie ich stärker werde und wie ich mit Zweihandwaffen umgehe.");
};

INSTANCE Info_Mod_Raven_Lernen (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Lernen_Condition;
	information	= Info_Mod_Raven_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Raven_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Teacher))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_Lernen_15_00"); //Ich will lernen.
	AI_Output(self, hero, "Info_Mod_Raven_Lernen_10_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice	(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Zweihandkampf)", Info_Mod_Raven_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Stärke)", Info_Mod_Raven_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_Lernen);
};

FUNC VOID Info_Mod_Raven_Lernen_Zweihand()
{
	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Zweihand_BACK);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Raven_Lernen_Zweihand_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice	(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Zweihandkampf)", Info_Mod_Raven_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Stärke)", Info_Mod_Raven_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_Lernen_Zweihand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Raven_Lernen);

		Info_AddChoice		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Raven_Lernen_Zweihand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Raven_Lernen);

		Info_AddChoice		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_Lernen_Zweihand_1);
	};
};	

FUNC VOID Info_Mod_Raven_Lernen_Staerke()
{
	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Raven_Lernen_Staerke_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice	(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Zweihandkampf)", Info_Mod_Raven_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_Lernen, "(Stärke)", Info_Mod_Raven_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Raven_Lernen_Staerke_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Raven_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_Lernen, DIALOG_BACK, Info_Mod_Raven_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_Lernen_Staerke_1);
};

INSTANCE Info_Mod_Raven_Pickpocket (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_Pickpocket_Condition;
	information	= Info_Mod_Raven_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Raven_Pickpocket_Condition()
{
	C_Beklauen	(161, ItMi_Gold, 92);
};

FUNC VOID Info_Mod_Raven_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raven_Pickpocket);

	Info_AddChoice	(Info_Mod_Raven_Pickpocket, DIALOG_BACK, Info_Mod_Raven_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raven_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raven_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raven_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_Pickpocket);
};

FUNC VOID Info_Mod_Raven_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raven_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raven_Pickpocket);

		Info_AddChoice	(Info_Mod_Raven_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raven_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raven_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raven_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raven_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raven_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raven_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raven_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raven_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raven_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raven_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raven_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raven_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raven_EXIT (C_INFO)
{
	npc		= Mod_520_DMR_Raven_MT;
	nr		= 1;
	condition	= Info_Mod_Raven_EXIT_Condition;
	information	= Info_Mod_Raven_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raven_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};