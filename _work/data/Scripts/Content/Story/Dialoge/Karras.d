INSTANCE Info_Mod_Karras_Hallo (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Hallo_Condition;
	information	= Info_Mod_Karras_Hallo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso bist du bei den Beliaranh�ngern?";
};

FUNC INT Info_Mod_Karras_Hallo_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karras_Hallo_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_Hallo_15_00"); //Wieso bist du bei den Beliaranh�ngern?
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_36_01"); //Beliar hat mich dazu berufen, als ich erwachsen wurde.
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_36_02"); //Mein Vater war innosgl�ubig und ein Schl�ger. Er hat meine Mutter und meine Geschwister misshandelt.
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_36_03"); //Eines Nachts sprach Beliar zu mir. Ich ging zu meinem Vater und erw�rgte ihn im Schlaf. Von da an wurde alles besser.

	Info_ClearChoices	(Info_Mod_Karras_Hallo);

	Info_AddChoice	(Info_Mod_Karras_Hallo, "Eine spannende Geschichte!", Info_Mod_Karras_Hallo_B);
	Info_AddChoice	(Info_Mod_Karras_Hallo, "So ein Bl�dsinn.", Info_Mod_Karras_Hallo_A);
};

FUNC VOID Info_Mod_Karras_Hallo_B()
{
	AI_Output(hero, self, "Info_Mod_Karras_Hallo_B_15_00"); //Eine spannende Geschichte!
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_B_36_01"); //Sie zeigt, dass Beliar uns nicht im Stich l�sst. Und wenn du einmal Kontakt zu ihm hergestellt hast, kannst du immer mit ihm reden, wenn du es w�nschst.
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_B_36_02"); //So geht es zumindest mir.

	Info_ClearChoices	(Info_Mod_Karras_Hallo);
};

FUNC VOID Info_Mod_Karras_Hallo_A()
{
	AI_Output(hero, self, "Info_Mod_Karras_Hallo_A_15_00"); //So ein Bl�dsinn.
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_A_36_01"); //Ich kann verstehen, dass du es nicht wahrhaben willst. Aber Beliar k�mmert sich um die Benachteiligten.
	AI_Output(self, hero, "Info_Mod_Karras_Hallo_A_36_02"); //Die meisten von uns haben eine �hnliche Vorgeschichte wie ich. Zu den K�nigen und F�rsten spricht Beliar nicht.

	Info_ClearChoices	(Info_Mod_Karras_Hallo);
};

INSTANCE Info_Mod_Karras_HastDuAuftrag_2 (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_HastDuAuftrag_2_Condition;
	information	= Info_Mod_Karras_HastDuAuftrag_2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du einen Auftrag f�r mich, Meister?";
};

