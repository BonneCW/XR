INSTANCE Info_Mod_Brendan_Hi (C_INFO)
{
	npc		= Mod_7730_OUT_Brendan_EIS;
	nr		= 1;
	condition	= Info_Mod_Brendan_Hi_Condition;
	information	= Info_Mod_Brendan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brendan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brendan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brendan_Hi_06_00"); //Ich danke dir! Du hast mir mein Leben gerettet. Einen Tag länger und ich wäre all zu gern vom Turm gesprungen.
	AI_Output(self, hero, "Info_Mod_Brendan_Hi_06_01"); //Aber wo bleiben meine Manieren. Mein Name ist Brendan und ich stehe in deiner schuld.
	AI_Output(hero, self, "Info_Mod_Brendan_Hi_15_02"); //Scheint eine ziemlich gefährliche Gegend zu sein. Das waren nicht wenige Wölfe.
	AI_Output(self, hero, "Info_Mod_Brendan_Hi_06_03"); //Ja, stimmt, und am Pass scheint es auch nicht besser zu sein. Nachts kann man die Feuer der Orks unten im Tal vor dem Pass sehen.
	AI_Output(self, hero, "Info_Mod_Brendan_Hi_06_04"); //Wir dachten die Orks aus dem Gebirge würden nur vereinzelt auftreten, aber mittlerweile sind sie am Pass überall anzutreffen.
	AI_Output(self, hero, "Info_Mod_Brendan_Hi_06_05"); //Wir müssen den Kommander so bald wie möglich darüber informieren.
	AI_Output(hero, self, "Info_Mod_Brendan_Hi_15_06"); //Dann lass uns dorthin aufbrechen, bevor noch mehr Wölfe oder Orks hier herkommen.

	B_LogEntry	(TOPIC_MOD_EIS_RAUESCHNEIDE, "Am Turm war nur noch Brendan am Leben. Ich muss ihn schleunigst zum Kommander zurückbringen.");

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Brendan_RaueSchneide (C_INFO)
{
	npc		= Mod_7730_OUT_Brendan_EIS;
	nr		= 1;
	condition	= Info_Mod_Brendan_RaueSchneide_Condition;
	information	= Info_Mod_Brendan_RaueSchneide_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brendan_RaueSchneide_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Willingham_RaueSchneide))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brendan_RaueSchneide_Info()
{
	AI_Output(self, hero, "Info_Mod_Brendan_RaueSchneide_06_00"); //Ich bleibe hier.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Brendan_RaueSchneide_06_01"); //Wenn du etwas über Einhand- oder Zweihandkampf lernen willst, komm zu mir. Ich halte Wache im Aussichtsturm der Kaserne.

		Log_CreateTopic	(TOPIC_MOD_LEHRER_EISGEBIET, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_EISGEBIET, "Brendan kann mir den Umgang mit Ein- und Zweihändern zeigen.");
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DORF");
};

INSTANCE Info_Mod_Brendan_Lernen (C_INFO)
{
	npc		= Mod_7730_OUT_Brendan_EIS;
	nr		= 1;
	condition	= Info_Mod_Brendan_Lernen_Condition;
	information	= Info_Mod_Brendan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Brendan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brendan_RaueSchneide))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brendan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brendan_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Brendan_Lernen);

	Info_AddChoice	(Info_Mod_Brendan_Lernen, DIALOG_BACK, Info_Mod_Brendan_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Brendan_Lernen_2H_5);
	Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Brendan_Lernen_2H_1);
	Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Brendan_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Brendan_Lernen_1H_1);
};

FUNC VOID Info_Mod_Brendan_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Brendan_Lernen);
};

FUNC VOID Info_Mod_Brendan_Lernen_2H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Brendan_Lernen);

		Info_AddChoice	(Info_Mod_Brendan_Lernen, DIALOG_BACK, Info_Mod_Brendan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Brendan_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Brendan_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Brendan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Brendan_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Brendan_Lernen_2H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Brendan_Lernen);

		Info_AddChoice	(Info_Mod_Brendan_Lernen, DIALOG_BACK, Info_Mod_Brendan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Brendan_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Brendan_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Brendan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Brendan_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Brendan_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Brendan_Lernen);

		Info_AddChoice	(Info_Mod_Brendan_Lernen, DIALOG_BACK, Info_Mod_Brendan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Brendan_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Brendan_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Brendan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Brendan_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Brendan_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Brendan_Lernen);

		Info_AddChoice	(Info_Mod_Brendan_Lernen, DIALOG_BACK, Info_Mod_Brendan_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)), Info_Mod_Brendan_Lernen_2H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)), Info_Mod_Brendan_Lernen_2H_1);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Brendan_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Brendan_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Brendan_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Brendan_Pickpocket (C_INFO)
{
	npc		= Mod_7730_OUT_Brendan_EIS;
	nr		= 1;
	condition	= Info_Mod_Brendan_Pickpocket_Condition;
	information	= Info_Mod_Brendan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Brendan_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Brendan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brendan_Pickpocket);

	Info_AddChoice	(Info_Mod_Brendan_Pickpocket, DIALOG_BACK, Info_Mod_Brendan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brendan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brendan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brendan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brendan_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brendan_EXIT (C_INFO)
{
	npc		= Mod_7730_OUT_Brendan_EIS;
	nr		= 1;
	condition	= Info_Mod_Brendan_EXIT_Condition;
	information	= Info_Mod_Brendan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brendan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brendan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};