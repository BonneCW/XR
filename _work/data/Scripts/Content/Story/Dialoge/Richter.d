INSTANCE Info_Mod_Richter_Hi (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Hi_Condition;
	information	= Info_Mod_Richter_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Richter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Richter_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Richter_Hi_10_01"); //Wir sind die oberste Gerichtsinstanz Khoratas.
	AI_Output(self, hero, "Info_Mod_Richter_Hi_10_02"); //Wir entscheiden über Wohlstand und Armut, Hass und Rache, Leben und Tod.
	AI_Output(self, hero, "Info_Mod_Richter_Hi_10_03"); //Doch gerade jetzt entscheiden Wir nur über den nächsten Gang bei unserem Mahl.
};

INSTANCE Info_Mod_Richter_UlrichVerpetzen (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_UlrichVerpetzen_Condition;
	information	= Info_Mod_Richter_UlrichVerpetzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ulrich hat vor, den Prozess von Anna zu sabotieren.";
};

FUNC INT Info_Mod_Richter_UlrichVerpetzen_Condition()
{
	if (Mod_AnnaQuest == 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Richter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_UlrichVerpetzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Richter_UlrichVerpetzen_15_00"); //Ulrich hat vor, den Prozess von Anna zu sabotieren.
	AI_Output(self, hero, "Info_Mod_Richter_UlrichVerpetzen_10_01"); //Ja? Ist ihm durchaus zuzutrauen. Was will er tun?
	AI_Output(hero, self, "Info_Mod_Richter_UlrichVerpetzen_15_02"); //Er will euch alle töten, solltet ihr Anna verurteilen.
	AI_Output(self, hero, "Info_Mod_Richter_UlrichVerpetzen_10_03"); //Hmm ... Dann wirst du ihm Einhalt gebieten.
	AI_Output(hero, self, "Info_Mod_Richter_UlrichVerpetzen_15_04"); //Wieso ich?
	AI_Output(self, hero, "Info_Mod_Richter_UlrichVerpetzen_10_05"); //Wir sind nicht ausgebildet im Kämpfen ... Wir haben Wichtigeres zu tun.
	AI_Output(self, hero, "Info_Mod_Richter_UlrichVerpetzen_10_06"); //Sollte dieser Ulrich also wirklich versuchen, handgreiflich zu werden, wirst du ihn mit Hilfe Unserer Wachen niederschlagen.
	AI_Output(self, hero, "Info_Mod_Richter_UlrichVerpetzen_10_07"); //Hast du das gehört?
	AI_Output(hero, self, "Info_Mod_Richter_UlrichVerpetzen_15_08"); //Ja. Bis dann.

	Mod_AnnaQuestRichter = 1;

	B_LogEntry	(TOPIC_MOD_KHORATA_HEXENWAHN, "Der Richter trägt mir auf, Ulrichs Aufstand niederzuschlagen. Da muss ich mich wohl für eine Seite entscheiden ...");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Richter_UlrichKO (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_UlrichKO_Condition;
	information	= Info_Mod_Richter_UlrichKO_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Richter_UlrichKO_Condition()
{
	if (Mod_AnnaQuest == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_UlrichKO_Info()
{
	AI_Output(self, hero, "Info_Mod_Richter_UlrichKO_10_00"); //Adanos war uns wohlgesonnen. Hol dir deine Belohnung beim Stadthalter ab.

	B_GivePlayerXP	(50);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7370_OUT_Ulrich_REL, "TOT");
	B_StartOtherRoutine	(Mod_7365_OUT_Margarethe_REL, "START");
	B_StartOtherRoutine	(Mod_7376_OUT_Anna_REL, "TOT");
	B_StartOtherRoutine	(Mod_7374_OUT_Gerichtswache_01, "START");
	B_StartOtherRoutine	(Mod_7375_OUT_Gerichtswache_02, "START");

	AI_Teleport	(Mod_7370_OUT_Ulrich_REL, "TOT");

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Richter_Plagenquest (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Plagenquest_Condition;
	information	= Info_Mod_Richter_Plagenquest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Richter_Plagenquest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Plagenquest))
	|| (Npc_KnowsInfo(hero, Info_Mod_Wendel_Plagenquest))
	|| (Npc_KnowsInfo(hero, Info_Mod_Theodorus_Plagenquest))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_Plagenquest_Info()
{
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_00"); //Du hast gegen die Gesetze unserer Stadt verstoßen.
	AI_Output(hero, self, "Info_Mod_Richter_Plagenquest_15_01"); //Wie bitte?! Was habe ich denn falsches gemacht?
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_02"); //Vor Unseren Augen hast du Insekten gejagt.
	AI_Output(hero, self, "Info_Mod_Richter_Plagenquest_15_03"); //Aber wieso habe ich damit gegen geltendes Stadtrecht verstoßen?
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_04"); //In unseren Gesetzesbüchern steht geschrieben, dass das Jagen von Insekten innerhalb der Stadtgrenzen nur mit den eigens dafür vorgesehenen Stadthämmern gestattet ist.
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_05"); //Da du kein Bewohner der Stadt bist, kannst du einen solchen Hammer garnicht besitzen ... andernfalls hättest du dich des Diebstahles schuldig gemacht.
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_06"); //Hast du etwas zu deiner Verteidigung zu sagen?
	AI_Output(hero, self, "Info_Mod_Richter_Plagenquest_15_07"); //Ich ...
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_08"); //Die Gesetze werden in aller strenge ausgelegt und das Urteil wird augenblicklich vollstreckt. Du erhälst ...

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_09"); //... die Todesstrafe. Gerichtsdiener!
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_10"); //Ohh, halt, bin einige Zeilen verrutscht.

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_11"); //Ähhm, also, das Urteil lautet ... verdammt, das kann ich nicht lesen, zu alt und ausgewaschen ...
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_12"); //Hmm, in dem Fall erlaubt es mir der Willkürparagraph zu entscheiden, dass du ähhh ...
	AI_Output(hero, self, "Info_Mod_Richter_Plagenquest_15_13"); //Nun wird es mir aber langsam zu bunt ... Was soll überhaupt dieser Unsinn mit den Hämmern und dem Insektenjagen?
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_14"); //Frevler, spotte nicht unseren Stadtgesetzten. Das Stadthammergesetz existiert schon fast so lange, wie unsere Stadt steht ...
	AI_Output(self, hero, "Info_Mod_Richter_Plagenquest_10_15"); //Und nun ... ach verdammt, du hast mich aus dem Konzept gebracht. Geh mir aus den Augen.

	if (Mod_REL_Stadthalter == 1)
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Na das ist mal wieder eine Spinnerei ... Stadthammergesetz ... und die Insekten sind auch wieder da. Ich sollte zu Theodorus gehen und schauen, ob er nicht etwas neues herausgefunden hat.");
	}
	else if (Mod_REL_Stadthalter == 2)
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Na das ist mal wieder eine Spinnerei ... Stadthammergesetz ... und die Insekten sind auch wieder da. Ich sollte zu Wendel gehen und schauen, ob er nicht etwas neues herausgefunden hat.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Na das ist mal wieder eine Spinnerei ... Stadthammergesetz ... und die Insekten sind auch wieder da. Ich sollte zu Lukas gehen und schauen, ob er nicht etwas neues herausgefunden hat.");
	};

	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(100);

	Wld_InsertNpc	(Insekt_01, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_01, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_02, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_340");
	Wld_InsertNpc	(Insekt_03, "REL_CITY_340");
};

INSTANCE Info_Mod_Richter_Unfrieden (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Unfrieden_Condition;
	information	= Info_Mod_Richter_Unfrieden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir das hier aushändigen.";
};

FUNC INT Info_Mod_Richter_Unfrieden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Aufgabe))
	&& (Npc_HasItems(hero, ItWr_LeonhardRichter) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_Unfrieden_Info()
{
	AI_Output(hero, self, "Info_Mod_Richter_Unfrieden_15_00"); //Ich soll dir das hier aushändigen.

	B_GiveInvItems	(hero, self, ItWr_LeonhardRichter, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Richter_Unfrieden_10_01"); //O Adanos, beschütze Uns! Das kann doch nicht sein Ernst sein!
	AI_Output(hero, self, "Info_Mod_Richter_Unfrieden_15_02"); //Wirst du die Männer freilassen?
	AI_Output(self, hero, "Info_Mod_Richter_Unfrieden_10_03"); //(nervös) Umgehend! Wir sind sicher, weitere complicaciones lassen sich vermeiden!

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_UNFRIEDEN, "Ich habe dem Richter die Nachricht überbracht. Dann sollte ich jetzt meinen Lohn abholen.");

	Wld_InsertNpc	(Mod_7420_OUT_Michael_REL, "REL_CITY_001");
	Wld_InsertNpc	(Mod_7421_OUT_Philipp_REL, "REL_CITY_001");
};

INSTANCE Info_Mod_Richter_Endres (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Endres_Condition;
	information	= Info_Mod_Richter_Endres_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich versuche den Mörder von Endres zu ermitteln.";
};

FUNC INT Info_Mod_Richter_Endres_Condition()
{
	if (Mod_EndresIndizien == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_15_00"); //Ich versuche den Mörder von Endres zu ermitteln.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_10_01"); //Ja? Wir haben von diesem blutrünstigen Ereignis erfahren. Was konntest du herausfinden?
	AI_Output(hero, self, "Info_Mod_Richter_Endres_15_02"); //Es gibt drei Verdächtige, die ich allesamt verhört habe.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_10_03"); //Zu welchen Schlüssen führen dich die Unterredungen? Lege dich fest und überlege wohl, bevor du antwortest.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_10_04"); //Die Gerichtsverhandlungen ersparen Wir Uns heute nämlich, weil Wir eine leichte Müdigkeit verspüren.

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	Info_AddChoice	(Info_Mod_Richter_Endres, "Ich weiß es noch nicht.", Info_Mod_Richter_Endres_D);

	if (Mod_RichterEndres_Juliana == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Juliana ist unschuldig.", Info_Mod_Richter_Endres_C);
	};
	if (Mod_RichterEndres_Arzt == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Der Heiler ist unschuldig.", Info_Mod_Richter_Endres_B);
	};
	if (Mod_RichterEndres_Wendel == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Wendel ist unschuldig.", Info_Mod_Richter_Endres_A);
	};
};

FUNC VOID Info_Mod_Richter_Endres_E()
{
	AI_Output(self, hero, "Info_Mod_Richter_Endres_E_10_00"); //Woher weißt du das?
};

FUNC VOID Info_Mod_Richter_Endres_H()
{
	AI_Output(self, hero, "Info_Mod_Richter_Endres_H_10_00"); //Und wer ist noch unschuldig?

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	Info_AddChoice	(Info_Mod_Richter_Endres, "Ich weiß es noch nicht.", Info_Mod_Richter_Endres_D);

	if (Mod_RichterEndres_Juliana == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Juliana ist unschuldig.", Info_Mod_Richter_Endres_C);
	};
	if (Mod_RichterEndres_Arzt == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Der Heiler ist unschuldig.", Info_Mod_Richter_Endres_B);
	};
	if (Mod_RichterEndres_Wendel == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Wendel ist unschuldig.", Info_Mod_Richter_Endres_A);
	};
};

FUNC VOID Info_Mod_Richter_Endres_I()
{
	AI_Output(self, hero, "Info_Mod_Richter_Endres_I_10_00"); //Dann könnte der Heiler der Täter sein?
	AI_Output(hero, self, "Info_Mod_Richter_Endres_I_15_01"); //So ist es.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_I_10_02"); //Dann gehe hin und finde Beweise!

	Mod_EndresIndizien = 2;

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Ich soll nun Beweise dafür finden, dass der Heiler der Täter ist.");

	Info_ClearChoices	(Info_Mod_Richter_Endres);
};

FUNC VOID Info_Mod_Richter_Endres_D()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_D_15_00"); //Ich weiß es noch nicht.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_D_10_01"); //Dann bring es in Erfahrung!

	Info_ClearChoices	(Info_Mod_Richter_Endres);
};

