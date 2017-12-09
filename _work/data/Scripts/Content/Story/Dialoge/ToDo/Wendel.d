INSTANCE Info_Mod_Wendel_Hi (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Hi_Condition;
	information	= Info_Mod_Wendel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Wendel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wendel_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Wendel_Hi_01_00"); //Wendel. Ich bin zuständig für die Wasserversorgung hier in Khorata.
	AI_Output(self, hero, "Info_Mod_Wendel_Hi_01_01"); //Wie du siehst, läuft die Wasserverteilung nicht ganz so einfach, sondern mit Hilfe von Pumpen und Schleusen, oberirdisch sowie unterirdisch.
	AI_Output(self, hero, "Info_Mod_Wendel_Hi_01_02"); //Dafür können wir eine optimale Versorgung der Bevölkerung gewährleisten.
	AI_Output(self, hero, "Info_Mod_Wendel_Hi_01_03"); //Solch ein kompliziertes System bedarf selbstverständlich ständiger Überwachung und Reparatur.
};

INSTANCE Info_Mod_Wendel_Endres (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres_Condition;
	information	= Info_Mod_Wendel_Endres_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wendel_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Juliana_WasLos))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_01_00"); //Oh nein! Wir haben ein ernstzunehmendes Problem!
	AI_Output(hero, self, "Info_Mod_Wendel_Endres_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_01_02"); //Das wüsste ich auch gern! Der Wasserkreislauf ist unterbrochen.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_01_03"); //Irgendetwas scheint die Rohre zu verstopfen.
	AI_Output(hero, self, "Info_Mod_Wendel_Endres_15_04"); //Was kann man dagegen tun?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_01_05"); //Entweder, wir nehmen alle Rohre auseinander und prüfen sie ... oder wir schmieren sie von innen mit Fett ein, in der Hoffnung, dass sich der Pfropfen von alleine löst.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_01_06"); //Übernimmst du das Einfetten?

	Info_ClearChoices	(Info_Mod_Wendel_Endres);

	Info_AddChoice	(Info_Mod_Wendel_Endres, "Das kriegt ihr schon ohne mich hin.", Info_Mod_Wendel_Endres_B);
	Info_AddChoice	(Info_Mod_Wendel_Endres, "Woher bekomme ich das Fett?", Info_Mod_Wendel_Endres_A);
};

FUNC VOID Info_Mod_Wendel_Endres_B()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres_B_15_00"); //Das kriegt ihr schon ohne mich hin.

	Info_ClearChoices	(Info_Mod_Wendel_Endres);
};

FUNC VOID Info_Mod_Wendel_Endres_A()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres_A_15_00"); //Woher bekomme ich das Fett?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_A_01_01"); //Das ist die nächste Fragestellung. Ich glaube, da hilft nur Trollfett, das ist extra schmierig. Und extra selten.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_A_01_02"); //Du hast aber Glück, es soll ein Troll hier in Relendel gesichtet worden sein.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_A_01_03"); //Erleg ihn einfach und nimm ihm so viel von seinem Fett ab, wie du tragen kannst!
	AI_Output(hero, self, "Info_Mod_Wendel_Endres_A_15_04"); //Kleiner habt ihr's nicht?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres_A_01_05"); //Nun beeil dich schon, ehe wir noch in Engpässe geraten!

	Mod_Wendel_FettNehmer = 1;

	Wld_InsertNpc	(Troll, "FP_ROAM_TROLL_WENDEL");

	Info_ClearChoices	(Info_Mod_Wendel_Endres);

	Log_CreateTopic	(TOPIC_MOD_KHORATA_WASSERWERK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_WASSERWERK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_WASSERWERK, "Die Rohre in Khoratas Wasserwerk sind verstopft. Wendel hat mich beauftragt, einen Troll in Relendel zu erlegen und ihm das Fett abzunehmen, damit wir die Rohre einfetten können.");
};

INSTANCE Info_Mod_Wendel_Endres02 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres02_Condition;
	information	= Info_Mod_Wendel_Endres02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Trollfett.";
};

FUNC INT Info_Mod_Wendel_Endres02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres))
	&& (Npc_HasItems(hero, ItMi_Trollfett) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres02_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres02_15_00"); //Ich habe das Trollfett.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres02_01_01"); //Sehr gut! Und nun gieß es in den Abort im Haus der Feuermagier.

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_WASSERWERK, "Ich soll das Trollfett in den Abort des Hauses der Feuermagier kippen ...");
};

