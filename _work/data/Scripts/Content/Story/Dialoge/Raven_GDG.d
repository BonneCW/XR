INSTANCE Info_Mod_Raven_GDG_Lernen (C_INFO)
{
	npc		= Mod_6001_DMR_Raven_GDG;
	nr		= 1;
	condition	= Info_Mod_Raven_GDG_Lernen_Condition;
	information	= Info_Mod_Raven_GDG_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Raven_GDG_Lernen_Condition()
{
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_GDG_Lernen_15_00"); //Ich will lernen.
	AI_Output(self, hero, "Info_Mod_Raven_GDG_Lernen_10_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Zweihandkampf)", Info_Mod_Raven_GDG_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Stärke)", Info_Mod_Raven_GDG_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Zweihand()
{
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Zweihand_BACK);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_GDG_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_GDG_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Zweihand_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Zweihandkampf)", Info_Mod_Raven_GDG_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Stärke)", Info_Mod_Raven_GDG_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Zweihand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_GDG_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_GDG_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Zweihand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Raven_GDG_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Raven_GDG_Lernen_Zweihand_1);
	};
};	

FUNC VOID Info_Mod_Raven_GDG_Lernen_Staerke()
{
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Staerke_BACK()
{
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Zweihandkampf)", Info_Mod_Raven_GDG_Lernen_Zweihand);
	Info_AddChoice	(Info_Mod_Raven_GDG_Lernen, "(Stärke)", Info_Mod_Raven_GDG_Lernen_Staerke);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Raven_GDG_Lernen_Staerke_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Raven_GDG_Lernen);

	Info_AddChoice 		(Info_Mod_Raven_GDG_Lernen, DIALOG_BACK, Info_Mod_Raven_GDG_Lernen_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Raven_GDG_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Raven_GDG_Lernen_Staerke_1);
};

INSTANCE Info_Mod_Raven_GDG_EXIT (C_INFO)
{
	npc		= Mod_6001_DMR_Raven_GDG;
	nr		= 1;
	condition	= Info_Mod_Raven_GDG_EXIT_Condition;
	information	= Info_Mod_Raven_GDG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raven_GDG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_GDG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};