INSTANCE Info_Mod_SoeldnerBeiThekla_Daemonisch (C_INFO)
{
	npc		= Mod_1201_SLD_Soeldner_NW;
	nr		= 1;
	condition	= Info_Mod_SoeldnerBeiThekla_Daemonisch_Condition;
	information	= Info_Mod_SoeldnerBeiThekla_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_SoeldnerBeiThekla_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch_Thekla == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SoeldnerBeiThekla_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_SoeldnerBeiThekla_Daemonisch_06_00"); //(klagend) Ohh, ich fühle mich aber gar nicht gut. Schwach wie ein Knabe, voll gefressen wie ein Troll.
	AI_Output(self, hero, "Info_Mod_SoeldnerBeiThekla_Daemonisch_06_01"); //Die nächsten Tage verlasse ich das Bett nicht mehr und Essen will ich auch nicht sehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};