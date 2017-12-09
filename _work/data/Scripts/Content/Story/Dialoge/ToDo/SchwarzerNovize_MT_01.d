INSTANCE Info_Mod_SchwarzerNovize_MT_01_Hi (C_INFO)
{
	npc		= Mod_7784_SNOV_Novize_MT;
	nr		= 1;
	condition	= Info_Mod_SchwarzerNovize_MT_01_Hi_Condition;
	information	= Info_Mod_SchwarzerNovize_MT_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_SchwarzerNovize_MT_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzerNovize_MT_01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_Hi_11_00"); //He, was machst du hier?
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_MT_01_Hi_15_01"); //Ich komme von Xardas.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_Hi_11_02"); //Dann ist ok. Wir wollen ja nicht jeden Penner hier rumlaufen haben.
};