INSTANCE Info_Mod_Salvador_Hi (C_INFO)
{
	npc		= Mod_1533_WKR_Salvador_NW;
	nr		= 1;
	condition	= Info_Mod_Salvador_Hi_Condition;
	information	= Info_Mod_Salvador_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Salvador_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salvador_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Salvador_Hi_04_01"); //Ich bin Salvador, Trainer der Wasserkrieger und Hüter.
};

INSTANCE Info_Mod_Salvador_Teacher (C_INFO)
{
	npc		= Mod_1533_WKR_Salvador_NW;
	nr		= 1;
	condition	= Info_Mod_Salvador_Teacher_Condition;
	information	= Info_Mod_Salvador_Teacher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Salvador_Teacher_Condition()
{
	if(Npc_KnowsInfo(hero, Info_Mod_Salvador_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salvador_Teacher_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Salvador_Teacher_04_01"); //Ja, ich kann dir zeigen wie du stärker wirst.
	AI_Output(self, hero, "Info_Mod_Salvador_Teacher_04_02"); //Außerdem kann ich dir den Umgang mit Ein- und Zweihandwaffen beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_WASSERKRIEGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_WASSERKRIEGER, "Salvador kann mir beibringen wie ich stärker werde und wie ich mit Ein- und Zweihandwaffen umgehe.");
};

INSTANCE Info_Mod_Salvador_Lernen (C_INFO)
{
	npc		= Mod_1533_WKR_Salvador_NW;
	nr		= 1;
	condition	= Info_Mod_Salvador_Lernen_Condition;
	information	= Info_Mod_Salvador_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Salvador_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salvador_Teacher))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salvador_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Salvador_Lernen_15_00"); //Ich will lernen.
	AI_Output(self, hero, "Info_Mod_Salvador_Lernen_04_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice	(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Zweihandkampf)", Info_Mod_Salvador_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Einhandkampf)", Info_Mod_Salvador_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Stärke)", Info_Mod_Salvador_Lernen_Stärke);
};

FUNC VOID Info_Mod_Salvador_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);
};

FUNC VOID Info_Mod_Salvador_Lernen_Zweihand()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Zweihand_BACK);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Salvador_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Salvador_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Salvador_Lernen_Zweihand_BACK()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice	(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Zweihandkampf)", Info_Mod_Salvador_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Einhandkampf)", Info_Mod_Salvador_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Stärke)", Info_Mod_Salvador_Lernen_Stärke);
};

FUNC VOID Info_Mod_Salvador_Lernen_Zweihand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Salvador_Lernen);

		Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Salvador_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Salvador_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Salvador_Lernen_Zweihand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Salvador_Lernen);

		Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Salvador_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Salvador_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Salvador_Lernen_Einhand()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Einhand_BACK);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Salvador_Lernen_Einhand_5);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Salvador_Lernen_Einhand_1);
};

FUNC VOID Info_Mod_Salvador_Lernen_Einhand_BACK()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice	(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Zweihandkampf)", Info_Mod_Salvador_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Einhandkampf)", Info_Mod_Salvador_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Stärke)", Info_Mod_Salvador_Lernen_Stärke);
};

FUNC VOID Info_Mod_Salvador_Lernen_Einhand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Salvador_Lernen);

		Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Einhand_BACK);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Salvador_Lernen_Einhand_5);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Salvador_Lernen_Einhand_1);
	};
};

FUNC VOID Info_Mod_Salvador_Lernen_Einhand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Salvador_Lernen);

		Info_AddChoice		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Einhand_BACK);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H))		,Info_Mod_Salvador_Lernen_Einhand_5);
		Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))		,Info_Mod_Salvador_Lernen_Einhand_1);
	};
};	

FUNC VOID Info_Mod_Salvador_Lernen_Stärke()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice 		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_5);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_1);
};

FUNC VOID Info_Mod_Salvador_Lernen_Stärke_BACK()
{
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice	(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Zweihandkampf)", Info_Mod_Salvador_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Einhandkampf)", Info_Mod_Salvador_Lernen_Einhand);
	Info_AddChoice	(Info_Mod_Salvador_Lernen, "(Stärke)", Info_Mod_Salvador_Lernen_Stärke);
};

FUNC VOID Info_Mod_Salvador_Lernen_Stärke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice 		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_5);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_1);
};

FUNC VOID Info_Mod_Salvador_Lernen_Stärke_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Salvador_Lernen);

	Info_AddChoice 		(Info_Mod_Salvador_Lernen, DIALOG_BACK, Info_Mod_Salvador_Lernen_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_5);
	Info_AddChoice		(Info_Mod_Salvador_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Salvador_Lernen_Stärke_1);
};

INSTANCE Info_Mod_Salvador_Pickpocket (C_INFO)
{
	npc		= Mod_1533_WKR_Salvador_NW;
	nr		= 1;
	condition	= Info_Mod_Salvador_Pickpocket_Condition;
	information	= Info_Mod_Salvador_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Salvador_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_Salvador_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Salvador_Pickpocket);

	Info_AddChoice	(Info_Mod_Salvador_Pickpocket, DIALOG_BACK, Info_Mod_Salvador_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Salvador_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Salvador_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Salvador_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Salvador_Pickpocket);
};

FUNC VOID Info_Mod_Salvador_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Salvador_Pickpocket);
};

INSTANCE Info_Mod_Salvador_EXIT (C_INFO)
{
	npc		= Mod_1533_WKR_Salvador_NW;
	nr		= 1;
	condition	= Info_Mod_Salvador_EXIT_Condition;
	information	= Info_Mod_Salvador_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Salvador_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salvador_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};