FUNC INT Info_Mod_Karras_HastDuAuftrag_2_Condition()
{
	if (Kapitel >= 2)
	&& (Mod_Gilde == 12)
	&& (Npc_KnowsInfo(hero, Info_Mod_Karras_Hallo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_HastDuAuftrag_2_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_HastDuAuftrag_2_15_00"); //Hast du einen Auftrag f�r mich, Meister?
	AI_Output(self, hero, "Info_Mod_Karras_HastDuAuftrag_2_36_01"); //Ja, ich habe eine Aufgabe f�r dich, junger Sch�ler. Meine Ohren vernahmen in letzter Zeit Ger�chte, dass unsere verhassten Br�der etwas Gro�es planen.
	AI_Output(self, hero, "Info_Mod_Karras_HastDuAuftrag_2_36_02"); //Geh den Ger�chten auf den Grund. Es w�re vermutlich das Kl�gste, wenn du dich an die Fersen des Boten heftest, den Pyrokar in letzter Zeit des �fteren in die Stadt geschickt hat.
	AI_Output(hero, self, "Info_Mod_Karras_HastDuAuftrag_2_15_03"); //Wo werde ich den Boten finden?
	AI_Output(self, hero, "Info_Mod_Karras_HastDuAuftrag_2_36_04"); //Unsere Sp�her berichten, dass er zu Mittag immer in der Taverne vor dem Kloster eine Pause einlegt, um ein Glas zu trinken.
	AI_Output(self, hero, "Info_Mod_Karras_HastDuAuftrag_2_36_05"); //Aus einem Glas wird meistens eine Flasche oder zwei. Du solltest keine Probleme haben, dem Boten den Brief abzuluchsen!
	AI_Output(self, hero, "Info_Mod_Karras_HastDuAuftrag_2_36_06"); //Lass dich jedoch nicht in deiner Robe erwischen!

	Log_CreateTopic	(TOPIC_MOD_KARRAS_BOTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KARRAS_BOTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KARRAS_BOTE, "Die Feuermagier scheinen etwas zu planen. Ich soll ihren Boten abfangen und seine Informationen zu Karras bringen. Mittags befindet er sich immer in der Taverne vor dem Kloster. Ich sollte aber nicht in meiner Robe dort auftauchen.");
};

INSTANCE Info_Mod_Karras_Bote (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Bote_Condition;
	information	= Info_Mod_Karras_Bote_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier eine Brief, Meister.";
};

FUNC INT Info_Mod_Karras_Bote_Condition()
{
	if (Npc_HasItems(hero, Mod_MattheusBotschaft) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Bote_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_Bote_15_00"); //Ich habe hier einen Brief, Meister.

	B_GiveInvItems	(hero, self, Mod_MattheusBotschaft, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Karras_Bote_36_01"); //Ah. Die Feuermagier wollen also Wachen aufstellen. Doch da Lord Hagen diesen Brief nicht bekommt, wird es wohl noch ein wenig dauern.

	if (Npc_KnowsInfo(hero, Info_Mod_Mattheus_Alk))
	{
		AI_Output(self, hero, "Info_Mod_Karras_Bote_36_02"); //Was hast du mit dem Boten gemacht?
		AI_Output(hero, self, "Info_Mod_Karras_Bote_15_03"); //Ich hab ihm noch was zu trinken gegeben, aber das scheint wohl ein Schluck zu viel gewesen zu sein, jedenfalls wird er jetzt nicht mehr aufstehen.
		AI_Output(self, hero, "Info_Mod_Karras_Bote_36_04"); //Dann wird es wohl noch ein wenig l�nger dauern, bis die Feuermagier Wind von der Sache bekommen.
	};

	AI_Output(self, hero, "Info_Mod_Karras_Bote_36_05"); //Du hast deine Aufgabe jedenfalls gut erf�llt. Hier ist eine kleine Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_KARRAS_BOTE, "Karras ist mit meiner Arbeit zufrieden.");

	B_SetTopicStatus	(TOPIC_MOD_KARRAS_BOTE, LOG_SUCCESS);

	B_G�ttergefallen(3, 1);
};

INSTANCE Info_Mod_Karras_Namib (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Namib_Condition;
	information	= Info_Mod_Karras_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dir diesen Brief geben.";
};

FUNC INT Info_Mod_Karras_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Namib))
	&& (Npc_HasItems(hero, ItWr_NamibForBeliar) == 1)
	&& (Npc_HasItems(hero, ItMi_HerbPaket) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_Namib_15_00"); //Ich soll dir diesen Brief geben.

	B_GiveInvItems	(hero, self, ItWr_NamibForBeliar, 1);

	B_UseFakeScroll();

	if (Mod_Gilde > 11)
	&& (Mod_Gilde < 16)
	{
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_01"); //Endlich, ich dachte schon, die fragen gar nicht mehr.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_02"); //Du hast damit gerechnet?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_03"); //Nat�rlich! Glaubst du, wir haben nicht mitbekommen, dass dieser gottverlassene Idiot in der H�hle oben seine Versuche macht?
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_04"); //Dann kommt ihr mit in den Sumpf.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_05"); //Ja ... das hei�t, nein.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_06"); //Was jetzt?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_07"); //Wir kommen mit, doch zuerst musst du etwas organisieren.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_08"); //Was?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_09"); //Ein Buch, das Necronomicum. Die Feuermagier haben es uns gestohlen. Es ist im Kloster.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_10"); //Und wie stellst du dir das vor? Ich kann nicht ins Kloster der Feuermagier! Ich habe dort den Hammer gestohlen und werde sicher gesucht.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_11"); //Was wei� ich, wie du das erledigst! Vielleicht hilft dir das hier weiter. Das ist ein Schlafkn�ppel.

		B_GiveInvItems	(self, hero, ItMw_UnconsciousKnueppel, 1);

		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_12"); //Er ist verzaubert. Schl�gst du jemanden damit, wird er in Ohnmacht fallen und sich an nichts mehr erinnern, wenn er aufwacht.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_13"); //Er funktioniert allerdings nur ein einziges Mal. Am besten siehst du dich mal in der Stadt um.

		B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Bevor Karras mit ins Minental geht, soll ich ihm ein Buch von der Feuermagiern holen, welches ihm gestohlen wurde. Ich sollte mich mal in der Stadt umh�ren.");

		Mod_Sekte_Karras = 2;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_14"); //Meinst du das ernsthaft? Und was bekommen wir als Gegenleistung?
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_15"); //Nun, ich soll euch dieses Paket hier geben.

		B_GiveInvItems	(hero, self, ItMi_HerbPaket, 1);

		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_16"); //Ein Paket Sumpfkraut? Dass ich nicht lache.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_17"); //Du glaubst doch nicht ernsthaft, dass wir uns nur wegen einem Paket Sumpfkraut so abm�hen? Ich mach dir einen Vorschlag.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_18"); //Es gibt etwas zu tun. Etwas, das nur jemand, der keiner unserer Br�der ist, machen kann.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_19"); //Was denn?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_20"); //Die Feuermagier haben uns ein Buch gestohlen. Du sollst es f�r uns zur�ckholen.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_21"); //Wenn ich den Feuermagiern dieses Buch stehle, dann kommt ihr mit?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_22"); //Also, erstens stiehlst du es nicht, sondern holst uns unser rechtm��iges Eigentum zur�ck, und zweitens, ja.
		AI_Output(hero, self, "Info_Mod_Karras_Namib_15_23"); //Na gut. Wo finde ich das Buch?
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_24"); //Vermutlich in ihrer Bibliothek.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_25"); //Und nimm diesen Kn�ppel. Er ist verzaubert. Schl�gst du jemanden damit, wird er in Ohnmacht fallen und sich an nichts mehr erinnern, wenn er aufwacht.

		B_GiveInvItems	(self, hero, ItMw_UnconsciousKnueppel, 1);

		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_26"); //Er funktioniert allerdings nur ein einziges Mal. Also pass gut auf. Versaust du das, musst du selbst eine M�glichkeit finden, die Wache auszuschalten.
		AI_Output(self, hero, "Info_Mod_Karras_Namib_36_27"); //Und jetzt beeil dich!

		B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Bevor Karras mit ins Minental geht, soll ich ihm ein Buch von der Feuermagiern holen, welches ihm gestohlen wurde.");

		Mod_Sekte_Karras = 1;
	};
};

