INSTANCE Info_Mod_Schiffskobold_Hi (C_INFO)
{
	npc		= Monster_11059_Kobold_MT;
	nr		= 1;
	condition	= Info_Mod_Schiffskobold_Hi_Condition;
	information	= Info_Mod_Schiffskobold_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Schiffskobold_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schiffskobold_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Schiffskobold_Hi_20_00"); //Wer Chromanin erringen will, wird mehr benötigen, als die schlichte Kraft der Arme, hehehe.

	AI_StopProcessInfos	(self);
};