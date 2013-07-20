INSTANCE Info_Mod_Amir_Hi (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Hi_Condition;
	information	= Info_Mod_Amir_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_Hi_Condition()
{
	if (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Mod_Gilde > 3)
	&& (Mod_DidCrime)
	&& (hero.guild != GIL_PAL)
	&& (Wld_IsTime(22,00,08,00))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_Hi_13_00"); //Na was bist denn du für einer? Hast du vielleicht Interesse mir bei einer Sache zu helfen, Kleiner?

	Info_ClearChoices	(Info_Mod_Amir_Hi);

	Info_AddChoice	(Info_Mod_Amir_Hi, "Nein, kein Interesse!", Info_Mod_Amir_Hi_B);
	Info_AddChoice	(Info_Mod_Amir_Hi, "Ja, aber immer doch! Um was geht es?", Info_Mod_Amir_Hi_A);
};

FUNC VOID Info_Mod_Amir_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Amir_Hi_B_15_00"); //Nein, kein Interesse!
	AI_Output(self, hero, "Info_Mod_Amir_Hi_B_13_01"); //(wütend) Gut, dann habe ich mich also in dir getäuscht. Verschwinde aus meinen Augen und komme nie wieder!

	Info_ClearChoices	(Info_Mod_Amir_Hi);
};

FUNC VOID Info_Mod_Amir_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Amir_Hi_A_15_00"); //Ja, aber immer doch! Um was geht es?
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_01"); //(lächelnd) Gut, ich wusste doch, dass ich mich auf einen Mann wie dich verlassen könnte. Dieser Auftrag ist von dringlicher Wichtigkeit, also musst du mir gut zuhören und genau arbeiten.
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_02"); //Der Lohn ist hoch und du könntest es dann zu etwas Großem bringen.
	AI_Output(hero, self, "Info_Mod_Amir_Hi_A_15_03"); //Red' nicht um den heißen Brei herum, sondern erkläre mir, was ich tun soll. Ich hoffe, dass meine Belohnung angemessen sein wird.
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_04"); //Mach dir um deine Belohnung keine Sorgen, eher über das, was dich erwarten wird. Ich warne dich vorher schon, es wird kein leichtes Unterfangen.
	AI_Output(hero, self, "Info_Mod_Amir_Hi_A_15_05"); //Schieß schon endlich los!
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_06"); //(flüstert) In der Stadt gibt es im Hafenviertel einen sehr reichen Bürger, der etwas hat, dass ich gerne haben möchte.
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_07"); //Einen der drei sogenannten Blutkelche die über geheimnisvolle Kräfte verfügen sollen. Leider rückt er diese Kostbarkeit nicht raus und das stört mich etwas.
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_08"); //Ich will, dass du heute Abend diesen Lehmar beseitigst und den Kelch an dich bringst. Doch sei gewarnt: Lehmar hat wegen mir zwei Halsabschneider angeheuert, die nachts patroullieren.
	AI_Output(self, hero, "Info_Mod_Amir_Hi_A_13_09"); //Also geh' vorsichtig vor. Ich erwarte dich nach Ende der Aufgabe am östlichen Stadttor.
	AI_Output(hero, self, "Info_Mod_Amir_Hi_A_15_10"); //Alles klar, ich ziehe los. Ich werde dich dann dort treffen.

	Log_CreateTopic	(TOPIC_MOD_ASS_LEHMAR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_LEHMAR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_LEHMAR, "Ich habe im Tempelviertel der Stadt Khorinis eine merkwürdige Gestalt getroffen. Der Mann, der mir keine Angaben über sich selbst gab, betreute mich mit einer wichtigen Aufgabe. Ich soll bei Nacht dem Geldverleiher Lehmar einen sogenannten Blutkelch abnehmen und ihn töten. Doch warnte mich der Mann davor, dass Lehmar von einigen Wachen umgeben sein wird. Ich muss mir etwas einfallen lassen.");

	Mod_ASS_AmirLehmar = 1;

	Info_ClearChoices	(Info_Mod_Amir_Hi);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "LEHMAR");
};

