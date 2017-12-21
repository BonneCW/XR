INSTANCE Info_Mod_Schaeferhund_Lobart_Hi (C_INFO)
{
	npc		= Schaeferhund_Lobart_01;
	nr		= 1;
	condition	= Info_Mod_Schaeferhund_Lobart_Hi_Condition;
	information	= Info_Mod_Schaeferhund_Lobart_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Geh zum Herrchen!";
};

FUNC INT Info_Mod_Schaeferhund_Lobart_Hi_Condition()
{
	if (Mod_SheromeSuche == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schaeferhund_Lobart_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Schaeferhund_Lobart_Hi_15_00"); //Geh zum Herrchen!

	B_Say_Dog_Wau();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FARM");
};

INSTANCE Info_Mod_Schaeferhund_Lobart_EXIT (C_INFO)
{
	npc		= Schaeferhund_Lobart_01;
	nr		= 1;
	condition	= Info_Mod_Schaeferhund_Lobart_EXIT_Condition;
	information	= Info_Mod_Schaeferhund_Lobart_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schaeferhund_Lobart_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schaeferhund_Lobart_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};