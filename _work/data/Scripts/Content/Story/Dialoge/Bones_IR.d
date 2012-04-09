INSTANCE Info_Mod_Bones_IR_Hi (C_INFO)
{
	npc		= Mod_7464_PIR_Bones_IR;
	nr		= 1;
	condition	= Info_Mod_Bones_IR_Hi_Condition;
	information	= Info_Mod_Bones_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Bones.";
};

FUNC INT Info_Mod_Bones_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bones_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bones_IR_Hi_15_00"); //Hallo Bones.

	if (Mod_VelayaDabei > 0)
	|| (Mod_CassiaDabei > 0)
	{
		AI_Output(hero, self, "Info_Mod_Bones_IR_Hi_15_01"); //Wieso schaust du so zerknirscht.
		AI_Output(self, hero, "Info_Mod_Bones_IR_Hi_01_02"); //Ähhm, ach, ne, nicht so wichtig ...
		AI_Output(hero, self, "Info_Mod_Bones_IR_Hi_15_03"); //Du hattest doch die schöne Frau an Bord, die du wolltest.
		AI_Output(self, hero, "Info_Mod_Bones_IR_Hi_01_04"); //(ausweichend) Ähh ... die war nicht mein Typ ... genau.
	}
	else if (Mod_SagittaDabei > 0)
	|| (Mod_UrielaDabei > 0)
	{
		AI_Output(hero, self, "Info_Mod_Bones_IR_Hi_15_05"); //Ohh, du siehst aber gar nicht gut aus ...
		AI_Output(self, hero, "Info_Mod_Bones_IR_Hi_01_06"); //Ach, sei bloß ruhig.
		AI_Output(self, hero, "Info_Mod_Bones_IR_Hi_01_07"); //Erst ist das einzige Weib an Bord eine alte Kräutertante und dann komme ich nicht mal dazu ihr zu zeigen, was für ein Kerl ich bin, weil meine Verdauung auf einmal verrückt spielt.
		AI_Output(self, hero, "Info_Mod_Bones_IR_Hi_01_08"); //Erst jetzt geht es mir langsam besser ...
	};
};

INSTANCE Info_Mod_Bones_IR_GehtLos (C_INFO)
{
	npc		= Mod_7464_PIR_Bones_IR;
	nr		= 1;
	condition	= Info_Mod_Bones_IR_GehtLos_Condition;
	information	= Info_Mod_Bones_IR_GehtLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Bones_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bones_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bones_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Bones_IR_GehtLos_01_00"); //Was?! Nach dieser üblen Seereise?! Vergiss es! Ich setze keinen Fuß auf die Insel ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bones_IR_EXIT (C_INFO)
{
	npc		= Mod_7464_PIR_Bones_IR;
	nr		= 1;
	condition	= Info_Mod_Bones_IR_EXIT_Condition;
	information	= Info_Mod_Bones_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bones_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bones_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};