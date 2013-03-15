INSTANCE Info_Mod_Shakir_Hi (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Hi_Condition;
	information	= Info_Mod_Shakir_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du Shakir, der Anführer der Gauner?";
};

FUNC INT Info_Mod_Shakir_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_00"); //Bist du Shakir, der Anführer der Gauner?
	AI_Output(self, hero, "Info_Mod_Shakir_Hi_31_01"); //Ja, das bin ich. Aber wer bist du denn? Dich habe ich hier noch nie gesehen!
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_02"); //Ich bin ...
	AI_Output(self, hero, "Info_Mod_Shakir_Hi_31_03"); //Auch egal. Ich frage mich nur, was du hier zu suchen hast.
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_04"); //Amir hat mich zu eurem Lager geführt, da ich ihm einen Gefallen getan habe.
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_05"); //Er meinte, dass ich mich euch anschließen sollte.
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_06"); //Am Tor habe ich dann mit Zahit darüber gesprochen, der am Ende gemeint hat, dass ich dich aufsuchen sollte.
	AI_Output(self, hero, "Info_Mod_Shakir_Hi_31_07"); //(grinst) Ah, Frischfleisch. Bevor du dich uns anschließen kannst, musst du noch aber einiges tun.
	AI_Output(self, hero, "Info_Mod_Shakir_Hi_31_08"); //Ich sage dir, da hast du dir einiges vorgenommen.
	AI_Output(hero, self, "Info_Mod_Shakir_Hi_15_09"); //Etwas ähnliches sagte mir schon Zahit.
};

INSTANCE Info_Mod_Shakir_GaunerWerden (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_GaunerWerden_Condition;
	information	= Info_Mod_Shakir_GaunerWerden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was muss ich tun, um ein Gauner werden zu können?";
};

FUNC INT Info_Mod_Shakir_GaunerWerden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shakir_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_GaunerWerden_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_00"); //Was muss ich tun, um ein Gauner werden zu können?
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_01"); //Im Grunde ist es ganz einfach. Du musst hier in unserem Viertel alle wichtigen Gauner auf deine Seite bringen.
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_02"); //Und was heißt das konkret?
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_03"); //Erfülle für jeden eine Aufgabe, um so Stimmen zu sammeln.
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_04"); //Wenn du alle Gauner überzeugt hast, auch mich, kannst du dich bei mir melden und ich nehme dich bei uns auf.
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_05"); //Dann wirst du zur Assassinengemeinschaft gehören.
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_06"); //Wer gehört alles zu den Gaunern, die ich überzeugen muss?
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_07"); //Folgende Mitglieder musst du überzeugen: Zeki, Ramsi, Aabid, Yasin, Yussuf und natürlich mich.
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_08"); //Das sind ja eine ganze Menge Leute.
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_09"); //(lacht) Du willst unser Vertrauen, also musst du auch etwas dafür tun.
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_10"); //(seufzt) Na gut, dann werde ich mich darum kümmern.
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden_31_11"); //(hämisch) Viel Spaß beim Stimmen sammeln.
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden_15_12"); //(trocken) Den werde ich haben.

	B_LogEntry	(TOPIC_MOD_ASS_VERTRAUEN, "Ich habe nun mit Shakir gesprochen, der bereit ist, mich bei den Gaunern aufzunehmen, aber nur unter einer Bedingung. Ich soll alle wichtigen Gauner im Viertel überzeugen, damit ich mich ihnen anschließen kann. Wenn ich das getan habe, soll ich mich wieder bei Shakir melden.");
};

