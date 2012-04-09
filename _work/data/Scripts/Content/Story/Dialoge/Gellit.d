INSTANCE Info_Mod_Gellit_Hi (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_Hi_Condition;
	information	= Info_Mod_Gellit_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gellit_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tondral_Ken))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gellit_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_03_00"); //Wer bist du und wo kommst du her?
	AI_Output(hero, self, "Info_Mod_Gellit_Hi_15_01"); //Ich komme aus dem Minental.
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_03_02"); //Minental? Nie davon gehört. Was hast du hier zu suchen?
	AI_Output(hero, self, "Info_Mod_Gellit_Hi_15_03"); //Ich suche einen Verwandlungszauber. Er soll sich hier irgendwo befinden. Ich bin hier doch in Gelato, oder?
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_03_04"); //Ja. Aber mit Zauberei habe ich nichts am Hut. Sprich mal mit dem Dorfschamanen. Aber keine Tricksereien.

	B_LogEntry	(TOPIC_MOD_FERCO_WANZE, "Ein Mann namens Gellit hat gesagt, ich solle mich bezüglich des Verwandlungszaubers zum Dorfschamanen begeben. Mir bleibt keine andere Wahl.");

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Gellit_Hi);

	Info_AddChoice	(Info_Mod_Gellit_Hi, "Darauf wäre ich auch von allein gekommen.", Info_Mod_Gellit_Hi_A);
	Info_AddChoice	(Info_Mod_Gellit_Hi, "Danke für den Tipp. Ich werde mich dann mal auf den Weg machen.", Info_Mod_Gellit_Hi_B);
};

FUNC VOID Info_Mod_Gellit_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Gellit_Hi_B_15_00"); //Danke für den Tipp. Ich werde mich dann mal auf den Weg machen.
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_B_03_01"); //Eins noch. Bring ihm ein kleines Geschenk mit, dann wird er freundlicher sein. Am besten du nimmst Fisch.
	AI_Output(hero, self, "Info_Mod_Gellit_Hi_B_15_02"); //Fisch? Wo bekomme ich denn Fisch her?
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_B_03_03"); //Ich habe dir schon zu viel gesagt, jetzt mach dass du wegkommst.

	B_LogEntry	(TOPIC_MOD_FERCO_WANZE, "Gellit erwähnte außerdem, dass ich dem Schamanen ein Geschenk, am besten Fisch, mitbringen sollte, da er dann freundlicher zu mir wäre.");

	VMG_Second = 6;

	Info_ClearChoices	(Info_Mod_Gellit_Hi);
};

FUNC VOID Info_Mod_Gellit_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Gellit_Hi_A_15_00"); //Darauf wäre ich auch von allein gekommen.
	AI_Output(self, hero, "Info_Mod_Gellit_Hi_A_03_01"); //Große Klappe, wie? Aber ich bin nicht dumm und lasse mich auf ein Geplänkel ein. Mach dass du wegkommst.

	VMG_Second = 5;

	Info_ClearChoices	(Info_Mod_Gellit_Hi);
};

INSTANCE Info_Mod_Gellit_RaueSchneide (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_RaueSchneide_Condition;
	information	= Info_Mod_Gellit_RaueSchneide_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gellit_RaueSchneide_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gellit_RaueSchneide_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gellit_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Gellit_RaueSchneide_03_00"); //Ach, noch etwas.
	};

	AI_Output(self, hero, "Info_Mod_Gellit_RaueSchneide_03_01"); //Wenn du einen guten Ruf und Ansehen in unserem Land bekommen willst, solltest du dich bei Kommander Willingham melden. Er wird dich einzusetzen wissen.
	AI_Output(self, hero, "Info_Mod_Gellit_RaueSchneide_03_02"); //Die Kaserne ist am anderen Ende der Stadt. Dort sind seine Truppen stationiert.
};

