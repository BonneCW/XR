INSTANCE Info_Mod_Wesen_09_Hi (C_INFO)
{
	npc		= Monster_11033_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_09_Hi_Condition;
	information	= Info_Mod_Wesen_09_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_09_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_09_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_09_Hi_10_00"); //Warum sollte ich mit dir sprechen?

	AI_StopProcessInfos	(self);
};