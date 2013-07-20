INSTANCE Info_Mod_Eremit_Hi (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Hi_Condition;
	information	= Info_Mod_Eremit_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Aha, da hätten wir also unseren Dieb.";
};

FUNC INT Info_Mod_Eremit_Hi_Condition()
{
	if (Mod_Saturas_Gast_Fortschritt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Hi_15_00"); //Aha, da hätten wir also unseren Dieb.
	AI_Output(self, hero, "Info_Mod_Eremit_Hi_04_01"); //(kindlich) Kein Dieb, nein! Nur spielen!
	AI_Output(self, hero, "Info_Mod_Eremit_Hi_04_02"); //(ernst) Ich hab dir doch gesagt, du sollst abhauen. War doch klar, dass einer dich findet.
	AI_Output(self, hero, "Info_Mod_Eremit_Hi_04_03"); //(kindlich, trotzig) Will aber spielen!
};

INSTANCE Info_Mod_Eremit_WerBistDu (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_WerBistDu_Condition;
	information	= Info_Mod_Eremit_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du eigentlich?";
};

FUNC INT Info_Mod_Eremit_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_WerBistDu_15_00"); //Wer bist du eigentlich?
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_01"); //(kindlich) Wen von uns meinst du?
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_02"); //(ernst) Selbstverständlich mich. Warum sollte er mit dir Kindskopf sprechen wollen?
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_03"); //(kindlich) Das nimmst du sofort zurück!
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_04"); //(ernst) Vergiss es.
	AI_Output(hero, self, "Info_Mod_Eremit_WerBistDu_15_05"); //He, seid mal ruhig. Könnt ihr, äh, euch nicht einigen, bevor ihr was sagt?
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_06"); //(kindlich) Im Geheimen?
	AI_Output(hero, self, "Info_Mod_Eremit_WerBistDu_15_07"); //Ja, genau.
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_08"); //(kindlich, begeistert) Ohhh ...
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_09"); //(ernst) An mir soll's nicht scheitern.
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_10"); //(ernst) Ist mir eh peinlich, wenn jemand die Kommentare dieses Zurückgebliebenen mithören muss.
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_11"); //(kindlich) Das nimmst du zurück!
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_12"); //(ernst) Nein!
	AI_Output(hero, self, "Info_Mod_Eremit_WerBistDu_15_13"); //Psst.
	AI_Output(self, hero, "Info_Mod_Eremit_WerBistDu_04_14"); //(räuspert sich, mit normaler Stimme) Hallo. Erinnert uns dunkel an alte Zeiten, so zu sprechen.
	AI_Output(hero, self, "Info_Mod_Eremit_WerBistDu_15_15"); //Schon viel besser.
};

INSTANCE Info_Mod_Eremit_Woher (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Woher_Condition;
	information	= Info_Mod_Eremit_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher kommst du?";
};

FUNC INT Info_Mod_Eremit_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Woher_15_00"); //Woher kommst du?
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_01"); //Ursprünglich kommen wir vom Festland und haben gemeinsam Karten hergestellt.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_02"); //Bis wir auf diesem Schiff anheuerten, um eine Karte von der Küste Khorinis' anzulegen.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_03"); //Wir waren noch nicht mal in seichten Gewässern, da wurden wir von einer Orkgaleere angegriffen und versenkt.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_04"); //Auf einem Fass voll Portwein haben wir es bis zu dem Strand geschafft - als Einzige.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_05"); //Bis dahin hatten die Piranhas uns schon vier Zehen abgeknabbert.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_06"); //(kindlich) Mir nur drei.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_07"); //(ernst) Du kannst einfach nicht weiter zählen als bis drei.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_08"); //Danach haben wir es uns gemütlich eingerichtet.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_09"); //Nicht am Strand, da hausen die Freibeuter. Mit denen wollten wir nichts zu tun haben.
	AI_Output(hero, self, "Info_Mod_Eremit_Woher_15_10"); //Hast du nie versucht, zurück zum Festland zu kommen?
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_11"); //Nö, Mann. Dort wartet nur ein nervige Frau auf uns, die keine Kinder haben will.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_12"); //Karten können wir hier auch zeichnen.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_13"); //Durch den Handel mit den Piraten werden wir mit dem Nötigsten versorgt, und mehr brauchen wir auch nicht.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_14"); //Wobei die Einsamkeit manchmal langweilig wird und wir uns gegenseitig auf die Nerven gehen.
	AI_Output(self, hero, "Info_Mod_Eremit_Woher_04_15"); //Manchmal wünschen wir uns einen Dritten im Bunde.
	AI_Output(hero, self, "Info_Mod_Eremit_Woher_15_16"); //Adanos bewahre!
};

INSTANCE Info_Mod_Eremit_WiesoDieb (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_WiesoDieb_Condition;
	information	= Info_Mod_Eremit_WiesoDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso hast du den Wassermagiern die Ausrüstung gestohlen?";
};

FUNC INT Info_Mod_Eremit_WiesoDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_WerBistDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_WiesoDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_WiesoDieb_15_00"); //Wieso hast du den Wassermagiern die Ausrüstung gestohlen?
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_01"); //Wassermagier sind die Typen in den Schlafröcken?
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_02"); //Einerseits ... (muss sich überwinden) wollten wir mit ihnen spielen.
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_03"); //Andererseits brauchen wir die Ingredenzien für ein paar Rezepte, die das alte Volk hinterlassen hat.
	AI_Output(hero, self, "Info_Mod_Eremit_WiesoDieb_15_04"); //Du kannst also ihre Sprache lesen?
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_05"); //Lesen, sprechen, was du willst.
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_06"); //Ich habe alle Texte gelesen, die ich gefunden habe.
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_07"); //Am Anfang habe ich natürlich kein Wort verstanden, aber ich hatte ja Zeit.
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_08"); //Wenn es ein Wort gibt, dass das alte Volk beschreibt, dann ist es "magisch".
	AI_Output(self, hero, "Info_Mod_Eremit_WiesoDieb_04_09"); //In der Hinsicht waren sie euch voraus.
};

