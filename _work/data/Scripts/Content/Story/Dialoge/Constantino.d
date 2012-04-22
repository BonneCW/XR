INSTANCE Info_Mod_Constantino_Hi (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Hi_Condition;
	information	= Info_Mod_Constantino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Constantino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Constantino_Hi_10_00"); //Hä? Das kann dir ja wohl egal sein, oder?
};

INSTANCE Info_Mod_Constantino_Irdorath (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Irdorath_Condition;
	information	= Info_Mod_Constantino_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will eine Seereise Unternehmen, die von höchster Bedeutung für das Wohl von Khorinis ist.";
};

FUNC INT Info_Mod_Constantino_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_00"); //Ich will eine Seereise Unternehmen, die von höchster Bedeutung für das Wohl von Khorinis ist.
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_01"); //Dafür brauche ich unbedingt einen Alchemisten in meiner Mannschaft, der sich auf Tränke und Pflanzen versteht ...
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_02"); //Was, wie, und mit so etwas kommst du zu mir?
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_03"); //Nein, also wirklich, da wirst du schon jemand anderen finden müssen, wenn das nicht gerade ein schlechter Scherz sein soll.
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_04"); //Ich werde ganz bestimmt nicht dieses sichere Eiland verlassen, um Orks und Piraten in die Hände zu fallen ...
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_05"); //(halblaut) ... wovon es auch hier genug gibt. Sicheres Eiland ...

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Nein, Constantino werde ich wohl kaum zu der Seereise überreden können.");
};

INSTANCE Info_Mod_Constantino_Alchemist (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Alchemist_Condition;
	information	= Info_Mod_Constantino_Alchemist_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns handeln.";
};

FUNC INT Info_Mod_Constantino_Alchemist_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Alchemist_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Alchemist_15_00"); //Lass uns handeln.
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_01"); //Siehst du nicht, dass ich gerade arbeite?
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_02"); //Wenn ich mit jedem quatschen würde, der hier angeschlichen kommt, würde ich jeden Tag sicher ... fünf Minuten oder mehr vergeuden!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Constantino kann mir Tränke und Kräuter verkaufen.");
};

INSTANCE Info_Mod_Constantino_Lehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrling_Condition;
	information	= Info_Mod_Constantino_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist einer der fünf Meister.";
};

FUNC INT Info_Mod_Constantino_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_00"); //Du bist einer der fünf Meister.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_01"); //Eigentlich bin ich der Einzige, der es wert ist, Meister genannt zu werden. Die anderen sind Stümper.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_02"); //Wie dem auch sei, ich möchte Lehrling bei einem der Meister werden.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_03"); //Du? (lacht) Na, das wird ein Spaß!
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_04"); //Stellst du mir eine Aufgabe?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_05"); //Nein. Für solche Kinkerlitzchen habe ich keine Zeit.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_06"); //Wie kann ich dann deine Stimme bekommen?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_07"); //Gar nicht.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_08"); //Hmm.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_09"); //Hmm.

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);

	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Du kannst durch mich eine Menge Zeit sparen!", Info_Mod_Constantino_Lehrling_C);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Wir wären sicher ein gutes Team!", Info_Mod_Constantino_Lehrling_B);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Das bedeutet wohl, dass ich Lord Andre einschalten muss.", Info_Mod_Constantino_Lehrling_A);
};

FUNC VOID Info_Mod_Constantino_Lehrling_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_00"); //Du kannst durch mich eine Menge Zeit sparen!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_01"); //Aha. Du bist also bereit, jede Aufgabe zu erledigen, die ich dir stelle?
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_02"); //Fast jede.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_03"); //(lacht in sich hinein) Ich habe hier ein kleines Rezept, für das ich noch einige Zutaten benötige. Die wirst du mir bringen.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_04"); //Was sind das für Zutaten?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_05"); //Ein Zwillingsdorn, vier Sumpfkrautpflanzen, und ... ja, einen Blutfliegenstachel und ... hmm ... ja, zwei volle Reagenzgläser vom Sekret aus einem Minecrawler-Ei.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_06"); //Hier habe ich eine Liste.

	B_GiveInvItems	(self, hero, Mod_ConstantinosZutatenliste, 1);

	Mod_MinecrawlerEi	=	0;

	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_07"); //Wo finde ich die Zutaten?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_08"); //Draußen. Die Klosterfuzzis haben einiges an Ingredenzien. Würde vorschlagen, dass du gleich da bleibst.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_09"); //In Ordnung, ich besorg dir den Kram.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_10"); //Man sieht sich in ein paar Jahren.

	Log_CreateTopic	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "Um Constantinos Stimme zu erhalten, soll ich ihm die Zutaten für einen neuen Trank bringen. Die Pflanzen sind ja noch auffindbar, aber woher ich ein Minecrawler-Ei und einen Blutfliegenstachel bekommen soll, ist mir schleierhaft. Constantino gab mir einen Tipp mit dem Kloster, allerdings muss das nichts heißen. Vielleicht sollte ich dort einfach mal rumfragen.");

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);
};

FUNC VOID Info_Mod_Constantino_Lehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_B_15_00"); //Wir wären sicher ein gutes Team!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_B_10_01"); //Wozu soll ein Team gut sein? Ich kann nicht gleichzeitig für zwei denken.
};

