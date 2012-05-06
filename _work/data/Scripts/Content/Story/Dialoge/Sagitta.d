INSTANCE Info_Mod_Sagitta_Hi (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Hi_Condition;
	information	= Info_Mod_Sagitta_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sagitta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Sagitta_Hi_17_00"); //Hey, was machst du hier? Willst du meine Dienste als Alchemistin nutzen oder willst du einen meiner Tränke kaufen?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_OHNELAGER, TOPIC_MOD_LEHRER_KHORINIS, "Sagitta verkauft Tränke.", "Sagitta kann mich in der Alchemie unterweisen.");
};

INSTANCE Info_Mod_Sagitta_AkilsHof (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_AkilsHof_Condition;
	information	= Info_Mod_Sagitta_AkilsHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gebieterin über die Kräuterheilkunst, ich benötige eure Unterstützung.";
};

FUNC INT Info_Mod_Sagitta_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllDead))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (Mod_AkilsHofAusgestorben == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_AkilsHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_00"); //Gebieterin über die Kräuterheilkunst, ich benötige eure Unterstützung.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_17_01"); //Selbstverständlich, sonst wärest du nicht hier. Worum geht es?
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_02"); //Seit dem Besuch einer finsteren Gestalt sind einige Leute auf Akil’s Hof erkrankt, leiden unter raschen körperlich Verfall.
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_03"); //Die beiden Brüder sind indes wie wild aufeinander losgegangen und Ehnim wurde dabei schwer verwundet.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_17_04"); //Hmm, die Umstände lassen mich vermuten, dass wir es mit keiner alltäglichen Krankheit zu tun haben.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_17_05"); //Es scheint sich eher um eine Art Fluch handeln zu können, bei welchem meine Heilkunst nichts auszurichten vermag.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_17_06"); //Am ehesten wirst du wohl im Kloster Hilfe finden, wo du dich auch schleunigst hinbegeben solltest.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_17_07"); //Hier noch ein heilender Trank für Ehnim. Seine Verletzung sollte dadurch kuriert werden.

	B_GiveInvItems	(self, hero, ItPo_Health_06, 1);
	
	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Sagitta_Kraeuter (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter_Condition;
	information	= Info_Mod_Sagitta_Kraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich auch in der Alchemie unterweisen?";
};

FUNC INT Info_Mod_Sagitta_Kraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_00"); //Kannst du mich auch in der Alchemie unterweisen?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_01"); //Du möchtest von mir etwas über Alchemie lernen? Wie kommst du denn auf diesen Gedanken?

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_02"); //Ich besitze schon Kenntnisse darüber und möchte mein Wissen erweitern.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_03"); //So? Das ist doch schon mal eine gute Voraussetzung.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_04"); //Dann solltest du die kleine Aufgabe, die ich dir stellen werde, auch ohne größere Schwierigkeiten erledigen können.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_05"); //Naja, kann ganz nützlich sein, denke ich.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_06"); //So, denkst du ... Klingt ja fast nach einer fixen Idee.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_07"); //Nein, wenn ich meine Zeit opfern soll, dann musst du zuerst eine Kleinigkeit für mich erledigen.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_08"); //So wird sich zeigen, ob dein Interesse auch wirklich aufrichtig ist.
	};

	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_09"); //Ich höre.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_10"); //Besorge mir einen Fliegenpilz, eine Heilknospe und zwei Blauflieder.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_17_11"); //Wenn du mir die Sachen gebracht hast, darfst du noch einen kleinen Botengang tätigen. Dazu aber später mehr.

	Log_CreateTopic	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Damit mich Sagitta unterrichtet, muss ich ihr zunächst 1 Fliegenpilz, 1 Heilknospe und 2 Blauflieder bringen.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter2_Condition;
	information	= Info_Mod_Sagitta_Kraeuter2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Sachen.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 1)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_00"); //Ich habe die Sachen.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 1);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 2);

	B_ShowGivenThings	("Heilknospe, Fliegenpilz und 2 Blauflieder gegeben");

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_01"); //Gut. Gib schon her. Ich muss die Gewächse noch am Alchemietisch verarbeiten.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_02"); //Sieh zu und lerne.

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_03"); //So, hier. Diese Medizin ist für Sekob. Wie immer jeweils zwei Esslöffel am Morgen und Abend.

	B_GiveInvItems	(self, hero, ItPo_SekobMedizin, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_04"); //Du bekommst etwas Gold und Naturalien dafür.
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_05"); //Medizin? Aus Fliegenpilz?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_06"); //Du scheinst ungläubig. Das spricht nicht für dich.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_07"); //Jeder erfahrene Alchemist sollte wissen, dass Gifte in geringer Konzentration durchaus heilsame Wirkungen entfalten können.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_08"); //Sekob z.B. leidet unter Herzproblemen, was auch kein Wunder ist, bei dem notorischen Choleriker der er ist.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_09"); //Das gering dosierte Fliegenpilzgift lindert seine Beschwerden ... und die Wutausbrüche.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_17_10"); //Und nun geh. Du weißt, was du zu tun hast.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Nun soll ich Sekob die Fliegenpilzmedizin bringen.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter3_Condition;
	information	= Info_Mod_Sagitta_Kraeuter3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dein Paket.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter2))
	&& (Npc_HasItems(hero, ItMi_SekobSagitta) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter3_15_00"); //Hier, dein Paket.

	B_GiveInvItems	(hero, self, ItMi_SekobSagitta, 1);

	Npc_RemoveInvItems	(self, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_17_01"); //Gut. Du hast deine Aufgabe erfüllt ... auch wenn sie nicht die anspruchsvollste war.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_17_02"); //Solltest du noch immer Interesse an der Alchemie haben, werde ich dich nun unterrichten.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sagitta_Irdorath (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath_Condition;
	information	= Info_Mod_Sagitta_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss diese Insel mit einem Schiff verlassen und benötige jemanden mit deinen Fähigkeiten in meiner Mannschaft.";
};

