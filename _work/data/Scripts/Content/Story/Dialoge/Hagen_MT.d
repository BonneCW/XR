INSTANCE Info_Mod_Hagen_MT_Hi (C_INFO)
{
	npc		= Mod_7698_PAL_Hagen_MT;
	nr		= 1;
	condition	= Info_Mod_Hagen_MT_Hi_Condition;
	information	= Info_Mod_Hagen_MT_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hagen_MT_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hagen_MT_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hagen_MT_Hi_04_00"); //Da ich nun vor dir stehe, darf ich annehmen, dass es nicht ganz so gut gelaufen ist?
	AI_Output(hero, self, "Info_Mod_Hagen_MT_Hi_15_01"); //Du hier? Ahh, ein Teleportzauber, ich verstehe.
	AI_Output(hero, self, "Info_Mod_Hagen_MT_Hi_15_02"); //Ja, Hymir war recht ungehalten über das Schreiben, genauso wie über die Tatsache, das Andre nicht mehr unter den Lebenden weilt.
	AI_Output(self, hero, "Info_Mod_Hagen_MT_Hi_04_03"); //Nun, mit so etwas hatte ich gerechnet.
	AI_Output(self, hero, "Info_Mod_Hagen_MT_Hi_04_04"); //Daher hoffe ich die Sache nun im persönlichen Gespräch mit Hymir klären zu können.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATHYMIR");
};

INSTANCE Info_Mod_Hagen_MT_EXIT (C_INFO)
{
	npc		= Mod_7698_PAL_Hagen_MT;
	nr		= 1;
	condition	= Info_Mod_Hagen_MT_EXIT_Condition;
	information	= Info_Mod_Hagen_MT_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hagen_MT_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hagen_MT_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};