FUNC VOID Info_Mod_Constantino_Lehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_A_15_00"); //Das bedeutet wohl, dass ich Lord Andre einschalten muss.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_A_10_01"); //(lacht) Andre hat andere Sorgen, als sich um dich zu kümmern.
};

INSTANCE Info_Mod_Constantino_Stimme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Stimme_Condition;
	information	= Info_Mod_Constantino_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Da hast du alles.";
};

FUNC INT Info_Mod_Constantino_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& ((Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	|| (Npc_HasItems(hero, ItAt_CrawlerQueen) >= 1))
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 1)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 4)
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_00"); //Da hast du alles.

	B_ShowGivenThings	("Zutaten gegeben");

	if (Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	{
		Npc_RemoveInvItems	(hero, ItFo_Potion_Elixier_Egg, 2);

		B_GivePlayerXP	(400);

		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_01"); //Na gut. Aber stör mich bloß nicht weiter!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_02"); //(erregt) Ein Minecrawler-Ei? Ich brauche das Sekret, habe ich gesagt!
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_03"); //Bist du zu faul, zum Alchemietisch zu gehen und es ordentlich zu extrahieren, oder was?
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_04"); //Alles muss man selbst machen ...

		Npc_RemoveInvItems	(hero, ItAt_CrawlerQueen, 1);

		B_GivePlayerXp	(300);
	};

	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 1);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 4);
	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_05"); //Bekomme ich denn jetzt deine Zustimmung?
	AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_06"); //(gereizt) Ja, ja. Auf Wiedersehen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	Mod_LehrlingsStimmen += 1;
	
	Npc_RemoveInvItems	(hero, Mod_ConstantinosZutatenliste, 1);

	B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "Constantino war sehr zufrieden mit mir. Er hat mir seine Stimme gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_Aufnahme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Aufnahme_Condition;
	information	= Info_Mod_Constantino_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich möchte dein Lehrling werden.";
};

FUNC INT Info_Mod_Constantino_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_00"); //Ich möchte dein Lehrling werden.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_01"); //(verdutzt) Aha.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_02"); //Weihst du mich in die Geheimnisse der Alchemie ein?
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_03"); //Ist es dir ... (hüstelt) Ist es dir wirklich wichtig? Kannst du hart arbeiten und dabei ruhig sein?

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);

	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "Nein.", Info_Mod_Constantino_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "Ja.", Info_Mod_Constantino_Aufnahme_A);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_B_10_01"); //Wusste ich's doch! Lass mich in Ruhe!

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_01"); //Dann ... na schön, na schön. Werd halt mein Lehrling.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_02"); //Aber um es gleich klar zu stellen: Du kriegst bei mir kein Geld und kein Essen. Nur Wissen. Pures Wissen. Kapiert?
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_03"); //Klar.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_04"); //Warte, irgendwo müsste ich den Stadtfummel doch noch haben ... so eine verkalkte Tradition mal wieder ... Da hab ich ihn. Nimm schon.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("Bürgerkleidung erhalten");

	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_05"); //Die Geheimnisse der Alchemie willst du lernen, oho. Aber wir werden ganz klein anfangen.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_06"); //Ich bezweifle nämlich, dass du mit meinem Intellekt mithalten kannst.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_07"); //Den untersten Schwierigkeitsgrad stellen die Essenzen dar. Mit ein wenig Übung schafft die selbst das unbegabteste Trampeltier.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_08"); //Aber auch hier kann man genügend falsch machen. Also pass gut auf!
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_09"); //Die Basis dieser beiden Tränke ist der Feldknöterich. Diesen zerstößt du in einem Mörser unter Hinzugabe von ein paar Tropfen Wasser.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_10"); //Erst danach fügst du die beiden Heilpflanzen beziehungsweise Feuernesseln hinzu.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_11"); //Das ist wichtig, damit die Pflanzen beim Zerstoßen die Regenerationskraft des Feldknöterichs aufnehmen.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_12"); //Andernfalls erhältst du wohlschmeckenden, aber wirkungslosen Tee.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_13"); //Den Sud erhitzt du dann bis zum Kochen über der Flamme und füllst ihn ab.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_14"); //Ich denke, ich hab's.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_15"); //Das wollen wir doch mal sehen. Du besorgst dir jetzt also die Zutaten und braust je fünf Heil- und Manaessenzen. Danach sprechen wir uns wieder.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 1;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Constantino, der Alchemist, hat mich als seinen Lehrling aufgenommen. Dadurch bin ich jetzt ein Bürger der Stadt.", "Constantino gab mir die Aufgabe, fünf Mana- und Heilessenzen herzustellen. Dafür muss ich erst die nötigen Zutaten sammeln und diese dann am Alchemietisch in der richtigen Reihenfolge zusammenfügen. Hmm, wie war die noch mal?", "Da Constantino mich als seinen Lehrling aufgenommen hat ist es mir jetzt möglich das Obere Viertel zu betreten.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, "Constantino, der Alchemist, hat mich als seinen Lehrling aufgenommen. Dadurch bin ich jetzt ein Bürger der Stadt.", "Constantino gab mir die Aufgabe, fünf Mana- und Heilessenzen herzustellen. Dafür muss ich erst die nötigen Zutaten sammeln und diese dann am Alchemietisch in der richtigen Reihenfolge zusammenfügen. Hmm, wie war die noch mal?");
	};

	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Zutaten ´ESSENZ DER HEILUNG´: 2 Heilpflanzen und 1 Feldknöterich.");
	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Zutaten ´MANA ESSENZ´: 2 Feuernesseln und 1 Feldknöterich.");

	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

