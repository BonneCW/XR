INSTANCE Info_Mod_Fortuno_Hi (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Hi_Condition;
	information	= Info_Mod_Fortuno_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fortuno_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fortuno_Hi_13_00"); //Hallo, wenn du was brauchst, kannst du es bei mir bekommen.
	
	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_PSICAMP, "Fortuno handelt mit allerlei Kleinkram.");
};

INSTANCE Info_Mod_Fortuno_Woher (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Woher_Condition;
	information	= Info_Mod_Fortuno_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du in diesem Lager?";
};

FUNC INT Info_Mod_Fortuno_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Woher_15_00"); //Wieso bist du in diesem Lager?
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_01"); //Das Sumpfkraut ist an allem Schuld.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_02"); //Es begann alles in Geldern. Ich war dort Lehrling eines Alchemisten und kam dort erstmals in Kontakt mit Sumpfkraut.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_03"); //Kurz darauf war ich süchtig und wurde in die Kolonie geworfen. Als ich dann erfahren habe, dass es hier Sumpfkraut gibt, bin ich sofort hierher gekommen.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_04"); //Seitdem lebe ich in diesem Lager und verwalte die Vorräte.
};

INSTANCE Info_Mod_Fortuno_Trade (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Trade_Condition;
	information	= Info_Mod_Fortuno_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fortuno_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fortuno_Pickpocket (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Pickpocket_Condition;
	information	= Info_Mod_Fortuno_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Fortuno_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 340);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_BACK, Info_Mod_Fortuno_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fortuno_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
};

INSTANCE Info_Mod_Fortuno_EXIT (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_EXIT_Condition;
	information	= Info_Mod_Fortuno_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};