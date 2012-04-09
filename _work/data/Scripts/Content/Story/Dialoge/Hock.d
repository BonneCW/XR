INSTANCE Info_Mod_Hock_HaradLehrling (C_INFO)
{
	npc		= Mod_1200_SLD_Soeldner_NW;
	nr		= 1;
	condition	= Info_Mod_Hock_HaradLehrling_Condition;
	information	= Info_Mod_Hock_HaradLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hock_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hock_HaradLehrling_Info()
{
	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Hock_NahkampfJG (C_INFO)
{
	npc		= Mod_1200_SLD_Soeldner_NW;
	nr		= 1;
	condition	= Info_Mod_Hock_NahkampfJG_Condition;
	information	= Info_Mod_Hock_NahkampfJG_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Bist du Hock?";
};

FUNC INT Info_Mod_Hock_NahkampfJG_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cord_NW_NahkampfJG))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hock_NahkampfJG_Info()
{
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_00"); //Hallo! Bist du Hock?
	AI_Output(self, hero, "Info_Mod_Hock_NahkampfJG_06_01"); //Sicher bin ich das. Sieht man mir nicht an?
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_02"); //Anweisung von Cord. Du sollst ins Minental gehen und dich dort im Waldläuferlager melden.
	AI_Output(self, hero, "Info_Mod_Hock_NahkampfJG_06_03"); //Aha. Und wie finde ich das?
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_04"); //Warst du schon im Minental?
	AI_Output(self, hero, "Info_Mod_Hock_NahkampfJG_06_05"); //War mal bei Lee im Söldnerlager. Ist aber länger her.
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_06"); //Pass auf. Wenn du ins Tal kommst, hälts du dich links, immer den Bach lang Richtung Küste.
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_07"); //Irgendwann siehst du dann eine Burgruine und in der Nähe einen hölzernen Wachturm.
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_08"); //Da ist das Waldläuferlager. Am Eingang steht Torgan. Ihm sagst du, du seiest der neue Nahkämpfer.
	AI_Output(self, hero, "Info_Mod_Hock_NahkampfJG_06_09"); //So, bin ich das.
	AI_Output(hero, self, "Info_Mod_Hock_NahkampfJG_15_10"); //Klar, du wirst reichlich Spass haben.
	AI_Output(self, hero, "Info_Mod_Hock_NahkampfJG_06_11"); //Na hoffentlich ...

	B_LogEntry	(TOPIC_MOD_JG_NAHKAMPF, "Ich habe Hock als Kämpfer gewinnen können. Dafür muss Cyrco einen der Jäger zum Bauern Onar schicken.");

	B_StartOtherRoutine	(self, "WEG");
};

INSTANCE Info_Mod_Hock_EXIT (C_INFO)
{
	npc		= Mod_1200_SLD_Soeldner_NW;
	nr		= 1;
	condition	= Info_Mod_Hock_EXIT_Condition;
	information	= Info_Mod_Hock_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hock_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hock_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};