INSTANCE Info_Mod_Constantino_GildenZeug (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_GildenZeug_Condition;
	information	= Info_Mod_Constantino_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_00"); //Bist du auch zu den Milizen gekrochen? Meinst wohl, das macht mir Angst? (lacht meckernd)
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_01"); //Du bist jetzt Novize? Glaub ja nicht, was dir die Feuermagier über Alchemie erzählen! Alles nur Geschwätz!
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_02"); //Hat Vatras dein Hirn auch noch vernebelt, hä?
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_03"); //Wenn ich sehe, was aus dir so wird, bereue ich es schon, mich jemals mit dir eingelassen zu haben.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_04"); //Beliar zum Gruß! (lacht meckernd)
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dir alle Tränke gebraut.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (Npc_HasItems(hero, ItPo_Health_01) >= 5)
	&& (Npc_HasItems(hero, ItPo_Mana_01) >= 5)
	&& (Mod_Count_Health_01 >= 5)
	&& (Mod_Count_Mana_01 >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_00"); //Ich habe dir alle Tränke gebraut.

	B_ShowGivenThings	("5 Essenzen der Heilung und 5 Manaessenzen gegeben");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_01"); //(riecht) Das Gefühl eines Könners fehlt dir wahrlich. Aber immerhin werden sie mehr helfen als schaden.

	B_ShowGivenThings	("5 Essenzen der Heilung und 5 Manaessenzen erhalten");

	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_02"); //Willst du die Tränke nicht behalten?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_03"); //Ich habe in zwei Minuten bessere gebraut. Was soll ich also damit?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_04"); //Was wirst du mir als nächstes beibringen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_05"); //Als Erstes brauche ich jetzt meine Ruhe. Deine Fragestunde ist hiermit beendet.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_06"); //Komm später wieder, falls ich noch mal Zeit für dich finde.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest2_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gern mehr lernen.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_00"); //Ich würde gern mehr lernen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_01"); //(unwirsch) Ich würde deine Wissbegierde mehr zu schätzen wissen, wenn du etwas begabter wärst.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_02"); //Das bezweifle ich.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_03"); //So? Dann beweise mir das Gegenteil!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_04"); //Womit wir beim Thema wären.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_05"); //(zähneknirschend) In Ordnung. Ich will mal prüfen, ob es dir im ersten Anlauf gelingt, einen Geschwindigkeitstrank herzustellen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_06"); //Alles, was du an Zutaten brauchst, sind Snapperkraut und Feldknöterich. Die Zubereitung ist jedoch kompliziert:
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_07"); //Zuerst musst du das Snapperkraut in heißes Wasser legen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_08"); //Nach etwa zwei Minuten nimmst du das Kraut aus dem Wasser und hängst es über Mörser, in dem du nun den Feldknöterich zerstößt.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_09"); //Derweil tropft die Seele des Krauts auf den Knöterich und vermischt sich.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_10"); //Sobald das Kraut abgetropft ist, verbrennst du den Rest im Feuer und mischst die Asche zusammen mit der Knöterich-Pampe.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_11"); //Diese Mischung kippst du in eine Schüssel voll Wasser und erhitzt diese.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_12"); //Sobald das Wasser kochst, schöpfst du die Mischung ab. Die Flüssigkeit kannst du nun abfüllen.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_13"); //Klingt wirklich nicht so einfach.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_14"); //Ein richtiger Alchemist kann sich auch auf sein Gefühl verlassen.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, "Constantino will mich dieses Mal wirklich herausfordern. Ich soll ihm einen Geschwindigkeitstrank zubereiten. Wenn ich bloß noch wüsste, was ich alles bedenken muss.");

	PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER GESCHWINDIGKEIT´: 1 Snapperkraut und 1 Feldknöterich");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest3_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich wär dann soweit.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest2))
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Mod_Darf_Speed == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_00"); //Ich wär dann soweit.

	B_GiveInvItems	(hero, self, ItPo_Speed, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_01"); //Lass mal sehen. (schnuppert) Hmm, nicht mal ganz schlecht.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_02"); //Bekomme ich den Trank jetzt auch wieder?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_03"); //Hä? Nein, nein, der bleibt schön bei mir.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_04"); //(zu sich selbst) Das ist wohl gleichbedeutend mit einem Kompliment.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_05"); //(laut) Und wann kann ich wiederkommen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_06"); //Bald. Bin ich froh, wenn die Zeit vorbei ist.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest4_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest4_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_00"); //Dachte schon, du hättest deine Ausbildung bei mir ganz vergessen.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_01"); //Soll ich wieder gehen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_02"); //Jetzt sei mal nicht gleich eingeschnappt!
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_03"); //Du hast mich heute in einer gnädigen Stimmung erwischt, deswegen lass uns nun die permanenten Tränke ansprechen. Die Königsdisziplin der Alchemisten.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_04"); //Ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_05"); //Beginnen wir mit der Geschichte: Eine positive permanente Wirkung mit einem Trank erzielen zu können, erschien lange Zeit unmöglich.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_06"); //In ihrem Potenzial ist sie vergleichbar mit dem Stein der Weisen, im Übrigen mein gegenwärtiges Projekt.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_07"); //Du willst den Stein der Weisen herstellen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_08"); //Jeder Alchemist will das. Aber ich bin der Einzige, der das Können dazu besitzt.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_09"); //Zurück zum Thema: Erst vor einigen Dutzend Jahren fand ein zweitklassiger Alchemist - natürlich durch Zufall - heraus, wie die Tränke beschaffen sein müssen, damit ihre Auswirkungen nicht verfliegen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_10"); //Es gibt eine sehr seltene Pflanze, den Kronstöckl. Auf den ersten Blick erscheint er wertlos und wurde deshalb in der Forschung lange Zeit nicht verwendet.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_11"); //Erst in Verbindung mit tendenziell permanenten Pflanzen wie der Drachenwurzel und der Goblinbeere entfaltet er seine volle Wirkung.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_12"); //Die Herstellung des permanenten Tranks ist einfach, erfordert aber hohe Präzision.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_13"); //Du musst den Kronstöckl und die für den jeweiligen Trank benötigte andere Pflanze in einer Laborwasserflasche leicht erhitzen, sodass das Wasser anfängt zu kochen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_14"); //Sobald die ersten Luftblasen aufsteigen, verschließt du die Flasche. Keine Sekunde früher oder später, verstanden?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_15"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_16"); //Denkst du! Präge dir daraufhin gut ein, wann du die Laborwasserflasche verdichtet hast.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_17"); //Exakt drei Tage später, auf die Stunde genau, entfernst du die Pflanzenteile aus der Flasche und hast den permanenten Trank.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_18"); //Solltest du dich nicht daran halten, wird der Trank zu stark oder zu schwach und verliert damit seine ganze Wirkung.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_19"); //Nun probiere dich an einem Elixier des Lebens. Die Zutaten dafür sind eine Heilwurzel und eben Kronstöckl.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_20"); //Ich werde mich dran versuchen.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, "Um ein Elixier des Lebens zu brauen, brauche ich eine Heilwurzel und einen Kronstöckl. Diese müssen genau drei Tage lang in einer verschlossenen Laborwasserflasche aufbewahrt werden, bevor der Trank fertig ist.");

	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Zutaten ´ELIXIER DES LEBENS´: 1 Heilwurzel und 1 Kronstöckel.");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest5_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Trank ist fertig.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest4))
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Mod_Darf_PermHealth == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest5_15_00"); //Der Trank ist fertig.

	B_GiveInvItems	(hero, self, ItPo_Perm_Health, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_01"); //Ich muss zugeben, dass du nicht ganz untalentiert scheinst.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_02"); //Nur die wenigsten unserer Zunft wissen richtig mit dem Kronstöckl umzugehen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_03"); //Damit habe ich dir schon alles Wichtige beigebracht.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_04"); //Ich werde mir jetzt eine Aufgabe für dich überlegen, mit der ich dich prüfe. Komm bald wieder.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_SUCCESS);

	if (Mod_PermTrank_Tries == 1)
	{
		B_GivePlayerXP	(200);
	}
	else
	{
		B_GivePlayerXP	(100);
	};

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest6_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest5))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_00"); //(ungeduldig) Komm her, komm her!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_15_01"); //Wieso so einladend heute?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_02"); //Ich bin kurz vor dem Durchbruch! Dem wohl letzten Durchbruch der Menschheit!

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "Du bist dabei, die Bürokratie abzuschaffen?", Info_Mod_Constantino_LehrlingQuest6_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "Du meinst deine Untersuchungen zum Stein der Weisen?", Info_Mod_Constantino_LehrlingQuest6_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_C()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_00"); //In der Theorie habe ich ihn schon fertig entwickelt. Was mir noch fehlt, sind einige Materialien.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_01"); //Bis auf einen herkömmlichen Stein und die Laborwasserflaschen hab ich so gut wie nichts im Haus.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_02"); //Du! Ich wollte dir eh noch einen Auftrag stellen.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_C_15_03"); //Das ist allerdings richtig.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_04"); //Du wirst also die Liste abarbeiten. Und zwar zügig!

	B_GiveInvItems	(self, hero, ItWr_SteinDerWeisen, 1);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "Constantino behauptet, kurz vor der Erstellung des Steins der Weisen zu stehen. Ich habe eine Liste mit Zutaten erhalten, die er noch benötigt.");
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_B_15_00"); //Du bist dabei, die Bürokratie abzuschaffen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_B_10_01"); //Wer sich davor nicht zu schützen weiß, ist selbst Schuld! Nein, ich meine den Stein der Weisen.

	Info_Mod_Constantino_LehrlingQuest6_C();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_A_15_00"); //Du meinst deine Untersuchungen zum Stein der Weisen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_A_10_01"); //Was denn sonst!

	Info_Mod_Constantino_LehrlingQuest6_C();
};

