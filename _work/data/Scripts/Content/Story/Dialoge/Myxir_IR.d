INSTANCE Info_Mod_Myxir_IR_Hi (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_Hi_Condition;
	information	= Info_Mod_Myxir_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_IR_Hi_12_00"); //(in die Höhle blickend) Ahh, herrlich ... Finsternis, Verdammnis, abscheuliche Geschöpfe sphärischer Manifestation.
	AI_Output(hero, self, "Info_Mod_Myxir_IR_Hi_15_01"); //Nun, zumindest dir scheint es hier recht gut zu gefallen ...
	AI_Output(self, hero, "Info_Mod_Myxir_IR_Hi_12_02"); //(zum Helden) Wie sollte es einen Verfechter dunkler Künste denn auch hier anders gehen?
	AI_Output(self, hero, "Info_Mod_Myxir_IR_Hi_12_03"); //Blicke dich um ... Es ist ein einziger Schatz dunkler Magie, den es nur noch zu ergründen gilt.
	AI_Output(hero, self, "Info_Mod_Myxir_IR_Hi_15_04"); //Ja, dazu wirst du bestimmt noch Gelegenheit bekommen.
};

INSTANCE Info_Mod_Myxir_IR_Hebel (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_Hebel_Condition;
	information	= Info_Mod_Myxir_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Myxir_IR_Hebel_Condition()
{
	if (Mod_IR_Myxir == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Myxir_IR_Hebel_12_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Myxir_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_Ambient01_Condition;
	information	= Info_Mod_Myxir_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_DRACONIANAREA_16") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_IR_Ambient01_12_00"); //(anerkennend) So viele finstere Gestalten auf engstem Raum ... hier muss ein wahrer Meister der dunklen Künste am Werk gewesen sein.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Myxir_IR_GehtLos (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_GehtLos_Condition;
	information	= Info_Mod_Myxir_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Myxir_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Myxir == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Myxir_IR_GehtLos_12_00"); //Selbstverständlich. Nichts sehnlicher wünsche ich, als das finstere Gut dieser Insel zu bergen und zu ergründen.

	Mod_IR_Dabei += 1;

	Mod_IR_Myxir = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Myxir_IR_GehBack (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_GehBack_Condition;
	information	= Info_Mod_Myxir_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Myxir_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_IR_Hi))
	&& (Mod_IR_Myxir == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Myxir_IR_GehBack_12_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Myxir = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Myxir_IR_Heiltrank (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_Heiltrank_Condition;
	information	= Info_Mod_Myxir_IR_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Heiltrank geben)";
};

FUNC INT Info_Mod_Myxir_IR_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (Mod_IR_Myxir == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, DIALOG_BACK, Info_Mod_Myxir_IR_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Elixier der Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Extrakt der Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Essenz der Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Trank der leichten Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Leichter Heiltrank", Info_Mod_Myxir_IR_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Myxir_IR_Heiltrank, "Trank der schnellen Heilung", Info_Mod_Myxir_IR_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Myxir_IR_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Myxir_IR_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Myxir_IR_EXIT (C_INFO)
{
	npc		= Mod_7448_KDS_Myxir_IR;
	nr		= 1;
	condition	= Info_Mod_Myxir_IR_EXIT_Condition;
	information	= Info_Mod_Myxir_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};