INSTANCE Info_Mod_Wendel_Endres02_Optional (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres02_Optional_Condition;
	information	= Info_Mod_Wendel_Endres02_Optional_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo ist denn das Haus der Feuermagier?";
};

FUNC INT Info_Mod_Wendel_Endres02_Optional_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres02))
	&& (Npc_HasItems(hero, ItMi_Trollfett) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres02_Optional_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres02_Optional_15_00"); //Wo ist denn das Haus der Feuermagier?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres02_Optional_01_01"); //Es liegt in der gleichen Straße wie Peters Gasthaus und die Brauerei. Nun aber los!
};

INSTANCE Info_Mod_Wendel_Endres03 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres03_Condition;
	information	= Info_Mod_Wendel_Endres03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wendel_Endres03_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Klo_Trollfett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres03_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Endres03_01_00"); //(verstört) Grundgütiger! Das ... das ist doch Endres!
	AI_Output(hero, self, "Info_Mod_Wendel_Endres03_15_01"); //Wer?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres03_01_02"); //Endres, der Baumeister! Julianas Mann, der vermisst wurde. Er hat die Rohre verstopft. (würgt)
	AI_Output(self, hero, "Info_Mod_Wendel_Endres03_01_03"); //(Pause) Ich ... oh, bei Adanos, er wurde ermordet!

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Die Leiche Endres' ist aufgetaucht, die Todesursache ist jedoch unklar. Vielleicht kann Juliana mehr Licht ins Dunkel bringen?");
};

INSTANCE Info_Mod_Wendel_Endres04 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres04_Condition;
	information	= Info_Mod_Wendel_Endres04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was weißt du über Endres?";
};

FUNC INT Info_Mod_Wendel_Endres04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres04_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres04_15_00"); //Was weißt du über Endres?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_01"); //Er war ein wenig verschroben ... und genial, könnte man sagen.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_02"); //Von ihm stammen die rätselhaften Skulpturen in der Stadt, und er half, das Wasserversorgungssystem zu planen.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_03"); //Ohne ihn wären wir bedeutend rückständiger.
	AI_Output(hero, self, "Info_Mod_Wendel_Endres04_15_04"); //Wer könnte ihn umbringen wollen?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_05"); //Woher soll ich das wissen? Er hatte bestimmt Neider, aber mehr weiß ich beim besten Willen nicht. Ich kannte ihn nie gut.
	AI_Output(hero, self, "Info_Mod_Wendel_Endres04_15_06"); //Dann werde ich mich weiter umhören.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_07"); //Erzähl Juliana von dem Vorfall. Ich fühle mich nicht gut.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_08"); //Ach ... was das Wasserwerk anbelangt: da läuft wieder alles ... wie geschmiert ...
	AI_Output(self, hero, "Info_Mod_Wendel_Endres04_01_09"); //Danke für deine Hilfe.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_KHORATA_WASSERWERK, "Die Probleme im Wasserwerk sind gelöst, um anderen Platz zu machen.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_WASSERWERK, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Wendel_Endres05 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres05_Condition;
	information	= Info_Mod_Wendel_Endres05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dir ein paar Fragen zu stellen.";
};

FUNC INT Info_Mod_Wendel_Endres05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Endres))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres05_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres05_15_00"); //Ich habe dir ein paar Fragen zu stellen.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres05_01_01"); //Wieso das?
	AI_Output(hero, self, "Info_Mod_Wendel_Endres05_15_02"); //Beantworte einfach die Fragen.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres05_01_03"); //(nervös) Na schön.
};

INSTANCE Info_Mod_Wendel_Endres06 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres06_Condition;
	information	= Info_Mod_Wendel_Endres06_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du gemacht, bevor Endres' Leiche (...)";
};

FUNC INT Info_Mod_Wendel_Endres06_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres06_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres06_15_00"); //Was hast du gemacht, bevor Endres' Leiche im Wasserversorgungssystem landete?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres06_01_01"); //Ähm ... ich war wie immer mit meinem Assistenten unterwegs, dem Monteur.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres06_01_02"); //Wie immer seit morgens in der Früh.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Wendel behauptet, am fraglichen Tag die ganze Zeit mit seinem Monteur zusammen gewesen zu sein.");
};

INSTANCE Info_Mod_Wendel_Endres07 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres07_Condition;
	information	= Info_Mod_Wendel_Endres07_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was meinst du zu dem Heiler als Verdächtigen?";
};