INSTANCE Info_Mod_Constantino_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest7_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest6))
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 5)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= 3)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 5)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 30)
	&& (Npc_HasItems(hero, ItMi_Addon_WhitePearl) >= 5)
	&& (Npc_HasItems(hero, ItPo_Perm_Str) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Dex) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Mana) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 5);
	Npc_RemoveInvItems	(hero, ItMi_RockCrystal, 3);
	Npc_RemoveInvItems	(hero, ItMi_Sulfur, 2);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMi_Coal, 5);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 30);
	Npc_RemoveInvItems	(hero, ItMi_Addon_WhitePearl, 5);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Str, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Dex, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Health, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Mana, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_00"); //Hast du endlich alles?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_01"); //Ja.

	B_ShowGivenThings	("Zutaten für Stein der Weisen gegeben");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_02"); //Dann lass mich jetzt allein, bis ich fertig bin.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_03"); //Warte mal. Das geht mir gerade etwas zu schnell.

	B_GivePlayerXP	(1000);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Was hast du mit dem Stein der Weisen vor?", Info_Mod_Constantino_LehrlingQuest7_C);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Wie bist du auf das Herstellungsverfahren gekommen?", Info_Mod_Constantino_LehrlingQuest7_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Was bewirkt der Stein der Weisen?", Info_Mod_Constantino_LehrlingQuest7_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_D()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_00"); //Das muss jetzt aber reichen, wichtige Experimente warten. Ich sollte morgen soweit sein, dass ich den Stein ausprobieren kann.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_01"); //Wenn du ... äh, für deine Mühen eine kleine Kostprobe erhalten willst, solltest du vorbeikommen.

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "Ich soll Constantino einen Tage Zeit lassen, damit er die nötigen Experimente zum Stein der Weisen durchführen kann.");

	Mod_Constantino_SDW_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_C_15_00"); //Was hast du mit dem Stein der Weisen vor?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_C_10_01"); //Ich werde dem König von Myrtana ein Angebot machen, das er kaum ausschlagen können wird. Nachdem ich selbst unsterblich geworden bin.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_00"); //Wie bist du auf das Herstellungsverfahren gekommen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_01"); //(hastig) Indem ich meinen Grips angestrengt habe.

	if (Mod_Ignaz_Bruder == 1)
	{
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_02"); //Du hast die Forschungen von deinem Bruder übernommen, richtig?
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_03"); //Bruder? Wer ...?
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_04"); //Ignaz hat es mir selbst vor einiger Zeit erzählt.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_05"); //(lacht schrill) Dem Spinner glaubst du doch wohl nicht!
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_06"); //Ihn hat der Stein der Weisen irre gemacht.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_07"); //Er hat es falsch angestellt, der Hochstapler! Er hat sicher gepfuscht! War immer nur der Zweitbeste.
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_08"); //An der Version habe ich so meine Zweifel ...
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_09"); //(aufgebracht) Was interessiert mich das?
	};

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_A_15_00"); //Was bewirkt der Stein der Weisen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_01"); //Er ist das ultimative Aufputschmittel für den Körper. Eine Rundumerneuerung und Verjüngungskur.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_02"); //Wenn meine Berechnungen stimmen, wovon ich stark ausgehe, könnte man durch den Stein quasi Unsterblichkeit erlangen.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest8_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest7))
	&& (Wld_GetDay() > Mod_Constantino_SDW_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest8_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_00"); //Bist du auch so aufgeregt wie ich?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest8_15_01"); //Eine gewisse Gespanntheit kann ich nicht leugnen.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_02"); //Alles in allem war die Zeit mit dir nicht so schlimm. Hätte auch dümmere Lehrlinge kriegen können.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_03"); //Darum sollst du eine Kostprobe der Ewigkeit bekommen.

	createInvItems	(self, ItMi_SteinDerWeisen, 2);

	B_GiveInvItems	(self, hero, ItMi_SteinDerWeisen, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_04"); //Aber nun werde Zeuge meines Aufstiegs zur Unsterblichkeit!

	B_UseItem	(self, ItMi_SteinDerWeisen);

	AI_PlayAni	(self, "T_MAGRUN_2_HEASHOOT");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest9_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, wie ist es gelaufen?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_00"); //Und, wie ist es gelaufen?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_01"); //Gnah? Im Speziellen oder Besonderen?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_02"); //Ganz allgemein ...
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_03"); //Ich hüpfe von Lolke zu Lolke. Mein Käfig wird nicht geputzt, aber die Sonne scheint heraus.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_04"); //Oh nein ...
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_05"); //Komm! Hüpf doch mit! (lacht irre)

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest10 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest10_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest10_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bist du immer noch verrückt?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest9))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest10_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_00"); //Bist du immer noch verrückt?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_01"); //Ich bin nicht verrückt!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_02"); //Den Göttern sei Dank. Aber dein Körper ist auch nicht jünger geworden.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_03"); //Gnah? Natürlich ist er jünger! Siehst du mich nicht, wenn ich zwischen den Lolken springe wie eine junge Warze?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_04"); //(seufzt) Nein, ehrlich gesagt nicht.
};