INSTANCE Info_Mod_Amir_Lehmar (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Lehmar_Condition;
	information	= Info_Mod_Amir_Lehmar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_Lehmar_Condition()
{
	if (Npc_IsDead(Mod_537_NONE_Lehmar_NW))
	&& (Npc_HasItems(hero, ItMi_BloodCup_MIS) == 1)
	&& (Npc_HasItems(hero, ItWr_BookLehmar) == 1)
	&& (Npc_HasItems(hero, ItMi_GoldPlate) >= 6)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (Mod_ASS_AmirLehmar == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Lehmar_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_00"); //(lacht) Das ich dich noch einmal wieder sehe, damit habe ich nicht gerechnet. Ich dachte du hättest Angst bekommen und wirst nicht mehr auftauchen.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_01"); //Respekt Kleiner, gute Arbeit!
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_15_02"); //Es war auch keine leichte Aufgabe, doch ich habe das, was du wolltest.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_03"); //Hast du den Kelch dabei?
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_15_04"); //Ja, und noch andere Dinge waren in der Truhe von Lehmar. Ein Buch und sechs goldene Teller mit einer feinen Runenschrift sowie 500 Goldstücke.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_05"); //Das Gold sollst du behalten, aber den Rest gibst du mir.

	Npc_RemoveInvItems	(hero, ItMi_BloodCup_MIS, 1);
	Npc_RemoveInvItems	(hero, ItWr_BookLehmar, 1);
	Npc_RemoveInvItems	(hero, ItMi_GoldPlate, 6);

	B_ShowGivenThings	("Blutkelch, Buch und sechs goldene Teller gegeben");

	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_15_06"); //Und was ist mit meiner Belohnung?
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_07"); //Das hätte ich ganz vergessen. Hier sind 100 Goldstücke für deine Mühen und ich habe ein interessantes Angebot für dich.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_15_08"); //Um was geht es in deinem Angebot?
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_13_09"); //Sage mir zuerst, ob du überhaupt darauf eingehen willst.

	B_GivePlayerXP	(250);

	B_SetTopicStatus	(TOPIC_MOD_ASS_LEHMAR, LOG_SUCCESS);

	B_Göttergefallen(3, 1);

	B_RemoveNpc	(Mod_7363_VLK_LehmarWache_NW);
	B_RemoveNpc	(Mod_7364_VLK_LehmarWache_NW);

	Info_ClearChoices	(Info_Mod_Amir_Lehmar);

	Info_AddChoice	(Info_Mod_Amir_Lehmar, "Nein, doch lieber nicht. Bis dann!", Info_Mod_Amir_Lehmar_B);

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		Info_AddChoice	(Info_Mod_Amir_Lehmar, "Klar!", Info_Mod_Amir_Lehmar_A);
	};
};

FUNC VOID Info_Mod_Amir_Lehmar_B()
{
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_B_15_01"); //Nein, doch lieber nicht. Bis dann!
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_B_13_00"); //(enttäuscht) Schade, da kann man wohl nichts machen. Ich denke wir werden uns dann nie wieder sehen.

	Info_ClearChoices	(Info_Mod_Amir_Lehmar);
};