FUNC INT Info_Mod_Wendel_Endres07_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres07_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres07_15_00"); //Was meinst du zu dem Heiler als Verdächtigen?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres07_01_01"); //Ich kann nicht sagen, ob sie sich überhaupt näher gekannt haben. Sicher waren sie keine guten Freunde.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Wendel glaubt, der Heiler und Endres hätten sich nicht näher gekannt.");
};

INSTANCE Info_Mod_Wendel_Endres08 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Endres08_Condition;
	information	= Info_Mod_Wendel_Endres08_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was meinst du zu Juliana als Verdächtige?";
};

FUNC INT Info_Mod_Wendel_Endres08_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Endres08_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Endres08_15_00"); //Was meinst du zu Juliana als Verdächtige?
	AI_Output(self, hero, "Info_Mod_Wendel_Endres08_01_01"); //Das Verhältnis von Juliana zu Endres schien etwas belastet.
	AI_Output(self, hero, "Info_Mod_Wendel_Endres08_01_02"); //Er war ein Genie, das ist für den Partner nicht immer einfach.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "In Beziehung von Juliana und Endres soll es gekriselt haben.");
};

INSTANCE Info_Mod_Wendel_Nagelnachschub (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Nagelnachschub_Condition;
	information	= Info_Mod_Wendel_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich habe hier einen Brief für dich.";
};                       

FUNC INT Info_Mod_Wendel_Nagelnachschub_Condition()
{
	if (Npc_HasItems(hero, ItWr_ErikaLiebesbrief) == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Nagelnachschub_15_00"); //Ich habe hier einen Brief für dich.

	B_GiveInvItems	(hero, self, ItWr_ErikaLiebesbrief, 1);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Ich habe Wendel die Nachricht überbracht. Jetzt sollte ich mir das Nagelpaket abholen.");

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Wendel_Nagelnachschub_01_01"); //(zittrig) Wer hat dir den Brief gegeben?

	Info_ClearChoices	(Info_Mod_Wendel_Nagelnachschub);

	Info_AddChoice	(Info_Mod_Wendel_Nagelnachschub, "Keine Ahnung, den habe ich gefunden.", Info_Mod_Wendel_Nagelnachschub_B);
	Info_AddChoice	(Info_Mod_Wendel_Nagelnachschub, "Ich habe den Brief von Erika.", Info_Mod_Wendel_Nagelnachschub_A);
};

FUNC VOID Info_Mod_Wendel_Nagelnachschub_B()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Nagelnachschub_B_15_00"); //Keine Ahnung, den habe ich gefunden.
	AI_Output(self, hero, "Info_Mod_Wendel_Nagelnachschub_B_01_01"); //Zu schade. Dann kann ich ja gar nicht antworten.

	Info_ClearChoices	(Info_Mod_Wendel_Nagelnachschub);
};

FUNC VOID Info_Mod_Wendel_Nagelnachschub_A()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Nagelnachschub_A_15_00"); //Ich habe den Brief von Erika.
	AI_Output(self, hero, "Info_Mod_Wendel_Nagelnachschub_A_01_01"); //Du bist der Überbringer der besten Nachricht meines Lebens! Nimm das als Dank!

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	Info_ClearChoices	(Info_Mod_Wendel_Nagelnachschub);
};

INSTANCE Info_Mod_Wendel_Unruhen (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen_Condition;
	information	= Info_Mod_Wendel_Unruhen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Du wirst als Nachfolger Anselms vorgeschlagen.";
};                       

FUNC INT Info_Mod_Wendel_Unruhen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen2))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen_15_00"); //Du wirst als Nachfolger Anselms vorgeschlagen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen_01_01"); //Das ehrt mich sehr. Allerdings bin ich mir nicht sicher, der Richtige zu sein.
};

INSTANCE Info_Mod_Wendel_Unruhen2 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen2_Condition;
	information	= Info_Mod_Wendel_Unruhen2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Was sagst du zu der jetzigen Situation?";
};                       

FUNC INT Info_Mod_Wendel_Unruhen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Unruhen))
	&& (Mod_REL_Kandidat < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen2_15_00"); //Was sagst du zu der jetzigen Situation?
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen2_01_01"); //Die ist äußerst prekär. Wir dürfen nichts mehr unternehmen, das die Bergleute weiter reizen könnte, sondern sollten die Verständigungsgespräche umgehend wieder aufnehmen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen2_01_02"); //Noch mehr Tote müssen verhindert werden!

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Wenn Wendel neuer Stadthalter wird, will er sich für eine Verständigung mit den Bergleuten einsetzen.");
};