INSTANCE Info_Mod_Eremit_AlteSprache (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_AlteSprache_Condition;
	information	= Info_Mod_Eremit_AlteSprache_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich die Sprache des alten Volkes lehren?";
};

FUNC INT Info_Mod_Eremit_AlteSprache_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_WiesoDieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_AlteSprache_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_AlteSprache_15_00"); //Kannst du mich die Sprache des alten Volkes lehren?
	AI_Output(self, hero, "Info_Mod_Eremit_AlteSprache_04_01"); //Zu gegebener Zeit könnte man darüber verhandeln.
	AI_Output(self, hero, "Info_Mod_Eremit_AlteSprache_04_02"); //(kindlich) Fnidhdr gröggel snüt!
	AI_Output(self, hero, "Info_Mod_Eremit_AlteSprache_04_03"); //(ernst) Pass bloß auf, was du sagst!
};

INSTANCE Info_Mod_Eremit_Prisma (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma_Condition;
	information	= Info_Mod_Eremit_Prisma_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bräuchte da Hilfe bei der Herstellung eines magischen Prismas.";
};

FUNC INT Info_Mod_Eremit_Prisma_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_WiesoDieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma_15_00"); //Ich bräuchte da Hilfe bei der Herstellung eines magischen Prismas.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_01"); //Ein magisches Prisma? Davon haben wir auch schon gehört.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_02"); //Eine Zeitlang war das mal in Mode beim alten Volk.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_03"); //Allerdings sind die Teile so schnell wieder verschwunden, wie sie aufgekommen sind. Frag nicht, warum.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma_15_04"); //Du weißt aber nicht zufällig, wie man so ein Prisma herstellen könnte?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_05"); //Doch, das würden wir wohl hinbekommen.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_06"); //(ernst) Also ich jedenfalls.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_07"); //Dazu bräuchten wir nur eine schwarze Perle.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma_15_08"); //Wenn ich dir eine bringe, schleifst du mir dann das Prisma?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_09"); //Ja. Unter einer Bedingung.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma_15_10"); //Die wäre?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_11"); //Wir dürfen die Sachen von den Wassermagiern behalten.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma_15_12"); //Saturas wird mir den Kopf abreißen, aber na schön.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_13"); //Wir machen uns auf den Rückweg, komm vorbei, soweit du bereit bist.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma_04_14"); //Auf dieser Karte haben wir markiert, wo du uns finden kannst.

	B_GiveInvItems	(self, hero, ItWr_Map_Eremit, 1);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItMi_DarkPearl, 1);

	if (Mod_Saturas_Gast == 1)
	{
		B_LogEntry_More (TOPIC_MOD_MAGIEPRISMA, TOPIC_MOD_SATURAS_TAGGAST, "Der Eremit, der die Wassermagier bestohlen hat, will mit bei dem Prisma helfen können. Ich muss nur mit einer schwarzen Perle zu ihm kommen. Den Weg zu seiner Behausung hat er mir aufgezeichnet.", "Bei dem Dieb handelt es sich um einen Eremiten. Im Austausch mit seinem Wissen habe ich versprochen, Saturas gegenüber die Schuld auf mich zu nehmen.");
	}
	else
	{
		B_LogEntry_More (TOPIC_MOD_MAGIEPRISMA, TOPIC_MOD_SATURAS_NACHTGAST, "Der Eremit, der die Wassermagier bestohlen hat, will mit bei dem Prisma helfen können. Ich muss nur mit einer schwarzen Perle zu ihm kommen. Den Weg zu seiner Behausung hat er mir aufgezeichnet.", "Bei dem Dieb handelt es sich um einen Eremiten. Im Austausch mit seinem Wissen habe ich versprochen, Saturas gegenüber die Schuld auf mich zu nehmen.");
	};
};

INSTANCE Info_Mod_Eremit_Prisma2 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma2_Condition;
	information	= Info_Mod_Eremit_Prisma2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin da und bereit.";
};

