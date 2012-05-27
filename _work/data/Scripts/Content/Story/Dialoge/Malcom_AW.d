INSTANCE Info_Mod_Malcom_AW_Hi (C_INFO)
{
	npc		= Mod_935_PIR_Malcom_AW;
	nr		= 1;
	condition	= Info_Mod_Malcom_AW_Hi_Condition;
	information	= Info_Mod_Malcom_AW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malcom_AW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_AW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_00"); //He Mann. Wie kommst du denn hierher?
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_01"); //Dasselbe könnte ich dich fragen.

	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_NW_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_02"); //Ich hatte Glück, dass Skip bei seiner Handelstour vorbeigekommen ist, sonst wäre ich wohl an diesem Strand verrottet.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_03"); //Ich war zuerst hier. Sehe jeden, der hier vorbeikommt. Und du kommst eindeutig aus der falschen Richtung.
		AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_04"); //Wieso? Ich komme vom Tempel drüben.
		AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_05"); //Unsinn. Da gibt’s nur den Einsiedler und diese schuppigen Ungeheuer im Sumpf.
	};

	AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_06"); //Wenn du meinst. Was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_07"); //Siehst du doch. Feuerholz für unser Lager.
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_08"); //Hier gibt’s ein Lager?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_09"); //Aber ja. Das Lager der gefürchtetsten Piraten der Meere.
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_10"); //Und wo finde ich das?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_11"); //Den Weg lang und vor der Ruine rechts. Ist nicht zu übersehen. Ach, und noch was.
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Hi_15_12"); //Ja?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_13"); //Falls Henry dich ins Lager lässt, rede mit Skip.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Hi_04_14"); //Sag ihm, ich hab Hunger und er soll mir was zum Essen schicken.

	Log_CreateTopic	(TOPIC_MOD_PIRATEN_MALCOM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_MALCOM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIRATEN_MALCOM, "Ich soll Skip im Lager sagen, dass Malcom hungrig ist und was zu essen braucht.");
};

INSTANCE Info_Mod_Malcom_AW_Schatzsuche (C_INFO)
{
	npc		= Mod_935_PIR_Malcom_AW;
	nr		= 1;
	condition	= Info_Mod_Malcom_AW_Schatzsuche_Condition;
	information	= Info_Mod_Malcom_AW_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg will auslaufen. Wir sollen die Vorbereitungen treffen.";
};

FUNC INT Info_Mod_Malcom_AW_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_AW_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_00"); //Greg will auslaufen. Wir sollen die Vorbereitungen treffen.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_01"); //Das hört man gern. Weißt du auch wohin?
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_02"); //Nein. Auf jeden Fall auf eine Schatzinsel.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_03"); //Das hört man noch lieber. Hmm ... da müsste ich aber noch was richten ...
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_04"); //Brauchst du mich dazu?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_05"); //Unbedingt. Hör zu:
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_06"); //Vor langer Zeit, kurz nachdem wir hier angelandet sind, hab ich mit meinem Entertrupp den Canyon ausgekundschaftet.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_07"); //'nen Haufen Viehzeug gab's da, aber mit denen sind wir fertig geworden.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_08"); //Irgendwann kamen wir in eine Riesenhöhle mit reichlich Riesenkrebsen drin.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_09"); //Wir konnten viele davon niedermachen, aber dabei sind zwei meiner Leute draufgegangen.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_10"); //Mir blieb nichts anderes übrig, als eiligst den Rückzug anzutreten.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_11"); //Seitdem war ich nicht mehr im Canyon.
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_12"); //Das waren wohl Minecrawler. Die gibt's überall auf der Insel.
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_13"); //Was hat das mit uns zu tun?
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_14"); //Ich muss wieder hin. Auf der Flucht ist mir unser Talismann abhanden gekommen.
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_15"); //Ohne den würde Greg niemals auslaufen.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_16"); //(zu sich selbst) Mann, sind die abergläubig.

	AI_TurnToNpc	(hero, self);

	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche_15_17"); //Und jetzt sollen wir zwei ...
	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche_04_18"); //Wir nehmen noch Jack mit. Er gehört zu meinem Entertrupp.

	Log_CreateTopic	(TOPIC_MOD_PIR_TALISMAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIR_TALISMAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIR_TALISMAN, "Malcom hat den Talisman der Mannschaft verloren. Ich soll helfen, ihn wiederzubeschaffen.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOJACK");
	B_StartOtherRoutine	(self, "MALCOM");
};

INSTANCE Info_Mod_Malcom_AW_Schatzsuche2 (C_INFO)
{
	npc		= Mod_935_PIR_Malcom_AW;
	nr		= 1;
	condition	= Info_Mod_Malcom_AW_Schatzsuche2_Condition;
	information	= Info_Mod_Malcom_AW_Schatzsuche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg will auslaufen. Wir sollen die Vorbereitungen treffen.";
};

FUNC INT Info_Mod_Malcom_AW_Schatzsuche2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Schatzsuche))
	&& (Npc_GetDistToWP(hero, "ADW_PIRATECAMP_WAY_07") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_AW_Schatzsuche2_Info()
{
	var c_npc Malcom; Malcom = Hlp_GetNpc(Mod_935_PIR_Malcom_AW);
	var c_npc Jack; Jack = Hlp_GetNpc(Mod_928_PIR_AlligatorJack_AW);

	TRIA_Invite(Jack);
	TRIA_Start();

	TRIA_Next(Malcom);

	AI_GotoNpc (Malcom, Jack);

	AI_TurnToNpc	(Malcom, Jack);
	AI_TurnToNpc	(Jack, Malcom);

	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche2_04_00"); //Hallo Jack. Wir müssen in den Canyon. Du kommst mit.

	TRIA_Next(Jack);

	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche2_12_01"); //Mit Freuden. Frag mich eh schon, warum ich die ganze Zeit hier rumstehen soll.

	TRIA_Next(Malcom);

	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche2_04_02"); //Alles mir nach.

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Malcom, "TOCANYON");
	B_StartOtherRoutine	(Jack, "TOCANYON");

	Wld_InsertItem	(ItMi_Talisman_Piraten, "FP_ITEM_CANYON_10");
};

INSTANCE Info_Mod_Malcom_AW_Schatzsuche3 (C_INFO)
{
	npc		= Mod_935_PIR_Malcom_AW;
	nr		= 1;
	condition	= Info_Mod_Malcom_AW_Schatzsuche3_Condition;
	information	= Info_Mod_Malcom_AW_Schatzsuche3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malcom_AW_Schatzsuche3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Schatzsuche2))
	&& (Npc_HasItems(hero, ItMi_Talisman_Piraten) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_AW_Schatzsuche3_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_AW_Schatzsuche3_15_00"); //Ich habe diese Figur hier gefunden.

	B_GiveInvItems	(hero, self, ItMi_Talisman_Piraten, 1);

	AI_Output(self, hero, "Info_Mod_Malcom_AW_Schatzsuche3_04_01"); //Ist ja noch mal gut gegangen. Jetzt nichts wie weg hier.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW, "START");

	B_LogEntry	(TOPIC_MOD_PIR_TALISMAN, "Der Talisman ist wieder in unserem Besitz.");
	B_SetTopicStatus	(TOPIC_MOD_PIR_TALISMAN, LOG_SUCCESS);

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(150);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Malcom_AW_EXIT (C_INFO)
{
	npc		= Mod_935_PIR_Malcom_AW;
	nr		= 1;
	condition	= Info_Mod_Malcom_AW_EXIT_Condition;
	information	= Info_Mod_Malcom_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Malcom_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};