FUNC VOID Info_Mod_Amir_Lehmar_A()
{
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_A_15_00"); //Klar!
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_01"); //Ich wusste das du der richtige Mann bist, also will ich dir alles genau erklären.
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_A_15_02"); //Also was für ein Angebot hast du für mich?
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_03"); //Wie du siehst gehöre ich nicht zu den Menschen, die legal ihr Gold erwerben. Ich bin einer der Assassinen aus Varant, die sich hier auf Khorinis niedergelassen haben.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_04"); //Wir suchen ständig nach neuen Leuten und du scheinst genau der Mann zu sein, den man sich gut als Assassinen vorstellen könnte.
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_A_15_05"); //(erstaunt) Assassinen? Wie seid ihr auf die Insel gekommen?
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_06"); //Unsere mächtigen Anführer haben uns alle hier auf die Insel telepotiert, da wir keine Lust mehr hatten auf dem Festland zu verweilen.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_07"); //Deshalb sind wir auf die Insel gekommen und verstecken uns seitdem in einer Höhle nahe der Stadt. Dort ist unser Lager und von dort aus agieren wir heimlich.
	AI_Output(hero, self, "Info_Mod_Amir_Lehmar_A_15_08"); //Ich fühle mich geehrt, dieses Angebot erhalten zu haben, und würde mich euch gerne anschließen.
	AI_Output(self, hero, "Info_Mod_Amir_Lehmar_A_13_09"); //(grinst) Sehr gut. Also dann folge mir mal, ich führe dich zum Versteck unserer Leute. Beeil dich!

	Log_CreateTopic	(TOPIC_MOD_ASS_VERSTECK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSTECK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_VERSTECK, "Amir wird mich nun zum Versteck der Assassinen führen. Dieses soll in einer Höhle nahe der Stadt sein.");

	Mod_ASS_AmirLehmar = 2;

	Info_ClearChoices	(Info_Mod_Amir_Lehmar);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VERSTECK");
};

INSTANCE Info_Mod_Amir_AtVersteck (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_AtVersteck_Condition;
	information	= Info_Mod_Amir_AtVersteck_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_AtVersteck_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amir_Lehmar))
	&& (Mod_ASS_AmirLehmar == 2)
	&& (Npc_GetDistToWP(self, "WP_ASSASSINE_13") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_AtVersteck_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_AtVersteck_13_00"); //So, da wären wir auch schon. Hinter dieser Tür befinden sich die Hallen, die wir unser Heim nennen. Ich gebe dir den Schlüssel zur Tür, damit du passieren kannst.

	B_GiveInvItems	(self, hero, ItKe_XR_NW_HOEHLE_01, 1);

	AI_Output(self, hero, "Info_Mod_Amir_AtVersteck_13_01"); //Wir sehen und sicher wieder, aber ich muss wieder los. Bis dann!
	AI_Output(hero, self, "Info_Mod_Amir_AtVersteck_15_02"); //Okay. Man sieht sich Amir, mach's gut!
	
	B_GivePlayerXP	(50);

	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSTECK, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Amir_Zeremoniendolch (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Zeremoniendolch_Condition;
	information	= Info_Mod_Amir_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, Amir.";
};

FUNC INT Info_Mod_Amir_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Azhar_Later))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch_15_00"); //Hallo, Amir. Du hast im Lager etwas von einem Zeremoniendolch gefaselt. Kannst du mir Näheres erzählen?
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch_13_01"); //Nicht wirklich. Aber der Wassertyp da draußen am Tempel hat was von einem Dolch erzählt.
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch_15_02"); //Nun gut, dann frag ich den mal. Und sauf nicht so viel, du sollst hier doch beobachten.
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch_13_03"); //Hier drin in der Kneipe erfahre ich allemal mehr, als draußen auf dem Platz.
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch_13_04"); //Und das Gefasel von diesem senilen Blaukittel kann ich nicht mehr hören. Erzählt immer dasselbe.
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch_15_05"); //Wie du meinst. Ich rede mal mit Vatras.
	
	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Amir hat mich zu Vatras geschickt. Sicher weiß der mehr.");
};

INSTANCE Info_Mod_Amir_Zeremoniendolch2 (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Zeremoniendolch2_Condition;
	information	= Info_Mod_Amir_Zeremoniendolch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_Zeremoniendolch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_PosWechsel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Zeremoniendolch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch2_13_00"); //He! Hast du mich verpfiffen? Plötzlich muss ich hier Wache schieben.
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch2_15_01"); //Nichts mehr mit den ganzen Tag in der Kneipe hocken, was? Aber nein, ich hab nichts gesagt.
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch2_13_02"); //Wenn ich da was merke ... Übrigens, der Rat wartet auf dich.
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch2_15_03"); //Ich weiß.
};

