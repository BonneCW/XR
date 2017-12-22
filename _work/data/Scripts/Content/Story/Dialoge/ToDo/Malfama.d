INSTANCE Info_Mod_Malfama_AtHome (C_INFO)
{
	npc		= Mod_7560_OUT_Malfama_EIS;
	nr		= 1;
	condition	= Info_Mod_Malfama_AtHome_Condition;
	information	= Info_Mod_Malfama_AtHome_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malfama_AtHome_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serra_AtHome))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malfama_AtHome_Info()
{
	AI_Output(self, hero, "Info_Mod_Malfama_AtHome_43_00"); //Ja, unsittlich berührt hat er sie und damit gedroht uns schlimmes anzutun, wenn wir es erzählen.
	AI_Output(self, hero, "Info_Mod_Malfama_AtHome_43_01"); //Es ist schlimm, wir beide können nichts gegen ihn ausrichten. Wenn uns doch nur jemand helfen könnte ...
	AI_Output(hero, self, "Info_Mod_Malfama_AtHome_15_02"); //Vielleicht könnte ich euch ja beistehen.
	AI_Output(self, hero, "Info_Mod_Malfama_AtHome_43_03"); //Wirklich? Ohh, vielen Dank. Einem so gutherzigen und hilfsbereiten Mann sind wir noch nie begegnet.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Malfama_Traenenkristall (C_INFO)
{
	npc		= Mod_7560_OUT_Malfama_EIS;
	nr		= 1;
	condition	= Info_Mod_Malfama_Traenenkristall_Condition;
	information	= Info_Mod_Malfama_Traenenkristall_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malfama_Traenenkristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Knatus_Traenenkristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malfama_Traenenkristall_Info()
{
	AI_TurnToNpc	(self, Mod_7559_OUT_Serra_EIS);

	AI_Output(self, hero, "Info_Mod_Malfama_Traenenkristall_43_00"); //(zu Serra) Was hast du getan? Ja, natürlich der Kristall. Das sollt ihr alle mit dem Tode bereuen!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HEXENMAGIE");
	B_StartOtherRoutine	(Mod_7559_OUT_Serra_EIS, "HEXENMAGIE");
};

INSTANCE Info_Mod_Malfama_EXIT (C_INFO)
{
	npc		= Mod_7560_OUT_Malfama_EIS;
	nr		= 1;
	condition	= Info_Mod_Malfama_EXIT_Condition;
	information	= Info_Mod_Malfama_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Malfama_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malfama_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};