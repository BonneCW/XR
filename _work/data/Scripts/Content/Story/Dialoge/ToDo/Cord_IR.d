INSTANCE Info_Mod_Cord_IR_Hi (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_Hi_Condition;
	information	= Info_Mod_Cord_IR_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cord_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cord_IR_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cord_IR_Hi_14_00"); //Hey, wenn mich mein Auge nicht täuscht, dann treiben sich nicht weit vom Schiff einige Untote umher.
	AI_Output(self, hero, "Info_Mod_Cord_IR_Hi_14_01"); //Sag Bescheid, wenn es losgehen kann. Nach der langweiligen Seereise muss endlich was passieren.
};

INSTANCE Info_Mod_Cord_IR_Hebel (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_Hebel_Condition;
	information	= Info_Mod_Cord_IR_Hebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du den einen Hebel dort benutzen, während ich den anderen bewege?";
};

FUNC INT Info_Mod_Cord_IR_Hebel_Condition()
{
	if (Mod_IR_Cord == 1)
	&& (Mod_IR_HebelProb2 >= 2)
	&& (Mod_IR_Hebel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_IR_Hebel_Info()
{
	B_Say	(hero, self, "$IRDORATHHEBEL");

	AI_Output(self, hero, "Info_Mod_Cord_IR_Hebel_14_00"); //Natürlich. Wenn wir dadurch vielleicht weiterkommen ...

	Mod_IR_Hebel = 1;

	Mod_IR_Hebelmann = Hlp_GetNpc(self);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cord_IR_Ambient01 (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_Ambient01_Condition;
	information	= Info_Mod_Cord_IR_Ambient01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cord_IR_Ambient01_Condition()
{
	if (Npc_GetDistToWP(hero, "DI_ENTER_01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_IR_Ambient01_Info()
{
	AI_Output(self, hero, "Info_Mod_Cord_IR_Ambient01_14_00"); //Hier ist aber ordentlich was los. Mal was anderes, als sich bei Onar die Beine in den Arsch zu stehen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cord_IR_GehtLos (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_GehtLos_Condition;
	information	= Info_Mod_Cord_IR_GehtLos_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Cord_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cord_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (Mod_IR_Cord == 0)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Cord_IR_GehtLos_14_00"); //Sicher, wozu bin ich mitgekommen. Auf geht’s.

	Mod_IR_Dabei += 1;

	Mod_IR_Cord = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Cord_IR_GehBack (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_GehBack_Condition;
	information	= Info_Mod_Cord_IR_GehBack_Info;
	permanent	= 1;
	important	= 0;
	description	= "Geh wieder zurück zum Schiff.";
};

FUNC INT Info_Mod_Cord_IR_GehBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cord_IR_Hi))
	&& (Mod_IR_Cord == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cord_IR_GehBack_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHBACK");

	AI_Output(self, hero, "Info_Mod_Cord_IR_GehBack_14_00"); //Gut, wenn du mich brauchst, weißt du ja, wo du mich findest.

	Mod_IR_Dabei -= 1;

	Mod_IR_Cord = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Cord_IR_EXIT (C_INFO)
{
	npc		= Mod_7452_SLD_Cord_IR;
	nr		= 1;
	condition	= Info_Mod_Cord_IR_EXIT_Condition;
	information	= Info_Mod_Cord_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cord_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cord_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};