INSTANCE Info_Mod_Wendel_Unruhen3 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen3_Condition;
	information	= Info_Mod_Wendel_Unruhen3_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Welche Seite hat deine Sympathien?";
};                       

FUNC INT Info_Mod_Wendel_Unruhen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Unruhen))
	&& (Mod_REL_Kandidat < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen3_15_00"); //Welche Seite hat deine Sympathien?
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen3_01_01"); //Darum geht es nicht. Beide Parteien haben Fehler begangen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen3_01_02"); //Unser Ziel muss es sein, die Bergarbeiter so in unsere Gesellschaft einzugliedern, dass wir alle zufrieden sind.
};

INSTANCE Info_Mod_Wendel_Unruhen4 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen4_Condition;
	information	= Info_Mod_Wendel_Unruhen4_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Du bist nun der Stadthalter Khoratas.";
};                       

FUNC INT Info_Mod_Wendel_Unruhen4_Condition()
{
	if (Mod_REL_Kandidat == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen4_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_00"); //Du bist nun der Stadthalter Khoratas.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_01"); //Ich weiß nicht, ob ich mich darüber freuen soll.
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_02"); //Du machst das schon.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_03"); //Mit deiner Unterstützung. Lass uns sofort loslegen. Es gibt einiges zu tun.
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_04"); //Wo fangen wir an?
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_05"); //Selbstverständlich bei den Bergleuten. Der Konflikt muss unblutig beendet werden.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_06"); //Eigentlich wäre das ein Fall für das Gericht. Aber, unter uns, ich halte nicht viel von dem Richter und den Schöffen.
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_07"); //Verständlich.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_08"); //Ich denke, wir sollten einen Vertreter der Städter und einen der Buddler zusammensetzen;
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_09"); //die beiden würden über die Lösungsmöglichkeiten beratschlagen, überwacht von einem unparteiischen Außenstehenden - dir.
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_10"); //Wer soll die Städter und wer die Buddler repräsentieren?
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_11"); //Da ich nun das Oberhaupt Khoratas bin, maße ich mir an, für die Bürger zu sprechen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_12"); //Was die Buddler betrifft - ich schlage vor, du suchst dir einen Freiwilligen unter ihnen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen4_01_13"); //Wir treffen uns anschließend im Rathaus.
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen4_15_14"); //Alles klar.

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Wendel hat mich gebeten, einen Buddler dazu zu überreden, im Haus des Stadthalters mit ihm zusammenzutreffen.");

	B_StartOtherRoutine	(self, "VERHANDLUNG");
};

INSTANCE Info_Mod_Wendel_Unruhen5 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen5_Condition;
	information	= Info_Mod_Wendel_Unruhen5_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Ihr zwei könnt loslegen. Ich werde eingreifen, wenn es nötig wird.";
};                       

