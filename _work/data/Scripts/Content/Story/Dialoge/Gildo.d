INSTANCE Info_Mod_Gildo_Unkraut (C_INFO)
{
	npc		= Mod_545_NONE_Gildo_NW;
	nr		= 1;
	condition	= Info_Mod_Gildo_Unkraut_Condition;
	information	= Info_Mod_Gildo_Unkraut_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gildo_Unkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lobart_Rueben))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gildo_Unkraut_Info()
{
	AI_Output(self, hero, "Info_Mod_Gildo_Unkraut_07_00"); //He, du, wir könnten mal wieder deine Hilfe gebrauchen ...
	AI_Output(hero, self, "Info_Mod_Gildo_Unkraut_15_01"); //Wovon werdet ihr bedroht?
	AI_Output(self, hero, "Info_Mod_Gildo_Unkraut_07_02"); //Unkraut ... die Felder sind voll davon. Du hast uns schon damals bei der Rübenernte geholfen und bist genau der Richtige für die Aufgabe.

	Info_ClearChoices	(Info_Mod_Gildo_Unkraut);

	Info_AddChoice	(Info_Mod_Gildo_Unkraut, "Willst du mich verarschen?! Seh ich vielleicht aus wie ein mickriger Feldarbeiter?!", Info_Mod_Gildo_Unkraut_B);
	Info_AddChoice	(Info_Mod_Gildo_Unkraut, "Na gut ...", Info_Mod_Gildo_Unkraut_A);

	Log_CreateTopic	(TOPIC_MOD_GILDO_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GILDO_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GILDO_UNKRAUT, "Ich habe mit Gildo gesprochen, einem er Gauner der Assassinen. Er will mir seine Stimme geben, aber nur, wenn ich ihm drei Pakete voller Sumpfkraut bringe, die eigentlich von verschiedenen 'Händlern' der Stadt hätten geliefert werden müssen. Dieser Personen sind Meldor, Borka und Jason. Wenn ich von ihnen die Pakete erhalten habe, soll ich mich wieder bei Gildo melden.");
};

FUNC VOID Info_Mod_Gildo_Unkraut_B()
{
	AI_Output(hero, self, "Info_Mod_Gildo_Unkraut_B_15_00"); //Willst du mich verarschen?! Seh ich vielleicht aus wie ein mickriger Feldarbeiter?!
	AI_Output(self, hero, "Info_Mod_Gildo_Unkraut_B_07_01"); //Ich meinte ja nur. Aber wenn du dir zu fein dafür bist, dann wird sich eben jemand anders die 20 Goldmünzen verdienen.

	Info_ClearChoices	(Info_Mod_Gildo_Unkraut);
};

FUNC VOID Info_Mod_Gildo_Unkraut_A()
{
	AI_Output(hero, self, "Info_Mod_Gildo_Unkraut_A_15_00"); //Na gut ...
	AI_Output(self, hero, "Info_Mod_Gildo_Unkraut_A_07_01"); //Dann fang am besten gleich an.

	Info_ClearChoices	(Info_Mod_Gildo_Unkraut);

	Mod_Gildo_Unkraut = 1;

	Log_CreateTopic	(TOPIC_MOD_GILDO_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GILDO_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GILDO_UNKRAUT, "Gildo hat mir aufgetragen die Felder auf Lobarts Hof von Unkraut zu befreien.");

	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_01");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_02");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_03");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_04");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_05");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_06");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_07");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_08");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_09");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_10");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_11");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_12");
	Wld_InsertItem	(ItPl_Unkraut_Gildo, "FP_ITEM_RUEBE_LOBART_13");
};

INSTANCE Info_Mod_Gildo_Unkraut2 (C_INFO)
{
	npc		= Mod_545_NONE_Gildo_NW;
	nr		= 1;
	condition	= Info_Mod_Gildo_Unkraut2_Condition;
	information	= Info_Mod_Gildo_Unkraut2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Felder sind sauber.";
};

FUNC INT Info_Mod_Gildo_Unkraut2_Condition()
{
	if (Mod_Gildo_Unkraut == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gildo_Unkraut2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gildo_Unkraut2_15_00"); //Die Felder sind sauber.
	AI_Output(self, hero, "Info_Mod_Gildo_Unkraut2_07_01"); //Gut gemacht. Dafür bekommst du auch einen Batzen Geld. Viel Spaß damit.

	B_GiveInvItems	(self, hero, ItMi_Gold, 20);

	B_SetTopicStatus	(TOPIC_MOD_GILDO_UNKRAUT, LOG_SUCCESS);

	B_GivePlayerXP	(50);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Gildo_Trade (C_INFO)
{
	npc		= Mod_545_NONE_Gildo_NW;
	nr		= 1;
	condition	= Info_Mod_Gildo_Trade_Condition;
	information	= Info_Mod_Gildo_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gildo_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gildo_Unkraut2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gildo_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gildo_Pickpocket (C_INFO)
{
	npc		= Mod_545_NONE_Gildo_NW;
	nr		= 1;
	condition	= Info_Mod_Gildo_Pickpocket_Condition;
	information	= Info_Mod_Gildo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Gildo_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Gildo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gildo_Pickpocket);

	Info_AddChoice	(Info_Mod_Gildo_Pickpocket, DIALOG_BACK, Info_Mod_Gildo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gildo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gildo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gildo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gildo_Pickpocket);
};

FUNC VOID Info_Mod_Gildo_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gildo_Pickpocket);
};

INSTANCE Info_Mod_Gildo_EXIT (C_INFO)
{
	npc		= Mod_545_NONE_Gildo_NW;
	nr		= 1;
	condition	= Info_Mod_Gildo_EXIT_Condition;
	information	= Info_Mod_Gildo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gildo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gildo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};