INSTANCE Info_Mod_Uriela_IR_Hi (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_Hi_Condition;
	information	= Info_Mod_Uriela_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, wie sieht es aus?";
};

FUNC INT Info_Mod_Uriela_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Uriela_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_IR_Hi_15_00"); //Und, wie sieht es aus?
	AI_Output(self, hero, "Info_Mod_Uriela_IR_Hi_17_01"); //Nun, ich spüre die morbiden dämonischen Kräfte, welche diese Insel umgeben und durchsetzen.
	AI_Output(self, hero, "Info_Mod_Uriela_IR_Hi_17_02"); //(nachdenklich) Sehr den Mächten ähnelnd, die unsere Heimat verheert haben.
};

INSTANCE Info_Mod_Uriela_IR_Hebel (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_Hebel_Condition;
	information	= Info_Mod_Uriela_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Uriela_IR_Hebel_Condition()
{
	if (Mod_IR_Uriela == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Uriela_IR_Hebel_17_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Uriela_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_Ambient01_Condition;
	information	= Info_Mod_Uriela_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Uriela_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_SHIP_08") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Uriela_IR_Ambient01_17_00"); //Ja, hinfort mit euch, ihr armseligen Ausgeburten eines wurmzerfressenen Kadavers.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Uriela_IR_GehtLos (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_GehtLos_Condition;
	information	= Info_Mod_Uriela_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Uriela_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Uriela_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Uriela == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Uriela_IR_GehtLos_17_00"); //Natürlich. Jedes einzelne dieser üblen Geschöpfe soll dafür büßen, was unserer Siedlung angetan wurde.

	Mod_IR_Dabei += 1;

	Mod_IR_Uriela = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Uriela_IR_GehBack (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_GehBack_Condition;
	information	= Info_Mod_Uriela_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Uriela_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Uriela_IR_Hi))
	&& (Mod_IR_Uriela == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Uriela_IR_GehBack_17_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Uriela = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Uriela_IR_IstDemon (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_IstDemon_Condition;
	information	= Info_Mod_Uriela_IR_IstDemon_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Hast du vielleicht etwas Hexenmagie für mich?";
};

FUNC INT Info_Mod_Uriela_IR_IstDemon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Uriela_IR_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_IstDemon_Info()
{
	AI_Output(hero, self, "Info_Mod_Uriela_IR_IstDemon_15_00"); //Hast du vielleicht etwas Hexenmagie für mich?
	AI_Output(self, hero, "Info_Mod_Uriela_IR_IstDemon_17_01"); //Ja, die eine, oder andere Spruchrolle habe ich dabei.
};

INSTANCE Info_Mod_Uriela_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_Heiltrank_Condition;
	information	= Info_Mod_Uriela_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Uriela_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Uriela == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, DIALOG_BACK, Info_Mod_Uriela_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Uriela_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Uriela_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Uriela_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Uriela_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Uriela_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Uriela_IR_EXIT (C_INFO)
{
	npc		= Mod_7467_HEX_Uriela_IR;
	nr		= 1;
	condition	= Info_Mod_Uriela_IR_EXIT_Condition;
	information	= Info_Mod_Uriela_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Uriela_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Uriela_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};