INSTANCE Info_Mod_Raven_IR_Hi (C_INFO)
{
	npc		= Mod_7446_DMR_Raven_IR;
	nr		= 1;
	condition	= Info_Mod_Raven_IR_Hi_Condition;
	information	= Info_Mod_Raven_IR_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, war die Seereise nicht ein Erlebnis für alle Sinne?";
};

FUNC INT Info_Mod_Raven_IR_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_IR_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_IR_Hi_15_00"); //Und, war die Seereise nicht ein Erlebnis für alle Sinne?
	AI_Output(self, hero, "Info_Mod_Raven_IR_Hi_03_01"); //Was, willst du mich verspotten?!
	AI_Output(self, hero, "Info_Mod_Raven_IR_Hi_03_02"); //Die einzigen Erlebnisse hatte mein Magen, und zwar die ganze Fahrt über.
	AI_Output(self, hero, "Info_Mod_Raven_IR_Hi_03_03"); //Und jetzt geh mir aus den Augen.
};

INSTANCE Info_Mod_Raven_IR_GehtLos (C_INFO)
{
	npc		= Mod_7446_DMR_Raven_IR;
	nr		= 1;
	condition	= Info_Mod_Raven_IR_GehtLos_Condition;
	information	= Info_Mod_Raven_IR_GehtLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es geht los. Wirst du mich auf die Insel begleiten?";
};

FUNC INT Info_Mod_Raven_IR_GehtLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_IR_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Raven_IR_Hi))
	&& (Mod_IR_Dabei < 7)
	&& (!Npc_IsDead(Dragon_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_IR_GehtLos_Info()
{
	B_Say	(hero, self, "$IRDORATHGEHTLOS");

	AI_Output(self, hero, "Info_Mod_Raven_IR_GehtLos_03_00"); //Nein! Xardas mag mich vielleicht dazu angewiesen haben mitzukommen. Von mitkämpfen war aber keine Rede.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Raven_IR_EXIT (C_INFO)
{
	npc		= Mod_7446_DMR_Raven_IR;
	nr		= 1;
	condition	= Info_Mod_Raven_IR_EXIT_Condition;
	information	= Info_Mod_Raven_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raven_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};