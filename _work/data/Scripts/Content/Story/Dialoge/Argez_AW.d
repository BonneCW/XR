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
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_37_00"); //Schön, dich wieder zu sehen. Wir haben dich gesucht.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_01"); //Äh, ja, ich wollte nur mal kurz in den Tempel schauen, da fuhr auch schon die Wand runter.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_02"); //Hat 'ne ganze Weile gedauert, das Ding aufzukriegen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_37_03"); //Und dann bist du direkt in Ohnmacht gefallen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Hi_15_04"); //Genau, war wohl die schlechte Luft da drin.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Hi_37_05"); //Hauptsache, es ist alles gutgegangen.
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
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_01"); //Du meinst ein Signum Magicum?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_02"); //Du überraschst mich immer wieder.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_03"); //Dabei handelt es sich um einen Zauber des Altes Volkes, der auf jedes beseelte Lebewesen angewendet werden kann.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_04"); //Der Zaubernde kann jederzeit spüren, wo sich sein Ziel befindet, dieses merkt ...
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_05"); //Genau. Aber bevor du jetzt eine Doktorarbeit improvisierst, könntest du mir helfen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_06"); //Es ist ungeheuer befriedigend, Wissen zu entdecken, wo man keines vermutet hat.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_07"); //Was genau willst du wissen?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_08"); //Es könnte sein, dass ich markiert bin. Dann würde ich diese Markierung gern loswerden.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_09"); //Hmm, lass mal sehen ...

	// ToDo: Toller Zaubereffekt auf den Helden

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_10"); //In der Tat.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_11"); //Kann man die Markierung entfernen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_12"); //Normalerweise entscheidet der Zaubernde darüber, wann er die Verbindung abbricht.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_13"); //Aber es gibt auch Möglichkeiten für das Opfer, die Wirkung zu durchbrechen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_14"); //Der Ere... Mir kam die Idee, die Markierung nicht zu lösen, sondern nur umzulenken.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_15"); //Damit der Zaubernde nicht merkt, dass er ausgetrickst worden ist.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_16"); //Eine kluge Überlegung. Auch das sollte machbar sein.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_17"); //Bring mir einfach ein Tier, das das neue Ziel sein soll.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur_15_18"); //Irgendein Tier?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur_37_19"); //Ja. Für den besseren Transport solltest du es vorher schrumpfen.

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
		AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_01"); //(lacht) Der ist ja putzig.
	}
	else if (Mod_Argez_ShrinkMonster.guild == GIL_MEATBUG)
	{
		AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_02"); //Wo denn? Ach, da unten!
	};

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_03"); //Perfekt, ich werde sofort beginnen.

	// ToDo: Effekt auf Held und Monster rennt weg

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_04"); //Das sollte es schon gewesen sein. Hoffentlich war das Tier noch nah genug, dass die Übertragung geklappt hat. Lass mal nachsehen.

	// ToDo: Toller Zaubereffekt auf den Helden

	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_05"); //Du bist frei. Die Markierung ist verschwunden.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur2_15_06"); //Ich fühle mich auch schon viel besser.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_07"); //Das ist nur der Placebo-Effekt. Aber von nun an sollte dich dein Widersacher nicht mehr ohne Weiteres aufspüren können.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Magiespur2_15_08"); //Das wäre großartig. Vielen Dank.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Magiespur2_37_09"); //Keine Ursache.

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
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_00"); //Hast wohl deine Einladung verloren?
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_01"); //Du schon wieder?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_02"); //Das Gleiche könnte ich dich fragen. Würde ich auch, wenn es von Bedeutung wäre.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_03"); //Was willst du überhaupt hier?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_04"); //Ich will in den Sumpf, aber wie du eindrucksvoll bewiesen hast, ist das nicht so einfach.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_05"); //Es wäre jedenfalls nicht gerade klug, durch das Tor zu brechen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_06"); //Klüger wäre es, einen Schwachpunkt an der Barriere zu nutzen, sagen wir mal ein Loch am Boden der Barriere, einige Meter rechts von den Wachen, das gerade groß genug ist, dass eine kleine Kreatur durchkriechen kann ... das wäre klug, ja.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_07"); //Vermutlich ...
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_08"); //Ja. Aber auch kluge Entscheidungen können mal schief gehen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_09"); //Dann gibt’s immer zwei Wege. Den des Kampfes und den der Diplomatie.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_10"); //Zum Ziel führen meist beide, der eine schneller, der andere dafür vielleicht effektiver ... aber ein kluger Mann wird wissen, was zu tun ist.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Echsis_15_11"); //Vermutlich.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Echsis_37_12"); //Ach ja, hier. Deine Einladung.

	B_GiveInvItems	(self, hero, ItSc_TrfMeatbug, 1);

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "STRAND");
	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Vor dem Sumpf habe ich Argez wieder getroffen. Er hat mir eine 'Verwandlung-Fleischwanze'-Spruchrolle gegeben und gab mir den Tipp, rechts von den Wachen durch ein Loch in der Barrikade zu kriechen. Auch hat er komische Andeutungen gemacht: 'Aber auch kluge Entscheidungen können mal schief gehen. Dann gibt’s immer zwei Wege. Den des Kampfes und den der Diplomatie. Zum Ziel führen meist beide, der eine schneller, der andere dafür vielleicht effektiver ...'");
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
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_37_00"); //Danke. Ich komme jetzt allein zurecht.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Rettung_15_01"); //Du willst deine Ruhe?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_37_02"); //Ja, bitte. Es gibt da etwas, über das ich nachdenken muss.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Rettung_37_03"); //Nimm es mir nicht übel, es liegt nicht an dir.

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
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_00"); //(schwärmerisch) Wunderschön, nicht? So alt und doch so ... vertraut.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_01"); //(vorsichtig) Argez?
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_02"); //Überrascht?
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_03"); //Gelinde gesagt, ja. Wie kommst du hierher?
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_04"); //Und wieso bist du vor mir angekommen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_05"); //Ich hatte dich beinahe eingeholt, als du den Tempel betratst.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_06"); //Als ich hörte, wohin du unterwegs warst, schoss mir das Bild dieses Tempels in den Kopf, und ich eilte dir sofort hinterher.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_07"); //Wir können uns nicht um viele Minuten verfehlt haben. Vor dem Eingang fiel mir dann vieles wieder ein: die Sicherungen vor Räubern, die düsteren Fresken.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_08"); //Und die verborgene Seitentür, mit der man die Fallen umgehen kann.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_09"); //(brummt) Na klasse ...
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_10"); //Sie wird jetzt auch nicht mehr funktionieren, da ich ihren Mechanismus versehentlich beschädigt habe. Sie klemmte, und ich griff zu roher Gewalt.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_11"); //Aber immerhin habe ich dich gefunden. Ich hoffe, dass ich dir irgendwie mit meinem Wissen dienlich sein kann.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_12"); //Klar, wenn du mir sagst, wo ich hier eine Götterwaffe finde.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_13"); //Das weiß ich nicht. Ich weiß nur, dass sie nicht weit sein kann.
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_14"); //Wenn du sie hast, würde ich sie mir gern näher anschauen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_AtTempel_15_15"); //Ganz ohne Hintergedanken?
	AI_Output(self, hero, "Info_Mod_Argez_AW_AtTempel_37_16"); //Zumindest keine, vor denen du dich fürchten musst. Ich bin vor allem neugierig.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Sobald ich die Götterwaffe aus dem Adanostempel gefunden habe, will Argez sie in Augenschein nehmen.");
};

