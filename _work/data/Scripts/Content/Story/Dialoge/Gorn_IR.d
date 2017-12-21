INSTANCE Info_Mod_Gorn_IR_Hi (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_Hi_Condition;
	information	= Info_Mod_Gorn_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und was hältst du von der Insel?";
};

FUNC INT Info_Mod_Gorn_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorn_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorn_IR_Hi_15_00"); //Und was hältst du von der Insel?
	AI_Output(self, hero, "Info_Mod_Gorn_IR_Hi_03_01"); //Ach, ich kenne mich mit dem ganzen magischen Firlefanz nicht aus ... aber ich bin mir sicher, dass ich meine Axt gut gebrauchen kann, um diesen untoten und dämonischen Bastarden ordentlich in den Arsch zu treten.
};

INSTANCE Info_Mod_Gorn_IR_Hebel (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_Hebel_Condition;
	information	= Info_Mod_Gorn_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Gorn_IR_Hebel_Condition()
{
	if (Mod_IR_Gorn == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Gorn_IR_Hebel_03_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gorn_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_Ambient01_Condition;
	information	= Info_Mod_Gorn_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorn_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_ORKAREA_21") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorn_IR_Ambient01_03_00"); //Man, ohh, man, die Untoten und Dämonen sind vielleicht zäh und aufdringlich.
	AI_Output(hero, self, "Info_Mod_Gorn_IR_Ambient01_15_01"); //(ironisch) Ich hoffe du hältst noch mit?
	AI_Output(self, hero, "Info_Mod_Gorn_IR_Ambient01_03_02"); //Machst du Witze? Es wurde höchste Zeit, dass sie eins mit dem schweren Stück Stahl auf die Mütze bekommen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gorn_IR_GehtLos (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_GehtLos_Condition;
	information	= Info_Mod_Gorn_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Gorn_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorn_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Gorn == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Gorn_IR_GehtLos_03_00"); //Klar. Bevor meine Axt noch völlig vom Salzwasser zerfressen wird, soll sie einigen Untoten den Schädel spalten.

	Mod_IR_Dabei += 1;

	Mod_IR_Gorn = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Gorn_IR_GehBack (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_GehBack_Condition;
	information	= Info_Mod_Gorn_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Gorn_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorn_IR_Hi))
	&& (Mod_IR_Gorn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Gorn_IR_GehBack_06_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Gorn = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Gorn_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_Heiltrank_Condition;
	information	= Info_Mod_Gorn_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Gorn_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Gorn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, DIALOG_BACK, Info_Mod_Gorn_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Gorn_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Gorn_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Gorn_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Gorn_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Gorn_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Gorn_IR_EXIT (C_INFO)
{
	npc		= Mod_7444_SLD_Gorn_IR;
	nr		= 1;
	condition	= Info_Mod_Gorn_IR_EXIT_Condition;
	information	= Info_Mod_Gorn_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gorn_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorn_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};