INSTANCE Info_Mod_Shakir_Frau (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Frau_Condition;
	information	= Info_Mod_Shakir_Frau_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shakir_Frau_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	&& (Npc_KnowsInfo(hero, Info_Mod_Yussuf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Yasin_MikaTot))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aabid_HabPakete))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ramsi_JaegerTot))
	&& (Npc_KnowsInfo(hero, Info_Mod_Zeki_Laute))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Frau_Info()
{
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_00"); //Da bist du ja. Hab bis jetzt nur Gutes über dich gehört.

	if (Mod_ASS_Yussuf == 1)
	{
		AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_01"); //Das freut mich. Aber mit Yussuf bin ich nicht einig geworden.
		AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_02"); //Will heißen?
		AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_03"); //Seine Aufgabe fand ich nicht nicht korrekt. Den anderen gegenüber.
		AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_04"); //Hoppla! Ein Gauner mit Gewissen! Was ganz was Neues hier.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_05"); //Freut mich. Den Yussuf hab ich noch nicht. Hat keine Zeit, sagt er.
		AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_06"); //Muss selbst Aufträge für die Krieger machen, sagt er.
	};

	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_07"); //Nun gut erst mal. Höre, was meine Prüfung ist:
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_08"); //Zuerst 'ne Frage: Wann hast du das letzte Mal mit 'ner Frau geschlafen?
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_09"); //O Himmel! Das war in meinem letzten Leben. Da hatte ich mal Bromor besucht.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_10"); //Den Puff im Hafen?
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_11"); //Genau. Ich hab's nicht bereut.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_12"); //Da sind wir beim Problem. Du musst wissen, dass ich in Varant zwei Frauen hatte.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_13"); //Nun geht mir hier einiges ab. Du weißt schon, was ich meine ...
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_14"); //Gewiss. Ich soll dir nun Frauen beschaffen.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_15"); //Also eine würde schon reichen.
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_16"); //Warum gehst du dann nicht in die Stadt? Ihr habt doch sicher noch Verkleidungen.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_17"); //Das ist nicht das Problem. Aber man kennt mich dort. Vor allem die Miliz.
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_18"); //Aha. Schon unangenehm aufgefallen.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_19"); //Das will ich meinen. Du bringst die Schöne in die Höhle vom Getränkepanscher hier in der Nähe.
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_20"); //Und der kann dann schon mal ...
	AI_Output(self, hero, "Info_Mod_Shakir_Frau_31_21"); //Bist du verrückt? Der macht eh nichts, ist viel zu beschäftigt.
	AI_Output(hero, self, "Info_Mod_Shakir_Frau_15_22"); //Alles klar. Will sehen, was ich für dich machen kann.

	Log_CreateTopic	(TOPIC_MOD_ASS_SHAKIR_FRAU, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_SHAKIR_FRAU, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Für Shakir soll ich eine Frau für gewisse Stunden auftreiben. Was denen alles einfällt. Am besten, ich rede mal mit Bromor. Wenn ich eine habe, soll ich sie zu einer Höhle in der Nähe des Assassinenlagers bringen, wo ein Alchemist zu hausen scheint.");
};

INSTANCE Info_Mod_Shakir_Frau2 (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Frau2_Condition;
	information	= Info_Mod_Shakir_Frau2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Melde mich zurück.";
};

FUNC INT Info_Mod_Shakir_Frau2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_Shakir3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Frau2_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_Frau2_15_00"); //Melde mich zurück. Ich hab dir eine schöne junge Frau besorgt. Sie wartet unten in der Höhle.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau2_31_01"); //Wirklich? Du bist ein Mordskerl.
	AI_Output(hero, self, "Info_Mod_Shakir_Frau2_15_02"); //Ich hab ihr dieses Kleid versprochen. Hier, nimm.

	B_GiveInvItems	(hero, self, ItAr_GrittasKleid, 1);

	AI_Output(hero, self, "Info_Mod_Shakir_Frau2_15_03"); //Und beeil dich. Bevor sie sich's anders überlegt.
	AI_Output(self, hero, "Info_Mod_Shakir_Frau2_31_04"); //Bin schon weg. Du wartest hier.

	B_SetTopicStatus	(TOPIC_MOD_ASS_SHAKIR_FRAU, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_ShakirGritta_Day = Wld_GetDay();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRITTA");
};

