INSTANCE Info_Mod_Hock_JG_Sweetwater (C_INFO)
{
	npc		= Mod_7539_SLD_Hock_JG;
	nr		= 1;
	condition	= Info_Mod_Hock_JG_Sweetwater_Condition;
	information	= Info_Mod_Hock_JG_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich höre, du hast mir was zu sagen?";
};

FUNC INT Info_Mod_Hock_JG_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hock_JG_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Hock_JG_Sweetwater_15_00"); //Ich höre, du hast mir was zu sagen?
	AI_Output(self, hero, "Info_Mod_Hock_JG_Sweetwater_06_01"); //Jo. Auf dem Herweg ist mir so ein Kerl über den Weg gelaufen. Der hat dich gesucht.
	AI_Output(hero, self, "Info_Mod_Hock_JG_Sweetwater_15_02"); //Und was wollte er?
	AI_Output(self, hero, "Info_Mod_Hock_JG_Sweetwater_06_03"); //Der hat gesagt, du sollst zu Vatras kommen. Der hätte was für dich.
	AI_Output(hero, self, "Info_Mod_Hock_JG_Sweetwater_15_04"); //Aha. Und eilt es?
	AI_Output(self, hero, "Info_Mod_Hock_JG_Sweetwater_06_05"); //Hat er nich gesagt.
	AI_Output(hero, self, "Info_Mod_Hock_JG_Sweetwater_15_06"); //Gut. Nun zeig den Bogenbrüdern mal, wo das Schwert hängt.
	AI_Output(self, hero, "Info_Mod_Hock_JG_Sweetwater_06_07"); //Mach ich. Kannst du glauben.

	Log_CreateTopic	(TOPIC_MOD_JG_SWEETWATER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_SWEETWATER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Dieser Söldner Hock sagt mir, dass ich zu Vatras kommen soll. Mache ich am Besten gleich.");
};

INSTANCE Info_Mod_Hock_JG_EXIT (C_INFO)
{
	npc		= Mod_7539_SLD_Hock_JG;
	nr		= 1;
	condition	= Info_Mod_Hock_JG_EXIT_Condition;
	information	= Info_Mod_Hock_JG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hock_JG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hock_JG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};