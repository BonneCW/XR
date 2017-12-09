INSTANCE Info_Mod_Namib_IR_Hi (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_Hi_Condition;
	information	= Info_Mod_Namib_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Namib_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Namib_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Namib_IR_Hi_02_00"); //Diese Aura ... ja, ein mächtiger Dämon auf dieser Insel ist dem Schläfer, wie wir ihn kannten, nicht unähnlich.
	AI_Output(self, hero, "Info_Mod_Namib_IR_Hi_02_01"); //Sie haben denselben Meister, da besteht kein Zweifel. Das spüre ich.
	AI_Output(self, hero, "Info_Mod_Namib_IR_Hi_02_02"); //Mit großer Spannung warte ich darauf, was wir hier vorfinden werden.
};

INSTANCE Info_Mod_Namib_IR_GehtLos (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_GehtLos_Condition;
	information	= Info_Mod_Namib_IR_GehtLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Namib_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Namib_IR_GehtLos_02_00"); //Ach, ich glaube dafür bin ich dann doch schon zu alt, um mitzuhalten. Ich halte hier die Position.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Namib_IR_Kram (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_Kram_Condition;
	information	= Info_Mod_Namib_IR_Kram_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du vielleicht etwas für mich, das mir helfen kann?";
};

FUNC INT Info_Mod_Namib_IR_Kram_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_IR_Kram_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_IR_Kram_15_00"); //Hast du vielleicht etwas für mich, das mir helfen kann?
	AI_Output(self, hero, "Info_Mod_Namib_IR_Kram_02_01"); //Ich habe einige Spruchrollen meiner Bruderschaft bei mir.
	AI_Output(self, hero, "Info_Mod_Namib_IR_Kram_02_02"); //Außerdem vermag ich dir zu zeigen, wie du deine magische Kraft erhöhst.
};

INSTANCE Info_Mod_Namib_IR_Lernen (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_Lernen_Condition;
	information	= Info_Mod_Namib_IR_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Namib_IR_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_IR_Kram))
	&& (hero.attribute[ATR_MANA_MAX] <= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_IR_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Namib_IR_Lernen_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Namib_IR_Lernen);

	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, DIALOG_BACK, Info_Mod_Namib_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Namib_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Namib_IR_Lernen_1);
};

FUNC VOID Info_Mod_Namib_IR_Lernen_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Namib_IR_Lernen_BACK_14_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Namib_IR_Lernen);
};

FUNC VOID Info_Mod_Namib_IR_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Namib_IR_Lernen);

	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, DIALOG_BACK, Info_Mod_Namib_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Namib_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Namib_IR_Lernen_1);
};

FUNC VOID Info_Mod_Namib_IR_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Namib_IR_Lernen);

	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, DIALOG_BACK, Info_Mod_Namib_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Namib_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Namib_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Namib_IR_Lernen_1);
};

INSTANCE Info_Mod_Namib_IR_Trade (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_Trade_Condition;
	information	= Info_Mod_Namib_IR_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Namib_IR_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Namib_IR_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Namib_IR_EXIT (C_INFO)
{
	npc		= Mod_7457_GUR_BaalNamib_IR;
	nr		= 1;
	condition	= Info_Mod_Namib_IR_EXIT_Condition;
	information	= Info_Mod_Namib_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Namib_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Namib_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};