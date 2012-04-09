INSTANCE Info_Mod_Milten_IR_Hi (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Hi_Condition;
	information	= Info_Mod_Milten_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, was hältst du von der Sache bisher?";
};

FUNC INT Info_Mod_Milten_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Milten_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_IR_Hi_15_00"); //Und, was hältst du von der Sache bisher?
	AI_Output(self, hero, "Info_Mod_Milten_IR_Hi_03_01"); //Nun, dieser finstere Ort macht dem Magier Xeres alle Ehre.
	AI_Output(self, hero, "Info_Mod_Milten_IR_Hi_03_02"); //Innos erhellendes Feuer ist es, was diesem Ort schon lange gefehlt hat.
	AI_Output(self, hero, "Info_Mod_Milten_IR_Hi_03_03"); //Sein Segen wird uns hoffentlich gute Dienste leisten, wenn es darum geht die dämonische Brut zu bannen, welche hier nistet.
	AI_Output(hero, self, "Info_Mod_Milten_IR_Hi_15_04"); //Ohh, ganz ungewohnte Töne. Du sprichst wie ein Feuermagier aus ganzem Willen.
	AI_Output(self, hero, "Info_Mod_Milten_IR_Hi_03_05"); //Nunja, es ist sicher die Kälte und sie Finsternis, die mich Innos umso näher bringt.
	AI_Output(self, hero, "Info_Mod_Milten_IR_Hi_03_06"); //Hier merke ich, was ich an ihm habe.
};

INSTANCE Info_Mod_Milten_IR_Hebel (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Hebel_Condition;
	information	= Info_Mod_Milten_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Milten_IR_Hebel_Condition()
{
	if (Mod_IR_Milten == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Milten_IR_Hebel_03_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Milten_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Ambient01_Condition;
	information	= Info_Mod_Milten_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Milten_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_SHIP_08") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Milten_IR_Ambient01_03_00"); //Asche zu Asche, und Staub zu Staub. Innos Feuer führt die Gebeine dieser Untoten ihrer rechten Bestimmung zu.
	AI_Output(hero, self, "Info_Mod_Milten_IR_Ambient01_15_01"); //Ja, das Feuer Innos leistet ganze Arbeit dabei, die vertrockneten Gebeine dieser Unholde in Asche zu verwandeln.

	AI_StopProcessInfos	(hero);
};

INSTANCE Info_Mod_Milten_IR_GehtLos (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_GehtLos_Condition;
	information	= Info_Mod_Milten_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Milten_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Milten == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Milten_IR_GehtLos_03_00"); //Natürlich werde ich dich begleiten. Möge Innos Feuer den Unholden ordentlich einheizen.

	Mod_IR_Dabei += 1;

	Mod_IR_Milten = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Milten_IR_GehBack (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_GehBack_Condition;
	information	= Info_Mod_Milten_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Milten_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_IR_Hi))
	&& (Mod_IR_Milten == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Milten_IR_GehBack_03_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Milten = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Milten_IR_Kram (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Kram_Condition;
	information	= Info_Mod_Milten_IR_Kram_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Milten_IR_Kram_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Kram_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Milten_IR_Kram_03_01"); //Ja, natürlich. Ich kann dich lehren deine magische Kraft zu steigern.
	AI_Output(self, hero, "Info_Mod_Milten_IR_Kram_03_02"); //Außerdem habe ich noch einige Spruchrollen des Klosters bei mir, falls du mal einen Blick darauf werfen willst.
};

INSTANCE Info_Mod_Milten_IR_Lernen (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Lernen_Condition;
	information	= Info_Mod_Milten_IR_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will meine magischen Kräfte steigern.";
};

FUNC INT Info_Mod_Milten_IR_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_IR_Kram))
	&& (hero.attribute[ATR_MANA_MAX] <= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Milten_IR_Lernen_15_00"); //Ich will meine magischen Kräfte steigern.

	Info_ClearChoices	(Info_Mod_Milten_IR_Lernen);

	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, DIALOG_BACK, Info_Mod_Milten_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Milten_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Milten_IR_Lernen_1);
};

FUNC VOID Info_Mod_Milten_IR_Lernen_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Milten_IR_Lernen_BACK_14_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Milten_IR_Lernen);
};

FUNC VOID Info_Mod_Milten_IR_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Milten_IR_Lernen);

	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, DIALOG_BACK, Info_Mod_Milten_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Milten_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Milten_IR_Lernen_1);
};

FUNC VOID Info_Mod_Milten_IR_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Milten_IR_Lernen);

	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, DIALOG_BACK, Info_Mod_Milten_IR_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Milten_IR_Lernen_5);
	Info_AddChoice		(Info_Mod_Milten_IR_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Milten_IR_Lernen_1);
};

INSTANCE Info_Mod_Milten_IR_Trade (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Trade_Condition;
	information	= Info_Mod_Milten_IR_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Milten_IR_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Milten_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_Heiltrank_Condition;
	information	= Info_Mod_Milten_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Milten_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Milten == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, DIALOG_BACK, Info_Mod_Milten_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Milten_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Milten_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Milten_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Milten_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Milten_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Milten_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Milten_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Milten_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Milten_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Milten_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Milten_IR_EXIT (C_INFO)
{
	npc		= Mod_7443_KDF_Milten_IR;
	nr		= 1;
	condition	= Info_Mod_Milten_IR_EXIT_Condition;
	information	= Info_Mod_Milten_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Milten_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Milten_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};