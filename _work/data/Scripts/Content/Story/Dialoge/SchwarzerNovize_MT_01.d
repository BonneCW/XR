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

INSTANCE Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen (C_INFO)
{
	npc		= Mod_7784_SNOV_Novize_MT;
	nr		= 1;
	condition	= Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_Condition;
	information	= Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie bist du zu dieser Gilde gekommen?";
};

FUNC INT Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SchwarzerNovize_MT_01_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_Info()
{
	AI_Output(hero, self, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_15_00"); //Wie bist du zu dieser Gilde gekommen?
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_11_01"); //Naja, also bis vor drei Wochen war ich ja noch ein, ähh ... Ganove in Khorinis.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_11_02"); //Dann hörte ich von dieser Gemeinschaft, die nach dem Fall der Barriere in kürzester Zeit wie aus dem Nichts entstanden war und rasch an Größe und Einfluss gewann.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_11_03"); //Es hieß, ihre Jünger würden Beliar anbeten und jedem, der seine Tugenden pflegte mit offenen Armen aufnehmen.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_11_04"); //Da muss ich hin, dachte ich mir ... und ich habe es nicht bereut.
	AI_Output(self, hero, "Info_Mod_SchwarzerNovize_MT_01_WieZuGildeGekommen_11_05"); //Hier bekomme ich Möglichkeiten, wie ich sie sonst nie hätte kriegen können ... vor allem mit meiner Vergangenheit.
};