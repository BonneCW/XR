INSTANCE Info_Mod_Griselda_Hi (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Hi_Condition;
	information	= Info_Mod_Griselda_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Griselda_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_00"); //Was, ein Besucher? Und dazu noch ein stattlicher Bursche.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_01"); //Erstaunlich, dir ist es tatsächlich gelungen zu mir vorzudringen.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_02"); //Was?! Wer bist du?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_03"); //(unschuldig) Ich? Ich bin nur ein altes Mütterchen.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_04"); //Verborgen in einer Höhle mit Schneegeistern?! Das glaube ich kaum. Lass das Gerede und erkläre dich!
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_05"); //(ironisch) Ohh, ein Mann mit Köpfchen. Und er lässt sich nichts vorspielen.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_06"); //Nun gut. Ich bin die Mutter einer Schwesternschaft, die sich den magischen Künsten verschrieben hat.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_07"); //Schwesternschaft magischer Künste? Du sprichst nicht zufällig von Hexen?!
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_08"); //Ohh, welch schlimmes Wort ... "Hexe". Ich ziehe die Umschreibung "Schwester der dunklen Kunst" vor.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_09"); //Was sollen diese Wortspielereien. Was machst du hier und was führst du im Schilde?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_10"); //Was ich hier mache? Du kamst doch zu mir.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_11"); //Die Frage muss also lauten: Was machst du hier?
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_12"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_13"); //Nach Wortspielchen scheint dir nicht das Gemüt zu stehen. Vielleicht darf es dann eine Prüfung sein?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_14"); //Ja, du siehst mir nach einem Mann aus, den es nach Prüfungen dürstet.
	AI_Output(hero, self, "Info_Mod_Griselda_Hi_15_15"); //Prüfungen? Was meinst du?
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_16"); //Nun, Prüfungen eben. Sie stellen Menschen auf die Probe, zeigen, ob sie Köpfchen, Mut, Stärke, Geschick besitzen.
	AI_Output(self, hero, "Info_Mod_Griselda_Hi_26_17"); //Bewährt man sich, so stehen Belohnungen in Aussicht. Was sagst du, mein Held?
};

INSTANCE Info_Mod_Griselda_Pruefung (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung_Condition;
	information	= Info_Mod_Griselda_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nun gut, ich kann es ja mal versuchen mit der Prüfung.";
};

FUNC INT Info_Mod_Griselda_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_15_00"); //Nun gut, ich kann es ja mal versuchen mit der Prüfung.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_01"); //Du kannst nun zeigen, ob du so viel über die Schöpfung weißt, wie du zu wissen glaubst.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_02"); //Genauer gesagt, den belebten Teil der Schöpfung, die Wesen und Kreaturen, welche auf dem Erdenrund wandeln, kriechen und krabbeln.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_03"); //In der Arena wird ein Geschöpf erscheinen und du kannst unter mehreren Wesen eines wählen, welches dagegen antreten soll.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_04"); //Dabei erhältst du im Kampf die Kontrolle über deine Kreatur und kannst sie nach deinem Willen lenken.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_05"); //Triumphierst du, erhältst du eine Belohnung.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_06"); //Versuchst du Kampf durch eine Rückverwandlung zu unterbrechen, gilt er als verloren.

	AI_PlayAni	(self, "T_PRACTICEMAGIC5");

	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_07"); //So, wie du sehen wirst, befindet sich nun ein Wolf in der Arena. Triff deine Wahl.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_26_08"); //Mit welcher Kreatur möchtest du kämpfen?

	B_StartOtherRoutine	(self, "ARENA");

	Wld_InsertNpc	(Wolf_Griselda_01, "HEXE_ARENA_SPAWN_SOLO_01");

	playerIsTransformed = FALSE;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Snapper.", Info_Mod_Griselda_Pruefung_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Fleischwanze.", Info_Mod_Griselda_Pruefung_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung, "Schaf.", Info_Mod_Griselda_Pruefung_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung_FalscheWahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_FalscheWahl_26_00"); //Hohoho, ganz, wie du wünschst, mein Dummerchen.
};

FUNC VOID Info_Mod_Griselda_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_C_15_00"); //Snapper.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung_C_26_01"); //So soll es sein.

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