FUNC INT Info_Mod_Wendel_Unruhen5_Condition()
{
	if (Mod_REL_WendelS == 1)
	&& (Npc_GetDistToWP(Mod_7492_OUT_Roman_REL, "RATHAUSUNTEN_01") < 500)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen5_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen5_15_00"); //Ihr zwei könnt loslegen. Ich werde eingreifen, wenn es nötig wird.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 2;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wendel_Unruhen6 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen6_Condition;
	information	= Info_Mod_Wendel_Unruhen6_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Mod_Wendel_Unruhen6_Condition()
{
	if (Mod_REL_WendelS == 4)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen6_Info()
{
	Info_ClearChoices	(Info_Mod_Wendel_Unruhen6);

	Info_AddChoice	(Info_Mod_Wendel_Unruhen6, "Ich sehe da deine deutliche Mitschuld, Wendel.", Info_Mod_Wendel_Unruhen6_B);
	Info_AddChoice	(Info_Mod_Wendel_Unruhen6, "Genau, Roman, versuch bitte, sachlich zu sein.", Info_Mod_Wendel_Unruhen6_A);
};

FUNC VOID Info_Mod_Wendel_Unruhen6_B()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen6_B_15_00"); //Ich sehe da deine deutliche Mitschuld, Wendel.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 6;

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen6);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Wendel_Unruhen6_A()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen6_A_15_00"); //Genau, Roman, versuch bitte, sachlich zu sein.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 5;

	Mod_REL_WendelS_Choice += 1;

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen6);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wendel_Unruhen7 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen7_Condition;
	information	= Info_Mod_Wendel_Unruhen7_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Mod_Wendel_Unruhen7_Condition()
{
	if (Mod_REL_WendelS == 10)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen7_Info()
{
	Info_ClearChoices	(Info_Mod_Wendel_Unruhen7);

	Info_AddChoice	(Info_Mod_Wendel_Unruhen7, "Wendel, in diesem Punkt solltest du nachgeben.", Info_Mod_Wendel_Unruhen7_B);
	Info_AddChoice	(Info_Mod_Wendel_Unruhen7, "Halt dich ein wenig zurück, Roman.", Info_Mod_Wendel_Unruhen7_A);
};

FUNC VOID Info_Mod_Wendel_Unruhen7_B()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen7_B_15_00"); //Wendel, in diesem Punkt solltest du nachgeben.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 12;

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen7);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Wendel_Unruhen7_A()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen7_A_15_00"); //Halt dich ein wenig zurück, Roman.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 11;

	Mod_REL_WendelS_Choice += 1;

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen7);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wendel_Unruhen8 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen8_Condition;
	information	= Info_Mod_Wendel_Unruhen8_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Mod_Wendel_Unruhen8_Condition()
{
	if (Mod_REL_WendelS == 16)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen8_Info()
{
	Info_ClearChoices	(Info_Mod_Wendel_Unruhen8);

	Info_AddChoice	(Info_Mod_Wendel_Unruhen8, "Romans Forderung ist absolut zulässig.", Info_Mod_Wendel_Unruhen8_B);
	Info_AddChoice	(Info_Mod_Wendel_Unruhen8, "Eine Entschädigung wäre jetzt doch zu viel des Guten.", Info_Mod_Wendel_Unruhen8_A);
};

FUNC VOID Info_Mod_Wendel_Unruhen8_B()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen8_B_15_00"); //Romans Forderung ist absolut zulässig.

	if (Mod_REL_WendelS_Choice == 0)
	{
		AI_Output(self, hero, "Info_Mod_Wendel_Unruhen8_B_01_01"); //Es tut mir Leid, dir das sagen zu müssen, aber unter einem Unparteiischen stelle ich mir nicht das vor, was du uns hier gezeigt hast.
		AI_Output(self, hero, "Info_Mod_Wendel_Unruhen8_B_01_02"); //Ich bin mit dem Verlauf des Gesprächs nicht zufrieden und würde vorschlagen, es später noch einmal zu versuchen.

		Mod_REL_WendelS = 17;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Wendel_Unruhen8_B_01_03"); //Ja, das ist mir bewusst. Wir werden schon eine Lösung finden.
		AI_Output(self, hero, "Info_Mod_Wendel_Unruhen8_B_01_04"); //Vielleicht könnten wir die Entschädigungen ein wenig in die Zukunft verschieben, um erst mal den Haushalt zu sanieren. Wäre das in Ordnung?

		Mod_REL_WendelS = 18;
	};

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen8);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Wendel_Unruhen8_A()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Unruhen8_A_15_00"); //Eine Entschädigung wäre jetzt doch zu viel des Guten.
	AI_Output(self, hero, "DEFAULT"); //

	Mod_REL_WendelS = 20;

	Mod_REL_WendelS_Choice += 1;

	Info_ClearChoices	(Info_Mod_Wendel_Unruhen8);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wendel_Unruhen9 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Unruhen9_Condition;
	information	= Info_Mod_Wendel_Unruhen9_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Wendel_Unruhen9_Condition()
{
	if (Mod_REL_WendelS == 19)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Unruhen9_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen9_01_00"); //Wir scheinen die gröbsten Probleme aus dem Weg geräumt zu haben. Ich hoffe, jetzt wird alles in geregelten Bahnen verlaufen.
	AI_Output(self, hero, "Info_Mod_Wendel_Unruhen9_01_01"); //Danke für deine Hilfe.

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Es gibt immerhin schon eine Grundlage für weitere Verhandlungen. Damit sollten die friedlichen Zeiten in Khorata eingeläutet worden sein.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_SUCCESS);

	B_GivePlayerXP	(800);

	Mod_REL_Stadthalter = 2;

	CurrentNQ += 1;

	B_StartOtherRoutine	(self, "STADTHALTER");
};

INSTANCE Info_Mod_Wendel_Plagenquest (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Plagenquest_Condition;
	information	= Info_Mod_Wendel_Plagenquest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mir scheint, ihr braucht einen Kammerjäger.";
};