INSTANCE Info_Mod_Karras_NamibHabBuch (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_NamibHabBuch_Condition;
	information	= Info_Mod_Karras_NamibHabBuch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Buch.";
};

FUNC INT Info_Mod_Karras_NamibHabBuch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_Namib))
	&& (Mod_Sekte_Aufnahme == 0)
	&& (Mod_Sekte_Karras >= 1)
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_NamibHabBuch_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_NamibHabBuch_15_00"); //Ich habe das Buch.

	B_GiveInvItems	(hero, self, ItWr_BeliarBook, 1);

	if (Mod_Sekte_Karras == 1)
	{
		AI_Output(self, hero, "Info_Mod_Karras_NamibHabBuch_36_01"); //Sehr gut. Dann gehen wir mit dir ins Minental. Sag, wenn du bereit bist.
		AI_Output(hero, self, "Info_Mod_Karras_NamibHabBuch_15_02"); //Ich muss noch jemanden abholen, dann k�nnen wir gehen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Karras_NamibHabBuch_36_03"); //Sehr gut! Damit sind die Vorbereitungen abgeschlossen.
		AI_Output(hero, self, "Info_Mod_Karras_NamibHabBuch_15_04"); //Die Vorbereitungen wozu?
		AI_Output(self, hero, "Info_Mod_Karras_NamibHabBuch_36_05"); //Das wirst du noch fr�h genug sehen. Sag Bescheid, sobald du gehen willst.
		AI_Output(hero, self, "Info_Mod_Karras_NamibHabBuch_15_06"); //Ich muss nur zuerst einen Freund aus einer H�hle holen.
	};

	AI_Output(self, hero, "Info_Mod_Karras_NamibHabBuch_36_07"); //Na gut.

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Jetzt muss ich noch Lester Bescheid geben und dann geht's mit Karras ins Minental.");
};

