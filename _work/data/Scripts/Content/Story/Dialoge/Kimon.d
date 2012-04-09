INSTANCE Info_Mod_Kimon_Hi (C_INFO)
{
	npc		= Mod_1932_FH_Kimon_NW;
	nr		= 1;
	condition	= Info_Mod_Kimon_Hi_Condition;
	information	= Info_Mod_Kimon_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du ein Problem?";
};

FUNC INT Info_Mod_Kimon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_Hi_15_00"); //Hast du ein Problem?
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_04_01"); //Keines, bei dem du mir helfen könntest ...
	AI_Output(hero, self, "Info_Mod_Kimon_Hi_15_02"); //Sag es mir einfach.
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_04_03"); //Na gut. Ich habe den Feuermagiern teure Weintrauben vom Berg Archolos aus Myrtana verkauft und sollte mir meinen Lohn von 2000 Gold von dem Magier Serpentes abholen.
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_04_04"); //Der Schweinehund hat mir aber nur 1000 Gold gegeben!
	AI_Output(hero, self, "Info_Mod_Kimon_Hi_15_05"); //Geh doch zu Lord Andre.
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_04_06"); //(ironisch) Klar, ich zeige einen der höchsten Diener Innos' wegen Betrugs an ...Das würde mich mehr Gold kosten, als es mir bringt.

	Info_ClearChoices	(Info_Mod_Kimon_Hi);

	Info_AddChoice	(Info_Mod_Kimon_Hi, "Dann kann ich dir auch nicht helfen.", Info_Mod_Kimon_Hi_Nein);
	Info_AddChoice	(Info_Mod_Kimon_Hi, "Ich schau, wie ich das regeln kann.", Info_Mod_Kimon_Hi_Ja);
};

FUNC VOID Info_Mod_Kimon_Hi_Nein()
{
	AI_Output(hero, self, "Info_Mod_Kimon_Hi_Nein_15_00"); //Dann kann ich dir auch nicht helfen.
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_Nein_04_01"); //Schon gut.

	Info_ClearChoices	(Info_Mod_Kimon_Hi);
};

FUNC VOID Info_Mod_Kimon_Hi_Ja()
{
	AI_Output(hero, self, "Info_Mod_Kimon_Hi_Ja_15_00"); //Ich schau, wie ich das regeln kann.
	AI_Output(self, hero, "Info_Mod_Kimon_Hi_Ja_04_01"); //Ah, danke, auch wenn ich nicht glaube, dass das viel Sinn hat.

	Log_CreateTopic	(TOPIC_MOD_KIMONSTRAUBEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KIMONSTRAUBEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KIMONSTRAUBEN, "Der Händler Kimon hat im Kloster Weintrauben aus Myrtana verkauft, jedoch zu wenig Gold dafür bekommen. Ich hab mich bereit erklärt, die Sache für ihn zu regeln.");

	Mod_Kimons_Traubenquest = TRUE;

	Info_ClearChoices	(Info_Mod_Kimon_Hi);
};

INSTANCE Info_Mod_Kimon_Beleg (C_INFO)
{
	npc		= Mod_1932_FH_Kimon_NW;
	nr		= 1;
	condition	= Info_Mod_Kimon_Beleg_Condition;
	information	= Info_Mod_Kimon_Beleg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du einen Beweis für den Betrug von Serpentes.";
};

FUNC INT Info_Mod_Kimon_Beleg_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_Beleg_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_Beleg_15_00"); //Hast du einen Beweis für den Betrug von Serpentes.
	AI_Output(self, hero, "Info_Mod_Kimon_Beleg_04_01"); //Sicherlich, hier.

	CreateInvItems	(self, ItWr_KimonsBeleg, 1);
	B_GiveInvItems	(self, hero, ItWr_KimonsBeleg, 1);

	B_LogEntry	(TOPIC_MOD_KIMONSTRAUBEN, "Kimon hat mir einen Beweis für die Schuld Serpentes' gegeben. Ich sollte diesen jetzt zu Pyrokar bringen.");
};

INSTANCE Info_Mod_Kimon_HierIstDeinGold (C_INFO)
{
	npc		= Mod_1932_FH_Kimon_NW;
	nr		= 1;
	condition	= Info_Mod_Kimon_HierIstDeinGold_Condition;
	information	= Info_Mod_Kimon_HierIstDeinGold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du dein Gold.";
};

FUNC INT Info_Mod_Kimon_HierIstDeinGold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serpentes_Kimon))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	&& (Mod_Kimons_Traubenquest == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_HierIstDeinGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_HierIstDeinGold_15_00"); //Hier hast du dein Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1000);

	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_01"); //Vielen Dank. Jetzt kann ich meine Runde wieder aufnehmen.
	AI_Output(hero, self, "Info_Mod_Kimon_HierIstDeinGold_15_02"); //Wo rundest du denn?
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_03"); //Ich verkehre normalerweise zwischen der Stadt und Relendel.
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_04"); //Ab und zu habe ich auch mal nen Abstecher ins Minental gemacht. Aber das ist mir zu gefährlich geworden.
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_05"); //Zu viel Viehzeugs und Wegelagerer unterwegs.
	AI_Output(hero, self, "Info_Mod_Kimon_HierIstDeinGold_15_06"); //Aha. Mit was handelst du eigentlich?
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_07"); //Im Moment mit gar nichts. Ich muss erst zukaufen. Am besten verkaufen sich Raritäten wie diese Weintrauben. Sind allerdings nicht billig im Einkauf.
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_08"); //Aber genug Gold habe ich ja jetzt wieder.
	AI_Output(hero, self, "Info_Mod_Kimon_HierIstDeinGold_15_09"); //Dann viel Erfolg. Vielleicht sehen wir uns mal wieder.
	AI_Output(self, hero, "Info_Mod_Kimon_HierIstDeinGold_04_10"); //Kann sein. Danke noch mal.

	B_LogEntry	(TOPIC_MOD_KIMONSTRAUBEN, "Ich habe Kimon sein Gold gegeben. Er wird jetzt zu den anderen gehen.");
	B_SetTopicStatus	(TOPIC_MOD_KIMONSTRAUBEN, LOG_SUCCESS);

	B_StartOtherRoutine	(self, "WEG");

	B_GivePlayerXP	(250);

	B_Göttergefallen (1, 1);

	Mod_Kimons_Traubenquest = 2;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Kimon_Pickpocket (C_INFO)
{
	npc		= Mod_1932_FH_Kimon_NW;
	nr		= 1;
	condition	= Info_Mod_Kimon_Pickpocket_Condition;
	information	= Info_Mod_Kimon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Kimon_Pickpocket_Condition()
{
	C_Beklauen	(98, ItMi_Gold, 2300);
};

FUNC VOID Info_Mod_Kimon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kimon_Pickpocket);

	Info_AddChoice	(Info_Mod_Kimon_Pickpocket, DIALOG_BACK, Info_Mod_Kimon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kimon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kimon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kimon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kimon_Pickpocket);
};

FUNC VOID Info_Mod_Kimon_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kimon_Pickpocket);
};

INSTANCE Info_Mod_Kimon_EXIT (C_INFO)
{
	npc		= Mod_1932_FH_Kimon_NW;
	nr		= 1;
	condition	= Info_Mod_Kimon_EXIT_Condition;
	information	= Info_Mod_Kimon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kimon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};