FUNC INT Info_Mod_Eremit_Prisma2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma))
	&& (Npc_HasItems(hero, ItMi_DarkPearl) >= 1)
	&& (Npc_GetDistToWP(self, "ADW_VALLEY_BENCH") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma2_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma2_15_00"); //Ich bin da und bereit.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma2_04_01"); //(kindlich) Und du hast sogar deine Freunde zum Spielen mitgebracht?
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma2_15_02"); //(irritiert) Welche Freunde?

	B_LogEntry	(TOPIC_MOD_MAGIEPRISMA, "Meine Widersacher bleiben mir auf den Fersen. Als ich wegen des Prismas den Eremiten aufsuchte, griff mich eine Reihe von Untoten unter der Führung Urnols an.");

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Demon_AtEremit,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(ZombieRandom_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(ZombieRandom_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(ZombieRandom_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(ZombieRandom_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(ZombieRandom_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(SkeletonMage_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(SkeletonWarrior_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(SkeletonWarrior_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(Skeleton_Weg,	"ADW_VALLEY_PATH_031");
	Wld_InsertNpc	(Skeleton_Weg,	"ADW_VALLEY_PATH_031");
};

INSTANCE Info_Mod_Eremit_Prisma3 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma3_Condition;
	information	= Info_Mod_Eremit_Prisma3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma2))
	&& (Npc_IsDead(Demon_AtEremit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma3_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_00"); //Denen haben wir ordentlich eingeheizt. Gegen uns drei hatten sie keine Chance.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_01"); //Woher wissen die immer, wo ich mich gerade befinde?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_02"); //Unmöglich ist nichts. Vielleicht kennen sie ein paar Kniffe des alten Volkes.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_03"); //Was für Kniffe?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_04"); //Wir vermuten nur. Sie könnten dich magisch markiert haben, sodass du überall hin eine feine Spur ziehst, die für den Zaubernden sichtbar ist.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_05"); //Bist du einem von ihnen schon mal nahe gekommen, ohne dass du ihn danach getötet hast?
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_06"); //Mehrmals.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_07"); //Dann wäre das zumindest eine Möglichkeit.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_08"); //Und wie könnte ich die Markierung wieder loswerden?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_09"); //Keine Ahnung. Der Zauber ist nicht darauf ausgelegt, leicht gebrochen werden zu können.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_10"); //Eventuell ließe er sich aber austricksen, indem du ihn auf einen anderen Gegenstand umlenkst.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_11"); //Ein Gegenstand, der sich danach willkürlich durch die Welt bewegt, um meine Gegner zu verwirren.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_12"); //Genau.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma3_15_13"); //Schön und gut, aber wie fange ich das an?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_14"); //Frag uns nicht ... Was sagen denn deine Schlafröcke dazu? Vielleicht hat einer von denen eine Idee.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_15"); //Oder jemand, der sich besser mit dem alten Volk auskennt als wir. Wenn es so jemanden gibt.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_16"); //Es wäre besser, du würdest die Markierung abstreifen, bevor wir fortfahren. So viel Besuch ist uns doch ein wenig lästig.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma3_04_17"); //Bis du wieder zurück bist, haben wir auch das Prisma fertig geschliffen.

	B_LogEntry_More	(TOPIC_MOD_MAGISCHEMARKIERUNG, TOPIC_MOD_MAGIEPRISMA, "Der Eremit vermutet, ich würde wegen einer magischen Markierung für diesen finsteren Urnol und seinen Meister überall sichtbar sein. Er selbst kennt keine Methode, sie wieder loszuwerden. Ich sollte mich an Vatras oder einen Kundigen des alten Volkes wenden, so ich denn einen kenne. Als Notlösung könnte auch Argez in Frage kommen.", "Der Eremit schleift nun die schwarze Perle. Wenn ich die magische Markierung abgestreift habe, soll ich wiederkommen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eremit_Prisma4 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma4_Condition;
	information	= Info_Mod_Eremit_Prisma4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_AW_Magiespur2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma4_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_00"); //Komm schon! Wir müssen noch ein kleines Stück Weg hinter uns bringen!
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma4_15_01"); //Wohin geht's?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_02"); //Es gibt eine Höhle hier in der Nähe, in der Beliars Macht stark ist. Das wird uns genügen müssen.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma4_15_03"); //Beliar? Wieso zum Teufel der?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_04"); //Beliar ist der einzige der drei Götter, der das Unbändige ähnlich wie Radanos, der Gott des alten Volkes, verkörpert.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_05"); //Da wir Radanos nicht mehr um Hilfe bitten können, müssen wir eben mit Beliar vorlieb nehmen.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma4_15_06"); //Ich habe da kein gutes Gefühl ...
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_07"); //Es wäre auch unklug, sich in Beliars Gegenwart sicher zu fühlen.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma4_04_09"); //Aber nun lass uns gehen!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RITUALHOEHLE");

	self.aivar[AIV_Partymember] = TRUE;
};

INSTANCE Info_Mod_Eremit_Prisma5 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma5_Condition;
	information	= Info_Mod_Eremit_Prisma5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma4))
	&& (Npc_GetDistToWP(self, "ADW_VALLEY_PATH_020_CAVE_05") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma5_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_00"); //Du musst uns bei dem Ritual assistieren.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma5_15_01"); //Wie funktioniert das überhaupt?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_02"); //Das Prisma ist noch nicht aufnahmefähig genug für mehrere Zaubersprüche, deshalb werden wir einen Dehnzauber wirken, der das magische Volumen des Prismas vergrößert.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_03"); //Das kann einige Zeit dauern. Das Prisma wird versuchen, den Zauber abzustoßen.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_04"); //Aber mit Beliars und deiner Hilfe sollte es gelingen.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_05"); //(kindlich) Mir brummt der Kopf!
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma5_15_06"); //Was kann ich machen?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_07"); //Wir zwei haben genug damit zu tun, den Dehnzauber aufrecht zu erhalten.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_08"); //Du musst aufpassen, dass er im Prisma bleibt.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma5_15_09"); //Und wie?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_10"); //Solange er sich im Prisma befindet, leuchtet es auf.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_11"); //Ermattet das Prisma, musst du schnell handeln - du hast nur wenige Sekunden, um den Zauber "Beliars Zorn" zu wirken, der den Dehnzauber zurück in seinen eigentlichen Bestimmungsort treibt.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_12"); //Hier hast du ein paar Spruchrollen. Sollte es bei den ersten Versuchen nicht klappen, geben wir dir noch mehr.

	B_GiveInvItems	(self, hero, ItSc_BeliarsRage, 6);

	AI_Output(self, hero, "Info_Mod_Eremit_Prisma5_04_13"); //Bist du bereit?

	B_LogEntry	(TOPIC_MOD_MAGIEPRISMA, "Das Ritual kann nun losgehen - ich muss aufpassen, dass der Dehnzauber, den der Eremit wirkt, das Prisma nicht verlässt. Sollte das Prisma ermatten, muss ich sofort den Zauber 'Beliars Zorn' sprechen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eremit_Prisma6 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma6_Condition;
	information	= Info_Mod_Eremit_Prisma6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass es uns versuchen.";
};

