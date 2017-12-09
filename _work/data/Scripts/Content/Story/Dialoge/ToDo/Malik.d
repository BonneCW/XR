INSTANCE Info_Mod_Malik_Aufgabe (C_INFO)
{
	npc		= Mod_7123_ASS_Malik_NW;
	nr		= 1;
	condition	= Info_Mod_Malik_Aufgabe_Condition;
	information	= Info_Mod_Malik_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malik_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Masut_Jack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malik_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Malik_Aufgabe_13_00"); //Aha, der Neue! Auf Stimmenfang, höre ich.
	AI_Output(hero, self, "Info_Mod_Malik_Aufgabe_15_01"); //Du sagst es. Was kostet deine?
	AI_Output(self, hero, "Info_Mod_Malik_Aufgabe_13_02"); //Eine Gefälligkeit. Nur eine  kleine Gefälligkeit.
	AI_Output(hero, self, "Info_Mod_Malik_Aufgabe_15_03"); //Und die wäre?
	AI_Output(self, hero, "Info_Mod_Malik_Aufgabe_13_04"); //Man wird alt. Man schläft schlecht auf den harten Betten. Ich brauche was Weiches unter den Kopf.
	AI_Output(hero, self, "Info_Mod_Malik_Aufgabe_15_05"); //Wie wäre es mit einem Fell vom Schaf?
	AI_Output(self, hero, "Info_Mod_Malik_Aufgabe_13_06"); //Nein, nein. Das wird hart und stinkt. Was warmes, weiches, sauberes soll es schon sein.
	AI_Output(hero, self, "Info_Mod_Malik_Aufgabe_15_07"); //Dann werde ich mal die Händler abklappern.
	AI_Output(self, hero, "Info_Mod_Malik_Aufgabe_13_08"); //Am Besten die in Khorata. Die sollen doch so fortschrittlich sein, sagt man.
	AI_Output(hero, self, "Info_Mod_Malik_Aufgabe_15_09"); //Gute Idee. Bis später.

	Log_CreateTopic	(TOPIC_MOD_ASS_KISSEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_KISSEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Was Weiches für den Kopf! Was es alles gibt. Ich denke, ich frage erst mal Matteo, der ist wohl der beste Händler im Ort. Ansonsten werde ich mich in Khorata umsehen müssen.");
};

INSTANCE Info_Mod_Malik_Kissen (C_INFO)
{
	npc		= Mod_7123_ASS_Malik_NW;
	nr		= 1;
	condition	= Info_Mod_Malik_Kissen_Condition;
	information	= Info_Mod_Malik_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dein Weiches für den Kopf.";
};

FUNC INT Info_Mod_Malik_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Kissen) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malik_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Malik_Kissen_15_00"); //Hier, dein Weiches für den Kopf.

	B_GiveInvItems	(hero, self, ItMi_Kissen, 1);

	AI_Output(self, hero, "Info_Mod_Malik_Kissen_13_01"); //Was ist denn das? Ein lila Viereck.
	AI_Output(hero, self, "Info_Mod_Malik_Kissen_15_02"); //Leg dich hin und mach es unter deinen Kopf.

	AI_GotoWP	(self, "WP_ASSASSINE_31");

	AI_UseMob	(self, "BEDHIGH", 1);
	AI_UseMob	(self, "BEDHIGH", -1);

	AI_GotoNpc	(self, hero);

	AI_Output(hero, self, "Info_Mod_Malik_Kissen_15_03"); //Und? Zufrieden?
	AI_Output(self, hero, "Info_Mod_Malik_Kissen_13_04"); //Bei allen Geistern. Wunderbar weich und riecht gut. Bin mehr als zufrieden.
	AI_Output(hero, self, "Info_Mod_Malik_Kissen_15_05"); //Dann habe ich deine Stimme?
	AI_Output(self, hero, "Info_Mod_Malik_Kissen_13_06"); //Aber ja. Ich würde dir sogar zwei geben, wenn's möglich wäre. Aber jetzt lass mich schlafen.
	AI_Output(self, hero, "Info_Mod_Malik_Kissen_13_07"); //Ach ja, eines noch. Sinbad sucht dich.

	B_LogEntry	(TOPIC_MOD_ASS_KRIEGER, "Malik war sehr zufrieden. Seine Stimme ist mir sicher. Soll nun zu Sinbad.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_KISSEN, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SLEEP");
};

INSTANCE Info_Mod_Malik_Pickpocket (C_INFO)
{
	npc		= Mod_7123_ASS_Malik_NW;
	nr		= 1;
	condition	= Info_Mod_Malik_Pickpocket_Condition;
	information	= Info_Mod_Malik_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Malik_Pickpocket_Condition()
{
	C_Beklauen	(117, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_Malik_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Malik_Pickpocket);

	Info_AddChoice	(Info_Mod_Malik_Pickpocket, DIALOG_BACK, Info_Mod_Malik_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Malik_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Malik_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Malik_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Malik_Pickpocket);
};

FUNC VOID Info_Mod_Malik_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Malik_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Malik_Pickpocket);

		Info_AddChoice	(Info_Mod_Malik_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Malik_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Malik_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Malik_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Malik_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Malik_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Malik_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Malik_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Malik_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Malik_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Malik_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Malik_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Malik_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Malik_EXIT (C_INFO)
{
	npc		= Mod_7123_ASS_Malik_NW;
	nr		= 1;
	condition	= Info_Mod_Malik_EXIT_Condition;
	information	= Info_Mod_Malik_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Malik_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};