INSTANCE Info_Mod_Constantino_PaketZauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_PaketZauberwasser_Condition;
	information	= Info_Mod_Constantino_PaketZauberwasser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_PaketZauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Namib))
	&& (Npc_HasItems(hero, ItMi_LesterPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_00"); //Was willst du?
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_01"); //Ich soll dir dieses Paket hier von der Bruderschaft bringen.

	B_GiveInvItems	(hero, self, ItMi_LesterPaket, 1);
	Npc_RemoveInvItems	(self, ItMi_LesterPaket, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_02"); //Ah, das wurde aber auch Zeit. Hier.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_03"); //Bring das Baal Namib. Sag ihm es ist das Beste, das zurzeit auf dem Markt ist!

	CreateInvItems	(self, ItMi_DuengerPaket, 1);
	B_GiveInvItems	(self, hero, ItMi_DuengerPaket, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_04"); //Ich soll auch eine Flasche Zauberwasser mitnehmen.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_05"); //Zauberwasser? Du hast Glück, ich hab bloß noch eine Flasche. Das macht 500 Goldstücke.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_06"); //Setz es auf Lesters Rechnung.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_07"); //WAS? Der Trunkenbold steht bei mir ohnehin schon mit 3000 Goldstücken in der Kreide.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_08"); //Nix da! Entweder du zahlst die 500 Goldstücke samt Lesters Schulden oder du bekommst gar nichts!

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Hast du nicht vielleicht etwas zu tun für mich?", Info_Mod_Constantino_PaketZauberwasser_ToDo);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Vergiss es!", Info_Mod_Constantino_PaketZauberwasser_Nein);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "So viel habe ich nicht bei mir.", Info_Mod_Constantino_PaketZauberwasser_NotEnough);

	if (Npc_HasItems(hero, ItMi_Gold) >= 3500)
	{
		Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Na gut. Hier hast du das Gold.", Info_Mod_Constantino_PaketZauberwasser_Zahlen);
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_ToDo()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_00"); //Hast du nicht vielleicht etwas zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_01"); //Nun jetzt da du es erwähnst ... Wie ich bereits gesagt hab geht mein Zauberwasservorrat zur Neige.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_02"); //Besorge mir die Zutaten für eine neue Ladung, dann sehen wir, wie wir ins Geschäft kommen.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_03"); //Na gut. Was brauchst du alles?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_04"); //Ich brauche 10 Flaschen Wasser, 2 Flaschen Salzwasser, 5 Feuernesseln und 5 Heilpflanzen, 3 Blauflieder und einen Feldknöterich. Hier hast du eine Liste.

	CreateInvItems	(self, ItWr_ConstantinosZauberwasserliste, 1);
	B_GiveInvItems	(self, hero, ItWr_ConstantinosZauberwasserliste, 1);

	Mod_ConstantinoZauberwasser = 1;

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Um Lesters Schulden abzuarbeiten muss ich Constantino die Zutaten für Zauberwasser bringen. Er hat mir dazu eine Liste gegeben.");

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Zurück", Info_Mod_Constantino_PaketZauberwasser_BACK);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Wo finde ich Feldknöterich?", Info_Mod_Constantino_PaketZauberwasser_Feldknöterich);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Wo finde ich Blauflieder?", Info_Mod_Constantino_PaketZauberwasser_Blauflieder);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Wo finde ich Heilpflanzen?", Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Wo finde ich Feuernesseln?", Info_Mod_Constantino_PaketZauberwasser_Feuernesseln);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Woher bekomme ich Salzwasser", Info_Mod_Constantino_PaketZauberwasser_Salzwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Nein()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Nein_15_00"); //Vergiss es!
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Nein_10_01"); //Dann verschwinde von hier!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab mich geweigert das Gold zu bezahlen. Ich muss einen anderen Weg finden, um an das Zauberwasser zu kommen.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feldknöterich()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feldknöterich_15_00"); //Wo finde ich Feldknöterich?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feldknöterich_10_01"); //Hier in der Stadt wirst du keinen finden. Geh raus und schau dich um.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Blauflieder()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_15_00"); //Wo finde ich Blauflieder?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_10_01"); //Das Zeug wächst überall, schau dich mal an Wegrändern um.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_15_00"); //Wo finde ich Heilpflanzen?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_10_01"); //An den Wegen und im Wald wirst du sicher was finden.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feuernesseln()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_15_00"); //Wo finde ich Feuernesseln?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_10_01"); //Die gibts fast überall. Beim Kloster der Feuermagier sollen aber recht viele sein.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Salzwasser()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_15_00"); //Woher bekomme ich Salzwasser
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_10_01"); //Wo wirst du wohl Salzwasser finden? Im Meer, du Idiot! Frag den Fischer, vielleicht füllt er dir was ab.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_NotEnough()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_15_00"); //So viel habe ich nicht bei mir.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_10_01"); //Dann verschwinde von hier!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab mich geweigert das Gold zu bezahlen. Ich muss einen anderen Weg finden, um an das Zauberwasser zu kommen.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Zahlen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_15_00"); //Na gut. Hier hast du das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 3500);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_10_01"); //Gut. Hier hast du das Zauberwasser.

	CreateInvItems	(self, ItMi_Zauberwasser, 1);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab das Zauberwasser von Constantino. Jetzt aber auf zu Lester.");

	Mod_ConstantinoZauberwasser = 3;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

