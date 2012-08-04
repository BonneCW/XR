INSTANCE Info_Mod_Dever_Trador (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_Trador_Condition;
	information	= Info_Mod_Dever_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dever_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Giftpflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dever_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_00"); //Willkommen zurück.
	AI_Output(hero, self, "Info_Mod_Dever_Trador_15_01"); //Kannst du mir sagen, welche Magier im Moment vermisst werden?
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_02"); //Vermisst wird eigentlich keiner, aber ich habe ein paar seit einigen Tagen nicht mehr gesehen.
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_03"); //Asko hat sich auf den Weg zu den Ruinen gemacht.
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_04"); //Fore hat etwas von seltenen Pflanzen gebrabbelt und ist den Hang runter gegangen.
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_05"); //Dean wollte, glaube ich, den Steinkreis untersuchen.
	AI_Output(hero, self, "Info_Mod_Dever_Trador_15_06"); //Ich werde die drei mal aufsuchen.
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_07"); //Das ist nett. Wenn du Dean triffst, frag ihn mal, ob er jetzt die Antwort auf meine Frage kennt.
	AI_Output(self, hero, "Info_Mod_Dever_Trador_11_08"); //Er sitzt schon ziemlich lange daran.

	Log_CreateTopic	(TOPIC_MOD_DEVER_DEAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DEVER_DEAN, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Per_Trador))
	{
		B_LogEntry	(TOPIC_MOD_DEVER_DEAN, "Ich soll Dean fragen, ob er nun die Antwort auf Devers Frage kennt.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_FAICE_GIFT, TOPIC_MOD_DEVER_DEAN, "Seit einigen Tagen nicht mehr aufgetaucht sind: Asko, der ist bei den Ruinen; Fore, der ist unten am Hang; und Dean, der ist beim Steinkreis.", "Ich soll Dean fragen, ob er nun die Antwort auf Devers Frage kennt.");
	};
};

INSTANCE Info_Mod_Dever_Dean (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_Dean_Condition;
	information	= Info_Mod_Dever_Dean_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dever_Dean_Condition()
{
	if (Mod_Turendil_Faice_Day == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dever_Dean_Info()
{
	AI_Output(self, hero, "Info_Mod_Dever_Dean_11_00"); //Da bist du ja wieder. Was hast du herausgefunden?
	AI_Output(hero, self, "Info_Mod_Dever_Dean_15_01"); //Dean wurde von einem Golem umgebracht, der von einem Betrüger namens Trador hierher gesendet wurde.
	AI_Output(self, hero, "Info_Mod_Dever_Dean_11_02"); //Oh nein! Wie konnte das passieren? Ich habe gar keinen Golem gesehen.
	AI_Output(self, hero, "Info_Mod_Dever_Dean_11_03"); //Du solltest Genn davon 	berichten.

	if (!Npc_KnowsInfo(hero, Info_Mod_Per_Dean))
	{
		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Ich habe von Deans Tod berichtet. Jetzt sollte ich zurück zu Genn gehen und ihn von den Ereignissen in Kenntnis setzen.");
	};
};

INSTANCE Info_Mod_Dever_Frage (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_Frage_Condition;
	information	= Info_Mod_Dever_Frage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich konnte Dean leider nicht mehr nach der Antwort fragen.";
};

FUNC INT Info_Mod_Dever_Frage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dever_Trador))
	&& (Mod_Turendil_Faice_Day == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dever_Frage_Info()
{
	AI_Output(hero, self, "Info_Mod_Dever_Frage_15_00"); //Ich konnte Dean leider nicht mehr nach der Antwort fragen.
	AI_Output(self, hero, "Info_Mod_Dever_Frage_11_01"); //Verständlich. Aber die Antwort ist irgendwo da draußen ...

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_DEVER_DEAN, "Ich habe Dever gesagt, dass ich Dean schlecht nach der Antwort fragen konnte.");
	B_SetTopicStatus	(TOPIC_MOD_DEVER_DEAN, LOG_SUCCESS);
};

var int Mod_Knows_DeverTeacher;

INSTANCE Info_Mod_Dever_Lernen (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_Lernen_Condition;
	information	= Info_Mod_Dever_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will stärker werden!";
};

FUNC INT Info_Mod_Dever_Lernen_Condition()
{
	if (hero.attribute[ATR_STRENGTH] < 200)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dever_Lernen_Info()
{
	if (Mod_Knows_DeverTeacher == FALSE)
	{
		Mod_Knows_DeverTeacher = TRUE;

		Log_CreateTopic	(TOPIC_MOD_LEHRER_VM, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_VM, "Dever kann mir helfen stärker zu werden.");
	};

	AI_Output(hero, self, "Info_Mod_Dever_Lernen_15_00"); //Ich will stärker werden!

	Info_ClearChoices	(Info_Mod_Dever_Lernen);

	Info_AddChoice	(Info_Mod_Dever_Lernen, DIALOG_BACK, Info_Mod_Dever_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_5);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_1);
};

FUNC VOID Info_Mod_Dever_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Dever_Lernen);
};

FUNC VOID Info_Mod_Dever_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Dever_Lernen);

	Info_AddChoice	(Info_Mod_Dever_Lernen, DIALOG_BACK, Info_Mod_Dever_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_5);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_1);
};

FUNC VOID Info_Mod_Dever_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Dever_Lernen);

	Info_AddChoice	(Info_Mod_Dever_Lernen, DIALOG_BACK, Info_Mod_Dever_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_5);
	Info_AddChoice	(Info_Mod_Dever_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Dever_Lernen_1);
};

INSTANCE Info_Mod_Dever_Pickpocket (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_Pickpocket_Condition;
	information	= Info_Mod_Dever_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Dever_Pickpocket_Condition()
{
	C_Beklauen	(79, ItPo_Perm_Dex, 1);
};

FUNC VOID Info_Mod_Dever_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Dever_Pickpocket);

	Info_AddChoice	(Info_Mod_Dever_Pickpocket, DIALOG_BACK, Info_Mod_Dever_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Dever_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Dever_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Dever_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Dever_Pickpocket);
};

FUNC VOID Info_Mod_Dever_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Dever_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Dever_Pickpocket);

		Info_AddChoice	(Info_Mod_Dever_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Dever_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Dever_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Dever_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Dever_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Dever_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Dever_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Dever_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Dever_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Dever_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Dever_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Dever_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Dever_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Dever_EXIT (C_INFO)
{
	npc		= Mod_7354_VMG_Dever_TUG;
	nr		= 1;
	condition	= Info_Mod_Dever_EXIT_Condition;
	information	= Info_Mod_Dever_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Dever_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dever_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};