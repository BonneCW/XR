INSTANCE Info_Mod_Hauptmann_Hi (C_INFO)
{
	npc		= Mod_1855_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Hauptmann_Hi_Condition;
	information	= Info_Mod_Hauptmann_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Folgt mir!";
};

FUNC INT Info_Mod_Hauptmann_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hauptmann_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hauptmann_Hi_15_00"); //Folgt mir.
	AI_Output(self, hero, "Info_Mod_Hauptmann_Hi_13_01"); //Gut, geh vorraus.
	
	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
	B_StartOtherRoutine	(Mod_1856_PAL_Paladin_PAT, "FOLLOW");
	B_StartOtherRoutine	(Mod_1857_KDF_Magier_PAT, "FOLLOW");
	B_StartOtherRoutine	(Mod_7333_KDS_SchwarzerMagier_PAT, "FOLLOW");
	B_StartOtherRoutine	(Mod_7332_SMK_SchwarzerKrieger_PAT, "FOLLOW");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1856_PAL_Paladin_PAT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1857_KDF_Magier_PAT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7333_KDS_SchwarzerMagier_PAT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_7332_SMK_SchwarzerKrieger_PAT.aivar[AIV_PARTYMEMBER] = TRUE;
};

INSTANCE Info_Mod_Hauptmann_Heiltrank (C_INFO)
{
	npc		= Mod_1855_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Hauptmann_Heiltrank_Condition;
	information	= Info_Mod_Hauptmann_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Hauptmann_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, DIALOG_BACK, Info_Mod_Hauptmann_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Essenz der Heilung", Info_Mod_Hauptmann_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Elixier der Heilung", Info_Mod_Hauptmann_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Extrakt der Heilung", Info_Mod_Hauptmann_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Essenz der Heilung", Info_Mod_Hauptmann_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Trank der leichten Heilung", Info_Mod_Hauptmann_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Leichter Heiltrank", Info_Mod_Hauptmann_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Hauptmann_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Hauptmann_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Hauptmann_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Hauptmann_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Hauptmann_EXIT (C_INFO)
{
	npc		= Mod_1855_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Hauptmann_EXIT_Condition;
	information	= Info_Mod_Hauptmann_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hauptmann_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hauptmann_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
