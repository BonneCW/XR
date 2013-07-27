INSTANCE Info_Mod_Dragon_Hi (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Hi_Condition;
	information	= Info_Mod_Dragon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_KoboldDragon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_00"); //So bekomme ich dich endlich zu Gesicht Mensch.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_01"); //Einer meiner Diener berichtete mir davon, dass du es warst, der das Buch öffnete.
	AI_Output(hero, self, "Info_Mod_Dragon_Hi_15_02"); //(zu sich selbst) Da bin ich aber erleichtert.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_03"); //Den Dienst, den du mir damit erwiesen hast, kann ich schwerlich mit Gold aufwiegen.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_04"); //Deine Belohnung soll es sein, als meine rechte Hand auf Khorinis zu wirken und an meiner wachsenden Macht teilzuhaben.
	AI_Output(hero, self, "Info_Mod_Dragon_Hi_15_05"); //(halblaut, leicht ironisch) Zu großzügig.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_06"); //Nun, zu allererst ...

	AI_TurnToNpc	(self, Kobold_11010_NW);

	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_07"); //Was sagst du Kobold, ihr habt den Übeltäter gefasst, der den Anteil seiner Beute von dem letzten Raubzug nicht an mich abgetreten hat.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_08"); //So, 20 Goldmünzen hat der unflätige Wurm mir unterschlagen. Was, nun fleht er um Mitleid und Gnade für seine Verfehlung?!
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_09"); //Verbrannt und durchbohrt von 20 Klingen soll er werden!
	AI_Output(hero, self, "Info_Mod_Dragon_Hi_15_10"); //(zu sich selbst, schockiert) Ohh, sein Gefolgsmann?
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_11"); //So, das soll ihm eine Lehre sein ...
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_12"); //Er bedankt sich für mein mildes Urteil?! Das will ich ihm auch geraten haben.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_13"); //Und wehe, er leistet sich noch eine Verfehlung… . Dann soll es ihm wirklich schlecht ergehen.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_14"); //So, wo waren wir grade stehen geblieben? Genau, deine Aufgaben.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_15"); //Vorerst habe ich noch nichts Konkretes für dich zu tun. Höre dich einfach auf diesem Eiland bei Mensch und Monster um, ob du nicht nützliche Informationen für mich aufschnappst.
	AI_Output(self, hero, "Info_Mod_Dragon_Hi_22_16"); //Mein Drachenschatz ist kläglich, nicht mal eines Linswurmes würdig, und ich Sinne darauf diesen zu vergrößern.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Dragon_Hi_15_17"); //Im Moment scheint mir der Drache samt seiner Dienerschaft übermächtig. Ich sollte mitspielen und schauen, ob ich nicht etwas Nützliches in Erfahrung bringe.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Tja, ein mächtiger Drache mit einer Furcht einflößenden Gefolgschaft ist dieser Dragon. Vorerst bin ich noch chancenlos und sollte daher mitspielen. Und es wäre wohl wirklich nicht von Nachteil, wenn ich mich etwas umsehe und umhöre. Hmm, seinen Drachenschatz will er vergrößern ...");
};

INSTANCE Info_Mod_Dragon_Kloster (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Kloster_Condition;
	information	= Info_Mod_Dragon_Kloster_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gebieter über Dämonen und Untiere (...)";
};

FUNC INT Info_Mod_Dragon_Kloster_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Kloster_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragon_Kloster_15_00"); //Gebieter über Dämonen und Untiere, ich kenne eine Möglichkeit, wie ihr euren Drachenschatz vergrößern könnt.
	AI_Output(self, hero, "Info_Mod_Dragon_Kloster_22_01"); //(erwartungsvoll) Ja, sprich Mensch!
	AI_Output(hero, self, "Info_Mod_Dragon_Kloster_15_02"); //Nicht weit im Osten liegt ein Kloster der Feuermagier, das große Reichtümer birgt. Diese solltet ihr ausheben.
	AI_Output(self, hero, "Info_Mod_Dragon_Kloster_22_03"); //Das hört sich in der Tat sehr verlockend an. Ein guter Hinweis Mensch.
	AI_Output(self, hero, "Info_Mod_Dragon_Kloster_22_04"); //Heute bei Anbruch der Nacht werden wir uns des Klosters annehmen.

	Mod_NL_DragonKlosterTag = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Ich habe Dragon über das Kloster und seine Reichtümer unterrichtet. Er war zufrieden und will bei Anbruch der Nacht einen Überfall starten.");
};

