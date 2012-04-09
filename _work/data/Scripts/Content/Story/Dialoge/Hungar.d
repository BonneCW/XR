INSTANCE Info_Mod_Hungar_Hey (C_INFO)
{
	npc		= Mod_7522_JG_Hungar_JL;
	nr		= 1;
	condition	= Info_Mod_Hungar_Hey_Condition;
	information	= Info_Mod_Hungar_Hey_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich sehe, du bist gut sortiert.";
};

FUNC INT Info_Mod_Hungar_Hey_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hungar_Hey_Info()
{
	AI_Output(hero, self, "Info_Mod_Hungar_Hey_15_00"); //Ich sehe, du bist gut sortiert.
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_01"); //Das muss auch sein. Wir sind hier etwas isoliert.
	AI_Output(hero, self, "Info_Mod_Hungar_Hey_15_02"); //Wo kriegst du das alles her?
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_03"); //Ich kaufe in den Lagern ein. Und das Fleisch bringen die Jäger bei.
	AI_Output(hero, self, "Info_Mod_Hungar_Hey_15_04"); //Du kannst ja jetzt auch in der Stadt was besorgen.
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_05"); //Das ist mir zu weit und viel zu gefährlich geworden.
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_06"); //All die Mörder und Banditen, die mit der Kuppel hierher gekommen sind. Und die Viecher überall.
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_07"); //Früher waren das nicht so viele.
	AI_Output(hero, self, "Info_Mod_Hungar_Hey_15_08"); //Du bist schon länger hier?
	AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_09"); //Gewiss. War einer der Ersten im Lager. Vor der Barriere. So wahr ich Hungar heiße.
	AI_Output(hero, self, "Info_Mod_Hungar_Hey_15_10"); //Dann zeig mal, was du alles hast ...

	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		AI_Output(self, hero, "Info_Mod_Hungar_Hey_08_11"); //Tut mir Leid, aber ich werde erst mit dir Handeln, wenn du ein Waldläufer bist.
	};

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_WALDIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_WALDIS, "Hungar scheint Lebensmittel an die Waldläufer zu verkaufen.");
};

INSTANCE Info_Mod_Hungar_Trade (C_INFO)
{
	npc		= Mod_7522_JG_Hungar_JL;
	nr		= 1;
	condition	= Info_Mod_Hungar_Trade_Condition;
	information	= Info_Mod_Hungar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hungar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hungar_Hey))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cyrco_BaalOrun))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hungar_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hungar_Pickpocket (C_INFO)
{
	npc		= Mod_7522_JG_Hungar_JL;
	nr		= 1;
	condition	= Info_Mod_Hungar_Pickpocket_Condition;
	information	= Info_Mod_Hungar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Hungar_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Hungar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hungar_Pickpocket);

	Info_AddChoice	(Info_Mod_Hungar_Pickpocket, DIALOG_BACK, Info_Mod_Hungar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hungar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hungar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hungar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hungar_Pickpocket);
};

FUNC VOID Info_Mod_Hungar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Hungar_Pickpocket);
};

INSTANCE Info_Mod_Hungar_EXIT (C_INFO)
{
	npc		= Mod_7522_JG_Hungar_JL;
	nr		= 1;
	condition	= Info_Mod_Hungar_EXIT_Condition;
	information	= Info_Mod_Hungar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hungar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hungar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};