INSTANCE Info_Mod_Constantino_Zauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alles.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_Condition()
{
	if (Mod_ConstantinoZauberwasser == 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 3)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItFo_Water) >= 10)
	&& (Npc_HasItems(hero, ItMi_Salzwasser) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_00"); //Ich habe alles.

	B_ShowGivenThings	("26 Gegenstände gegeben!");

	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 3);
	Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, 1);
	Npc_RemoveInvItems	(hero, ItFo_Water, 10);
	Npc_RemoveInvItems	(hero, ItMi_Salzwasser, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_01"); //Sehr gut. Gib schon her!

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_02"); //Bekomme ich jetzt eine Flasche?
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_03"); //Du hast mir sehr geholfen, dass muss ich zugeben, aber das deckt Lesters Schulden noch nicht!
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_04"); //Liefere diese vier Lieferungen noch aus und wir sind quitt.

	CreateInvItems	(self, ItMi_Zauberwasser_MIS, 32);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser_MIS, 32);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_05"); //Eine Lieferung geht an Orlan, Taverne zur Toten Harpie, eine Lieferung geht in die Kneipe im Hafenviertel, eine geht in die Kneipe hier, in der Unterstadt, und eine Lieferung geht an die Söldner auf Onars Hof. Gib sie dort Thekla.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Constantino hat noch etwas für mich zu tun: Ich soll das Zauberwasser auch noch ausliefern. Die Lieferungen sind für: Orlan in der Taverne zur Toten Harpie, die Kneipe im Hafenviertel, die Kneipe in der Unterstadt und die Söldner auf Onars Hof.");
};