INSTANCE Info_Mod_Dragon_KlosterErfolg (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_KlosterErfolg_Condition;
	information	= Info_Mod_Dragon_KlosterErfolg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_KlosterErfolg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	&& (Mod_NL_DragonKloster == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_KlosterErfolg_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_00"); //(erfreut) Wuahaha, dein Vorschlag war wirklich Gold wert, Mensch.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_01"); //Wir rafften so viel aus Schatzkammern und Vorratsräumen des Klosters zusammen, dass wir kaum alles zu tragen vermochten, so viel hatten sie.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_02"); //Diese Feuermagier scheinen ja einem überaus einträglichen Gewerbe nachzugehen ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_03"); //Wie dem auch sei Mensch, du hast dir deinen Anteil verdient.

	B_ShowGivenThings	("2000 Gold, 16 Schinken und 30 Wein erhalten");

	CreateInvItems	(hero, ItMi_Gold, 2000);
	CreateInvItems	(hero, ItFo_Bacon, 16);
	CreateInvItems	(hero, ItFo_Wine, 30);

	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_04"); //Wonach es mich jetzt gelüstet: magisches, bläulich schimmerndes Erz.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_05"); //Wenn ich noch damit meinen Drachenschatz bereichern könnte, müsste jeder andere Drache, König, oder was sonst auf dieser Erdkugel Rang und Schätze hat, vor Neid erblassen.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_06"); //Hier, nimm diesen Ring und ziehe ihn in einer Mine an, in welcher meine Diener für mich Erz schürfen können.

	B_GiveInvItems	(self, hero, ItRi_DragonRing, 1);

	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_07"); //Aber nun ... (gähnt) muss ich mich mal wieder zur Ruhe begeben.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_08"); //Der erfolgreiche Raubzug und die Schafe im Magen ... (gähnt) rufen förmlich nach Muße, Erholung und Schlaf.
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_09"); //(spricht im Schlaf) Gold ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_10"); //(spricht im Schlaf) ... Edelsteine ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_11"); //(spricht im Schlaf) ... Schafe ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_12"); //(spricht im Schlaf) ... Macht und Reichtum ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_13"); //(spricht im Schlaf) ... Macht und Unsterblichkeit ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_14"); //(spricht im Schlaf) ... geteilt mit dem, der untot ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_15"); //(spricht im Schlaf) ... mit dem magischen Bündnis ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_16"); //(spricht im Schlaf) ... in Höhlen, Kerkern und Folterkammern ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_17"); //(spricht im Schlaf) ... ein Gegenstand der das Leben birgt ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_18"); //(spricht im Schlaf) ... im Lande ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_19"); //(spricht im Schlaf) ... des Korns der Mutter ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_20"); //(spricht im Schlaf) ... das Moor ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_21"); //(spricht im Schlaf) ... und seine Bewohnerin ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_22"); //(spricht im Schlaf) ... sich verbirgt ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_23"); //(spricht im Schlaf) ... dem Mächtigen ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_24"); //(spricht im Schlaf) ... sie trägt ihn ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_25"); //(spricht im Schlaf) ... mhh, Schafsfleisch ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_26"); //(spricht im Schlaf) ... Schinken ...
	AI_Output(self, hero, "Info_Mod_Dragon_KlosterErfolg_22_27"); //(spricht im Schlaf) ... blonde Jungfrauen ...

	B_LogEntry_NS	(TOPIC_MOD_NL_DRACHEN, "Dragon gab mir einen Ring, welchen ich in einer Mine aufziehen soll, in der seine Diener Erz für ihn schürfen können.");
	B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Macht und Unsterblichkeit geteilt mit dem, der Untot ... magisches Bündnis, in Höhlen, Kerkern und Folterkammern ... ein Gegenstand der das Leben birgt, im Lande, des Korns der Mutter, das Moor und seine Bewohnerin, sich verbirgt dem Mächtigen, sie trägt ihn.");
	B_LogEntry	(TOPIC_MOD_NL_DRAGON, "Okey, der Drache hat mit einem Untoten ein Bündnis geschlossen, in welchem Unsterblichkeit geteilt wird.");

	if (Mod_HSNL_RatProblem == 1)
	{
		Mod_HSNL_RatProblem = 2;

		// ToDo

		//Npc_ExchangeRoutine	(Mod_520_DMR_Raven_NW, "RAT");
		//Npc_ExchangeRoutine	(Mod_517_DMR_Gomez_NW, "RAT");
		Npc_ExchangeRoutine	(Mod_551_KDF_Pyrokar_NW, "RAT");
		Npc_ExchangeRoutine	(Mod_592_PAL_Hagen_NW, "RAT");
		Npc_ExchangeRoutine	(Mod_774_KDW_Saturas_NW, "RAT");
		Npc_ExchangeRoutine	(Mod_527_SLD_Torlof_NW, "RAT");
		Npc_ExchangeRoutine	(Mod_925_KDF_Talamon_NW, "RAT");
	};
};

INSTANCE Info_Mod_Dragon_Mine (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Mine_Condition;
	information	= Info_Mod_Dragon_Mine_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_Mine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_KlosterErfolg))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dschinn_VM_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Mine_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_Mine_22_00"); //Du hast deine Aufgabe einmal mehr zu meiner Zufriedenheit erfüllt und eine ergiebige Mine gefunden. Hier, deine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 25);

	B_GivePlayerXP	(350);
};

