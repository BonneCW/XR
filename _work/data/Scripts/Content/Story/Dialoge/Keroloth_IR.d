INSTANCE Info_Mod_Keroloth_IR_Hebel (C_INFO)
{
	npc		= Mod_7463_RIT_Keroloth_IR;
	nr		= 1;
	condition	= Info_Mod_Keroloth_IR_Hebel_Condition;
	information	= Info_Mod_Keroloth_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Keroloth_IR_Hebel_Condition()
{
	if (Mod_IR_Keroloth == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keroloth_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Keroloth_IR_Hebel_07_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Keroloth_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7463_RIT_Keroloth_IR;
	nr		= 1;
	condition	= Info_Mod_Keroloth_IR_Heiltrank_Condition;
	information	= Info_Mod_Keroloth_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Keroloth_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Keroloth == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, DIALOG_BACK, Info_Mod_Keroloth_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Keroloth_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Keroloth_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Keroloth_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Keroloth_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Keroloth_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Keroloth_IR_EXIT (C_INFO)
{
	npc		= Mod_7463_RIT_Keroloth_IR;
	nr		= 1;
	condition	= Info_Mod_Keroloth_IR_EXIT_Condition;
	information	= Info_Mod_Keroloth_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Keroloth_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Keroloth_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};