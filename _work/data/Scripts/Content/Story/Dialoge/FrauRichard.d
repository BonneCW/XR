INSTANCE Info_Mod_FrauRichard_Hi (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_Hi_Condition;
	information	= Info_Mod_FrauRichard_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung mit dir?";
};

FUNC INT Info_Mod_FrauRichard_Hi_Condition()
{
	if (Npc_IsDead(Ratte_Richard))
	&& (Npc_IsDead(Mod_7409_OUT_Richard_EIS))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_Hi_15_00"); //Alles in Ordnung mit dir?
	AI_Output(self, hero, "Info_Mod_FrauRichard_Hi_17_01"); //Ja, danke! Was ist passiert?
	AI_Output(hero, self, "Info_Mod_FrauRichard_Hi_15_02"); //Ich hab diesen Richard und seine Rattenbrut getötet. Du brauchst dir keine Sorgen mehr zu machen.
	AI_Output(self, hero, "Info_Mod_FrauRichard_Hi_17_03"); //Hast du meinen Mann gesehen? Die Ratten haben ihn und mich entführt.
};

INSTANCE Info_Mod_FrauRichard_Notiz (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_Notiz_Condition;
	information	= Info_Mod_FrauRichard_Notiz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tut mir leid, aber bei deinem Mann kam ich leider zu spät.";
};

FUNC INT Info_Mod_FrauRichard_Notiz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FrauRichard_Hi))
	&& (Npc_HasItems(hero, ItWr_CirioNotiz2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_Notiz_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_Notiz_15_00"); //Tut mir leid, aber bei deinem Mann kam ich leider zu spät. Ich konnte nur noch diesen Brief bei ihm finden.

	B_GiveInvItems	(hero, self, ItWr_CirioNotiz2, 1);

	B_UseFakescroll();

	AI_Output(self, hero, "Info_Mod_FrauRichard_Notiz_17_01"); //Mein Mann hat bis zum Ende für mich gekämpft.
	AI_Output(self, hero, "Info_Mod_FrauRichard_Notiz_17_02"); //Auch wenn die Nachricht schrecklich ist, danke ich dir, dass du dir die Mühe gemacht hast, mich zu finden.
	AI_Output(self, hero, "Info_Mod_FrauRichard_Notiz_17_03"); //Hier hast du 100 Gold. Ich weiß, es ist nicht viel, aber ich hoffe du kannst es gebrauchen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(hero, self, "Info_Mod_FrauRichard_Notiz_15_04"); //Am besten gehst du in die Stadt, dort bist du erst mal sicher. 
	AI_Output(self, hero, "Info_Mod_FrauRichard_Notiz_17_05"); //Ja, ich werde mich dort erst mal ausruhen und dann vielleicht nach Relendel zurückkehren.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "CITY");

	B_LogEntry	(TOPIC_MOD_RATTENQUEST,"Ich habe die Frau gefunden und gerettet. Damit sollte die Rattenplage beseitigt sein.");
	Log_SetTopicStatus	(TOPIC_MOD_RATTENQUEST, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_FrauRichard_InDorf (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_InDorf_Condition;
	information	= Info_Mod_FrauRichard_InDorf_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kommst du zurecht?";
};

FUNC INT Info_Mod_FrauRichard_InDorf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FrauRichard_Hi))
	&& (Npc_GetDistToWP(self, "EIS_161") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_InDorf_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_InDorf_15_00"); //Kommst du zurecht?
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf_17_01"); //Mehr oder weniger. Ich fühle mich nicht so recht wohl hier.
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf_17_02"); //Die Menschen - sie sind so kalt wie die Luft.
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf_17_03"); //Selbst tagsüber ist das Dorf wie ausgestorben.
};

INSTANCE Info_Mod_FrauRichard_InDorf2 (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_InDorf2_Condition;
	information	= Info_Mod_FrauRichard_InDorf2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso kehrst du dann nicht nach Relendel zurück?";
};

FUNC INT Info_Mod_FrauRichard_InDorf2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FrauRichard_InDorf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_InDorf2_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_InDorf2_15_00"); //Wieso kehrst du dann nicht nach Relendel zurück?
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf2_17_01"); //Ich habe es mir schon oft vorgenommen, aber der Weg hoch zum Steinkreis ist so lang und beschwerlich.
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf2_17_02"); //In letzter Zeit gab es auch immer mal wieder Meldungen von einer Räuberbande und vermissten Wanderern.
};

INSTANCE Info_Mod_FrauRichard_InDorf3 (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_InDorf3_Condition;
	information	= Info_Mod_FrauRichard_InDorf3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich könnte dich begleiten.";
};

FUNC INT Info_Mod_FrauRichard_InDorf3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FrauRichard_InDorf2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_InDorf3_Info()
{
	AI_Output(hero, self, "Info_Mod_FrauRichard_InDorf3_15_00"); //Ich könnte dich begleiten.
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf3_17_01"); //(erfreut) In dem Fall würde ich gern zurück nach Relendel.
	AI_Output(self, hero, "Info_Mod_FrauRichard_InDorf3_17_02"); //Meinetwegen können wir sofort aufbrechen, ich habe hier nichts, an dem ich hänge.

	Log_CreateTopic	(TOPIC_MOD_EIS_GELEIT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EIS_GELEIT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EIS_GELEIT, "Ich habe mich dazu bereit erklärt, die ehemalige Frau Richards zum Teleport beim Steinkreis außerhalb des Dorfes zu begleiten.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOSTEINKREIS");
};

INSTANCE Info_Mod_FrauRichard_AtSteinkreis (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_AtSteinkreis_Condition;
	information	= Info_Mod_FrauRichard_AtSteinkreis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_FrauRichard_AtSteinkreis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FrauRichard_InDorf3))
	&& (Npc_GetDistToWP(hero, "EIS_01") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FrauRichard_AtSteinkreis_Info()
{
	AI_Output(self, hero, "Info_Mod_FrauRichard_AtSteinkreis_17_00"); //Wir scheinen Glück gehabt zu haben. Heute ist keine Menschenseele unterwegs.
	AI_Output(hero, self, "Info_Mod_FrauRichard_AtSteinkreis_15_01"); //Ich bin gar nicht gewohnt, dass Eskorte-Aufträge so unspektakulär verlaufen. Soll mir aber recht sein.
	AI_Output(self, hero, "Info_Mod_FrauRichard_AtSteinkreis_17_02"); //Und zum zweiten Mal stehe ich in deiner Schuld. Ich danke dir.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_FrauRichard_AtSteinkreis_17_03"); //Komm mich doch mal in Khorata besuchen!

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_EIS_GELEIT, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATSTEINKREIS");

	CurrentNQ += 1;
};

INSTANCE Info_Mod_FrauRichard_EXIT (C_INFO)
{
	npc		= Mod_7410_OUT_Frau_EIS;
	nr		= 1;
	condition	= Info_Mod_FrauRichard_EXIT_Condition;
	information	= Info_Mod_FrauRichard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_FrauRichard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FrauRichard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};