INSTANCE Info_Mod_Wesen_04_Hi (C_INFO)
{
	npc		= Monster_11028_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_04_Hi_Condition;
	information	= Info_Mod_Wesen_04_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_04_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_04_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_04_Hi_18_00"); //Das Leben ist manchmal nicht mehr als ein bizarrer Traum.
	AI_Output(self, hero, "Info_Mod_Wesen_04_Hi_18_01"); //Doch welcher Traum vermag es schon, bizarrer zu sein als das Leben?

	AI_StopProcessInfos	(self);
};