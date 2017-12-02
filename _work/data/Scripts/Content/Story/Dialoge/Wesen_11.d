INSTANCE Info_Mod_Wesen_11_Hi (C_INFO)
{
	npc		= Monster_11035_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_11_Hi_Condition;
	information	= Info_Mod_Wesen_11_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_11_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_11_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_11_Hi_10_00"); //Das Meer ist eigentlich nur ein groﬂer See und die Gesellschaft ... nur ein groﬂes Individuum.

	AI_StopProcessInfos	(self);
};