FUNC VOID Info_Mod_Griselda_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_B_15_00"); //Fleischwanze.

	Info_Mod_Griselda_Pruefung_FalscheWahl();

	B_GiveInvItems	(self, hero, ItSc_TrfMeatbug, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

FUNC VOID Info_Mod_Griselda_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung_A_15_00"); //Schaf.

	Info_Mod_Griselda_Pruefung_FalscheWahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSheep, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung);
};

INSTANCE Info_Mod_Griselda_Pruefung2 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung2_Condition;
	information	= Info_Mod_Griselda_Pruefung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung2_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_00"); //Ohh, ich bin enttäuscht von dir.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_01"); //Das pulsierende Leben wäre dein Lohn gewesen ... Ach, wie bedauerlich, ich vergaß zu erwähnen:
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_02"); //Deine Wettschuld soll nun auf dieselbe Weise getilgt werden. (lacht meckernd)

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_03"); //Nun, es war wohl nicht allzu schwer die rechte Wahl zu treffen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_04"); //Zumindest kann ich nun ausschließen, dass ein kompletter Narr vor mir steht. (lacht)
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_05"); //Nichts für ungut, dein Lohn soll ein Teil der Lebenskraft deines getöteten Gegners sein.

		B_RaiseAttribute_Rest (hero, ATR_HITPOINTS_MAX, 14);

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_06"); //So, nachdem du den ersten Kampf erfolgreich überstanden hast, gelüstet es dich da nicht nach einer Fortsetzung?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_07"); //Auch jetzt gibt es wieder Preise für den glücklichen Knaben zu erringen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung2_26_08"); //Diesmal sind es eine Handvoll Gegner, zwei Blutfliegen und zwei Spinnen ... nichts, wovor es sich zu fürchten gilt, nur Bodensatz des Tierreiches.
	};
};

INSTANCE Info_Mod_Griselda_Pruefung3 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung3_Condition;
	information	= Info_Mod_Griselda_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will kämpfen.";
};

FUNC INT Info_Mod_Griselda_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung2))
	&& (Mod_Griselda_Arena == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_15_00"); //Ich will kämpfen.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung3_26_01"); //Triff deine Wahl.

	Wld_InsertNpc	(Blutfliege_Griselda_01, "HEXE_ARENA_TEAM_01");
	Wld_InsertNpc	(Blutfliege_Griselda_02, "HEXE_ARENA_TEAM_02");
	Wld_InsertNpc	(Spinne_Griselda_01, "HEXE_ARENA_TEAM_03");
	Wld_InsertNpc	(Spinne_Griselda_02, "HEXE_ARENA_TEAM_04");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Schattenläufer.", Info_Mod_Griselda_Pruefung3_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Skelett.", Info_Mod_Griselda_Pruefung3_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung3, "Harpie.", Info_Mod_Griselda_Pruefung3_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung3_Wahl_26_00"); //Wie du wünschst.
};

FUNC VOID Info_Mod_Griselda_Pruefung3_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_C_15_00"); //Schattenläufer.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfShadowbeast, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_B_15_00"); //Skelett.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSkeleton, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

FUNC VOID Info_Mod_Griselda_Pruefung3_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung3_A_15_00"); //Harpie.

	Info_Mod_Griselda_Pruefung3_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfHarpie, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung3);
};