INSTANCE Info_Mod_Constantino_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab das Zauberwasser ausgeliefert.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_MIS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Kardif_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_Zauberwasser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_MIS_15_00"); //Ich hab das Zauberwasser ausgeliefert.
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_01"); //Gut, hier hast du dein Zauberwasser.

	CreateInvItems	(self, ItMi_Zauberwasser, 8);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_02"); //Und jetzt verschwinde, ich hab zu tun!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Constantino hat mir eine Flasche Zauberwasser gegeben. Jetzt aber auf zu Lester.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Constantino_VitaminC (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_VitaminC_Condition;
	information	= Info_Mod_Constantino_VitaminC_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll hier Vitamin C kaufen.";
};

FUNC INT Info_Mod_Constantino_VitaminC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Auftrag))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_00"); //Ich soll hier Vitamin C kaufen.
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_01"); //Jaja, hier ist ein Beutel.

	CreateInvItems	(self, ItFo_Addon_VitaminC, 1);
	B_GiveInvItems	(self, hero, ItFo_Addon_VitaminC, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_02"); //Das macht dann 500 Goldmünzen.
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_03"); //Du willst mich doch nicht etwa verarschen, oder?
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_04"); //Na gut, ich mach dir nen Freundschaftspreis. Dich kostet es nur 400 Golmünzen.

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Akzeptieren.", Info_Mod_Constantino_VitaminC_Ok_400);
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Feilschen.", Info_Mod_Constantino_VitaminC_Feilschen_400);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_05"); //Hier ist dein Gold.
	
		B_GiveInvItems	(hero, self, ItMi_Gold, 400);
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Ok_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Ok_400_15_00"); //Hier ist dein Gold.
	
	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
};

FUNC VOID Info_Mod_Constantino_VitaminC_Feilschen_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Feilschen_400_15_00"); //Das ist doch viel zu viel.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_Feilschen_400_10_01"); //(grimmig) Na gut, 300.

		B_GiveInvItems	(hero, self, ItMi_Gold, 300);

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Constantino_VitaminC_Feilschen_400_10_02"); //Ich will meine ganzen 400 Goldmünzen.

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
		
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Akzeptieren.", Info_Mod_Constantino_VitaminC_Ok_400);
	};
};

INSTANCE Info_Mod_Constantino_BosperLehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling_Condition;
	information	= Info_Mod_Constantino_BosperLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir aus dieser Spruchrolle eine Tinktur herstellen?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling_Condition()
{
	if (Mod_Bosper_Tinktur == 1)
	&& (Npc_HasItems(hero, ItSc_Rueckverwandlung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_00"); //Kannst du mir aus dieser Spruchrolle eine Tinktur herstellen?

	B_GiveInvItems	(hero, self, ItSc_Rueckverwandlung, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_01"); //(argwöhnisch) Du willst wohl meine wertvolle Arbeitszeit stehlen?
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_02"); //Kannst du oder kannst du nicht?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_03"); //Selbstverständlich kann ich. Ist aber nicht ganz einfach.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_04"); //Mit einem Vorschuss von 100 Goldmünzen könnte ich es bis morgen schaffen.
};

INSTANCE Info_Mod_Constantino_BosperLehrling2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling2_Condition;
	information	= Info_Mod_Constantino_BosperLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann ran ans Werk!";
};

FUNC INT Info_Mod_Constantino_BosperLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling2_15_00"); //Dann ran ans Werk!

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling3_Condition;
	information	= Info_Mod_Constantino_BosperLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du fertig mit der Tinktur?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling2))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_00"); //Bist du fertig mit der Tinktur?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_01"); //Nö.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_02"); //Wieso nicht?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_03"); //Ich lasse mich doch nicht hetzen. Meine Forschungen zum Stein der Weisen haben Vorrang.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_04"); //Bis wann wirst du denn fertig?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_05"); //Mal schauen. Kannst ja mal morgen vorbeischauen, aber nerv mich nicht.

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling4_Condition;
	information	= Info_Mod_Constantino_BosperLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gern die Tinktur abholen.";
};

