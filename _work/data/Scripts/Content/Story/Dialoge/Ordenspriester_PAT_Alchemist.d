INSTANCE Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest (C_INFO)
{
	npc		= Mod_1740_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_Condition;
	information	= Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hieltest du davon, zur Abwechslung mal wieder die Hände zum Gebet zu falten in der Kirche unseres Herrn?";
};

FUNC INT Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_15_00"); //Was hieltest du davon, zur Abwechslung mal wieder die Hände zum Gebet zu falten in der Kirche unseres Herrn?
	AI_Output(self, hero, "Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_06_01"); //Hmm, ja, das Gebet in der Kirche. Danke, dass du mich daran erinnerst, Bruder. Mein letzter Besuch liegt schon allzu lange zurück.
	AI_Output(self, hero, "Info_Mod_Ordenspriester_PAT_Alchemist_MangelQuest_06_02"); //Danach werde ich auch gewiss mit ruhigerer Hand weiterarbeiten können. Ich mache mich sofort auf den Weg.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KIRCHE");

	B_GivePlayerXP	(100);

	Mod_Pat_Beter += 1;

	if (Mod_Pat_Beter == 3)
	{
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "So, ich denke ich haben genügend Jünger Innos’ zum Gebet bewegen können und sollte in der Kirche bei Nagon vorbeischauen.");
	};
};

INSTANCE Info_Mod_Ordenspriester_PAT_Alchemist_EXIT (C_INFO)
{
	npc		= Mod_1740_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Ordenspriester_PAT_Alchemist_EXIT_Condition;
	information	= Info_Mod_Ordenspriester_PAT_Alchemist_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ordenspriester_PAT_Alchemist_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ordenspriester_PAT_Alchemist_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};