INSTANCE Info_Mod_Griselda_Pruefung4 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung4_Condition;
	information	= Info_Mod_Griselda_Pruefung4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung3))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung4_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_00"); //Ohh, wie ernüchternd, den Giften hielt er nicht stand. Schade, denn als Lohn hätte dich die Fähigkeit erwartet, den Giften zu entrinnen ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_01"); //Ach, wie bedauerlich, ich vergaß zu erwähnen: Deine Wettschuld soll nun auf dieselbe Weise getilgt werden. (lacht meckernd)

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_02"); //Ohh, du hast mich überrascht. Du scheinst nicht auf den Kopf gefallen zu sein, mein Knabe. (lacht)
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung4_15_03"); //He, was sollte das mit dem Sumpfgolem!?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_04"); //Ohh, ich vergaß wohl, ihn zu erwähnen. Aber ich sagte doch "eine Handvoll", und das können durchaus fünf sein.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_05"); //Gleichermaßen ist ein Golem auch kein Geschöpf der Tierwelt.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_06"); //Gräme dich also nicht, du hast dich mutig geschlagen und Giften getrotzt, so erhältst du auch deine Belohnung, die Kraft den Giften zu entrinnen.

		if (Gift < 3)
		{
			Gift += 1;

			PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_07"); //Nun, nachdem du dich so wacker geschlagen hast, wirst du jetzt wohl kaum verzagen und der nächsten Prüfung mit Freuden entgegentreten.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_08"); //Dich erwarten nun die Elemente im Ring, ein Golem des Feuers und Eises gleichermaßen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_09"); //Es scheint gewagt, gar unmöglich, beide niederzustrecken, so erlasse ich es dir auch, dich beiden zu stellen.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_10"); //Nur einen musst du in die Knie zwingen, und dein Kampf gilt als bestanden.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_11"); //Mehr noch, sie werden sich nicht von der Stelle rühren.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung4_26_12"); //Das klingt doch nach einem rechten Kinderspiel. Was sagst du, mein Täubchen?
	};
};

INSTANCE Info_Mod_Griselda_Pruefung5 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung5_Condition;
	information	= Info_Mod_Griselda_Pruefung5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin so weit.";
};

FUNC INT Info_Mod_Griselda_Pruefung5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung4))
	&& (Mod_Griselda_Arena == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung5_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_15_00"); //Ich bin so weit.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung5_26_01"); //Gut, so triff dein Wahl.

	Wld_InsertNpc	(Firegolem_Griselda_01, "HEXE_ARENA_TEAM_01");
	Wld_InsertNpc	(Icegolem_Griselda_01, "HEXE_ARENA_TEAM_03");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Warg.", Info_Mod_Griselda_Pruefung5_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Bluthund.", Info_Mod_Griselda_Pruefung5_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung5, "Hase.", Info_Mod_Griselda_Pruefung5_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung5_Wahl_26_00"); //Ganz wie du wünschst.
};

FUNC VOID Info_Mod_Griselda_Pruefung5_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_C_15_00"); //Warg.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfWarg, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_B_15_00"); //Bluthund.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfBloodhound, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

FUNC VOID Info_Mod_Griselda_Pruefung5_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung5_A_15_00"); //Hase.

	Info_Mod_Griselda_Pruefung5_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfRabbit, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung5);
};

INSTANCE Info_Mod_Griselda_Pruefung6 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung6_Condition;
	information	= Info_Mod_Griselda_Pruefung6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung5))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung6_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_00"); //Ohh, wurde es dem zarten Knaben heiß und kalt im Ringe.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_01"); //Schade, denn als Lohn hätte dich die Widerstandkraft gegen Hitze und Kälte erwartet.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_02"); //Ach, wie bedauerlich, ich vergaß zu erwähnen: Deine Wettschuld soll nun auf dieselbe Weise getilgt werden. (lacht meckernd)

		Mod_Griselda_Arena = -1;

		Wld_PlayEffect	("INFERNALFIRE", hero, hero, 0, 0, 0, FALSE);

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_03"); //(überrascht) Ohh ... du machst mich fast sprachlos.
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung6_15_04"); //Warum, es war doch ein Kinderspiel.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_05"); //Nun gut, nun gut. Dann sollst du noch mehr dieser Spiele haben.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_06"); //Zuvor jedoch die Belohnung dafür, dass du den Elementen getrotzt hast. Die Widerstandkraft gegen sie soll in dir wachsen.

		PrintScreen	("+5 Schutz vor Feuer und Magie", -1, -1, FONT_SCREEN, 2);

		hero.protection[PROT_FIRE] += 5;
		hero.protection[PROT_MAGIC] += 5;

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_07"); //So, bereit für die nächste Runde?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_08"); //Als nächstes stellen sich dir drei langsame, träge Untote entgegen. Und dies nicht mal zu gleicher Zeit.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_09"); //Erst, wenn du einen bezwungen hast, erscheint der nächste.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_10"); //Ich hoffe, du bist nicht gekränkt, wenn ich dich mit dieser anspruchslosen Aufgabe betraue.
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung6_26_11"); //Wenn du bereit bist, so triff deine Wahl.

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TRANSFORM");
	};
};

