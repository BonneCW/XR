INSTANCE Info_Mod_Cavalorn_AW_Hi (C_INFO)
{
	npc		= Mod_7640_RDW_Cavalorn_AW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_AW_Hi_Condition;
	information	= Info_Mod_Cavalorn_AW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cavalorn_AW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cavalorn_AW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cavalorn_AW_Hi_08_00"); //Moment. Ich habe eine Nachricht für dich.
	AI_Output(hero, self, "Info_Mod_Cavalorn_AW_Hi_15_01"); //Ich höre ...
	AI_Output(self, hero, "Info_Mod_Cavalorn_AW_Hi_08_02"); //Wenn du in die Stadt kommst, sollst du am Tempelplatz vorbei schauen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_AW_Hi_08_03"); //Da steht ein Kerl, der will dich unbedingt sprechen.
	AI_Output(hero, self, "Info_Mod_Cavalorn_AW_Hi_15_04"); //Wenn's sonst nichts ist.

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Cavalorn_AW_EXIT (C_INFO)
{
	npc		= Mod_7640_RDW_Cavalorn_AW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_AW_EXIT_Condition;
	information	= Info_Mod_Cavalorn_AW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cavalorn_AW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cavalorn_AW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};