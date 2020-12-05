INSTANCE Info_Mod_Bennet_IR_Hi (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_Hi_Condition;
	information	= Info_Mod_Bennet_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_IR_Hi_30_00"); //Yuck, I didn't expect such a cold and humid dump when they said we were going to an island.
	AI_Output(self, hero, "Info_Mod_Bennet_IR_Hi_30_01"); //I'm lucky to have the forge always near me.
};

INSTANCE Info_Mod_Bennet_IR_GehtLos (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_GehtLos_Condition;
	information	= Info_Mod_Bennet_IR_GehtLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Let's get going. Will you escort me to the island?";
};

FUNC INT Info_Mod_Bennet_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bennet_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Bennet_IR_GehtLos_30_00"); //Are you kidding me?! I came aboard as a blacksmith and no centimetre will I move away from the forging furnace. Would be even more beautiful...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bennet_IR_Kram (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_Kram_Condition;
	information	= Info_Mod_Bennet_IR_Kram_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have some swords and forging tools for me?";
};

FUNC INT Info_Mod_Bennet_IR_Kram_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_IR_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_IR_Kram_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_IR_Kram_15_00"); //Do you have some swords and forging tools for me?
	AI_Output(self, hero, "Info_Mod_Bennet_IR_Kram_30_01"); //Sure. Since I don't have much to do so far anyway, I can also show you how to get a stronger arm.
};

INSTANCE Info_Mod_Bennet_IR_Staerke (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_Staerke_Condition;
	information	= Info_Mod_Bennet_IR_Staerke_Info;
	permanent	= 1;
	important	= 0;
	description	= "I want to get stronger.";
};

FUNC INT Info_Mod_Bennet_IR_Staerke_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_IR_Kram))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_IR_Staerke_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_IR_Staerke_15_00"); //I want to be stronger.

	Info_ClearChoices	(Info_Mod_Bennet_IR_Staerke);

	Info_AddChoice 		(Info_Mod_Bennet_IR_Staerke, DIALOG_BACK, Info_Mod_Bennet_IR_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_5);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_1);
};

FUNC VOID Info_Mod_Bennet_IR_Staerke_BACK()
{
	Info_ClearChoices	(Info_Mod_Bennet_IR_Staerke);
};

func void Info_Mod_Bennet_IR_Staerke_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Bennet_IR_Staerke);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, DIALOG_BACK, Info_Mod_Bennet_IR_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_5);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_1);
};

FUNC VOID Info_Mod_Bennet_IR_Staerke_5()
{
	B_TeachAttributePoints_New (self, other, ATR_STRENGTH, 5, 20);
	
	Info_ClearChoices	(Info_Mod_Bennet_IR_Staerke);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, DIALOG_BACK, Info_Mod_Bennet_IR_Staerke_BACK);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_5);
	Info_AddChoice		(Info_Mod_Bennet_IR_Staerke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Bennet_IR_Staerke_1);
};

INSTANCE Info_Mod_Bennet_IR_Trade (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_Trade_Condition;
	information	= Info_Mod_Bennet_IR_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bennet_IR_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_IR_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bennet_IR_EXIT (C_INFO)
{
	npc		= Mod_7453_NONE_Bennet_IR;
	nr		= 1;
	condition	= Info_Mod_Bennet_IR_EXIT_Condition;
	information	= Info_Mod_Bennet_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bennet_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