FUNC INT Info_Mod_Eremit_Prisma6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma6_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma6_15_00"); //Lass es uns versuchen.
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RITUAL");

	Wld_InsertItem	(ItMi_Magieprisma_Fake, "FP_ITEM_MAGIEPRISMA");

	Wld_PlayEffect ("SPELLFX_PRISMA", ItMi_Magieprisma_Fake, ItMi_Magieprisma_Fake, 0, 0, 0, FALSE);
};

INSTANCE Info_Mod_Eremit_Prisma7 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma7_Condition;
	information	= Info_Mod_Eremit_Prisma7_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma6))
	&& (Mod_PrismaRitual_ZuLangsam == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma7_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma7_04_00"); //Das hat noch nicht ganz geklappt. Noch mal!

	AI_StopProcessInfos	(self);

	Mod_PrismaRitual_ZuLangsam = FALSE;

	Mod_PrismaRitual_Counter = 0;

	Wld_PlayEffect ("SPELLFX_PRISMA", ItMi_Magieprisma_Fake, ItMi_Magieprisma_Fake, 0, 0, 0, FALSE);
};

INSTANCE Info_Mod_Eremit_Prisma8 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma8_Condition;
	information	= Info_Mod_Eremit_Prisma8_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma6))
	&& (Npc_HasItems(hero, ItSc_BeliarsRage) == 0)
	&& (Mod_PrismaRitual_Counter < 80)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma8_Info()
{
	if (!Mod_PrismaZauber_Eremit) {
		AI_Output(self, hero, "Info_Mod_Eremit_Prisma8_04_00"); //Du hast ja gar keine Zauber mehr. Hier, nimm neue.

		B_GiveInvItems	(self, hero, ItSc_BeliarsRage, 6);

		AI_StopProcessInfos	(self);

		Mod_PrismaZauber_Eremit = TRUE;
	} else {
		AI_Output(self, hero, "Info_Mod_Eremit_Prisma8_04_01"); //Puh, wir sind ja immer noch nicht fertig. Wir haben zwar noch ein paar Zauber, aber bei deinem Verschleiß bald nicht mehr.
		AI_Output(self, hero, "Info_Mod_Eremit_Prisma8_04_02"); //(ernst) Oder versuchst du etwa, uns zu hintergehen?
		AI_Output(self, hero, "Info_Mod_Eremit_Prisma8_04_03"); //Wenn du mehr Zauber willst, verlangen wir von nun an 300 Goldstücke dafür.

		Info_ClearChoices	(Info_Mod_Eremit_Prisma8);

		Info_AddChoice	(Info_Mod_Eremit_Prisma8, "So viel Gold habe ich noch nicht.", Info_Mod_Eremit_Prisma8_B);

		if (Npc_HasItems(hero, ItMi_Gold) >= 300) {
			Info_AddChoice	(Info_Mod_Eremit_Prisma8, "Na gut, gib mir die Zauber.", Info_Mod_Eremit_Prisma8_A);
		};
	};

	Mod_PrismaRitual_ZuLangsam = FALSE;

	Mod_PrismaRitual_Counter = 0;
};

FUNC VOID Info_Mod_Eremit_Prisma8_A()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma8_A_15_00"); //Na gut, gib mir die Zauber.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);

	AI_Output(self, hero, "DEFAULT"); //

	B_GiveInvItems	(self, hero, ItSc_BeliarsRage, 6);

	Info_ClearChoices	(Info_Mod_Eremit_Prisma8);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eremit_Prisma8_B()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma8_B_15_00"); //So viel Gold habe ich noch nicht.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Eremit_Prisma8);

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk	(self, 30);
};

INSTANCE Info_Mod_Eremit_Prisma9 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Prisma9_Condition;
	information	= Info_Mod_Eremit_Prisma9_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Prisma9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma6))
	&& (Mod_PrismaRitual_Counter == 80)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Prisma9_Info()
{
	Wld_RemoveItem	(ItMi_Magieprisma_Fake);

	Wld_InsertItem	(ItMi_Magieprisma, "FP_ITEM_MAGIEPRISMA");

	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_00"); //Das hätten wir. Dort liegt dein fertiges Prisma.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma9_15_01"); //Wie kann ich dir danken?
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_02"); //Ein einfaches Danke reicht vollkommen.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma9_15_03"); //Danke.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_04"); //Wir können dir auch noch einen Hinweis zum Gebrauch geben.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_05"); //Das Prisma wird nur aktiv, wenn du es aus deinem Gepäck hervorholst und anlegst.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_06"); //Alle Schadenszauber, die du nun sprichst, laden das Prisma auf.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_07"); //Allerdings haben nur drei bis vier Zauber gleichzeitig im Prisma Platz.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_08"); //Wenn du mehr sprichst, gehen die Zauber verloren.
	AI_Output(hero, self, "Info_Mod_Eremit_Prisma9_15_09"); //Ich werd's mir merken.
	AI_Output(self, hero, "Info_Mod_Eremit_Prisma9_04_10"); //Möge es dir auf deinen Reisen Glück bringen.

	B_GivePlayerXP	(350);

	Wld_StopEffect ("SPELLFX_PRISMA");

	B_SetTopicStatus	(TOPIC_MOD_MAGIEPRISMA, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_PRISMA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_PRISMA, "Wenn das Prisma angelegt ist und der Held einen Schadenszauber spricht, wird das Prisma aufgeladen. Das Prisma kann vier Zaubersprüche gleichzeitig aufnehmen. Das Prisma kann durch Drücken der ihm zu gewiesenen Taste ausgelöst werden und streut dann den Schaden der vier Zauber auf umliegende Gegner.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Eremit_ScrollJG (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_ScrollJG_Condition;
	information	= Info_Mod_Eremit_ScrollJG_Info;
	permanent	= 0;
	important	= 0;
	description	= "Adanos zum Gruß.";
};

