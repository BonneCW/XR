INSTANCE Info_Mod_Attila_Hi (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Hi_Condition;
	information	= Info_Mod_Attila_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und froh das du aus dem Kerker bist?";
};

FUNC INT Info_Mod_Attila_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_WelcomeBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Attila_Hi_15_00"); //Und, froh das du aus dem Kerker bist?
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_01"); //Die Frage bedarf wohl keiner Antwort, Sohn der Gerissenheit.
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_02"); //Du hast deinen Anteil bei meiner Befreiung geleistet und dafür danke ich dir.
	AI_Output(hero, self, "Info_Mod_Attila_Hi_15_03"); //Was hast du jetzt vor?
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_04"); //Nun. Cassia hat mir direkt einen neuen Auftrag gegeben.
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_05"); //Da ich aber nach der Zeit im Kerker etwas eingerostet bin, soll ich jemanden zur Unterstützung mitnehmen.
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_06"); //Ich habe gehört, dass du während meiner Abwesenheit einige Bandenmitglieder eliminiert hast?
	AI_Output(hero, self, "Info_Mod_Attila_Hi_15_07"); //Ich hatte keine Wahl ...
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_08"); //Würdest du mich mit deiner Erfahrung etwas unterstützen?
	AI_Output(hero, self, "Info_Mod_Attila_Hi_15_09"); //Und gegen wenn geht es?
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_10"); //Es hieß, ein "Möchtegern" hätte sich mit Meldor angelegt und das Sumpfkraut nicht bezahlt.
	AI_Output(hero, self, "Info_Mod_Attila_Hi_15_11"); //Na gut, aber nur das eine mal!
	AI_Output(self, hero, "Info_Mod_Attila_Hi_09_12"); //Folge mir.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "MOECHTEGERN");

	Wld_InsertNpc	(Mod_7702_OUT_Moechtegern_NW,	"NW_CITY_HABOUR_KASERN_05_01");
};

INSTANCE Info_Mod_Attila_Moechtegern (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Moechtegern_Condition;
	information	= Info_Mod_Attila_Moechtegern_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_Moechtegern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_05_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Moechtegern_Info()
{
	var c_npc Attila; Attila = Hlp_GetNpc(Mod_760_NONE_Attila_NW);
	var c_npc Moechtegern; Moechtegern = Hlp_GetNpc(Mod_7702_OUT_Moechtegern_NW);

	TRIA_Invite(Moechtegern);
	TRIA_Start();

	TRIA_Next(Attila);

	AI_GotoNpc	(Attila, Moechtegern);

	AI_TurnToNpc	(Attila, Moechtegern);
	AI_TurnToNpc	(Moechtegern, Attila);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_09_00"); //Ohh, Sohn des grünen Dunstes ... woher stammt das viele Kraut?
	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_09_01"); //Du scheinst mir eigentlich nicht mit dem nötigen Reichtum gesegnet, es auf "ehrlichem" Wege zu erstehen.

	TRIA_Next(Moechtegern);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_04_02"); //Was zum Teufel laberst du da? Mein Kraut geht dich einen Scheiß an.
	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_04_03"); //Mach also, dass du wegkommst, bevor ich meinen Schuh dort versenke, wo keine Sonne scheint.

	TRIA_Next(Attila);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_09_04"); //In dem Fall darf ich zu erkennen geben, dass ich gekommen bin das Sumpfkraut und deinen Kopf zu holen.

	TRIA_Next(Moechtegern);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_04_05"); //Besser du kriechst wieder unter deinen Stein oder du wirst mit deinem Freund den nächsten Tag nicht mehr erleben.

	Moechtegern.guild = GIL_STRF;
	Npc_SetTrueGuild	(Moechtegern, GIL_STRF);

	TRIA_Next(Attila);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern_09_06"); //Richte der ewigen Finsternis meinen Gruß aus. Beliar erwartet dich.

	TRIA_Finish();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Attila_Moechtegern2 (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Moechtegern2_Condition;
	information	= Info_Mod_Attila_Moechtegern2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_Moechtegern2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_Moechtegern))
	&& (Npc_IsDead(Mod_7702_OUT_Moechtegern_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Moechtegern2_Info()
{
	AI_GotoNpc	(self, Mod_7702_OUT_Moechtegern_NW);

	AI_PlayAni	(self, "T_PLUNDER");

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern2_09_00"); //Nun sollten wir jedoch von dannen ziehen, ehe die Miliz kommt.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOMELDOR");
};

INSTANCE Info_Mod_Attila_Moechtegern3 (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Moechtegern3_Condition;
	information	= Info_Mod_Attila_Moechtegern3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_Moechtegern3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_Moechtegern2))
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_POOR_AREA_PATH_20") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Moechtegern3_Info()
{
	var c_npc Attila; Attila = Hlp_GetNpc(Mod_760_NONE_Attila_NW);
	var c_npc Meldor; Meldor = Hlp_GetNpc(Mod_597_NONE_Meldor_NW);

	TRIA_Invite(Meldor);
	TRIA_Start();

	TRIA_Next(Attila);

	AI_GotoNpc	(Attila, Meldor);

	AI_TurnToNpc	(Attila, Meldor);
	AI_TurnToNpc	(Meldor, Attila);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern3_09_00"); //Hier hast du dein Sumpfkraut wieder, Vater der Geschäftstüchtigkeit.

	TRIA_Next(Meldor);

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern3_04_01"); //Wie auch immer, danke. Auf dich kann man sich verlassen.

	TRIA_Next(Attila);

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOLAGER");
};

INSTANCE Info_Mod_Attila_Moechtegern4 (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Moechtegern4_Condition;
	information	= Info_Mod_Attila_Moechtegern4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Attila_Moechtegern4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Attila_Moechtegern3))
	&& (Npc_GetDistToWP(self, "NW_CITY_KANAL_ROOM_05_03") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Moechtegern4_Info()
{
	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern4_09_00"); //Danke für deine Unterstützung. Nimm dieses bescheidene Präsent als Zeichen meines Dankes.

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItPo_Tiergift, 1);

	B_ShowGivenThings	("200 Gold und Tiergift erhalten");

	AI_Output(self, hero, "Info_Mod_Attila_Moechtegern4_09_01"); //Ja, du hast zuletzt wahrhaft gezeigt, dass der finstere Gott dich mit Gerissenheit gesegnet hat.

	B_GivePlayerXP	(150);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FREE");
};