INSTANCE Info_Mod_Argez_AW_Stab (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Stab_Condition;
	information	= Info_Mod_Argez_AW_Stab_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin fündig geworden. Allerdings hat anscheinend die Zeit ihre Wirkung getan.";
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
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_15_00"); //Ich bin fündig geworden. Allerdings hat anscheinend die Zeit ihre Wirkung getan.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_01"); //Hmm ... gib mal her, das muss ich mir näher anschauen.

	Npc_RemoveInvItems (hero, ItMw_Adanos_Stab_Teil1, 1);
	Npc_RemoveInvItems (hero, ItMw_Adanos_Stab_Teil2, 1);

	B_ShowGivenThings	("Zwei Bruchstücke gegeben");

	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_02"); //Das sieht nicht gut aus, und damit meine ich noch nicht mal das morsche Holz und den offensichtlichen Bruch.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_03"); //Der Ort der Waffe, also ihre Spitze, war brüchig und ist zerbröckelt, als ich ihn betastet habe, und auch die restliche Klinge zeigt Risse.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_04"); //Damit hat sie einen Großteil ihrer alten Stärke eingebüßt.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_15_05"); //Kann man da nichts mit Magie machen?
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_06"); //(überlegt) Ich kenne einen Heilzauber, der auch bei unbelebter Materie helfen könnte. Er ist kein Ersatz für eine heiße Esse, aber das Beste, was ich anbieten kann.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_07"); //Ich will nicht versprechen, dass die Waffe dadurch ihre ursprüngliche Effektivität wiedergewinnt, aber zumindest wäre sie wieder einsatzbereit.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_08"); //Dafür müssten aber die einzelnen Bruchstücke der Spitze an ihrem richtigen Platz liegen, was zu bewerkstelligen schwierig genug sein dürfte.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab_15_09"); //Bleibt mir wohl nichts anderes, als mich daran zu versuchen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_10"); //Hier hast du die Fragmente. Ich glaube, ich habe sie alle gefunden.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_11"); //Du solltest sie also so zusammenlegen können, dass sie wieder ihre ursprüngliche Form erhalten.

	B_GiveInvItems	(self, hero, ItMi_ArgezBruchstuecke, 1);

	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab_37_12"); //Sag Bescheid, wenn du Fortschritte gemacht hast.

	Log_CreateTopic	(TOPIC_MOD_ARGEZ_ORT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ARGEZ_ORT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ARGEZ_ORT, "Die Spitze der Klinge im Stab ist zerbrochen. Ich muss sie in die richtige Form bringen. Dazu sollte ich mir die Bruchstücke genauer ansehen, die Argez mit gegeben hat.");
};