FUNC VOID Info_Mod_Richter_Endres_C()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_C_15_00"); //Juliana ist unschuldig.

	Info_Mod_Richter_Endres_E();

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	if (Npc_KnowsInfo(hero, Info_Mod_Roman_REL_Hi))
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Der Täter ist männlich.", Info_Mod_Richter_Endres_G);
	};
	Info_AddChoice	(Info_Mod_Richter_Endres, "Das sagt mir mein Gefühl.", Info_Mod_Richter_Endres_F);
};

FUNC VOID Info_Mod_Richter_Endres_B()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_B_15_00"); //Der Heiler ist unschuldig.

	Info_Mod_Richter_Endres_E();

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	Info_AddChoice	(Info_Mod_Richter_Endres, "Das sagt mir mein Gefühl.", Info_Mod_Richter_Endres_F);
};

FUNC VOID Info_Mod_Richter_Endres_A()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_A_15_00"); //Wendel ist unschuldig.

	Info_Mod_Richter_Endres_E();

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	if (Npc_KnowsInfo(hero, Info_Mod_Monteur_Endres))
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Er hat ein Alibi.", Info_Mod_Richter_Endres_J);
	};
	Info_AddChoice	(Info_Mod_Richter_Endres, "Das sagt mir mein Gefühl.", Info_Mod_Richter_Endres_F);
};