INSTANCE Info_Mod_Attila_Umzug (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Umzug_Condition;
	information	= Info_Mod_Attila_Umzug_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist los? Wo sind alle hin?";
};

FUNC INT Info_Mod_Attila_Umzug_Condition()
{
	if (Mod_Diebe_Weg == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Attila_Umzug_Info()
{
	AI_Output(hero, self, "Info_Mod_Attila_Umzug_15_00"); //Was ist los? Wo sind alle hin?
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_01"); //Unsere Kellergemeinschaft begibt sich nach Khorata, Sohn der Unwissenheit.
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_02"); //Seit den Ereignissen mit den dämonischen Schatten sind die Bürger und Wachen so misstrauisch und vorsichtig, wie nie zuvor.
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_03"); //Für mehr, als paar kleine Gaunereien, wird es in dieser Stadt keine Gelegenheit mehr geben.
	AI_Output(hero, self, "Info_Mod_Attila_Umzug_15_04"); //Das war es also mit uns und Khorinis.
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_05"); //Es ist die einzige Möglichkeit einem ehrbaren Beruf zu entgehen ...
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_06"); //Cassia hat mich übrigens darum gebeten dir auszurichten, dass du dich in die Taverne Khoratas begeben sollst.
	AI_Output(self, hero, "Info_Mod_Attila_Umzug_09_07"); //Es geht darum dort eine neue Unterkunft für uns zu finden.
	AI_Output(hero, self, "Info_Mod_Attila_Umzug_15_08"); //Mach ich. Bis bald.

	Log_CreateTopic	(TOPIC_MOD_DIEB_UMZUG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_UMZUG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_UMZUG, "Nach der Geschichte mit den Seelenpeinigern kann man in Khorinis dem Diebeshandwerk kaum noch erfolgreich nachgehen, Daher zieht unsere Kellergemeinschaft nach Khorata um. Nun geht es zuerst darum, dort eine neue Unterkunft zu finden. Dazu soll ich in die Taverne Khoratas gehen.");
};

INSTANCE Info_Mod_Attila_Pickpocket (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_Pickpocket_Condition;
	information	= Info_Mod_Attila_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Attila_Pickpocket_Condition()
{
	C_Beklauen	(87, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Attila_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Attila_Pickpocket);

	Info_AddChoice	(Info_Mod_Attila_Pickpocket, DIALOG_BACK, Info_Mod_Attila_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Attila_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Attila_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Attila_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Attila_Pickpocket);
};

FUNC VOID Info_Mod_Attila_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Attila_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Attila_Pickpocket);

		Info_AddChoice	(Info_Mod_Attila_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Attila_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Attila_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Attila_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Attila_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Attila_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Attila_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Attila_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Attila_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Attila_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Attila_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Attila_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Attila_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Attila_EXIT (C_INFO)
{
	npc		= Mod_760_NONE_Attila_NW;
	nr		= 1;
	condition	= Info_Mod_Attila_EXIT_Condition;
	information	= Info_Mod_Attila_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Attila_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Attila_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};