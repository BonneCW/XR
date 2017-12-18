INSTANCE Info_Mod_Velaya_IR_Hi (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Hi_Condition;
	information	= Info_Mod_Velaya_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velaya_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Hi_39_00"); //(unzufrieden) Ach, so hatte ich mir die große weite Welt aber nicht vorgestellt.
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Hi_39_01"); //Erinnert mich entfernt an die kalten, feuchten Mauern in welche ich so lange gefangen war.
	AI_Output(hero, self, "Info_Mod_Velaya_IR_Hi_15_02"); //Naja, wir wollen hier auch nicht allzu lange unsere Zelte aufschlagen.
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Hi_39_03"); //Ja, machen wir das, wofür wir hierher gekommen sind und dann nichts wie unter den freien Himmel so schnell es geht.
};

INSTANCE Info_Mod_Velaya_IR_Hebel (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Hebel_Condition;
	information	= Info_Mod_Velaya_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Velaya_IR_Hebel_Condition()
{
	if (Mod_IR_Velaya == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Velaya_IR_Hebel_39_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Velaya_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Ambient01_Condition;
	information	= Info_Mod_Velaya_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Velaya_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_ORKAREA_10") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Ambient01_39_00"); //Nein, langweilig wird einem bei so vielen scheußlichen Viechern wirklich nicht.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Velaya_IR_GehtLos (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_GehtLos_Condition;
	information	= Info_Mod_Velaya_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Velaya_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Velaya_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Velaya == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Velaya_IR_GehtLos_39_00"); //Naja, besser als mich hier an Bord zu langweilen ... sonst wäre die Reise ja umsonst gewesen.

	Mod_IR_Dabei += 1;

	Mod_IR_Velaya = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Velaya_IR_GehBack (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_GehBack_Condition;
	information	= Info_Mod_Velaya_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Velaya_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Velaya_IR_Hi))
	&& (Mod_IR_Velaya == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Velaya_IR_GehBack_39_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Velaya = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Velaya_IR_Lehrer (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Lehrer_Condition;
	information	= Info_Mod_Velaya_IR_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Velaya_IR_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_IR_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Velaya_IR_Lehrer_39_01"); //Klar, ich trage den Bogen nicht zum Spaß um meine Schulter und den Degen an der Seite.
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Lehrer_39_02"); //Ich kann dir zeigen, wie du geschickter wirst und den Bogen richtig spannst.
};

INSTANCE Info_Mod_Velaya_IR_Lernen_Bogen (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Lernen_Bogen_Condition;
	information	= Info_Mod_Velaya_IR_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Bogenschießen bei.";
};

FUNC INT Info_Mod_Velaya_IR_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_IR_Lehrer))
	&& (hero.hitchance[NPC_TALENT_BOW] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_IR_Lernen_Bogen_15_00"); //Bring mir Bogenschießen bei.

	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, "Zurück.", Info_Mod_Velaya_IR_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Velaya_IR_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Velaya_IR_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_Bogen);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 100);

	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, "Zurück.", Info_Mod_Velaya_IR_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Velaya_IR_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Velaya_IR_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 100);

	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, "Zurück.", Info_Mod_Velaya_IR_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Velaya_IR_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Velaya_IR_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Velaya_IR_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Velaya_IR_Lernen_DEX (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Lernen_DEX_Condition;
	information	= Info_Mod_Velaya_IR_Lernen_DEX_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zeig mir, wie ich geschickter werden kann.";
};

FUNC INT Info_Mod_Velaya_IR_Lernen_DEX_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Velaya_IR_Lehrer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_DEX_Info()
{
	AI_Output(hero, self, "Info_Mod_Velaya_IR_Lernen_DEX_15_00"); //Zeig mir, wie ich geschickter werden kann.
	AI_Output(self, hero, "Info_Mod_Velaya_IR_Lernen_DEX_16_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Velaya_IR_Lernen_DEX, DIALOG_BACK, Info_Mod_Velaya_IR_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_DEX_BACK()
{
	Info_ClearChoices (Info_Mod_Velaya_IR_Lernen_DEX);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_DEX_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Velaya_IR_Lernen_DEX, DIALOG_BACK, Info_Mod_Velaya_IR_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Velaya_IR_Lernen_DEX_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Velaya_IR_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Velaya_IR_Lernen_DEX, DIALOG_BACK, Info_Mod_Velaya_IR_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Velaya_IR_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Velaya_IR_Lernen_DEX_Geschick_1);
};

INSTANCE Info_Mod_Velaya_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_Heiltrank_Condition;
	information	= Info_Mod_Velaya_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Velaya_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Velaya == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, DIALOG_BACK, Info_Mod_Velaya_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Velaya_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Velaya_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Velaya_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Velaya_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Velaya_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Velaya_IR_EXIT (C_INFO)
{
	npc		= Mod_7468_BAU_Velaya_IR;
	nr		= 1;
	condition	= Info_Mod_Velaya_IR_EXIT_Condition;
	information	= Info_Mod_Velaya_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Velaya_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velaya_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};