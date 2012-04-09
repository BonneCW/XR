INSTANCE Info_Mod_Salmey_Hi (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Hi_Condition;
	information	= Info_Mod_Salmey_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es denn hier für Bier?";
};

FUNC INT Info_Mod_Salmey_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salmey_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Salmey_Hi_15_00"); //Was gibt es denn hier für Bier?
	AI_Output(self, hero, "Info_Mod_Salmey_Hi_16_01"); //Restbestände vom Khorataer Lagerbier. Unser Brauer hat gerade Probleme, will aber bald wieder liefern.
	AI_Output(self, hero, "Info_Mod_Salmey_Hi_16_02"); //Ansonsten reichlich herkömmliches Klosterbier, mit frischem Quellwasser verdünnt.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Salmey in der Kneipe kann mir Bier verkaufen.");
};

INSTANCE Info_Mod_Salmey_Trade (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Trade_Condition;
	information	= Info_Mod_Salmey_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Dann lass mal das Angebot sehen.";
};

FUNC INT Info_Mod_Salmey_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salmey_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salmey_Trade_Info()
{
	Backup_Questitems();

	//B_GiveTradeInv (self);
	AI_Output(hero, self, "Info_Mod_Salmey_Trade_15_00"); //Dann lass mal das Angebot sehen.
};

INSTANCE Info_Mod_Salmey_Pickpocket (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_Pickpocket_Condition;
	information	= Info_Mod_Salmey_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Salmey_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Salmey_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Salmey_Pickpocket);

	Info_AddChoice	(Info_Mod_Salmey_Pickpocket, DIALOG_BACK, Info_Mod_Salmey_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Salmey_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Salmey_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Salmey_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Salmey_Pickpocket);
};

FUNC VOID Info_Mod_Salmey_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Salmey_Pickpocket);
};

INSTANCE Info_Mod_Salmey_EXIT (C_INFO)
{
	npc		= Mod_7726_OUT_Salmey_REL;
	nr		= 1;
	condition	= Info_Mod_Salmey_EXIT_Condition;
	information	= Info_Mod_Salmey_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Salmey_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salmey_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};