INSTANCE Info_Mod_Gellit_Schneegeister (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_Schneegeister_Condition;
	information	= Info_Mod_Gellit_Schneegeister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gellit_Schneegeister_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thys_Eriskult))
	&& (Wld_GetDay()-4 > Mod_Thys_Schneegeister_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gellit_Schneegeister_Info()
{
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_00"); //Warte. Du bist doch recht viel unterwegs draußen.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_01"); //Sei vorsichtig, denn zurzeit treiben sich wieder recht viel Schneegeister draußen herum.
	AI_Output(hero, self, "Info_Mod_Gellit_Schneegeister_15_02"); //Gut, ich werde aufpassen.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_03"); //Ja, da tust du gut daran. Mit denen ist nicht zu spaßen.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_04"); //Wenn ich daran denke, dass es eine Zeit gab, wo das Dorf noch nicht unter ihnen gelitten hat ...
	AI_Output(hero, self, "Info_Mod_Gellit_Schneegeister_15_05"); //Wieso? Ich dachte, sie waren schon immer da?
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_06"); //Nein, erst seit einigen Jahrzehnten gehören sie zum festen Bild der Landschaft hier.
	AI_Output(hero, self, "Info_Mod_Gellit_Schneegeister_15_07"); //Wie ist es damals dazu gekommen?
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_08"); //Gute Frage. Das weiß niemand so genau.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_09"); //Einige sehen Beliars Bosheit darin, andere die Strafe Innos, für tadeliges Verhalten.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_10"); //Manche wiederum machen Dämonen dafür verantwortlich, oder gar die Gestirne ...  unzählige Mutmaßungen gibt es.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_11"); //Was  ich auch einmal gehört hatte ist, dass jemand  wegen dunkler Rituale aus dem Dorf verbannt worden sein soll.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_12"); //Einige der Alten meinen ihrerseits, dass es damit zusammenhängen könnte. Kann aber auch genauso gut Unsinn sein.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister_03_13"); //Frag am besten mal unseren Dorfältesten Thys, wenn du mehr wissen möchtest.

	Log_CreateTopic	(TOPIC_MOD_GELLIT_SCHNEEGEISTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GELLIT_SCHNEEGEISTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GELLIT_SCHNEEGEISTER, "Gellit berichtete mir, dass die Geister nicht immer die Umgebung des Dorfes unsicher gemacht hätten, wusste aber auch nicht näheres zu ihrem Ursprung. Vielleicht kann Thys mir mehr dazu berichten.");
};

INSTANCE Info_Mod_Gellit_Schneegeister2 (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_Schneegeister2_Condition;
	information	= Info_Mod_Gellit_Schneegeister2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gellit_Schneegeister2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thys_Schneegeister3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gellit_Schneegeister2_Info()
{
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister2_03_00"); //Hey, unglaubliche Neuigkeiten. Fast alle Schneegeister haben sich verflüchtigt.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister2_03_01"); //Ich habe Gerüchte gehört, wonach irgendein Abenteurer angeblich die Wurzel des Übels gefunden und ausgemerzt haben soll.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister2_03_02"); //Mann, dem würde ich die Hand schütteln und erst mal auf einen Drink in der Taverne einladen.
	AI_Output(self, hero, "Info_Mod_Gellit_Schneegeister2_03_03"); //Ich meine, kannst du dir das vorstellen? Endlich keine Schneegeister mehr.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Gellit_Pickpocket (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_Pickpocket_Condition;
	information	= Info_Mod_Gellit_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Gellit_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 1200);
};

FUNC VOID Info_Mod_Gellit_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gellit_Pickpocket);

	Info_AddChoice	(Info_Mod_Gellit_Pickpocket, DIALOG_BACK, Info_Mod_Gellit_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gellit_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gellit_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gellit_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gellit_Pickpocket);
};

FUNC VOID Info_Mod_Gellit_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gellit_Pickpocket);
};

INSTANCE Info_Mod_Gellit_EXIT (C_INFO)
{
	npc		= Mod_1953_EIS_Gellit_EIS;
	nr		= 1;
	condition	= Info_Mod_Gellit_EXIT_Condition;
	information	= Info_Mod_Gellit_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gellit_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gellit_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};