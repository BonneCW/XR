INSTANCE Info_Mod_Bobo_Unheil (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_Unheil_Condition;
	information	= Info_Mod_Bobo_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Irgendwelche besonderen Vorkommnisse und Auffälligkeiten in letzter Zeit?";
};

FUNC INT Info_Mod_Bobo_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bobo_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Bobo_Unheil_15_00"); //Irgendwelche besonderen Vorkommnisse und Auffälligkeiten in letzter Zeit?
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_01"); //Du bist mir gut. Alle spielen verrückt, seit dem diese Ungetüme auf den Bauernhöfen ihr Unwesen treiben.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_02"); //Dazu noch dieses Rudel schwarzer Wölfe, welches sich immer wieder nachts  in der Nähe unseres Hofes im Wald herumtreibt. Das kann schon manchem ordentlich zusetzen.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_03"); //Vorallem die Frauen auf dem Hof leiden darunter. Maria ist ziemlich krank geworden – die ganzen Sorgen wahrscheinlich – und Elena geht jeden Abend, wenn es dunkel wird wohl zu Cord, um vermutlich Schutz zu suchen.
	AI_Output(self, hero, "Info_Mod_Bobo_Unheil_13_04"); //Er ist ja ein zäher Kämpfer. Naja, wo soll das ganze nur enden ...

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Von Bobo erfuhr ich, dass ein Rudel schwarzer Wölfe nachts seit einiger Zeit in der Nähe des Hofes sein Unwesen treibt.");
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Elena sucht nachts immer Schutz bei Cord.");

	if (!Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Maria ist seit einigen Tagen stark erkrankt.");
	};

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Bobo_Pickpocket (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_Pickpocket_Condition;
	information	= Info_Mod_Bobo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_40;
};

FUNC INT Info_Mod_Bobo_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 55);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);

	Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_BACK, Info_Mod_Bobo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bobo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bobo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);
};

FUNC VOID Info_Mod_Bobo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bobo_Pickpocket);
};

INSTANCE Info_Mod_Bobo_EXIT (C_INFO)
{
	npc		= Mod_1410_BAU_Bobo_NW;
	nr		= 1;
	condition	= Info_Mod_Bobo_EXIT_Condition;
	information	= Info_Mod_Bobo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bobo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bobo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};