INSTANCE Info_Mod_Shakir_GaunerWerden2 (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_GaunerWerden2_Condition;
	information	= Info_Mod_Shakir_GaunerWerden2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shakir_GaunerWerden2_Condition()
{
	if (Mod_ASS_ShakirGritta == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_GaunerWerden2_Info()
{
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_00"); //Wow! Das war's. Aber hallo!

	if (Mod_ASS_Yussuf == 1)
	{
		AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden2_15_01"); //Freut mich. Ich habe nun alle Aufgaben erledigt. Wie geht es weiter?
		AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_02"); //Ich bin über alles unterrichtet und halte dich für absolut geeignet, unserem Verein beizutreten.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden2_15_03"); //Freut mich. Ich habe noch den Yussuf.
		AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_04"); //Vergiss ihn. Du bist erst kurz bei uns und hast schon so viel erledigt. Schneller als sonst ein Anwärter.
		AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_05"); //Ich halte dich für absolut geeignet, unserem Verein beizutreten.

		B_SetTopicStatus	(TOPIC_MOD_ASS_YUSSUF_HILFE, LOG_SUCCESS);
	};

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_06"); //Wenn du willst, kannst du dich uns nun anschließen.

		B_LogEntry	(TOPIC_MOD_ASS_VERTRAUEN, "Shakir war voll begeistert von meiner Vermittlung. Er hat mir die Prüfung von Yussuf erlassen und mir die Möglichkeit gegeben, Gauner zu werden.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden2_31_07"); //Leider gehörst du schon zu vielen Gemeinschaften an.
	};

	B_GivePlayerXP	(250);

	AI_UnequipArmor	(Mod_580_NONE_Gritta_NW);

	AI_EquipArmor (Mod_580_NONE_Gritta_NW, ItAr_GrittasKleid);
};

INSTANCE Info_Mod_Shakir_GaunerWerden3 (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_GaunerWerden3_Condition;
	information	= Info_Mod_Shakir_GaunerWerden3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Gauner werden.";
};

FUNC INT Info_Mod_Shakir_GaunerWerden3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden2))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_GaunerWerden3_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_GaunerWerden3_15_00"); //Ich will Gauner werden.
	AI_Output(self, hero, "Info_Mod_Shakir_GaunerWerden3_31_01"); //Hier hast du deine Gaunerkluft. Du meldest dich bei dem Krieger Masut.

	CreateInvItems	(hero, ITAR_Gauner, 1);

	B_ShowGivenThings	("Gaunerkluft erhalten");

	B_GivePlayerXP	(250);

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Ich gehöre jetzt zu den Assassinen.");

	Mod_7117_ASS_Krieger_NW.aivar[AIV_PASSGATE] = TRUE;

	Mod_AnzahlNebengilden += 1;

	Assassinen_Dabei = TRUE;
};