FUNC INT Info_Mod_Eremit_ScrollJG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Riordian_AW_ScrollJG))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_ScrollJG_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_00"); //Adanos zum Gruß.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_01"); //Adanos? Verschone uns mit diesem neumodischen Quatsch!
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_02"); //Du bist kein Anhänger des Wassers?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_03"); //Nein, in den alten Schriften, die wir lesen, kam er noch nicht vor. Vier der Sprachen konnten wir entziffern.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_04"); //Vier? Ich kenne nur drei, welches ist die vierte?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_05"); //Die Sprache der Gelehrten.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_06"); //Dann stießen wir auf eine weitere Sprache. Die war so furchtbar, dass wir heute noch in Panik geraten, wenn wir nur daran denken.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_07"); //Hmm. Dann kannst du mir die Sprache der Gelehrten auch beibringen?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_08"); //Wir wissen nicht, ob du dafür schon bereit bist.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_09"); //Dann probier's halt. Auf den Kopf gefallen bin ich nicht.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_10"); //So höre: „Ralgnatiru chrenid kar.“
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_11"); //Hör auf. Ich versteh kein Wort.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_12"); //Also doch. Tut uns Leid.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_13"); //Hmm. Kannst du mir wenigstens diese Nachricht übersetzen?

	B_GiveInvItems	(hero, self, ItWr_TruhenNotizJG, 1);

	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_14"); //Zeig her.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_15"); //Ja. Die Gelehrtensprache.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_16"); //Und das heißt?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_17"); //Du hast ein paar Gold für uns? Wir müssen wieder mal einkaufen gehen zu den Piraten.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_15_18"); //An wie viel dachtest du?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_04_19"); //Dir scheint es wichtig zu sein. So 500 Gold ...

	Info_ClearChoices	(Info_Mod_Eremit_ScrollJG);

	Info_AddChoice	(Info_Mod_Eremit_ScrollJG, "Hier hast du. Und?", Info_Mod_Eremit_ScrollJG_B);
	Info_AddChoice	(Info_Mod_Eremit_ScrollJG, "Tun es 200 Gold auch?", Info_Mod_Eremit_ScrollJG_A);
};

FUNC VOID Info_Mod_Eremit_ScrollJG_B()
{
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_B_15_00"); //Hier hast du. Und?

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_01"); //Dieser Text erklärt die Handhabung einer gewissen Spruchrolle.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_B_15_02"); //Die Rolle haben wir auch.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_03"); //Hier steht: Ralgnatiru chrenid ...
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_04"); //Ach so: „Man nehme diese Rolle, einen Brocken unreines Erz, einen Geschwindigkeitstrank, Teil eines Flugtieres oder einen Fliegenpilz, das Fleisch eines Untoten und zwei Skelettknochen.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_05"); //Das füge man in der Opferschale zusammen. Sodann erscheint ein Gegenstand, der dir in Zeiten höchster Bedrängnis helfen wird."
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_B_15_06"); //Uff. Das wirft ja mehr Fragen auf, als es Antworten gibt.
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_07"); //Tut uns Leid. Da können wir dir auch nicht weiterhelfen.
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_B_15_08"); //Das glaub ich gerne. Also, wir sind quitt?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_B_04_09"); //Gewiss. Wir wünschen dir Glück.

	B_GivePlayerXP	(250);

	Info_ClearChoices	(Info_Mod_Eremit_ScrollJG);

	Log_CreateTopic	(TOPIC_MOD_JG_OPFERSCHALE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_OPFERSCHALE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_JG_SCROLL, TOPIC_MOD_JG_OPFERSCHALE, "Der Einsiedler hat mir den Text übersetzt. Er ist in der Sprache der Gelehrten geschrieben und handelt von einer gewissen Opferschale. Hmm. Hoffentlich weiß Wulfgar darüber Bescheid.", "Hmm. Ich brauche zwei Skelettknochen, was von einer Blutfliege oder einen Fliegenpilz, einen Geschwindigkeitstrank und unreines Erz. Das könnte der Brocken seltsames Erz sein, den ich von Grimbald habe. Hoffe, ich hab's noch dabei. Und dann die Opferschale. Welche, bitte schön? Vielleicht kann Riordian ...");
	B_SetTopicStatus	(TOPIC_MOD_JG_SCROLL, LOG_SUCCESS);
};

FUNC VOID Info_Mod_Eremit_ScrollJG_A()
{
	AI_Output(hero, self, "Info_Mod_Eremit_ScrollJG_A_15_00"); //Tun es 200 Gold auch?
	AI_Output(self, hero, "Info_Mod_Eremit_ScrollJG_A_04_01"); //Nein. Wir müssen auf Vorrat kaufen.

	Info_ClearChoices	(Info_Mod_Eremit_ScrollJG);

	Info_AddChoice	(Info_Mod_Eremit_ScrollJG, "Hier hast du. Und?", Info_Mod_Eremit_ScrollJG_B);
};

INSTANCE Info_Mod_Eremit_Zeremoniendolch (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Zeremoniendolch_Condition;
	information	= Info_Mod_Eremit_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Du kennst dich doch aus in der Gegend.";
};

FUNC INT Info_Mod_Eremit_Zeremoniendolch_Condition()
{
	if (Mod_ASS_DolchMonolog == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch_15_00"); //Hallo! Du kennst dich doch aus in der Gegend.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch_04_01"); //Das wollen wir meinen. Was suchst du?
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch_15_02"); //Sowas wie eine Ritualstätte, Opferstätte, einen mystischen Platz oder so.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch_04_03"); //Da wüssten wir schon was. Aber damit wir dir das verraten, musst du uns einen Gefallen tun.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch_15_04"); //Und das wäre?
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch_04_05"); //Uns geht das Essen aus. Und dann würden wir gern mal etwas anderes trinken, als das Wasser vom See bei den Piraten.
};