FUNC INT Info_Mod_Wendel_Plagenquest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Plagenquest))
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Plagenquest_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST01");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_01"); //Ja, wir hatten schon einen ganzen Trupp Hammerjäger durch die Stadt geschickt.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_02"); //Aber auch mit ihren Hämmern konnten sie dem Ungeziefer keinen Einhalt gebieten.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_03"); //Egal wie oft man drauf schlägt, sie kommen wieder und in Gesellschaft vieler ihrer Artgenossen.
	B_Say	(hero, self, "$PLAGENQUEST02");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_05"); //In der Tat, ich forsche gerade in den Chroniken der Stadt nach und bin da tatsächlich auf etwas gestoßen ...
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_06"); //Es wird aber noch ein Weilchen dauern, bis ich mir den Text vollständig erschlossen habe.
	B_Say	(hero, self, "$PLAGENQUEST03");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_08"); //Ja, du kannst mal dein Glück als Hammerjäger im Gerichtsgebäude versuchen, wo sich im Moment besonders viele Drecksviecher tummeln.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_01_09"); //Vielleicht hast du ja mehr Erfolg.

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Wendel scheint in den Chroniken der Stadt auf Anhaltspunkte gestoßen zu sein. Bis er sie vollständig ergründet hat, soll ich mich im Gerichtsgebäude im Insektenjagen erproben.");

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

INSTANCE Info_Mod_Wendel_Plagenquest_02 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Plagenquest_02_Condition;
	information	= Info_Mod_Wendel_Plagenquest_02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wendel_Plagenquest_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Richter_Plagenquest))
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Plagenquest_02_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_00"); //Ahh, gut, dass du vorbeikommst, ich habe etwas wichtiges entdeckt.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_01"); //Die Plage, die zurzeit die Stadt heimsucht, hatte es bereits vor vielen Jahrhunderten gegeben – nicht lange, nach der Stadtgründung.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_02"); //Um der Stadt und ihrer Umgebung den Segen der Götter zu sichern, wurde damals den Göttern mit Tieropfern gehuldigt.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_03"); //Jeder hatte die Pflicht eine bestimmte Anzahl an Tieren zu opfern.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_04"); //Einer ihrer Gründerväter war jedoch so geizig, dass er nicht Schafe oder Molerat, sondern Insekten opferte.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_05"); //Die Götter waren darüber so erzürnt, dass sie den Wunsch der Menschen nach reicher Tierpopulation vor allem auf die Insekten der Umgebung übertrugen.

	B_Say	(hero, self, "$PLAGENQUEST04");

	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_07"); //Nun, mit der chemischen Keule.

	B_Say	(hero, self, "$PLAGENQUEST05");

	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_09"); //Ja, lange Zeit war man völlig ratlos und es schien so, als müsse man die Stadt aufgeben.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_10"); //Doch dann wurde einem rechtschaffenden und ehrbaren Bürger namens Chemos ein Traum gesandt.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_11"); //Er erhielt die Anleitung zum Bau einer Waffe, welche die Plagegeister bannen konnte.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_12"); //Daher muss auch unser Brauch mit den Stadthämmern zum Kampf gegen die Insekten kommen.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_13"); //Damals unterschieden sich Hämmer und Keulen nämlich noch nicht grundlegend.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_14"); //Unser Gesetz dazu stammt erst aus etwas späterer Zeit, als die Hämmer ihre charakteristische Form erhielten und die Keulen aus praktischen Gründen ablösten.

	B_Say	(hero, self, "$PLAGENQUEST06");

	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_16"); //Nein, leider nicht mehr. Und die Anfertigung einer solchen Waffe ist nicht ganz unkompliziert. Ich habe die Anleitung gefunden ...

	B_Say	(hero, self, "$PLAGENQUEST07");

	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_18"); //Hier hast du eine Abschrift davon.

	B_GiveInvItems	(self, hero, ItWr_Bauplan_ChemischeKeule, 1);

	B_Say	(hero, self, "$PLAGENQUEST08");

	B_HeroFakeScroll ();

	B_Say	(hero, self, "$PLAGENQUEST09");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_21"); //(erfreut) Wirklich? Du würdest uns allen einen großen Dienst damit erweisen.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_22"); //Sobald du alles zusammen hast, begib dich wieder hier her und händige die Materialien unserem Schmied aus.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_02_01_23"); //Und eine Keule werden wir schon irgendwo in der Stadt auftreiben. Ich danke dir.

	B_LogEntry_More	(TOPIC_MOD_ADANOS_PLAGE, TOPIC_MOD_ADANOS_DRECKSVIECHER, "Aha, die Insektenplage beruht also auf einer Strafe der Götter für einen Frevel, der begangen wurde.", "Ok, ich darf mich jetzt auf die Suche nach dem Material für die chemische Keule begeben, welche die Mistviecher bannen kann. Eine Keule müssten sie in Khorata schon selbst auftreiben können ...");

	B_GivePlayerXP	(200);

	Mod_WM_Plage_PartInsekt = 1;
};

