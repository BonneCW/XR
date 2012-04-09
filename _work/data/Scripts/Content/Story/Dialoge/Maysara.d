INSTANCE Info_Mod_Maysara_Hi (C_INFO)
{
	npc		= Mod_7122_ASS_Maysara_NW;
	nr		= 1;
	condition	= Info_Mod_Maysara_Hi_Condition;
	information	= Info_Mod_Maysara_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. Wo kann man hier was Einkaufen?";
};

FUNC INT Info_Mod_Maysara_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maysara_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Maysara_Hi_15_00"); //Hallo. Wo kann man hier was Einkaufen?
	AI_Output(self, hero, "Info_Mod_Maysara_Hi_06_01"); //Bei mir natürlich. Nur beste Waffen. Und trainieren könnte ich dich auch.
	AI_Output(hero, self, "Info_Mod_Maysara_Hi_15_02"); //Training wäre gut.
	AI_Output(self, hero, "Info_Mod_Maysara_Hi_06_03"); //Was willst Du üben?
};

INSTANCE Info_Mod_Maysara_Lernen (C_INFO)
{
	npc		= Mod_7122_ASS_Maysara_NW;
	nr		= 1;
	condition	= Info_Mod_Maysara_Lernen_Condition;
	information	= Info_Mod_Maysara_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Maysara_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Maysara_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maysara_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Maysara_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Maysara_Lernen);

	Info_AddChoice	(Info_Mod_Maysara_Lernen, DIALOG_BACK, Info_Mod_Maysara_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_LearnBow5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Maysara_Lernen_BOW_5);
	Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_LearnBow1	, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Maysara_Lernen_BOW_1);
	Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Maysara_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Maysara_Lernen_1H_1);
};

FUNC VOID Info_Mod_Maysara_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Maysara_Lernen);
};

FUNC VOID Info_Mod_Maysara_Lernen_BOW_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_BOW, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Maysara_Lernen);

		Info_AddChoice	(Info_Mod_Maysara_Lernen, DIALOG_BACK, Info_Mod_Maysara_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Maysara_Lernen_BOW_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Maysara_Lernen_BOW_1);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Maysara_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Maysara_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Maysara_Lernen_BOW_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_BOW, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Maysara_Lernen);

		Info_AddChoice	(Info_Mod_Maysara_Lernen, DIALOG_BACK, Info_Mod_Maysara_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Maysara_Lernen_BOW_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Maysara_Lernen_BOW_1);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Maysara_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Maysara_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Maysara_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Maysara_Lernen);

		Info_AddChoice	(Info_Mod_Maysara_Lernen, DIALOG_BACK, Info_Mod_Maysara_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Maysara_Lernen_BOW_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Maysara_Lernen_BOW_1);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Maysara_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Maysara_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Maysara_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Maysara_Lernen);

		Info_AddChoice	(Info_Mod_Maysara_Lernen, DIALOG_BACK, Info_Mod_Maysara_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Maysara_Lernen_BOW_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Maysara_Lernen_BOW_1);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Maysara_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Maysara_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Maysara_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Maysara_Trade (C_INFO)
{
	npc		= Mod_7122_ASS_Maysara_NW;
	nr		= 1;
	condition	= Info_Mod_Maysara_Trade_Condition;
	information	= Info_Mod_Maysara_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Maysara_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Maysara_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maysara_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Maysara_Pickpocket (C_INFO)
{
	npc		= Mod_7122_ASS_Maysara_NW;
	nr		= 1;
	condition	= Info_Mod_Maysara_Pickpocket_Condition;
	information	= Info_Mod_Maysara_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Maysara_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Maysara_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Maysara_Pickpocket);

	Info_AddChoice	(Info_Mod_Maysara_Pickpocket, DIALOG_BACK, Info_Mod_Maysara_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Maysara_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Maysara_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Maysara_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Maysara_Pickpocket);
};

FUNC VOID Info_Mod_Maysara_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Maysara_Pickpocket);
};

INSTANCE Info_Mod_Maysara_EXIT (C_INFO)
{
	npc		= Mod_7122_ASS_Maysara_NW;
	nr		= 1;
	condition	= Info_Mod_Maysara_EXIT_Condition;
	information	= Info_Mod_Maysara_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Maysara_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maysara_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};