INSTANCE Info_Mod_Eremit_Zeremoniendolch2 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Zeremoniendolch2_Condition;
	information	= Info_Mod_Eremit_Zeremoniendolch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab da einiges dabei. Hier, probier mal diesen Wein.";
};

FUNC INT Info_Mod_Eremit_Zeremoniendolch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Zeremoniendolch))
	&& (Npc_HasItems(hero, ItFo_Wine) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Zeremoniendolch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch2_15_00"); //Ich hab da einiges dabei. Hier, probier mal diesen Wein.

	B_GiveInvItems	(hero, self, ItFo_Wine, 1);

	B_UseItem	(self, ItFo_Wine);

	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch2_04_01"); //Boaar! Lange nicht mehr so was Gutes getrunken! Wo hast du den her?
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch2_15_02"); //In Khorinis kannst du den fast überall kaufen.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch2_04_03"); //Khorinis?
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch2_15_04"); //Der andere Teil der Insel. Da, wo ich und die Wassermagier beim Tempel herkommen.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch2_04_05"); //Wie kommt man da hin?
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch2_15_06"); //Durch eben diesen Tempel. Die Magier würden dir sicher helfen.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch2_04_07"); //Wir überlegen es uns. Aber erst mal, was wir dringend brauchen. Wir schreiben dir einen Zettel.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch2_04_08"); //Inzwischen könntest du uns frisches Wasser vom See im Talkessel in der Nähe der Piraten besorgen. Hier hast du einen Eimer.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);

	Log_CreateTopic	(TOPIC_MOD_ASS_EREMIT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_EREMIT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_EREMIT, "Der Eremit will mir eine Liste mit Dingen schreiben, die er benötigt. Währenddessen soll ich ihm einen Eimer Wasser aus dem See im Talkessel in der Nähe der Piraten holen.");
};

INSTANCE Info_Mod_Eremit_Zeremoniendolch3 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Zeremoniendolch3_Condition;
	information	= Info_Mod_Eremit_Zeremoniendolch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, das Wasser.";
};

FUNC INT Info_Mod_Eremit_Zeremoniendolch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Zeremoniendolch2))
	&& (Npc_HasItems(hero, ItMi_EimerW) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Zeremoniendolch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch3_15_00"); //Hier, das Wasser.

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch3_04_01"); //Und hier unsere Liste. Und einen neuen Jagdbogen und eine neue Pfanne brauchen wir auch noch.

	B_GiveInvItems	(self, hero, ItWr_EremitEinkaufsliste, 1);

	B_HEROFAKESCROLL();

	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch3_15_02"); //Ich lese hier: 30 Holz. Meinst du normale oder schwere Äste?
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch3_04_03"); //Das ist egal. Hauptsache, es ist trocken und brennt gut.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch3_15_04"); //Und dann verrätst du mir, wo ich eine Opferstätte finde?
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch3_04_05"); //Versprochen.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch3_15_06"); //Bis später.

	B_LogEntry	(TOPIC_MOD_ASS_EREMIT, "Möglicherweise kann mir der Eremit weiterhelfen. Ich muss allerdings erst seine Einkaufsliste erledigen. Er will 20 Brote, 10 Schinken, 10 Wurst, 10 Wein, 5 Grog, 30 Äste, 300 Pfeile, 1 Jagdbogen, 2 Moleratfett und eine neue Pfanne haben. Hoffentlich lohnt sich die Mühe ...");

	Wld_InsertNpc	(Mod_7640_RDW_Cavalorn_AW, "ADW_ENTRANCE");
};

INSTANCE Info_Mod_Eremit_Zeremoniendolch4 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Zeremoniendolch4_Condition;
	information	= Info_Mod_Eremit_Zeremoniendolch4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Bin zurück mit deinem Zeug.";
};

FUNC INT Info_Mod_Eremit_Zeremoniendolch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Zeremoniendolch2))
	&& (Npc_HasItems(hero, ItFo_Bread) >= 20)
	&& (Npc_HasItems(hero, ItFo_Bacon) >= 10)
	&& (Npc_HasItems(hero, ItFo_Wine) >= 10)
	&& (Npc_HasItems(hero, ItFo_Sausage) >= 10)
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 5)
	&& (Npc_HasItems(hero, ItMi_Ast) >= 30)
	&& (Npc_HasItems(hero, ItRw_Arrow) >= 300)
	&& (Npc_HasItems(hero, ItMi_MoleratLubric_MIS) >= 2)
	&& (Npc_HasItems(hero, ItRw_Bow_L_03) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Zeremoniendolch4_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch4_15_00"); //Hallo! Bin zurück mit deinem Zeug. War ganz schön teuer, das alles.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch4_04_01"); //Zeig her. Erst mal sehen.

	Npc_RemoveInvItems	(hero, ItFo_Bread, 20);
	Npc_RemoveInvItems	(hero, ItFo_Bacon, 10);
	Npc_RemoveInvItems	(hero, ItFo_Wine, 10);
	Npc_RemoveInvItems	(hero, ItFo_Sausage, 10);
	Npc_RemoveInvItems	(hero, ItFo_Addon_Grog, 5);
	Npc_RemoveInvItems	(hero, ItMi_Ast, 30);
	Npc_RemoveInvItems	(hero, ItRw_Arrow, 300);
	Npc_RemoveInvItems	(hero, ItMi_MoleratLubric_MIS, 2);
	Npc_RemoveInvItems	(hero, ItRw_Bow_L_03, 1);

	B_ShowGivenThings	("Diverse Gegenstände gegeben");

	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch4_04_02"); //Prima, alles dabei. Wir machen dir einen Vorschlag: Wenn unser Tipp dir weiterhilft, bekommen wir die Lieferung umsonst. Wenn nicht, bezahlen wir die Sachen.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch4_15_03"); //Von mir aus. Wo ist nun diese verdammte Opferstätte?
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch4_04_04"); //Also höre: Gleich hier um die Ecke, auf dem Weg hoch aus dem Tal, ist eine versteckte Abzweigung auf ein kleines Plateau.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch4_04_05"); //Dort findest du eine Gruft. Und da drin könnte deine Opferstätte sein.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch4_15_06"); //Warst du schon mal dort?
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch4_04_07"); //Bewahre! Da wimmelt es von Monstern. Niemand kriegt uns da rein. Wir sind zwar ein bisschen seltsam, aber nicht lebensmüde.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch4_15_08"); //Ich schaff das schon. Bin gespannt.

	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Der Einsiedler hat mir von einem Plateau erzählt, das ganz in der Nähe seiner Hütte liegt. Der Zugang liegt an einem Weg, der nach oben führt. Da gibt es eine Gruft und haufenweise Monster. Mal sehen ...");
	B_SetTopicStatus	(TOPIC_MOD_ASS_EREMIT, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Wld_InsertNpc	(Troll_Weg, "FP_ROAM_VALLEY_010");
};