INSTANCE Info_Mod_Argez_AW_Stab2 (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Stab2_Condition;
	information	= Info_Mod_Argez_AW_Stab2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich scheine die richtige Anordnung gefunden zu haben...";
};

FUNC INT Info_Mod_Argez_AW_Stab2_Condition()
{
	// TODO: Richtige Bedingung ergänzen, sobald Minispiel fertig ist
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Stab))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Stab2_Info()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab2_15_00"); //Ich scheine die richtige Anordnung gefunden zu haben.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_37_01"); //Das hilft mir weiter.

	B_GiveInvItems	(hero, self, ItMi_ArgezBruchstuecke, 1);

	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_37_02"); //Bevor ich nun die Fragmente zusammenfüge, will ich dir noch anbieten, den Stab umzufunktionieren.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_37_03"); //Ich könnte das stumpfe Ende mit einem Zauber belegen, sodass du deinem Gegner eine Mischung aus den zwei Schadensarten Holz und Magie verpassen würdest.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_37_04"); //Von der Klinge am anderen Ende würde ein solcher Zauber abprallen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_37_05"); //Welche der zwei Möglichkeiten spricht dich mehr an?

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Argez hat mir den Stab Adanos' repariert. Wie er das nur immer anstellt.");

	B_GivePlayerXP	(400);

	B_SetTopicStatus	(TOPIC_MOD_ARGEZ_ORT, LOG_SUCCESS);

	Info_ClearChoices	(Info_Mod_Argez_AW_Stab2);

	Info_AddChoice	(Info_Mod_Argez_AW_Stab2, "Ich wähle den magisch verstärkten Stab.", Info_Mod_Argez_AW_Stab2_Magie);
	Info_AddChoice	(Info_Mod_Argez_AW_Stab2, "Ich nehme den Stab so, wie er ist.", Info_Mod_Argez_AW_Stab2_Kampf);
};

FUNC VOID Info_Mod_Argez_AW_Stab2_Weiter()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab2_Kampf_37_00"); //So sei es. Nun tritt zurück.

	Info_ClearChoices	(Info_Mod_Argez_AW_Stab2);

	AI_StopProcessInfos	(self);

};

FUNC VOID Info_Mod_Argez_AW_Stab2_Kampf()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab2_Kampf_15_00"); //Ich nehme den Stab so, wie er ist.

	Mod_Argez_Stab = 0;

	Info_Mod_Argez_AW_Stab2_Weiter();
};

FUNC VOID Info_Mod_Argez_AW_Stab2_Magie()
{
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab2_Magie_15_00"); //Ich wähle den magisch verstärkten Stab.

	Mod_Argez_Stab = 1;

	Info_Mod_Argez_AW_Stab2_Weiter();
};