INSTANCE Info_Mod_Dragon_Snorre (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Snorre_Condition;
	information	= Info_Mod_Dragon_Snorre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_Snorre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Moorhexe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Snorre_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_Snorre_22_00"); //Dieser dreckige kleine Dieb! Zu Asche werde ich ihn verbrennen!
	AI_Output(hero, self, "Info_Mod_Dragon_Snorre_15_01"); //Was ist geschehen?
	AI_Output(self, hero, "Info_Mod_Dragon_Snorre_22_02"); //Dieser dreiste Kobold Snorre hat sich mit einem Teil meiner Schätze aus dem Staub gemacht. Darunter besonders wertvolle Stücke aus dem Kloster. Grrr (schnaubt)
	AI_Output(self, hero, "Info_Mod_Dragon_Snorre_22_03"); //Meine Dracheninstinkte sagen mir, dass er nach Norden geflohen ist.  Tue mir den Gefallen und töte ihn.
	AI_Output(self, hero, "Info_Mod_Dragon_Snorre_22_04"); //Als besonderen Anreiz darfst du sogar die Schätze behalten.
	AI_Output(self, hero, "Info_Mod_Dragon_Snorre_22_05"); //Es muss ein Exempel statuiert werden, bevor noch andere auf dumme Gedanken kommen.

	B_LogEntry	(TOPIC_MOD_NL_STAB, "Der Kobold Snorre ist mit einem Teil von Dragon’s schätzen durchgebrannt. Er ist vermutlich nach Norden geflohen. Ob darunter auch der Stab war? Hier sehe ich ihn jedenfalls nicht.");

	B_StartOtherRoutine	(Kobold_11010_NW, "FLUCHT");

	Wld_InsertItem	(ItWr_SnorresNotiz, "FP_ROAM_UNTIER_02");
};

INSTANCE Info_Mod_Dragon_SnorreTot (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_SnorreTot_Condition;
	information	= Info_Mod_Dragon_SnorreTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_SnorreTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Snorre))
	&& (Npc_IsDead(Kobold_11010_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_SnorreTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_SnorreTot_22_00"); //Hmm, ich spüre Snorress Aura nicht mehr. Ich darf daher davon ausgehen, dass du deine Aufgabe zu meiner äußersten Zufriedenheit erfüllt hast.
	AI_Output(self, hero, "Info_Mod_Dragon_SnorreTot_22_01"); //Belohnt bist du ja durch die Schätze bereits mehr als zureichend.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Dragon_Kamm (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Kamm_Condition;
	information	= Info_Mod_Dragon_Kamm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragon_Kamm_Condition()
{
	if (Mod_NL_HasKamm >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Kamm_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_00"); //(faucht) Grrr, ein Feind hat einen meiner Verbündeten vernichtet und damit einen mächtigen magischen Pakt zerstört, der für mich und die anderen Drachen von unschätzbarer Bedeutung war.
	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_01"); //Dafür hat sich ein anderer Magier mit mir in Verbindung gesetzt und mich über den vermeintlichen Übeltäter unterrichtet.
	AI_Output(hero, self, "Info_Mod_Dragon_Kamm_15_02"); //(zu sich selbst) Oha ...
	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_03"); //Ich habe sein Bild ... Hier, nimm es und finde dieses Ungeziefer und dann bereite ihm einen schmerzhaften Tot.

	B_GiveInvItems	(self, hero, ItWr_Poster_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_04"); //Ich werde dich mit Gold und Reichtümern beladen, mehr als du zu tragen vermagst. (hält kurz inne) Ich kann mir nicht helfen, aber Ihr Menschen seht für mich alle gleich aus.
	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_05"); //Achja, und lauf besser nicht meinen Brüdern über den Weg.
	AI_Output(self, hero, "Info_Mod_Dragon_Kamm_22_06"); //Nach den jüngsten Vorkommnissen werden sie nicht damit zögern jeden Menschen, der sich ihnen nährt, sofort den Garaus zu machen.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Langsam wird die Luft dünn für mich beim Oberdrachen Dragon. Xeres scheint den Drachen über mich unterrichtet zu haben. Und ich bin mir nicht sicher, ob ich jetzt schon eine Chance gegen ihn habe, selbst, wenn er jetzt sterblich sein sollte. Vielleicht sollte ich mich erst mal mit etwas Unterstützung an einem schwächeren Exemplar erproben.");
};

INSTANCE Info_Mod_Dragon_Infos (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_Infos_Condition;
	information	= Info_Mod_Dragon_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Herr über Drachen und Dämonen, könnt ihr mir mehr verraten (...)";
};

FUNC INT Info_Mod_Dragon_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragon_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragon_Infos_15_00"); //Herr über Drachen und Dämonen, könnt ihr mir mehr verraten über euch und eure Geschöpfe? Was hat es auf sich ...
	AI_Output(self, hero, "Info_Mod_Dragon_Infos_22_01"); //(unterbricht, zurechtweisen) Sei nicht so neugierig Mensch. Du wirst das erfahren, was du zu wissen brauchst.
};

INSTANCE Info_Mod_Dragon_EXIT (C_INFO)
{
	npc		= Dragon_11009_NW;
	nr		= 1;
	condition	= Info_Mod_Dragon_EXIT_Condition;
	information	= Info_Mod_Dragon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dragon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dragon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};