INSTANCE Info_Mod_Amir_Zeremoniendolch3 (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Zeremoniendolch3_Condition;
	information	= Info_Mod_Amir_Zeremoniendolch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_Zeremoniendolch3_Condition()
{
	if (Npc_HasItems(hero, ItMw_Avaquar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Zeremoniendolch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_Zeremoniendolch3_13_00"); //Du hast's gut, ständig auf Achse. Und ich steh mir hier die Beine in den Bauch.
	AI_Output(hero, self, "Info_Mod_Amir_Zeremoniendolch3_15_01"); //Dem Tüchtigen gehört die Welt.
};

INSTANCE Info_Mod_Amir_Blutkelch (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Blutkelch_Condition;
	information	= Info_Mod_Amir_Blutkelch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Amir_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shakir_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Amir_Blutkelch_Info()
{
	AI_Output(self, hero, "Info_Mod_Amir_Blutkelch_13_00"); //Schon wieder unterwegs?
	AI_Output(hero, self, "Info_Mod_Amir_Blutkelch_15_01"); //Wie du siehst. Sag, ist dir hier irgendwas aufgefallen?
	AI_Output(self, hero, "Info_Mod_Amir_Blutkelch_13_02"); //Eigentlich nicht. Aber ich stehe ja noch nicht lange hier am Tor.
	AI_Output(self, hero, "Info_Mod_Amir_Blutkelch_13_03"); //Allerdings meint der Krieger da drüben, dass hier in letzter Zeit reichlich Verkehr herrscht.
	AI_Output(hero, self, "Info_Mod_Amir_Blutkelch_15_04"); //Aha. Und wer verkehrt dann hier?
	AI_Output(self, hero, "Info_Mod_Amir_Blutkelch_13_05"); //Tags einige Krieger und nachts, so gegen Mitternacht, Magier.
	AI_Output(hero, self, "Info_Mod_Amir_Blutkelch_15_06"); //(selbst) Hm ... die Krieger gehen wahrscheinlich trainieren aufs Plateau. Aber die Magier ... Hm ...
	AI_Output(hero, self, "Info_Mod_Amir_Blutkelch_15_07"); //Dieser Erol hat doch was erzählt von grünem Licht in der Höhle am kleinen See ... Mal sehen.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Werde mal der Goblinhöhle bei Erol einen Besuch abstatten. So gegen Mitternacht ...");

	Wld_SendTrigger	("EVT_ASSASSINENREPERTOIRE");

	B_StartOtherRoutine	(Mod_7156_ASS_Mirza_NW,	"VERRAT");
	B_StartOtherRoutine	(Mod_7149_ASS_Mufid_NW,	"VERRAT");
};

INSTANCE Info_Mod_Amir_Pickpocket (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_Pickpocket_Condition;
	information	= Info_Mod_Amir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Amir_Pickpocket_Condition()
{
	C_Beklauen	(111, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Amir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Amir_Pickpocket);

	Info_AddChoice	(Info_Mod_Amir_Pickpocket, DIALOG_BACK, Info_Mod_Amir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Amir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Amir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Amir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Amir_Pickpocket);
};

FUNC VOID Info_Mod_Amir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Amir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Amir_Pickpocket);

		Info_AddChoice	(Info_Mod_Amir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Amir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Amir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Amir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Amir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Amir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Amir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Amir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Amir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Amir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Amir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Amir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Amir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Amir_EXIT (C_INFO)
{
	npc		= Mod_7199_ASS_Amir_NW;
	nr		= 1;
	condition	= Info_Mod_Amir_EXIT_Condition;
	information	= Info_Mod_Amir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Amir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Amir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};