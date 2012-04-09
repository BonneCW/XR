INSTANCE Info_Mod_Blutkultkrieger_Hi (C_INFO)
{
	npc		= Mod_4092_BlutkultKrieger_NW;
	nr		= 1;
	condition	= Info_Mod_Blutkultkrieger_Hi_Condition;
	information	= Info_Mod_Blutkultkrieger_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Blutkultkrieger_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blutkultkrieger_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Blutkultkrieger_Hi_13_00"); //Was willst du hier, Kleiner?
	AI_Output(hero, self, "Info_Mod_Blutkultkrieger_Hi_15_01"); //Ich bin hier, um dir und deinen Freunden den Schädel zu spalten.
	AI_Output(self, hero, "Info_Mod_Blutkultkrieger_Hi_13_02"); //(lacht) Hahahahaha. Du meinst, du hättest gegen uns eine Chance? Da liegst du falsch, Kleiner! STIRB!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_KILL, 0);
};