INSTANCE Info_Mod_Eremit_Zeremoniendolch5 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Zeremoniendolch5_Condition;
	information	= Info_Mod_Eremit_Zeremoniendolch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_Zeremoniendolch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Zeremoniendolch4))
	&& (Npc_HasItems(hero, ItMw_Avaquar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Zeremoniendolch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch5_04_00"); //Und, hast du deinen Dolch?
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch5_15_01"); //Ja. Er war tatsächlich in der Gruft, aber gut geschützt. Und dann das Viehzeug!
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch5_04_02"); //Haben wir doch gesagt. Dann schulden wir dir nichts.
	AI_Output(hero, self, "Info_Mod_Eremit_Zeremoniendolch5_15_03"); //So war's abgemacht. Mach's gut, ich muss weiter.
	AI_Output(self, hero, "Info_Mod_Eremit_Zeremoniendolch5_04_04"); //Möge dir die Sonne den Weg weisen. Alter Spruch.
};

INSTANCE Info_Mod_Eremit_NettHier (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_NettHier_Condition;
	information	= Info_Mod_Eremit_NettHier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nett hast du es hier.";
};

FUNC INT Info_Mod_Eremit_NettHier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma))
	&& (Npc_GetDistToWP(self, "ADW_VALLEY_BENCH") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_NettHier_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_NettHier_15_00"); //Nett hast du es hier.
	AI_Output(self, hero, "Info_Mod_Eremit_NettHier_04_01"); //Kann man mit viel Zeit alles schaffen.
	AI_Output(self, hero, "Info_Mod_Eremit_NettHier_04_02"); //Seitdem wir zu zweit sind, ist der Raum etwas eng, deshalb schlafen wir zusammen in einem Bett.
	AI_Output(self, hero, "Info_Mod_Eremit_NettHier_04_03"); //Aber wer nur das Nötigste zum Leben hat, kommt auch mit wenig Platz klar.
};

INSTANCE Info_Mod_Eremit_PreLehrer (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_PreLehrer_Condition;
	information	= Info_Mod_Eremit_PreLehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Eremit_PreLehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_Prisma))
	&& (Npc_GetDistToWP(self, "ADW_VALLEY_BENCH") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_PreLehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer_04_00"); //Wir könnten dir die Sprache der alten Kultur beibringen ...
	AI_Output(hero, self, "Info_Mod_Eremit_PreLehrer_15_01"); //Schön. Also, was muss ich ...
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer_04_02"); //(unterbricht) Wir sagten, wir könnten ... aber wir haben zur Zeit absolut nicht den Nerv dazu!
	AI_Output(hero, self, "Info_Mod_Eremit_PreLehrer_15_03"); //Wieso, was ist los?
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer_04_04"); //Ach ... diese verdammten Harpien machen uns gerade das Leben echt schwer.
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer_04_05"); //Immer, wenn wir uns gerade was Feines braten möchte, kommen sie angeflogen und ... oh verflucht, da sind sie schon wieder!

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Harpie_Eremit_01, "ADW_VALLEY_PATH_032");
	Wld_InsertNpc	(Harpie_Eremit_02, "ADW_VALLEY_PATH_032");
};