INSTANCE Info_Mod_Griselda_Pruefung7 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung7_Condition;
	information	= Info_Mod_Griselda_Pruefung7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weiter geht's.";
};

FUNC INT Info_Mod_Griselda_Pruefung7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung6))
	&& (Mod_Griselda_Arena == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung7_Info()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_15_00"); //Weiter geht's.
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung7_26_01"); //Welches Wesen soll es diesmal sein?

	Wld_InsertNpc	(Zombie_Griselda_01, "HEXE_ARENA_TEAM_01");

	playerIsTransformed = FALSE;

	Mod_Griselda_Arena = 0;

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);

	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Snapper.", Info_Mod_Griselda_Pruefung7_C);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Keiler.", Info_Mod_Griselda_Pruefung7_B);
	Info_AddChoice	(Info_Mod_Griselda_Pruefung7, "Golem.", Info_Mod_Griselda_Pruefung7_A);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_Wahl()
{
	AI_Output(self, hero, "Info_Mod_Griselda_Pruefung7_Wahl_26_00"); //Wie du wünschst.
};

FUNC VOID Info_Mod_Griselda_Pruefung7_C()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_C_15_00"); //Snapper.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_B()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_B_15_00"); //Keiler.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfKeiler, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

FUNC VOID Info_Mod_Griselda_Pruefung7_A()
{
	AI_Output(hero, self, "Info_Mod_Griselda_Pruefung7_A_15_00"); //Golem.

	Info_Mod_Griselda_Pruefung7_Wahl();

	B_GiveInvItems	(self, hero, ItSc_TrfGolem, 1);

	Info_ClearChoices	(Info_Mod_Griselda_Pruefung7);
};

INSTANCE Info_Mod_Griselda_Pruefung8 (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pruefung8_Condition;
	information	= Info_Mod_Griselda_Pruefung8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Griselda_Pruefung8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Griselda_Pruefung7))
	&& (Mod_Griselda_Arena > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Griselda_Pruefung8_Info()
{
	if (Mod_Griselda_Arena == 1)
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_00"); //Ohh, hat das Knäblein gekränkelt?
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_01"); //Schade, denn als Lohn hätte dich die Widerstandkraft gegen Krankheiten erwartet ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_02"); //Ach, wie bedauerlich, ich vergaß zu erwähnen: Deine Wettschuld soll nun auf dieselbe Weise getilgt werden. (lacht meckernd)

		Mod_Griselda_Arena = -1;

		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_03"); //Erstaunlich, selbst dem Hauch der Pest wusstest du durch geschickte Wahl zu Widerstehen.
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung8_15_04"); //So soll auch deine Widerstandskraft gegen Krankheiten wachsen.

		if (Krankheit < 4)
		{
			Krankheit += 1;

			PrintScreen	("Deine Resistenzen gegenüber Erkrankungen sind gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		if (KHDP < 4)
		{
			KHDP += 1;

			//PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
		};

		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_05"); //So, gespielt hast du und viele Preise gewonnen. Willst du nicht noch ein letztes Mal spielen und mir die Möglichkeit eröffnen, alles zurück zu gewinnen?
		AI_Output(hero, self, "Info_Mod_Griselda_Pruefung8_15_06"); //Was meinst du? Ich glaube ...
		AI_Output(self, hero, "Info_Mod_Griselda_Pruefung8_26_07"); //(krächzt) Es ist nicht so, dass du die Wahl hättest, hahahaha.
	};
};

INSTANCE Info_Mod_Griselda_Pickpocket (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_Pickpocket_Condition;
	information	= Info_Mod_Griselda_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Griselda_Pickpocket_Condition()
{
	C_Beklauen	(117, ItPo_Perm_Health, 1);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

	Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_BACK, Info_Mod_Griselda_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Griselda_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

		Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Griselda_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Griselda_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Griselda_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Griselda_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Griselda_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Griselda_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Griselda_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Griselda_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Griselda_EXIT (C_INFO)
{
	npc		= Mod_7643_HEX_Griselda_EIS;
	nr		= 1;
	condition	= Info_Mod_Griselda_EXIT_Condition;
	information	= Info_Mod_Griselda_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Griselda_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Griselda_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};