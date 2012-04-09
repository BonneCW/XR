INSTANCE Info_Mod_Esteban_OC_Hi (C_INFO)
{
	npc		= Mod_7184_BDT_Esteban_OC;
	nr		= 1;
	condition	= Info_Mod_Esteban_OC_Hi_Condition;
	information	= Info_Mod_Esteban_OC_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Esteban_OC_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Esteban_OC_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Esteban_OC_Hi_07_00"); //(freudig erstaunt) Du hier?! Ich glaube es ja nicht. Wie ... ?
	AI_Output(hero, self, "Info_Mod_Esteban_OC_Hi_15_01"); //Nun, auf die Details können wir später eingehen. Wir müssen erst mal schauen, wie wir hier wieder heil herauskommen.
	AI_Output(self, hero, "Info_Mod_Esteban_OC_Hi_07_02"); //Ahh, und hier steht auch ein Fass mit unseren Waffen.

	Wld_InsertNpc	(OrcWarrior_Roam, "WP_OCC_105");
	Wld_InsertNpc	(OrcWarrior_Roam, "WP_OCC_105");
	Wld_InsertNpc	(OrcWarrior_Roam, "WP_OCC_105");

	Mod_AlbertTransforms = 3;
};

INSTANCE Info_Mod_Esteban_OC_EXIT (C_INFO)
{
	npc		= Mod_7184_BDT_Esteban_OC;
	nr		= 1;
	condition	= Info_Mod_Esteban_OC_EXIT_Condition;
	information	= Info_Mod_Esteban_OC_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Esteban_OC_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Esteban_OC_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};