FUNC INT Info_Mod_Constantino_BosperLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling3))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling4_15_00"); //Ich würde gern die Tinktur abholen.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_01"); //Du siehst ja richtig ausgeschlafen aus. (lacht)
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_02"); //In meiner gestrigen guten Laune habe ich meine wichtigen Experimente kurz unterbrochen.

	B_GiveInvItems	(self, hero, ItMi_Rueckverwandlungstinktur, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_03"); //Und jetzt stör mich nicht weiter!

	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Ich habe nun die Tinktur und muss nur noch meine Pfeile damit bestreichen.");

	Wld_InsertNpc	(Warg_Atalante,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
};

INSTANCE Info_Mod_Constantino_Mitgift (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift_Condition;
	information	= Info_Mod_Constantino_Mitgift_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ich sehe, hast du ein Tiergift bei dir ...";
};

FUNC INT Info_Mod_Constantino_Mitgift_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_00"); //Wie ich sehe, hast du ein Tiergift bei dir ...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_01"); //(abweisend) Was geht dich das an?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_02"); //Ich bräuchte genau so ein Fläschchen ...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_03"); //(störrisch) Nein, verkäuflich ist es nicht. Es ist nämlich mein einziges Exemplar.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_04"); //(erklärt) Ein Jäger hat es bei einem vermummten Leichnam zwischen wilden Tieren gefunden und zu mir gebracht.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_05"); //Ich habe gerade herausgefunden, wie ich selbst ein solches Gift gewinnen könnte ...
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_06"); //Könntest du mir ein Fläschchen davon herstellen ...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_07"); //(abweisend) Das wird ja immer schöner? Wieso sollte ich das tun?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_08"); //Meister Neoras braucht es für seine Forschungen.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_09"); //(einlenkend) Achso ... das ist natürlich was anderes.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_10"); //Es wäre mir eine Ehre einem Feuermagier und kundigen Alchemisten bei seinen Forschungen zu helfen.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_11"); //Für die Herstellung des Giftes bräuchte ich aber zumindest einen Blufliegenstachel und eine Minecrawlerzange.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_12"); //Vielleicht wirst du bei dem alten Zausel im Hafenviertel fündig.

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Constantino könnte mir Tiergift herstellen, bräuchte dafür aber einen Blutfliegenstacheln und eine Minecrawlerzange.");
};

INSTANCE Info_Mod_Constantino_Mitgift2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift2_Condition;
	information	= Info_Mod_Constantino_Mitgift2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, ich habe den Stachel und die Zange.";
};

FUNC INT Info_Mod_Constantino_Mitgift2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift2_15_00"); //Hier, ich habe den Stachel und die Zange.

	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);
	Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, 1);

	B_ShowGivenThings	("Minecrawlerzange und Blutfliegenstachel gegeben");

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_01"); //Sehr gut. Lass mir nur einen Augenblick Zeit ...

	AI_UseMob	(self, "LAB", 1);

	AI_Wait	(self, 3);

	AI_UseMob	(self, "LAB", -1);

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_02"); //So, hier ist das Konzentrat für Neoras. Und richte ihm von mir Schöne Grüße aus.

	B_GiveInvItems	(self, hero, ItPo_Tiergift, 1);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Constantino hat mir das Tiergift hergestellt.");
};

INSTANCE Info_Mod_Constantino_Anschlagtafel (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Anschlagtafel_Condition;
	information	= Info_Mod_Constantino_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Constantino_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Constantino == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder)
	&& (Npc_HasItems(hero, ItMi_Flask) >= Mod_Anschlagtafel_Khorinis_Constantino_Flasche)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich)
	&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut)
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe)
	&& (Npc_HasItems(hero, ItPl_Weed) >= Mod_Anschlagtafel_Khorinis_Constantino_Unkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze)
	{
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel);
		Npc_RemoveInvItems	(hero, ItPl_Blueplant, Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder);
		Npc_RemoveInvItems	(hero, ItMi_Flask, Mod_Anschlagtafel_Khorinis_Constantino_Flasche);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_02, Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz);
		Npc_RemoveInvItems	(hero, ItPl_SwampHerb, Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut);
		Npc_RemoveInvItems	(hero, ItPl_Heilknospe, Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe);
		Npc_RemoveInvItems	(hero, ItPl_Weed, Mod_Anschlagtafel_Khorinis_Constantino_Unkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Constantino_Gold);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Constantino = 0;
		Mod_Anschlagtafel_Khorinis_Constantino_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Constantino, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Constantino_Lehrer (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrer_Condition;
	information	= Info_Mod_Constantino_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir etwas über die Alchemie bei.";
};

FUNC INT Info_Mod_Constantino_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Constantino_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Constantino_Lehrer_10_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
	Info_AddChoice 		(Info_Mod_Constantino_Lehrer,DIALOG_BACK,Info_Mod_Constantino_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Trank der leichten Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Constantino_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Leichter Heiltrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Constantino_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Trank der schnellen Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Constantino_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Constantino_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Constantino_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Constantino_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Trank des leichten Mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Constantino_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Leichte Manatrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Constantino_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Constantino_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Constantino_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Constantino_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Constantino_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Constantino_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 3)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Constantino_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice (Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Constantino_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Constantino_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};
FUNC VOID Info_Mod_Constantino_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Constantino_Trade (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Trade_Condition;
	information	= Info_Mod_Constantino_Trade_Info;
	trade		= 1;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Constantino_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Constantino_Pickpocket (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Pickpocket_Condition;
	information	= Info_Mod_Constantino_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Constantino_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 340);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_BACK, Info_Mod_Constantino_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Constantino_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
};

INSTANCE Info_Mod_Constantino_EXIT (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_EXIT_Condition;
	information	= Info_Mod_Constantino_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Constantino_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};