INSTANCE Info_Mod_Argez_AW_Stab3 (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Stab3_Condition;
	information	= Info_Mod_Argez_AW_Stab3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_Stab3_Condition()
{
	// TODO: Richtige Bedingung ergänzen, sobald Minispiel fertig ist
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Stab2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Stab3_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab3_37_00"); //Fast so gut wie erhofft. Aber immer noch besser als alles, was heutzutage geschmiedet wird.

	if (Mod_Argez_Stab == 1) {
		B_GiveInvItems	(self, hero, ItMw_Adanos_Stab_Magieteil, 1);
	} else {
		B_GiveInvItems	(self, hero, ItMw_Adanos_Stab_Kampfteil, 1);
	};

	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab3_15_01"); //Danke. Damit bin ich hier im Tempel fertig.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab3_37_02"); //Ich ebenfalls. Lass uns diese Teleportplattform benutzen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab3_37_03"); //Man kann vom Alten Volk sagen, was man will, aber Bequemlichkeit wurde geschätzt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTELEPORT");
};

INSTANCE Info_Mod_Argez_AW_Stab4 (C_INFO)
{
	npc		= PC_Friend_AW;
	nr		= 1;
	condition	= Info_Mod_Argez_AW_Stab4_Condition;
	information	= Info_Mod_Argez_AW_Stab4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Argez_AW_Stab4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Stab3))
	&& (Npc_GetDistToWP(hero, "ADW_ADANOSTEMPEL_TELEPORTSTATION") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Argez_AW_Stab4_Info()
{
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_00"); //Ich spüre, dass du bald aufbrechen wirst zur letzten Schlacht.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab4_15_01"); //Na ja...
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_02"); //Ich respektiere deine Gründe dafür, dass du mich nicht fragst, ob ich mitkommen will.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab4_15_03"); //Argez...
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_04"); //Du brauchst dich wirklich nicht zu entschuldigen.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab4_15_05"); //Danke. Aber warum bist du heute so gut gelaunt? Das war vor einiger Zeit noch anders.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_06"); //Ich habe etwas Altes gefunden. Von mir.
	AI_Output(hero, self, "Info_Mod_Argez_AW_Stab4_15_07"); //Das ist ja ... fantastisch!
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_08"); //In Xeres' Kerker, du erinnerst dich? Als dieser schreckliche Kobold, der uns eingeschlossen hatte, endlich verschwunden war, fand ich nahe den Gitterstäben einen stinkenden, zerfledderten Kodex, in dem etliche Seiten fehlten.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_09"); //Ich schlug ihn auf ... und erkannte meine eigene Handschrift! Ich hielt mein eigenes Tagebuch in der Hand, geschrieben vor unendlich langer Zeit!
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_10"); //Natürlich begann ich sofort zu lesen, aber was ich erfuhr, legte sich wie ein Grabstein auf mein Gemüt. Nachdem wir entkommen waren, konnte ich es kaum über mich bringen, weiterzulesen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_11"); //Ein Glück, dass ich es doch getan habe. Denn es erfüllt mich nun mit Stolz.
	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_12"); //Ich will dir eine Seite davon schenken, eine der letzten, eine Seite, die einiges, aber nicht alles erklären wird. Ich habe sie für dich übersetzt.

	B_GiveInvItems	(self, hero, ItWr_ArgezTagebuch1, 1);

	AI_Output(self, hero, "Info_Mod_Argez_AW_Stab4_37_13"); //Und damit lasse ich dich allein, damit du deinen Weg ohne mich gehen kannst. Aber sei unbesorgt: Ich werde dich nicht aus dem Blick verlieren.

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");
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
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_37_01"); //Nein, mir ist nichts aufgefallen.
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_37_02"); //Ich bin nur verwundert und erleichtert, dass noch niemand mich verdächtigt hat.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Argez_AW_Gast_15_03"); //Hast du etwas vom Diebstahl der Ausrüstung mitbekommen?
		AI_Output(self, hero, "Info_Mod_Argez_AW_Gast_37_04"); //Welcher Diebstahl? Ich habe die ganze Nacht geschlafen.
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
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_01"); //Das Gefühl, das mich beim Anblick des Tempelinneren in Khorinis erfasst hat, ist hier noch stärker.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_02"); //Ich bin mir sicher, dass ich diese Gegend kenne.
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_03"); //Sieht aber nicht so aus, als könnten das viele andere von sich behaupten.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_04"); //Richtig. Aber vielleicht gibt es hier irgendwo Menschen.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_05"); //Ich fühle mich einfach zu Hause.
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_06"); //Viel Glück bei der Suche.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_07"); //Danke. Was hast du jetzt vor?
	AI_Output(hero, self, "Info_Mod_Argez_AW_WarumHier_15_08"); //Mal schauen. Zur Ruhe setzen kann ich mich noch nicht.
	AI_Output(self, hero, "Info_Mod_Argez_AW_WarumHier_37_09"); //Ich verstehe. Wir sehen uns.
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