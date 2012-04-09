INSTANCE Info_Mod_Argez_AW_Hi (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Hi_Condition;
	information	= Info_Mod_Argez_AW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_AW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_01_00"); //Schön, dich wieder zu sehen. Wir haben dich gesucht.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_01"); //Äh, ja, ich wollte nur mal kurz in den Tempel schauen, da fuhr auch schon die Wand runter.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_02"); //Hat 'ne ganze Weile gedauert, das Ding aufzukriegen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_01_03"); //Und dann bist du direkt in Ohnmacht gefallen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_04"); //Genau, war wohl die schlechte Luft da drin.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_01_05"); //Hauptsache, es ist alles gutgegangen.
};

INSTANCE Info_Mod_Argez_AW_Magiespur (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Magiespur_Condition;
	information	= Info_Mod_Argez_AW_Magiespur_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du etwas über magische Markierungen?";
};

FUNC INT Info_Mod_Argez_AW_Magiespur_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Magiespur_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_00"); //Weißt du etwas über magische Markierungen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_01"); //Du meinst ein Signum Magicum?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_02"); //Du überraschst mich immer wieder.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_03"); //Dabei handelt es sich um einen Zauber des Altes Volkes, der auf jedes beseelte Lebewesen angewendet werden kann.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_04"); //Der Zaubernde kann jederzeit spüren, wo sich sein Ziel befindet, dieses merkt ...
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_05"); //Genau. Aber bevor du jetzt eine Doktorarbeit improvisierst, könntest du mir helfen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_06"); //Es ist ungeheuer befriedigend, Wissen zu entdecken, wo man keines vermutet hat.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_07"); //Was genau willst du wissen?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_08"); //Es könnte sein, dass ich markiert bin. Dann würde ich diese Markierung gern loswerden.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_09"); //Hmm, lass mal sehen ...

	// ToDo: Toller Zaubereffekt auf den Helden

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_10"); //In der Tat.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_11"); //Kann man die Markierung entfernen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_12"); //Normalerweise entscheidet der Zaubernde darüber, wann er die Verbindung abbricht.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_13"); //Aber es gibt auch Möglichkeiten für das Opfer, die Wirkung zu durchbrechen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_14"); //Der Ere... Mir kam die Idee, die Markierung nicht zu lösen, sondern nur umzulenken.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_15"); //Damit der Zaubernde nicht merkt, dass er ausgetrickst worden ist.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_16"); //Eine kluge Überlegung. Auch das sollte machbar sein.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_17"); //Bring mir einfach ein Tier, das das neue Ziel sein soll.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_18"); //Irgendein Tier?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_01_19"); //Ja. Für den besseren Transport solltest du es vorher schrumpfen.

	B_GiveInvItems	(self, hero, ItSc_Shrink, 1);

	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_20"); //Gut, bis später.

	B_LogEntry	(TOPIC_MOD_MAGISCHEMARKIERUNG, "Argez hat tatsächlich eine Markierung bei mir festgestellt. Er will sie aber umleiten können, wenn ich ihm ein geschrumpftes Tier bringe.");

	Mod_Argez_Shrink = 1;
};

INSTANCE Info_Mod_Argez_AW_Magiespur2 (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Magiespur2_Condition;
	information	= Info_Mod_Argez_AW_Magiespur2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist das neue Ziel für die Markierung.";
};