FUNC VOID Info_Mod_Richter_Endres_G()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_G_15_00"); //Der Täter ist männlich.

	Mod_RichterEndres_Juliana = 1;

	if (Mod_RichterEndres_Wendel == 0)
	{
		Info_Mod_Richter_Endres_H();
	}
	else
	{
		Info_Mod_Richter_Endres_I();
	};
};

FUNC VOID Info_Mod_Richter_Endres_J()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_J_15_00"); //Er hat ein Alibi.

	Mod_RichterEndres_Wendel = 1;

	if (Mod_RichterEndres_Juliana == 0)
	{
		Info_Mod_Richter_Endres_H();
	}
	else
	{
		Info_Mod_Richter_Endres_I();
	};
};

FUNC VOID Info_Mod_Richter_Endres_F()
{
	AI_Output(hero, self, "Info_Mod_Richter_Endres_F_15_00"); //Das sagt mir mein Gefühl.
	AI_Output(self, hero, "Info_Mod_Richter_Endres_F_10_01"); //Dein Gefühl ist nicht gut genug!

	Info_ClearChoices	(Info_Mod_Richter_Endres);

	Info_AddChoice	(Info_Mod_Richter_Endres, "Ich weiß es noch nicht.", Info_Mod_Richter_Endres_D);

	if (Mod_RichterEndres_Juliana == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Juliana ist unschuldig.", Info_Mod_Richter_Endres_C);
	};
	if (Mod_RichterEndres_Arzt == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Der Heiler ist unschuldig.", Info_Mod_Richter_Endres_B);
	};
	if (Mod_RichterEndres_Wendel == 0)
	{
		Info_AddChoice	(Info_Mod_Richter_Endres, "Wendel ist unschuldig.", Info_Mod_Richter_Endres_A);
	};
};