INSTANCE Info_Mod_Shakir_Assassinengold (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Assassinengold_Condition;
	information	= Info_Mod_Shakir_Assassinengold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shakir_Assassinengold_Condition()
{
	if (Mod_ASS_Assassinengold == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Assassinengold_Info()
{
	AI_Output(self, hero, "Info_Mod_Shakir_Assassinengold_31_00"); //Willkommen zurück. Warst du erfolgreich?
	AI_Output(hero, self, "Info_Mod_Shakir_Assassinengold_15_01"); //Ich glaube schon. Mal sehen.
};

INSTANCE Info_Mod_Shakir_Zeremoniendolch (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Zeremoniendolch_Condition;
	information	= Info_Mod_Shakir_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Shakir_Zeremoniendolch_Condition()
{
	if (Npc_HasItems(hero, ItMw_Avaquar) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Zeremoniendolch_Info()
{
	AI_Output(self, hero, "Info_Mod_Shakir_Zeremoniendolch_31_00"); //Gibt's was Neues?
	AI_Output(hero, self, "Info_Mod_Shakir_Zeremoniendolch_15_01"); //Nein. Hast du was?
	AI_Output(self, hero, "Info_Mod_Shakir_Zeremoniendolch_31_02"); //Und ob! Da hinten braut sich was zusammen, denke ich.
	AI_Output(hero, self, "Info_Mod_Shakir_Zeremoniendolch_15_03"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Mod_Shakir_Zeremoniendolch_31_04"); //Die Krieger sind irgendwie unruhig. Immer wieder rennt hier einer raus oder kommt zurückgehastet. Sogar tagsüber.
	AI_Output(self, hero, "Info_Mod_Shakir_Zeremoniendolch_31_05"); //Wo doch sonst kaum jemand am Tag das Lager verlässt ...
	AI_Output(hero, self, "Info_Mod_Shakir_Zeremoniendolch_15_06"); //Ich schau mal.
};

INSTANCE Info_Mod_Shakir_Blutkelch (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Blutkelch_Condition;
	information	= Info_Mod_Shakir_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo.";
};

FUNC INT Info_Mod_Shakir_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Masut_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_Blutkelch_15_00"); //Hallo.
	AI_Output(self, hero, "Info_Mod_Shakir_Blutkelch_31_01"); //In Kriegerrüstung! Hätte dich fast nicht erkannt. Wie hast du ...?
	AI_Output(hero, self, "Info_Mod_Shakir_Blutkelch_15_02"); //Tut jetzt nichts zur Sache. Sag, sind dir auch Magier aufgefallen, die nachts aus dem Lager gehen?
	AI_Output(self, hero, "Info_Mod_Shakir_Blutkelch_31_03"); //Ja, da ist erst mal der Mufid, und dann noch einer. Weiß allerdings nicht, wie der heißt.
	AI_Output(self, hero, "Info_Mod_Shakir_Blutkelch_31_04"); //Die waren schon halbe Nächte unterwegs.
	AI_Output(hero, self, "Info_Mod_Shakir_Blutkelch_15_05"); //Aha. Und, haben die was gesagt?
	AI_Output(self, hero, "Info_Mod_Shakir_Blutkelch_31_06"); //Nee, hatten es nur eilig.
	AI_Output(hero, self, "Info_Mod_Shakir_Blutkelch_15_07"); //Hmm ... danke.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Habe erfahren, dass nachts einige Magier das Lager verlassen. Das hat bestimmt mit dem Kelch zu tun.");
};

INSTANCE Info_Mod_Shakir_NachSchlacht (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_NachSchlacht_Condition;
	information	= Info_Mod_Shakir_NachSchlacht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du sollst zum Rat kommen.";
};

FUNC INT Info_Mod_Shakir_NachSchlacht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Naim_NachSchlacht2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Shakir_NachSchlacht_Info()
{
	AI_Output(hero, self, "Info_Mod_Shakir_NachSchlacht_15_00"); //Du sollst zum Rat kommen.
	AI_Output(self, hero, "Info_Mod_Shakir_NachSchlacht_31_01"); //Was ist bloß los da drinnen?
	AI_Output(hero, self, "Info_Mod_Shakir_NachSchlacht_15_02"); //Du wirst schon sehen. Mach hin.

	B_StartOtherRoutine	(Mod_7105_ASS_Aabid_NW,	"START");
	B_StartOtherRoutine	(Mod_7106_ASS_Ramsi_NW,	"START");
	B_StartOtherRoutine	(Mod_7102_ASS_Zeki_NW,	"START");
	B_StartOtherRoutine	(Mod_7103_ASS_Gauner_NW,	"START");
	B_StartOtherRoutine	(Mod_7108_ASS_Gauner_NW,	"START");
	B_StartOtherRoutine	(Mod_7107_ASS_Gauner_NW,	"START");
	B_StartOtherRoutine	(Mod_7113_ASS_Yussuf_NW,	"START");
	B_StartOtherRoutine	(Mod_7111_ASS_Yasin_NW,	"START");
	B_StartOtherRoutine	(Mod_7104_ASS_Shakir_NW,	"START");

	Npc_RemoveInvItems	(hero, ItKe_XR_NW_HOEHLE_01, 1);
};

INSTANCE Info_Mod_Shakir_Pickpocket (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_Pickpocket_Condition;
	information	= Info_Mod_Shakir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Shakir_Pickpocket_Condition()
{
	C_Beklauen	(75, ItPo_Pflanzengift, 1);
};

FUNC VOID Info_Mod_Shakir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);

	Info_AddChoice	(Info_Mod_Shakir_Pickpocket, DIALOG_BACK, Info_Mod_Shakir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Shakir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Shakir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Shakir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);
};

FUNC VOID Info_Mod_Shakir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);

		Info_AddChoice	(Info_Mod_Shakir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Shakir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Shakir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Shakir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Shakir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Shakir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Shakir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Shakir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Shakir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Shakir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Shakir_EXIT (C_INFO)
{
	npc		= Mod_7104_ASS_Shakir_NW;
	nr		= 1;
	condition	= Info_Mod_Shakir_EXIT_Condition;
	information	= Info_Mod_Shakir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Shakir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Shakir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};