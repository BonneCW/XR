INSTANCE Info_Mod_Wesen_05_Hi (C_INFO)
{
	npc		= Monster_11029_Wesen_HALU;
	nr		= 1;
	condition	= Info_Mod_Wesen_05_Hi_Condition;
	information	= Info_Mod_Wesen_05_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wesen_05_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wesen_05_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wesen_05_Hi_10_00"); //Was du auch sehen magst, was du auch hören, fühlen oder schmecken magst, nichts davon ist wahr.
	AI_Output(self, hero, "Info_Mod_Wesen_05_Hi_10_01"); //Es gibt keine Wahrheit, es gibt nur Wahrnehmung.
	AI_Output(self, hero, "Info_Mod_Wesen_05_Hi_10_02"); //Das, was du wahrnimmst, ist das, was du Wahrheit nennst.

	AI_StopProcessInfos	(self);
};