FUNC INT Info_Mod_Argez_AW_Magiespur2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Magiespur))
	&& (Hlp_IsValidNpc(Mod_Argez_ShrinkMonster))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Magiespur2_Info()
{
	AI_Teleport	(Mod_Argez_ShrinkMonster, "PC_HERO");

	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur2_15_00"); //Hier ist das neue Ziel für die Markierung.

	if (Mod_Argez_ShrinkMonster.guild == GIL_TROLL)
	|| (Mod_Argez_ShrinkMonster.guild == GIL_STONEGOLEM)
	{
		AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_01"); //(lacht) Der ist ja putzig.
	}
	else if (Mod_Argez_ShrinkMonster.guild == GIL_MEATBUG)
	{
		AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_02"); //Wo denn? Ach, da unten!
	};

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_03"); //Perfekt, ich werde sofort beginnen.

	// ToDo: Effekt auf Held und Monster rennt weg

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_04"); //Das sollte es schon gewesen sein. Hoffentlich war das Tier noch nah genug, dass die Übertragung geklappt hat. Lass mal nachsehen.

	// ToDo: Toller Zaubereffekt auf den Helden

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_05"); //Du bist frei. Die Markierung ist verschwunden.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur2_15_06"); //Ich fühle mich auch schon viel besser.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_07"); //Das ist nur der Placebo-Effekt. Aber von nun an sollte dich dein Widersacher nicht mehr ohne Weiteres aufspüren können.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur2_15_08"); //Das wäre großartig. Vielen Dank.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_01_09"); //Keine Ursache.

	B_SetTopicStatus	(TOPIC_MOD_MAGISCHEMARKIERUNG, LOG_SUCCESS);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Argez_AW_Echsis (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Echsis_Condition;
	information	= Info_Mod_Argez_AW_Echsis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_Echsis_Condition()
{
	if (Mod_ArgezSpawn)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Echsis_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_00"); //Hast wohl deine Einladung verloren?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_01"); //Du schon wieder?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_02"); //Das gleiche könnte ich dich fragen. Würde ich auch, wenn es von Bedeutung wäre.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_03"); //Was willst du überhaupt hier?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_04"); //Ich will in den Sumpf, aber wie du eindrucksvoll bewiesen hast, ist das nicht so einfach.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_05"); //Es wäre jedenfalls nicht gerade klug, durch das Tor zu brechen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_06"); //Klüger wäre es einen Schwachpunkt an der Barriere zu nutzen, sagen wir mal ein Loch am Boden der Barriere, einige Meter rechts von den Wachen, das gerade groß genug ist, dass eine kleine Kreatur durchkriechen kann ... das wäre klug, ja.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_07"); //Vermutlich ...
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_08"); //Ja. Aber auch kluge Entscheidungen können mal schief gehen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_09"); //Dann gibt’s immer zwei Wege. Den des Kampfes und den der Diplomatie.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_10"); //Zum Ziel führen meist beide, der eine schneller, der andere dafür vielleicht effektiver ... aber ein kluger Mann wird wissen, was zu tun ist.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_11"); //Vermutlich.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_01_12"); //Ach ja, hier. Deine Einladung.

	B_GiveInvItems	(self, hero, ItSc_TrfMeatbug, 1);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	AI_Teleport	(self, "START");

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Vor dem Sumpf habe ich Argez wieder getroffen. Er hat mir eine 'Verwandlung Fleischwanze' Spruchrolle gegeben und gab mir den Tip, rechts von den Wachen durch ein Loch in der Barrikade zu kriechen. Auch hat er komische Andeutungen gemacht: 'Aber auch kluge Entscheidungen können mal schief gehen. Dann gibt’s immer zwei Wege. Den des Kampfes und den der Diplomatie. Zum Ziel führen meist beide, der eine schneller, der andere dafür vielleicht effektiver ...");
};

INSTANCE Info_Mod_Argez_AW_Rettung (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Rettung_Condition;
	information	= Info_Mod_Argez_AW_Rettung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_Rettung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_XW_Gefangen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Rettung_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_01_00"); //Danke. Ich komme jetzt allein zurecht.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Rettung_15_01"); //Du willst deine Ruhe?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_01_02"); //Ja, bitte. Es gibt da etwas, über das ich nachdenken muss.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_01_03"); //Nimm es mir nicht übel, es liegt nicht an dir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_ARGEZ, "Unsere Flucht aus der Unterwelt ist geglückt! Ich sollte schauen, ob Xardas etwas herausgefunden hat.");

	B_GivePlayerXP	(1000);
};

INSTANCE Info_Mod_Argez_AW_AtTempel (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_AtTempel_Condition;
	information	= Info_Mod_Argez_AW_AtTempel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_AtTempel_Condition()
{
	if (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_AtTempel_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_01_00"); //Ah, da kommst du endlich. Ich hab gehört, dass du hier bist und bin so schnell ich konnte auch hierher gekommen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_01"); //Und wieso wolltest du mir folgen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_01_02"); //Ich hab gedacht du würdest Hilfe brauchen, aber scheinbar hast du deinen Weg durch den Tempel alleine gefunden. Ich bin also umsonst gekommen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_03"); //Wie bist du vor mir hier angekommen? Der ganze Tempel ist doch voller Fallen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_01_04"); //Ich weiß nicht, aber es kommt mir vor als wäre ich schon einmal hier gewesen. Aber ich kann mich nicht daran erinnern.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_01_05"); //Als ich hier jedoch ankam wusste ich genau wo ich hin musste. Aber du scheinst ja wie gesagt keine Hilfe zu brauchen.
};

INSTANCE Info_Mod_Argez_AW_Stab (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Stab_Condition;
	information	= Info_Mod_Argez_AW_Stab_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du diesen Stab reparieren?";
};

FUNC INT Info_Mod_Argez_AW_Stab_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_AtTempel))
	&& (Npc_HasItems(hero, ItMw_Adanos_Stab_Teil1) == 1)
	&& (Npc_HasItems(hero, ItMw_Adanos_Stab_Teil2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Stab_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_15_00"); //Kannst du diesen Stab reparieren?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_01_01"); //Hmm ... Gib mir mal die Teile, ich schaue, was ich machen kann.

	Npc_RemoveInvItems (hero, ItMw_Adanos_Stab_Teil1, 1);
	Npc_RemoveInvItems (hero, ItMw_Adanos_Stab_Teil2, 1);

	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_01_02"); //Ja, ich denke da lässt sich was machen ... Eine Sekunde ... Ja, so geht es.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_01_03"); //Sieht mächtig aus, du solltest gut darauf aufpassen. Willst du ihn lieber als Waffe mit normalem Schaden oder mit magischem Schaden, dann ist er allerdings schwächer?

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Argez hat mir den Stab Adanos' repariert. Wie er das nur immer anstellt.");

	Info_ClearChoices	(Info_Mod_Argez_AW_Stab);

	Info_AddChoice	(Info_Mod_Argez_AW_Stab, "Magischer Stab", Info_Mod_Argez_AW_Stab_Magie);
	Info_AddChoice	(Info_Mod_Argez_AW_Stab, "Normaler Kampfstab", Info_Mod_Argez_AW_Stab_Kampf);
};

