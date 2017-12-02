INSTANCE Info_Mod_Wesen_01_Hi (C_INFO)
{
	npc		= Monster_11025_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_01_Hi_Condition;
	information	= Info_Mod_Wesen_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_01_Hi_10_00"); //Weiﬂt du, Kohlestaub, der in der Mittagssonne glitzert, ist heller als ein weiﬂes Blatt bei Vollmond.

	AI_StopProcessInfos	(self);
};