INSTANCE Info_Mod_Eremit_PreLehrer2 (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_PreLehrer2_Condition;
	information	= Info_Mod_Eremit_PreLehrer2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eremit_PreLehrer2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eremit_PreLehrer))
	&& (Npc_IsDead(Harpie_Eremit_01))
	&& (Npc_IsDead(Harpie_Eremit_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_PreLehrer2_Info()
{
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer2_04_00"); //Siehst du, das meinten wir! Immer, wenn wir uns etwas braten möchten, kommen diese Viecher angeflogen und besudeln alles mit ihrem Gestank und Unrat.
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer2_04_01"); //Diese verdammten Biester haben irgendwo in der Nähe ihre Nester ...
	AI_Output(hero, self, "Info_Mod_Eremit_PreLehrer2_15_02"); //Hast du schon versucht sie zu erledigen?
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer2_04_03"); //Wie denn?! Können wir denn zu ihren Nestern hochfliegen?! Und auf Fernkampf verstehen Wir uns auch nicht.
	AI_Output(self, hero, "Info_Mod_Eremit_PreLehrer2_04_04"); //Wenn das so weitergeht, werden Wir uns wohl einen anderen Platz zum Leben suchen müssen ...

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Harpie_Eremit_03, "FP_ROAM_EREMIT_HARPIE_01");
	Wld_InsertNpc	(Harpie_Eremit_04, "FP_ROAM_EREMIT_HARPIE_02");
	Wld_InsertNpc	(Harpie_Eremit_05, "FP_ROAM_EREMIT_HARPIE_03");

	Log_CreateTopic	(TOPIC_MOD_EREMIT_HARPIEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EREMIT_HARPIEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EREMIT_HARPIEN, "Der Eremit wird immer wieder von Harpien heimgesucht, die ihm das Leben schwer machen. Er meinte, dass die Viecher in der Nähe ihre Nester haben müssen.");
};

INSTANCE Info_Mod_Eremit_Lehrer (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Lehrer_Condition;
	information	= Info_Mod_Eremit_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Harpien sollten dir in Zukunft keinen Ärger mehr machen.";
};

FUNC INT Info_Mod_Eremit_Lehrer_Condition()
{
	if (Mod_Eremit_Harpien == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eremit_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Eremit_Lehrer_15_00"); //Die Harpien sollten dir in Zukunft keinen Ärger mehr machen.
	AI_Output(self, hero, "Info_Mod_Eremit_Lehrer_04_01"); //Dann hast du sie alle erwischt? Großartig, endlich haben wir wieder unsere Ruhe.
	AI_Output(self, hero, "Info_Mod_Eremit_Lehrer_04_02"); //Wir wissen nicht, wie wir dir danken sollen ... hmm, wobei ... nimm diese Steintafeln.

	B_ShowGivenThings	("2 Steintafeln erhalten");

	CreateInvItems	(hero, ItWr_DexStonePlate1_Addon, 1);
	CreateInvItems	(hero, ItWr_ManaStonePlate1_Addon, 1);

	AI_Output(self, hero, "Info_Mod_Eremit_Lehrer_04_03"); //Und falls du sie noch nicht lesen kannst, werden wir es dir selbstverständlich beibringen.
	
	Log_CreateTopic	(TOPIC_MOD_LEHRER_JHARKENDAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_JHARKENDAR, "Der Eremit kann mir die Sprachen dieses Landes beibringen.");

	B_SetTopicStatus	(TOPIC_MOD_EREMIT_HARPIEN, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Eremit_Lernen (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Lernen_Condition;
	information	= Info_Mod_Eremit_Lernen_Info;
	permanent 	= TRUE;
	description 	= "Ich will die Sprachen lernen.";
};
FUNC INT Info_Mod_Eremit_Lernen_Condition ()
{
	if (Npc_KnowsInfo (other, Info_Mod_Eremit_Lehrer))
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID Info_Mod_Eremit_Lernen_Info ()
{
	AI_Output (other, self, "Info_Mod_Eremit_Lernen_15_00"); //Ich will die Sprachen lernen.
	AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_01"); //Welche willst du lernen?

	Info_ClearChoices (Info_Mod_Eremit_Lernen);
	Info_AddChoice (Info_Mod_Eremit_Lernen, DIALOG_BACK, Info_Mod_Eremit_Lernen_No);
	
	
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice (Info_Mod_Eremit_Lernen,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_1 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)),Info_Mod_Eremit_Lernen_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Info_AddChoice (Info_Mod_Eremit_Lernen,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_2 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)),Info_Mod_Eremit_Lernen_Yes);
	}	
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		Info_AddChoice (Info_Mod_Eremit_Lernen,B_BuildLearnString (NAME_ADDON_LEARNLANGUAGE_3 , B_GetLearnCostTalent (other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)),Info_Mod_Eremit_Lernen_Yes);
	};
};

FUNC VOID B_Eremit_LernenLanguage()
{	
	AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_02"); //Also, es es ganz einfach. Ein G ist ein O, ein T ist ein H und ein I ist ein C. 
	AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_03"); //Wenn du das mal kapiert hast, ist der Rest eigentlich logisch ...
};

FUNC VOID B_Eremit_LernenLanguage2()
{	
	AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_05"); //Wohl aus Gründen der strategischen Geheimhaltung schrieben die Krieger ihre Texte rückwärts.
	AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_06"); //Zum Beispiel: „Tlah! Rew  ad?“ oder „Elorap!“ Es sollte also nicht allzu schwer sein, diese Tafeln zu lesen.
};

FUNC VOID Info_Mod_Eremit_Lernen_No()
{
	Info_ClearChoices (Info_Mod_Eremit_Lernen);
};

FUNC VOID Info_Mod_Eremit_Lernen_Yes()
{
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output (self, other, "Info_Mod_Eremit_Lernen_04_04"); //Wir glauben nicht, dass wir dir noch was darüber beibringen können...
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_3))
		{
			B_Eremit_LernenLanguage();
		};
	}
	else if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_2))
		{
			B_Eremit_LernenLanguage();
		};
	}
	else //Keine Language
	{
		if (B_TeachPlayerTalentForeignLanguage (self, other, LANGUAGE_1))
		{
			B_Eremit_LernenLanguage();
		};
	};
};

INSTANCE Info_Mod_Eremit_Pickpocket (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_Pickpocket_Condition;
	information	= Info_Mod_Eremit_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Eremit_Pickpocket_Condition()
{
	C_Beklauen	(80, ItWr_HitPointStonePlate2_Addon, 1);
};

FUNC VOID Info_Mod_Eremit_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);

	Info_AddChoice	(Info_Mod_Eremit_Pickpocket, DIALOG_BACK, Info_Mod_Eremit_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Eremit_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Eremit_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Eremit_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);
};

FUNC VOID Info_Mod_Eremit_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);

		Info_AddChoice	(Info_Mod_Eremit_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Eremit_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Eremit_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Eremit_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Eremit_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Eremit_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Eremit_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Eremit_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Eremit_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Eremit_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Eremit_EXIT (C_INFO)
{
	npc		= Mod_115_NONE_Eremit_AW;
	nr		= 1;
	condition	= Info_Mod_Eremit_EXIT_Condition;
	information	= Info_Mod_Eremit_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Eremit_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eremit_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};