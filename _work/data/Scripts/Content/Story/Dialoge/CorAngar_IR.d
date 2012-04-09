INSTANCE Info_Mod_Angar_IR_Hi (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Hi_Condition;
	information	= Info_Mod_Angar_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, was sagst du?";
};

FUNC INT Info_Mod_Angar_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_IR_Hi_15_00"); //Und, was sagst du?
	AI_Output(self, hero, "Info_Mod_Angar_IR_Hi_04_01"); //Ja, das ist das Ziel unserer Reise.
	AI_Output(self, hero, "Info_Mod_Angar_IR_Hi_04_02"); //Hier werde ich mein Schwert gegen jene führen, die mit Schuld an dem Tod von Meister Y'berion tragen.
	AI_Output(self, hero, "Info_Mod_Angar_IR_Hi_04_03"); //Erst wenn sein Ableben 100fach durch die zerschmetterten Leiber unserer Feinde gesühnt wurde, kann ich wieder ruhen.
	AI_Output(hero, self, "Info_Mod_Angar_IR_Hi_15_04"); //Ohh, das ist genau die Art von Einstellung, die wir für diese Expedition brauchen.
};

INSTANCE Info_Mod_Angar_IR_Hebel (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Hebel_Condition;
	information	= Info_Mod_Angar_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Angar_IR_Hebel_Condition()
{
	if (Mod_IR_Angar == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Angar_IR_Hebel_04_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Angar_IR_GehtLos (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_GehtLos_Condition;
	information	= Info_Mod_Angar_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Angar_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Angar_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Angar == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Angar_IR_GehtLos_04_00"); //Natürlich. Wenn es die Situation verlangt, so soll ein Mann nicht nur durch Worte, sondern auch durch seine Taten überzeugen.

	Mod_IR_Dabei += 1;

	Mod_IR_Angar = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Angar_IR_GehBack (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_GehBack_Condition;
	information	= Info_Mod_Angar_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Angar_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Angar_IR_Hi))
	&& (Mod_IR_Angar == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Angar_IR_GehBack_04_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Angar = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Angar_IR_Kram (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Kram_Condition;
	information	= Info_Mod_Angar_IR_Kram_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Angar_IR_Kram_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_IR_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_Kram_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Angar_IR_Kram_04_01"); //Ich kann dich lehren das zweihändige Schwert zu führen und dir zeigen, wie du die Kräfte deines Körpers effektiver nutzen kannst.
};

INSTANCE Info_Mod_Angar_IR_Lernen (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Lernen_Condition;
	information	= Info_Mod_Angar_IR_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Angar_IR_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_IR_Kram))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_IR_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Angar_IR_Lernen);

	Info_AddChoice		(Info_Mod_Angar_IR_Lernen, DIALOG_BACK, Info_Mod_Angar_IR_Lernen_Zweihand_BACK);
	Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_IR_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_IR_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_IR_Lernen_Zweihand_BACK()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Lernen);
};

FUNC VOID Info_Mod_Angar_IR_Lernen_Zweihand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Angar_IR_Lernen);

		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, DIALOG_BACK, Info_Mod_Angar_IR_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_IR_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_IR_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Angar_IR_Lernen_Zweihand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Angar_IR_Lernen);

		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, DIALOG_BACK, Info_Mod_Angar_IR_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_IR_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Angar_IR_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_IR_Lernen_Zweihand_1);
	};
};

INSTANCE Info_Mod_Angar_IR_Stärke (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Stärke_Condition;
	information	= Info_Mod_Angar_IR_Stärke_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will stärker werden.";
};

FUNC INT Info_Mod_Angar_IR_Stärke_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_IR_Kram))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_Stärke_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_IR_Stärke_15_00"); //Ich will stärker werden.

	Info_ClearChoices	(Info_Mod_Angar_IR_Stärke);

	Info_AddChoice 		(Info_Mod_Angar_IR_Stärke, DIALOG_BACK, Info_Mod_Angar_IR_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_5);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_1);
};

FUNC VOID Info_Mod_Angar_IR_Stärke_BACK()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Stärke);
};

func void Info_Mod_Angar_IR_Stärke_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Angar_IR_Stärke);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, DIALOG_BACK, Info_Mod_Angar_IR_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_5);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_1);
};

FUNC VOID Info_Mod_Angar_IR_Stärke_5()
{
	B_TeachAttributePoints_New (self, other, ATR_STRENGTH, 5, 020);
	
	Info_ClearChoices	(Info_Mod_Angar_IR_Stärke);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, DIALOG_BACK, Info_Mod_Angar_IR_Stärke_BACK);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_5);
	Info_AddChoice		(Info_Mod_Angar_IR_Stärke, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	,Info_Mod_Angar_IR_Stärke_1);
};

INSTANCE Info_Mod_Angar_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_Heiltrank_Condition;
	information	= Info_Mod_Angar_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Angar_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Angar == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, DIALOG_BACK, Info_Mod_Angar_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Angar_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Angar_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Angar_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Angar_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Angar_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Angar_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Angar_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Angar_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Angar_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Angar_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Angar_IR_EXIT (C_INFO)
{
	npc		= Mod_7455_TPL_Angar_IR;
	nr		= 1;
	condition	= Info_Mod_Angar_IR_EXIT_Condition;
	information	= Info_Mod_Angar_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Angar_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};