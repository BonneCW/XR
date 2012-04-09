INSTANCE Info_Mod_Baecker_August (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_August_Condition;
	information	= Info_Mod_Baecker_August_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast Fladenbrot? (10 Gold)";
};

FUNC INT Info_Mod_Baecker_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baecker_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Baecker_August_15_00"); //Du hast Fladenbrot?
	AI_Output(self, hero, "Info_Mod_Baecker_August_01_01"); //Gewiss. Eine Spezialität meines Hauses.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 10);

	CreateInvItems	(hero, ItFo_Fladenbrot, 1);

	B_ShowGivenThings	("10 Gold gegeben und Fladenbrot erhalten");

	B_LogEntry	(TOPIC_MOD_JG_AUGUST, "Ich hab das Fladenbrot vom Bäcker.");
};

INSTANCE Info_Mod_Baecker_Pickpocket (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_Pickpocket_Condition;
	information	= Info_Mod_Baecker_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Baecker_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Baecker_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baecker_Pickpocket);

	Info_AddChoice	(Info_Mod_Baecker_Pickpocket, DIALOG_BACK, Info_Mod_Baecker_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baecker_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baecker_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baecker_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baecker_Pickpocket);
};

FUNC VOID Info_Mod_Baecker_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Baecker_Pickpocket);
};

INSTANCE Info_Mod_Baecker_EXIT (C_INFO)
{
	npc		= Mod_7573_OUT_Baecker_REL;
	nr		= 1;
	condition	= Info_Mod_Baecker_EXIT_Condition;
	information	= Info_Mod_Baecker_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baecker_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baecker_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};