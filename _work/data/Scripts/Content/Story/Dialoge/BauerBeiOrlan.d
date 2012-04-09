INSTANCE Info_Mod_BauerBeiOrlan_Daemonisch (C_INFO)
{
	npc		= Mod_1402_BAU_Bauer_NW;
	nr		= 1;
	condition	= Info_Mod_BauerBeiOrlan_Daemonisch_Condition;
	information	= Info_Mod_BauerBeiOrlan_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_BauerBeiOrlan_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_BauerBeiOrlan_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_BauerBeiOrlan_Daemonisch_07_00"); //Ja, dort setze ich nie mehr einen Fuﬂ hinein.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};