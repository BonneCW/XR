INSTANCE Info_Mod_Wache_Eisgebiet_01_Hi (C_INFO)
{
	npc		= Mod_7727_OUT_Wache_EIS;
	nr		= 1;
	condition	= Info_Mod_Wache_Eisgebiet_01_Hi_Condition;
	information	= Info_Mod_Wache_Eisgebiet_01_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wache_Eisgebiet_01_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gellit_RaueSchneide))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wache_Eisgebiet_01_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wache_Eisgebiet_01_Hi_06_00"); //Halt! (schaut ihn musternt an) Warum willst du in die Kaserne?
	AI_Output(hero, self, "Info_Mod_Wache_Eisgebiet_01_Hi_15_01"); //Gellit schickt mich. Ich will mir euer Ansehen verdienen.
	AI_Output(self, hero, "Info_Mod_Wache_Eisgebiet_01_Hi_06_02"); //In Ordnung, dann bist du hier richtig. Durch deinen Militärdienst bei uns kannst du zeigen wer du bist.
	AI_Output(self, hero, "Info_Mod_Wache_Eisgebiet_01_Hi_06_03"); //Wenn du allerdings denkst, du könntest den Kommander angeifen, soll dir gesagt sein, das er sich gegen Jeden zu verteidigen weiß.
};

INSTANCE Info_Mod_Wache_Eisgebiet_01_EXIT (C_INFO)
{
	npc		= Mod_7727_OUT_Wache_EIS;
	nr		= 1;
	condition	= Info_Mod_Wache_Eisgebiet_01_EXIT_Condition;
	information	= Info_Mod_Wache_Eisgebiet_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wache_Eisgebiet_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wache_Eisgebiet_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};