INSTANCE Info_Mod_Wendel_Plagenquest_03 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Plagenquest_03_Condition;
	information	= Info_Mod_Wendel_Plagenquest_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wendel_Plagenquest_03_Condition()
{
	if (Npc_HasItems(hero, ItMw_Chemo) == 1)
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Plagenquest_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_03_01_00"); //Ich habe gehört, du hast die Keule. Jetzt ist es an der Zeit die Plagegeister aus der Stadt zu verjagen.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_03_01_01"); //Am Marktplatz haben sich besonders viele von den Viechern gesammelt. Nimm die chemische Keule und vernichte sie.

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

INSTANCE Info_Mod_Wendel_Plagenquest_04 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Plagenquest_04_Condition;
	information	= Info_Mod_Wendel_Plagenquest_04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Keule konnte den Insekten Einhalt gebieten. Ich habe sie alle bezwungen.";
};

FUNC INT Info_Mod_Wendel_Plagenquest_04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Plagenquest_03))
	&& (Npc_IsDead(Insekt_04))
	&& (Npc_IsDead(Insekt_05))
	&& (Npc_IsDead(Insekt_06))
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Plagenquest_04_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST10");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_01"); //Das ist großartig und der erste Schritt um das Übel endgültig zu bannen.
	B_Say	(hero, self, "$PLAGENQUEST11");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_03"); //Ja, leider mussten wir feststellen, dass weiterhin neue Parasiten aus den umliegenden Wäldern kommen.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_04"); //Irgendwo dort muss die Wurzel des Übels sein ... der ominöse Riesenbug, von dem die Quellen sprachen.
	B_Say	(hero, self, "$PLAGENQUEST12");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_06"); //Es gibt da aber etwas, besser gesagt jemanden, der dir dabei helfen könnte.
	B_Say	(hero, self, "$PLAGENQUEST13");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_08"); //Ein Bürger unserer Stadt. Sein Name ist Axon und er trägt das chemische Blut in sich, wie ich vor ein paar Stunden herausgefunden habe.
	B_Say	(hero, self, "$PLAGENQUEST14");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_10"); //Nun, zum einen geben die Stammbäume klare Hinweise darauf und dann ... nun ...
	B_Say	(hero, self, "$PLAGENQUEST15");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_12"); //... dann haben wir noch die chemische Keule bei ihm gefunden. Sie hing die ganze Zeit im Wohnzimmer seines Hauses.
	B_Say	(hero, self, "$PLAGENQUEST16");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_04_01_14"); //Jedenfalls sollte er dir dabei helfen können das Käfergetier zu erspüren, den Riesenbug zu entdecken und zu vernichten. Er wartet bereits vor der Stadt auf dich.

	B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Grmpf, das wird ja immer besser. Die ganze Zeit hing die chemische Keule bei Axon, einem Nachfahren des Chemos ... Nun denn, jetzt darf ich also mit ihm den Riesenbug im Wald erlegen. Axon erwartet mich vor der Stadt.");

	B_StartOtherRoutine	(Mod_7415_OUT_Axon_REL, "VORSTADT");
	AI_Teleport	(Mod_7415_OUT_Axon_REL, "REL_CITY_001");
};

INSTANCE Info_Mod_Wendel_Plagenquest_05 (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Plagenquest_05_Condition;
	information	= Info_Mod_Wendel_Plagenquest_05_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es ist vollbracht. Der Riesenbug ist bezwungen.";
};

