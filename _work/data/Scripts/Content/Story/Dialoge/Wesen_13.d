INSTANCE Info_Mod_Wesen_13_Hi (C_INFO)
{
	npc		= Monster_11037_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_13_Hi_Condition;
	information	= Info_Mod_Wesen_13_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_13_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_13_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_13_Hi_18_00"); //Wohingegen das Argument als gegenläufig betrachtet werden könnte ...

	AI_StopProcessInfos	(self);
};