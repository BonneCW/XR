INSTANCE Info_Mod_Thorge_TUG_AtDorf (C_INFO)
{
	npc		= Mod_1960_VMG_Thorge_TUG;
	nr		= 1;
	condition	= Info_Mod_Thorge_TUG_AtDorf_Condition;
	information	= Info_Mod_Thorge_TUG_AtDorf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorge_TUG_AtDorf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorge_KommMit))
	&& (Npc_KnowsInfo(hero, Info_Mod_Genn_Hi))
	&& (Npc_GetDistToWP(self, "TUG_32") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorge_TUG_AtDorf_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorge_TUG_AtDorf_13_00"); //Ah, das Dorf. Ich bleibe hier, ab sofort musst du alleine klar kommen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATCITY");

	Thorge_Abgeliefert = 1;

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Thorge_TUG_Heiltrank (C_INFO)
{
	npc		= Mod_1960_VMG_Thorge_TUG;
	nr		= 1;
	condition	= Info_Mod_Thorge_TUG_Heiltrank_Condition;
	information	= Info_Mod_Thorge_TUG_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Thorge_TUG_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, DIALOG_BACK, Info_Mod_Thorge_TUG_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Essenz der Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Elixier der Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Extrakt der Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Essenz der Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Trank der leichten Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Leichter Heiltrank", Info_Mod_Thorge_TUG_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thorge_TUG_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Thorge_TUG_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Thorge_TUG_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Thorge_TUG_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Thorge_TUG_EXIT (C_INFO)
{
	npc		= Mod_1960_VMG_Thorge_TUG;
	nr		= 1;
	condition	= Info_Mod_Thorge_TUG_EXIT_Condition;
	information	= Info_Mod_Thorge_TUG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorge_TUG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorge_TUG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};