FUNC INT Info_Mod_Wendel_Plagenquest_05_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest_02))
	&& (Npc_IsDead(Riesenbug))
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Plagenquest_05_Info()
{
	B_Say	(hero, self, "$PLAGENQUEST17");
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_05_01_01"); //Das ist großartig. Du hast unserer Stadt einen Dienst von unschätzbarem Wert erwiesen und das Übel gebannt.
	AI_Output(self, hero, "Info_Mod_Wendel_Plagenquest_05_01_02"); //Nimm, dieses Gold und den Stadthammer zum Dank. Der Segen der Götter möge dich begleiten.

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

INSTANCE Info_Mod_Wendel_Andre (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Andre_Condition;
	information	= Info_Mod_Wendel_Andre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wendel_Andre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Herold))
	&& (Mod_PAL_HeroBot == 17)
	&& (Mod_REL_Stadthalter == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wendel_Andre_Info()
{
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_00"); //Guten Morgen, Soldat. Oder sollte ich dich lieber Hauptmann nennen?
	B_Say	(hero, self, "$HEROBOTQUEST01");
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_02"); //Lord Andre's Plan hat funktioniert, allerdings gab es keine Möglichkeit einen Ausgang in den Hochofen zu implementieren, deshalb hat er dich überwältigt, selbst das Kostüm angezogen und den Roboter in den Hochofen gelockt.
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_03"); //Wir haben einen versiegelten Umschlag neben dir gefunden. Darin erklärte Andre die ganze Angelegenheit und hat dich zu seinem Nachfolger ernannt.
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_04"); //Aber hier ... die Details kannst du selbst nachlesen.

	B_GiveInvItems	(self, hero, ItWr_AndreAbschied, 1);

	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_05"); //Und diesen Schlüssel soll ich dir geben. Vermutlich zu seiner Kiste im Hauptmannzimmer.

	B_GiveInvItems	(self, hero, ItKe_Andre, 1);

	B_Say	(hero, self, "$HEROBOTQUEST02");
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_06"); //Genau. Die Trauerfeier hast du verpasst, du haben geschlagene 32 Stunden durchgeschlafen. Der alte Haudegen scheint in ganz guter Form gewesen zu sein.
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_07"); //Wenn du dich verabschieden willst, Andre liegt mittlerweile am Friedhof. Zumindest seine Asche. Aber ruh' dich zuerst aus, er läuft dir schon nicht weg.
	AI_Output(self, hero, "Info_Mod_Wendel_Andre_01_08"); //Ach ja, bevor ich's vergesse: Der Betreiber des Hochofens hat nach dir gefragt, schau mal bei ihm vorbei.

	B_Göttergefallen(1, 5);

	B_GivePlayerXP	(1000);

	Log_CreateTopic	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_PAL_BOT, TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, "Der Roboter ist besiegt, jedoch musste sich Lord Andre opfern, um dies zu erreichen. Nun hat er mich zu seinem Nachfolger ernannt.", "Andre hat sich tatsächlich geopfert um den Roboter zu vernichten. In einem Schreiben hat er mich zu seinem Nachfolger ernannt und mir einen Schlüssel hinterlegt, der wahrscheinlich zu seiner Truhe in der Kaserne führt.");
	B_SetTopicStatus	(TOPIC_MOD_PAL_BOT, LOG_SUCCESS);

	B_LogEntry_NS	(TOPIC_MOD_MILIZ_ANDRESVERMAECHTNIS, "Der Betreiber des Hochofens Robert will mich sprechen. Ich sollte dort mal vorbeischauen und fragen, worum es geht.");
};

INSTANCE Info_Mod_Wendel_Freudenspender (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Freudenspender_Condition;
	information	= Info_Mod_Wendel_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Willst du Freudenspender?";
};                       

FUNC INT Info_Mod_Wendel_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Wendel_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Wendel_Freudenspender_15_00"); //Willst du Freudenspender?
	AI_Output(self, hero, "Info_Mod_Wendel_Freudenspender_01_01"); //Was ist das?
	AI_Output(hero, self, "Info_Mod_Wendel_Freudenspender_15_02"); //Ein Weg zur Spiritualität.
	AI_Output(self, hero, "Info_Mod_Wendel_Freudenspender_01_03"); //(lacht) Versuch's besser bei den alten Frauen.
};

INSTANCE Info_Mod_Wendel_Pickpocket (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_Pickpocket_Condition;
	information	= Info_Mod_Wendel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Wendel_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Wendel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);

	Info_AddChoice	(Info_Mod_Wendel_Pickpocket, DIALOG_BACK, Info_Mod_Wendel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wendel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wendel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wendel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);
};

FUNC VOID Info_Mod_Wendel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);

		Info_AddChoice	(Info_Mod_Wendel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wendel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wendel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wendel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wendel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wendel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wendel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wendel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wendel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wendel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wendel_EXIT (C_INFO)
{
	npc		= Mod_7480_OUT_Wendel_REL;
	nr		= 1;
	condition	= Info_Mod_Wendel_EXIT_Condition;
	information	= Info_Mod_Wendel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wendel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wendel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};