FUNC VOID Info_Mod_Argez_AW_Stab_Kampf()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_Kampf_15_00"); //Ich nehme den normalen Kampfstab.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_Kampf_01_01"); //Gut, hier ist er.

	CreateInvItems	(self, ItMw_Adanos_Stab_Kampfteil, 1);
	B_GiveInvItems	(self, hero, ItMw_Adanos_Stab_Kampfteil, 1);

	Info_ClearChoices	(Info_Mod_Argez_AW_Stab);
};

FUNC VOID Info_Mod_Argez_AW_Stab_Magie()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_Magie_15_00"); //Ich nehme den magischen Stab.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_Magie_01_01"); //Gut, hier ist er.

	CreateInvItems	(self, ItMw_Adanos_Stab_Magieteil, 1);
	B_GiveInvItems	(self, hero, ItMw_Adanos_Stab_Magieteil, 1);

	Info_ClearChoices	(Info_Mod_Argez_AW_Stab);
};

INSTANCE Info_Mod_Argez_AW_Gast (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Gast_Condition;
	information	= Info_Mod_Argez_AW_Gast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du überhaupt mitgekommen?";
};

FUNC INT Info_Mod_Argez_AW_Gast_Condition()
{
	if (Mod_Saturas_Gast == 1)
	{
		Info_Mod_Argez_AW_Gast.description = "Hast du Anhaltspunkte dafür, wer den Magiern die Ausrüstung gestohlen hat?";
	}
	else
	{
		Info_Mod_Argez_AW_Gast.description = "Hast du etwas vom Diebstahl der Ausrüstung mitbekommen?";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_UngebeterBesucher))
	&& (Mod_Saturas_Gast_Fortschritt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Gast_Info()
{
	if (Mod_Saturas_Gast == 1)
	{
		AI_Output(hero, self, "Info_Mod_Argez_AW_Gast_15_00"); //Hast du Anhaltspunkte dafür, wer den Magiern die Ausrüstung gestohlen hat?
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_01_01"); //Nein, mir ist nichts aufgefallen.
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_01_02"); //Ich bin nur verwundert und erleichtert, dass noch niemand mich verdächtigt hat.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Argez_AW_Gast_15_03"); //Hast du etwas vom Diebstahl der Ausrüstung mitbekommen?
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_01_04"); //Welcher Diebstahl? Ich habe die ganze Nacht geschlafen.
	};
};

INSTANCE Info_Mod_Argez_AW_WarumHier (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_WarumHier_Condition;
	information	= Info_Mod_Argez_AW_WarumHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du überhaupt mitgekommen?";
};

FUNC INT Info_Mod_Argez_AW_WarumHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_WarumHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_00"); //Warum bist du überhaupt mitgekommen? Wolltest du nicht in den Sumpf?
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_01"); //Das Gefühl, das mich beim Anblick des Tempelinneren in Khorinis erfasst hat, ist hier noch stärker.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_02"); //Ich bin mir sicher, dass ich diese Gegend kenne.
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_03"); //Sieht aber nicht so aus, als könnten das viele andere von sich behaupten.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_04"); //Richtig. Aber vielleicht gibt es hier irgendwo Menschen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_05"); //Ich fühle mich einfach zu Hause.
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_06"); //Viel Glück bei der Suche.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_07"); //Danke. Was hast du jetzt vor?
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_08"); //Mal schauen. Zur Ruhe setzen kann ich mich noch nicht.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_01_09"); //Ich verstehe. Wir sehen uns.
};

INSTANCE Info_Mod_Argez_AW_EXIT (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_EXIT_Condition;
	information	= Info_Mod_Argez_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Argez_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Argez_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};