FUNC INT Info_Mod_Sagitta_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_00"); //Ich muss diese Insel mit einem Schiff verlassen und benötige jemanden mit deinen Fähigkeiten in meiner Mannschaft.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_01"); //Es geht um das Waohl von Khorinis ...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_02"); //Was, ich auf einem Schiff, welche sich doch ihr ganzes Leben der Kräuterkunst auf dem Land gewidmet hat? Na du kommst auf Ideen ...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_03"); //Aber erzähl doch erst einmal, worum es überhaupt bei dieser Exkursion geht?
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_04"); //Ein finsterer Magier versucht dieses Eiland zu unterwerfen und richtete bereits einigen Schaden an im Minental, der Stadt und auf Bauernhöfen ...
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_05"); //Wir müssen eine nahe gelegene Insel aufsuchen, um seinen Machenschaften auf kurz oder lang ein Ende setzen zu können.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_06"); //Was sagst du da?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_07"); //Ja, in letzter Zeit haben sich die Fälle ungewöhnlicher Erkrankungen gehäuft, ich wurde so oft aufgesucht, wie niemals zuvor.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_08"); //Kaum ein Tag mehr, da nicht Leute klagend zu mir kommen und um Linderung ihrer Leiden bitten.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_09"); //(halblaut) Allmählich wird mir das zu viel ...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_10"); //(wieder zum Helden) In Ordnung, wenn nur die Seereise dieses üble Treiben beenden kann, werde ich euch begleiten ...
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_11"); //(überrascht) Was, ja, wirklich?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_12"); //Ja ... aber vorher musst du mir noch einige Gewächse besorgen ... sie sollen den Effekt von Seekrankheit deutlich mindern können ...
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_13"); //Ok, wohin muss ich laufen?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_14"); //Nirgendwohin.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_15"); //Wie? Was dann?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_16"); //Klettern und schwimmen. Die Harpienkralle – ein Pilz - wächst nur auf kahlen Berggipfeln und zwar – wie der Name schon verrät – in der Nähe von Harpien.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_17"); //Du wirst eines ihrer Nester finden müssen und zwischen ihrem Unrat bestimmt die begehrte Zutat finden.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_18"); //Früher sollen sie vor allem im Minental heimisch gewesen sein, aber mit dem Fall der Barriere könntest du vielleicht auch in der Nähe von Onar’s Hof in den Bergen Harpien antreffen.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_19"); //Hmm, ok, was noch?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_20"); //Und dann musst du noch den Salzwassersprießling besorgen, der in der Nähe von Seichtwasserbarsten wächst.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_21"); //Der Grund liegt darin ...
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_22"); //Jaja, dass die Pflanze in seinem Unrat wächst ...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_23"); //Was, nein, absolut nicht, wie kommst du auf so etwas.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_24"); //Der Seichtwasserbarsten ist die bevorzugte Beute seines fünf Meter größeren Vetters, dem Gierschlundleviathan und wächst in dessen Ausscheidungen.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_17_25"); //Du könntest an den seichten Stellen des Hafens und der vorgelagerten kleinen Insel fündig werden.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_26"); //Ähh ... ich mache mich dann mal auf den Weg.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Schön, Sagitta erklärt sich prinzipiell zu der Reise bereit ... nur muss ich ihr noch zwei Dinge besorgen: Die Harpienkralle, die auf Berggipfeln in Harpiennestern wächst – im Minental und in den Bergen um Onar’s Hof könnte ich welche finden – und den Salzwassersprießling, der irgendwo an seichten Stellen am Hafen und der kleinen Insel sprießen könnte.");

	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_01");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_02");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_03");

	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_02");

	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
};