INSTANCE Info_Mod_Richter_Endres02 (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Endres02_Condition;
	information	= Info_Mod_Richter_Endres02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Richter_Endres02_Condition()
{
	if (Mod_EndresIndizien == 4)
	|| (Mod_EndresIndizien == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Richter_Endres02_Info()
{
	if (Mod_EndresIndizien == 4)
	{
		AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_00"); //(übellaunig) Du hast zwar einen Verbrecher gestellt, aber Fingerspitzengefühl hast du nicht bewiesen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_01"); //(wohlwollend) Wir müssen dir für deine Hilfe in diesem Fall danken. So etwas Entsetzliches darf nicht wieder passieren.
	};

	AI_Output(hero, self, "Info_Mod_Richter_Endres02_15_02"); //Was geschieht nun mit dem Heiler?
	AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_03"); //Wir lassen ihn vierteilen, hängen oder köpfen, je nach Unserer Laune.
	AI_Output(hero, self, "Info_Mod_Richter_Endres02_15_04"); //Muss er mit dem Tod gestraft werden?
	AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_05"); //Die Leute wollen es so, glaube Uns. Wie unzufrieden wären sie, könnten sie den Schuldigen nicht büßen sehen.
	AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_06"); //Nun aber lass uns nicht mehr darüber reden.

	if (Mod_EndresIndizien == 4)
	{
		AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_07"); //Die  Klatschweiber werden es noch ausführlich tun.

		B_GivePlayerXP	(200);

		B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Ich habe den Heiler selbstständig zur Strecke gebracht.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Richter_Endres02_10_08"); //Es gibt denkbar Erfreulicheres. Anselm hat verfügt, dass du diesen Trank als Belohnung für deine Dienste erhalten sollst.

		B_GiveInvItems	(self, hero, ItPo_Perm_Health, 1);

		B_GivePlayerXP	(400);

		B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Ich habe den mörderischen Heiler an die Justiz übergeben.");
	};

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_ENDRES, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;
};

INSTANCE Info_Mod_Richter_Glorie (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Glorie_Condition;
	information	= Info_Mod_Richter_Glorie_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Richter_Glorie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_Glorie2))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Richter_Glorie_Info()
{
	AI_Output(self, hero, "Info_Mod_Richter_Glorie_10_00"); //Ahh, schön euch zu treffen, Gelehrter. Ich wollte noch unbedingt etwas mit euch erörtern.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "CASSIA");
	B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "RICHTER");
};

INSTANCE Info_Mod_Richter_Freudenspender (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Freudenspender_Condition;
	information	= Info_Mod_Richter_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Lust auf Freudenspender?";
};                       

