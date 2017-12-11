INSTANCE Info_Mod_Vatras_IR_Hi (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_Hi_Condition;
	information	= Info_Mod_Vatras_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vatras_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vatras_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Vatras_IR_Hi_16_00"); //Adanos hat uns sicher hierher geleitet.
	AI_Output(self, hero, "Info_Mod_Vatras_IR_Hi_16_01"); //Ich hoffe, wir können uns auch weiterhin seiner schützenden Hand gewahr sein.
	AI_Output(hero, self, "Info_Mod_Vatras_IR_Hi_15_02"); //Ja, mir ist der Segen jeder der drei Gottheiten willkommen. Brauchen werden wir sie in diesem finsteren Loch bestimmt.
};

INSTANCE Info_Mod_Vatras_IR_GehtLos (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_GehtLos_Condition;
	information	= Info_Mod_Vatras_IR_GehtLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Vatras_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Vatras_IR_GehtLos_16_00"); //Nun, die Tage jugendlicher Gewandtheit und  schneller Beine liegen bei mir viele Jahre zurück.
	AI_Output(self, hero, "Info_Mod_Vatras_IR_GehtLos_16_01"); //Ich werde hier verweilen, für den Erfolg der Mission beten und über das Schiff wachen. Adanos möge euch behüten.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Vatras_IR_Kram (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_Kram_Condition;
	information	= Info_Mod_Vatras_IR_Kram_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie kannst du mich unterstützen?";
};

FUNC INT Info_Mod_Vatras_IR_Kram_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_IR_Kram_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_IR_Kram_15_00"); //Wie kannst du mich unterstützen?
	AI_Output(self, hero, "Info_Mod_Vatras_IR_Kram_16_01"); //Ich kann dir helfen deine magische Kraft zu mehren und dir einige meiner Spruchrollen und Tränke zur Verfügung stellen.
};

INSTANCE Info_Mod_Vatras_IR_Lernen (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_Lernen_Condition;
	information	= Info_Mod_Vatras_IR_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Vatras_IR_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_IR_Kram))
	&& (hero.attribute[ATR_MANA_MAX] <= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_IR_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_IR_Lernen_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Vatras_IR_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, DIALOG_BACK, Info_Mod_Vatras_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_IR_Lernen_1);
};

FUNC VOID Info_Mod_Vatras_IR_Lernen_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_IR_Lernen_BACK_16_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Vatras_IR_Lernen);
};

FUNC VOID Info_Mod_Vatras_IR_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Vatras_IR_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, DIALOG_BACK, Info_Mod_Vatras_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_IR_Lernen_1);
};

FUNC VOID Info_Mod_Vatras_IR_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Vatras_IR_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, DIALOG_BACK, Info_Mod_Vatras_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_IR_Lernen_1);
};

INSTANCE Info_Mod_Vatras_IR_Trade (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_Trade_Condition;
	information	= Info_Mod_Vatras_IR_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Vatras_IR_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_IR_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Vatras_IR_EXIT (C_INFO)
{
	npc		= Mod_7449_KDW_Vatras_IR;
	nr		= 1;
	condition	= Info_Mod_Vatras_IR_EXIT_Condition;
	information	= Info_Mod_Vatras_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vatras_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vatras_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};