INSTANCE Info_Mod_Sagitta_Irdorath2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath2_Condition;
	information	= Info_Mod_Sagitta_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe die Gewächse.";
};

FUNC INT Info_Mod_Sagitta_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath))
	&& (Mod_SagittaSS == 1)
	&& (Mod_SagittaHK == 1)
	&& (Npc_HasItems(hero, ItPl_SalzwasserSprießling) >= 1)
	&& (Npc_HasItems(hero, ItPl_Harpienkralle) >= 1)
	&& (Mod_Irdorath == 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath2_15_00"); //Ich habe die Gewächse.

	B_ShowGivenThings	("Harpienkralle und Salzwassersprießling gegeben");

	Npc_RemoveInvItems	(hero, ItPl_SalzwasserSprießling, 1);
	Npc_RemoveInvItems	(hero, ItPl_Harpienkralle, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_17_01"); //Zeig mal ... tatsächlich.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_17_02"); //Das hast du vortrefflich gemacht.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_17_03"); //Du scheinst es wirklich ernst zu meinen, mit der Expedition ... und ich sehe keinen Hinderungsgrund mehr, warum auch ich mich ihr nicht anschließen sollte.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_17_04"); //Wir sehen uns beim Hafen.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Sagitta war sehr zufrieden und wird am Hafen auf den Beginn der Seereise warten.");

	B_GivePlayerXP	(300);

	Mod_SagittaDabei = 1;
	Mod_JackAL = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Sagitta_Irdorath3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath3_Condition;
	information	= Info_Mod_Sagitta_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Sagitta_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_SagittaDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath3_17_01"); //Schade. Ich gehe dann wieder zurück.

	Mod_SagittaDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Sagitta_OnarsSchnaps (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsSchnaps_Condition;
	information	= Info_Mod_Sagitta_OnarsSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Onar hat was falsches getrunken und jetzt schwere Magenverstimmungen.";
};

FUNC INT Info_Mod_Sagitta_OnarsSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Wasili_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsSchnaps_15_00"); //Onar hat was falsches getrunken und jetzt schwere Magenverstimmungen. Weißt du Abhilfe?
	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsSchnaps_17_01"); //Onar sagst du? Dieser alte Geizkragen? In diesem Fall kostet mein Heilmittel 100 Goldmünzen.
};

INSTANCE Info_Mod_Sagitta_OnarsHeilmittel (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsHeilmittel_Condition;
	information	= Info_Mod_Sagitta_OnarsHeilmittel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du das Gold.";
};

FUNC INT Info_Mod_Sagitta_OnarsHeilmittel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_OnarsSchnaps))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsHeilmittel_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsHeilmittel_15_00"); //Hier hast du das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsHeilmittel_17_01"); //Er muss diese Kräutermischung einfach trinken. Nach kurzer Zeit sollte es ihm dann besser gehen.

	B_GiveInvItems	(self, hero, ItPo_OnarsTrank, 1);
};

INSTANCE Info_Mod_Sagitta_MangelQuest (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_MangelQuest_Condition;
	information	= Info_Mod_Sagitta_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fungizid kaufen (80 Gold)";
};

FUNC INT Info_Mod_Sagitta_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Sagitta_Lehrer (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Lehrer_Condition;
	information	= Info_Mod_Sagitta_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir etwas über die Alchemie bei.";
};

FUNC INT Info_Mod_Sagitta_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter3))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Sagitta_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Sagitta_Lehrer_17_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
	Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,DIALOG_BACK,Info_Mod_Sagitta_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Trank der leichten Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Sagitta_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Leichter Heiltrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Sagitta_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Trank der schnellen Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Sagitta_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Sagitta_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Sagitta_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Sagitta_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (Mod_LehrlingBei != 1)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Sagitta_Lehrer_Perm_Health);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Trank des leichten Mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Sagitta_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Leichte Manatrank", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Sagitta_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Sagitta_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Sagitta_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Sagitta_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Trank der Geschwindigkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Sagitta_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Sagitta_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 4)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Sagitta_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice (Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Sagitta_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Sagitta_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Sagitta_Trade (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Trade_Condition;
	information	= Info_Mod_Sagitta_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sagitta_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sagitta_Pickpocket (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Pickpocket_Condition;
	information	= Info_Mod_Sagitta_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150_Female;
};

FUNC INT Info_Mod_Sagitta_Pickpocket_Condition()
{
	C_Beklauen	(130, ItPo_Gegengift, 4);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_BACK, Info_Mod_Sagitta_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sagitta_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sagitta_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sagitta_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sagitta_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sagitta_EXIT (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_EXIT_Condition;
	information	= Info_Mod_Sagitta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sagitta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};