FUNC INT Info_Mod_Richter_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Richter_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Richter_Freudenspender_15_00"); //Lust auf Freudenspender?
	AI_Output(self, hero, "Info_Mod_Richter_Freudenspender_10_01"); //Wir hätten lieber ein gutes Essen und eine spannende Verhandlung.
};

var int Richter_LastPetzCounter;
var int Richter_LastPetzCrime;

INSTANCE Info_Mod_Richter_PMSchulden (C_INFO)
{
	npc         	= Mod_7371_OUT_Richter_REL;
	nr          	= 1;
	condition   	= Info_Mod_Richter_PMSchulden_Condition;
	information 	= Info_Mod_Richter_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Richter_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Richter_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Richter_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Richter_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Richter_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Richter_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Richter_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Richter_LastPetzCounter);
		
			if (diff > 0)
			{
				Richter_Schulden = Richter_Schulden + (diff * 50);
			};
		
			if (Richter_Schulden > 1000)	{	Richter_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Richter_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Richter_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Richter_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Richter_LastPetzCrime == CRIME_THEFT)
		|| ( (Richter_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Richter_LastPetzCrime == CRIME_ATTACK)
		|| ( (Richter_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Richter_Schulden			= 0;
			Richter_LastPetzCounter 	= 0;
			Richter_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Richter_Schulden);
			AI_Output (self, hero, "Info_Mod_Richter_PMSchulden_10_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Richter_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Richter_PETZMASTER);
		Info_AddChoice		(Info_Mod_Richter_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Richter_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Richter_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Richter_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Richter_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Richter_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Richter_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Richter_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Richter_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Richter_Schulden);

	Info_ClearChoices  	(Info_Mod_Richter_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Richter_PETZMASTER);
	Info_AddChoice		(Info_Mod_Richter_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Richter_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Richter_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Richter_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Richter_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Richter_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Richter_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Richter_PETZMASTER   (C_INFO)
{
	npc         	= Mod_7371_OUT_Richter_REL;
	nr          	= 1;
	condition   	= Info_Mod_Richter_PETZMASTER_Condition;
	information 	= Info_Mod_Richter_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Richter_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Richter_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Richter_PETZMASTER_Info()
{
	Richter_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_02"); //Mord ist ein schweres Vergehen!

		Richter_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Richter_Schulden = Richter_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_04"); //Die Wachen haben Befehl, jeden Mörder auf der Stelle zu richten.
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_05"); //Und auch die meisten Bürger werden einen Mörder im Lager nicht dulden!
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_06"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_07"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_08"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_09"); //Ich werde so ein Verhalten im Lager nicht dulden!
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_10"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Richter_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_11"); //Du kannst nicht einfach wahllos Leute angreifen. Dafür werde ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_12"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_13"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_14"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Richter_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_15"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_16"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_10_17"); //Du wirst eine Entschädigung zahlen müssen!
		
		Richter_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Richter_PETZMASTER_15_18"); //Wie viel?
	
	if (Richter_Schulden > 1000)	{	Richter_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Richter_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Richter_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Richter_PETZMASTER);
	Info_AddChoice		(Info_Mod_Richter_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Richter_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Richter_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Richter_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Richter_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Richter_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Richter_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Richter_Schulden);
	AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_PayNow_10_01"); //Gut! Ich werde dafür sorgen, dass es jeder in der Stadt erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_KHORATA);
	
	Richter_Schulden			= 0;
	Richter_LastPetzCounter 	= 0;
	Richter_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Richter_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Richter_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Richter_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Richter_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_PayLater_10_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Richter_PETZMASTER_PayLater_10_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Richter_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Richter_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Richter_Pickpocket (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_Pickpocket_Condition;
	information	= Info_Mod_Richter_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Richter_Pickpocket_Condition()
{
	C_Beklauen	(145, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Richter_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Richter_Pickpocket);

	Info_AddChoice	(Info_Mod_Richter_Pickpocket, DIALOG_BACK, Info_Mod_Richter_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Richter_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Richter_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Richter_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Richter_Pickpocket);
};

FUNC VOID Info_Mod_Richter_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Richter_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Richter_Pickpocket);

		Info_AddChoice	(Info_Mod_Richter_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Richter_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Richter_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Richter_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Richter_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Richter_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Richter_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Richter_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Richter_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Richter_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Richter_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Richter_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Richter_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Richter_EXIT (C_INFO)
{
	npc		= Mod_7371_OUT_Richter_REL;
	nr		= 1;
	condition	= Info_Mod_Richter_EXIT_Condition;
	information	= Info_Mod_Richter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Richter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Richter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};