INSTANCE Info_Mod_Karras_Lester (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Lester_Condition;
	information	= Info_Mod_Karras_Lester_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir k�nnen gehen.";
};

FUNC INT Info_Mod_Karras_Lester_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Karras))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Lester_Info()
{
	AI_Output(hero, self, "Info_Mod_Karras_Lester_15_00"); //Wir k�nnen gehen.
	AI_Output(self, hero, "Info_Mod_Karras_Lester_36_01"); //Na gut.
	
	AI_StopProcessInfos	(self);

	Mod_Sekte_Aufnahme = 1;
};

INSTANCE Info_Mod_Karras_Namib2 (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Namib2_Condition;
	information	= Info_Mod_Karras_Namib2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_Namib2_Condition()
{
	if (Mod_Sekte_Aufnahme == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Namib2_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_Namib2_36_00"); //Berichte Baal Namib, dass wir hier sind.
};

INSTANCE Info_Mod_Karras_Leader (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Leader_Condition;
	information	= Info_Mod_Karras_Leader_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_Leader_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_AtTempel))
	&& (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Leader_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_00"); //Da bist du ja. Alles l�uft nach Plan. Bald ist es so weit.
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_01"); //Wir werden hier gleich Untote beschw�ren, aber keine Knochenger�ste, sondern die Sumpfhaie, die hier ihr Ende fanden.
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_02"); //Keine Angst, das hat den gleichen Effekt auf den Boden, doch wir werden einen Vorteil daraus ziehen.
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_03"); //Wir haben daf�r gesorgt, dass einer der Templer, der eine Kampfgruppe gegen die Untoten leiten sollte, nicht dazu kommen wird.
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_04"); //Du wirst seinen Platz einnehmen.
	AI_Output(hero, self, "Info_Mod_Karras_Leader_15_05"); //Warum?
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_06"); //Da, nimm diesen Stein.

	B_GiveInvItems	(self, hero, ItMi_SumpfhaiStein, 1);

	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_07"); //Er wird die Energie jedes Sumphaies absorbieren, den du oder jemand aus deiner Gruppe umbringt.
	AI_Output(self, hero, "Info_Mod_Karras_Leader_36_08"); //Es sollten mindestens zehn Haie sein, sonst war alles umsonst! Und jetzt geh.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Karras hat mir einen Stein gegeben. Er meinte, dass er die Energie von Sumpfhaien, die ich mit meiner Gruppe t�te, absorbieren wird.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Karras_Stein (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Stein_Condition;
	information	= Info_Mod_Karras_Stein_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_Stein_Condition()
{
	if (Npc_HasItems(hero, ItMi_SumpfhaiStein) == 1)
	&& (hero.guild == GIL_KDF)
	&& (Mod_Sekte_SH_Kampf == 4)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Stein_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_Stein_36_00"); //Gib mir den Stein.

	B_GiveInvItems	(hero, self, ItMi_SumpfhaiStein, 1);

	if (Mod_Sekte_UDS_Stein >= 10)
	{
		AI_Output(self, hero, "Info_Mod_Karras_Stein_36_01"); //Oh ja, sehr gut, er ist voll geladen. Komm in ein paar Tagen im Tal vorbei.
	
		B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Karras will, dass ich in ein paar Tagen nochmal bei ihm vorbei komme.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Karras_Stein_36_02"); //Aber ... der ist ja gar nicht aufgeladen! Verdammt, es war alles umsonst! Du nichtsnutziger Bastard! Geh mir aus den Augen!
	};
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	AI_Teleport	(self, "TOT");
};

INSTANCE Info_Mod_Karras_Fertig (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Fertig_Condition;
	information	= Info_Mod_Karras_Fertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_SUDD))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Fertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_Fertig_36_00"); //Ich werde jetzt wieder gehen.

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Karras_UDS (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_UDS_Condition;
	information	= Info_Mod_Karras_UDS_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_UDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_Stein))
	&& (Mod_Sekte_UDS_Stein >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_UDS_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_UDS_36_00"); //Ah, da bist du ja! Ich habe was f�r dich.
	AI_Output(self, hero, "Info_Mod_Karras_UDS_36_01"); //Hier, das ist eine Rune, die einen untoten Sumpfhai beschw�rt.

	B_GiveInvItems	(self, hero, ItRu_SumUDSwampshark, 1);

	AI_Output(self, hero, "Info_Mod_Karras_UDS_36_02"); //Wir haben sie mit der Energie des Steines, den du f�r uns aufgeladen hast, hergestellt.
	AI_Output(self, hero, "Info_Mod_Karras_UDS_36_03"); //Sumpfhaie sind z�he Gegner, untote Sumpfhaie sind unglaublich stark, aber diese, durch Magie beschworen, sind nahezu unbesiegbar!
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Karras_MagierWerden (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_MagierWerden_Condition;
	information	= Info_Mod_Karras_MagierWerden_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Karras_MagierWerden_Condition()
{
	if (Kapitel >= 3)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Befoerderung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Raven_Befoerderung))
	&& (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_MagierWerden_Info()
{
	AI_Output(self, hero, "Info_Mod_Karras_MagierWerden_36_00"); //Du bist nun bereit, ein Schwarzmagier zu werden.
	AI_Output(self, hero, "Info_Mod_Karras_MagierWerden_36_01"); //Wenn du dich f�r diesen Weg entscheidest, dann solltest du Xardas aufsuchen.
	AI_Output(self, hero, "Info_Mod_Karras_MagierWerden_36_02"); //Alternativ kannst du auch zu Raven gehen und dich dort den Schwarzen Kriegern anschlie�en.
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Karras_Kreis1	(C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis1_Condition;
	information	= Info_Mod_Karras_Kreis1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den ersten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_Kreis1_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_Hallo))
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_MagieKreis == 0)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_Kreis1_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis1_15_00"); //Lehre mich den ersten Kreis der Magie.
	
	if B_TeachMagicCircle (self, hero, 1)
	{
		AI_Output (self, hero, "Info_Mod_Karras_Kreis1_36_01"); //Der erste Kreis erlaubt es dir, Runen, die du erschaffen hast, anzuwenden.
		AI_Output (self, hero, "Info_Mod_Karras_Kreis1_36_02"); //Du kannst jetzt die Formeln der Zauberspr�che lernen, um deine eigenen Runen herzustellen.

		Mod_MagieKreis = 1;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Karras_Kreis2		(C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis2_Condition;
	information	= Info_Mod_Karras_Kreis2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den zweiten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_Kreis2_Condition ()
{	
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	&& (Mod_MagieKreis == 1)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_Kreis2_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis2_15_00"); //Lehre mich den zweiten Kreis der Magie.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, hero, 2)
		{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis2_36_01"); //Tritt nun in den zweiten Kreis und lerne, noch m�chtigere Zauber zu wirken.

			Mod_MagieKreis = 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_Kreis2_36_02"); //Die Zeit ist noch nicht gekommen.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Karras_Kreis3		(C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis3_Condition;
	information	= Info_Mod_Karras_Kreis3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den dritten Kreis der Magie.";
};
FUNC INT Info_Mod_Karras_Kreis3_Condition ()
{	
	if ((Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	&& (Mod_MagieKreis == 2)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_Kreis3_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis3_15_00"); //Lehre mich den dritten Kreis der Magie.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self, hero, 3)
		{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis3_36_01"); //Ja, die Zeit ist gekommen. Tritt ein in den dritten Kreis der Magie. Neue Zauber erwarten dich.

			Mod_MagieKreis = 3;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_Kreis3_36_02"); //Es ist noch nicht an der Zeit f�r dich, den dritten Kreis zu lernen.
	};
};		

INSTANCE Info_Mod_Karras_Kreis4 (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis4_Condition;
	information	= Info_Mod_Karras_Kreis4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den vierten Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Karras_Kreis4_Condition()
{	
	if (Mod_MagieKreis == 3)
	&& ((Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Karras_Kreis4_Info ()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis4_15_00"); //Ich will den vierten Kreis der Magie lernen.
	
	if (Kapitel >= 4)
	{
		if B_TeachMagicCircle (self,hero, 4)
		{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis4_36_01"); //Gut. Alle Zeichen sind erf�llt. Tritt nun ein in den vierten Kreis, auf dass dir die Macht der neuen Zauber inne werde.

			Mod_MagieKreis = 4;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis4_36_02"); //Noch ist es nicht soweit.
	};
};

INSTANCE Info_Mod_Karras_Kreis5 (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis5_Condition;
	information	= Info_Mod_Karras_Kreis5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den f�nften Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Karras_Kreis5_Condition()
{	
	if (Mod_MagieKreis == 4)
	&& (Mod_Gilde == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Kreis5_Info()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis5_15_00"); //Ich will den f�nften Kreis der Magie lernen.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,hero, 5)
		{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis5_36_01"); //Dann tritt nun ein in den f�nften Kreis der Magie. Du wirst nun m�chtigere Zauber als je zuvor beherrschen.

			Mod_MagieKreis = 5;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis5_36_02"); //Die Zeit ist noch nicht reif daf�r.
	};
};

INSTANCE Info_Mod_Karras_Kreis6	(C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Kreis6_Condition;
	information	= Info_Mod_Karras_Kreis6_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den letzten Kreis der Magie.";
};

FUNC INT Info_Mod_Karras_Kreis6_Condition()
{	
	if (Mod_MagieKreis == 5)
	&& (Mod_Gilde == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Karras_Kreis6_Info()
{
	AI_Output (hero, self, "Info_Mod_Karras_Kreis6_15_00"); //Lehre mich den letzten Kreis der Magie.
	
	if (Kapitel >= 6)
	{
		if B_TeachMagicCircle (self,hero, 6)  
		{
			AI_Output (self, hero, "Info_Mod_Karras_Kreis6_36_01"); //Viel Zeit ist vergangen, seit du den Bund mit Beliar eingegangen bist. Viel ist geschehen und wir finden keine Ruhe.
			AI_Output (self, hero, "Info_Mod_Karras_Kreis6_36_02"); //Du bist der Erw�hlte Beliars. Und als solcher wirst du alle Kraft brauchen, um deine K�mpfe zu bestehen.
			AI_Output (self, hero, "Info_Mod_Karras_Kreis6_36_03"); //Ich weihe dich nun, Erw�hlter. Du trittst ein in den sechsten Kreis.
			AI_Output (self, hero, "Info_Mod_Karras_Kreis6_36_04"); //Die Zauberformeln des letzten Kreises kannst du nun von Andokai lernen, wenn du es w�nschst.

			Mod_MagieKreis = 6;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Karras_Kreis6_36_05"); //Noch ist es nicht an der Zeit daf�r. Wenn du ein St�ck weiter auf dem Weg gegangen bist, den Beliar dir zeigt, dann werde ich dich unterweisen.
	};
};

INSTANCE Info_Mod_Karras_Pickpocket (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_Pickpocket_Condition;
	information	= Info_Mod_Karras_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Karras_Pickpocket_Condition()
{
	C_Beklauen	(136, ItMi_Gold, 62);
};

FUNC VOID Info_Mod_Karras_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Karras_Pickpocket);

	Info_AddChoice	(Info_Mod_Karras_Pickpocket, DIALOG_BACK, Info_Mod_Karras_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Karras_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Karras_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Karras_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Karras_Pickpocket);
};

FUNC VOID Info_Mod_Karras_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Karras_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Karras_Pickpocket);

		Info_AddChoice	(Info_Mod_Karras_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Karras_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Karras_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Karras_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Karras_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Karras_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Karras_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Karras_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Karras_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Karras_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Karras_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Karras_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Karras_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Karras_EXIT (C_INFO)
{
	npc		= Mod_514_DMB_Karras_MT;
	nr		= 1;
	condition	= Info_Mod_Karras_EXIT_Condition;
	information	= Info_Mod_Karras_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Karras_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Karras_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};