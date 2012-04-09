INSTANCE Info_Mod_Athos_Hi (C_INFO)
{
	npc		= Mod_7290_PAL_Athos_NW;
	nr		= 1;
	condition	= Info_Mod_Athos_Hi_Condition;
	information	= Info_Mod_Athos_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Athos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Athos_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Athos_Hi_13_00"); //Verdammt, er ist uns entwischt.

	AI_StopProcessInfos	(self);
};