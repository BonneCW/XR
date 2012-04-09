INSTANCE Info_Mod_Ulthar_Daemonisch (C_INFO)
{
	npc		= Mod_553_KDF_Ulthar_NW;
	nr		= 1;
	condition	= Info_Mod_Ulthar_Daemonisch_Condition;
	information	= Info_Mod_Ulthar_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ulthar_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulthar_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_00"); //Hallo mein Sohn. Du wirkst, als würdest du etwas suchen. Kann ich dir helfen?
	AI_Output(hero, self, "Info_Mod_Ulthar_Daemonisch_15_01"); //Ich hörte es gab einen Todesfall. Kurz bevor der unglückliche Novize starb, soll er in der Kirche gewesen sein.
	AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_02"); //Ja, der Verlust ist schrecklich und unerwartet. Zum Glück hat er zuvor noch dem mittäglichen Gottesdienst beigewohnt und starb somit mit Innos Segen.
	AI_Output(hero, self, "Info_Mod_Ulthar_Daemonisch_15_03"); //Und wie sieht ein solcher Gottesdienst aus?
	AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_04"); //Hmm, es scheint nicht allzu weit her mit deinem Glauben zu sein, wenn du diese Frage an mich richtest.
	AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_05"); //In aller Kürze: man betet, nimmt den Segen eines hohen Feuermagiers entgegen und trinkt zuletzt etwas Klosterwein, aus einem gesegneten Kelch.
	AI_Output(hero, self, "Info_Mod_Ulthar_Daemonisch_15_06"); //Aha, Klosterwein ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Der Novize Dyrian hatte kurz vor seinem Tot noch dem Gottesdienst beigewohnt. Darin wurde gebetet, der Segen eines Feuermagiers gespendet und etwas Klosterwein aus einem gesegneten Kelch genossen.");

	if (hero.guild == GIL_VLK)
	{
		AI_Output(hero, self, "Info_Mod_Ulthar_Daemonisch_15_07"); //Woraus besteht Klosterwein?
		AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_08"); //Also, man nehme fünf Flaschen ganz gewöhnlichen Wein, gehe damit zu einem Schrein Innos, weihe sie und verteile einen Trank zur Heilung von Besessenheit auf sie. Das war es auch schon.

		B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Für den Klosterwein nimmt man fünf normale Flaschen Wein, verteilt an einem Innosschrein eine Flasche Heilung der Besessenheit auf diese und segnet sie.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Ulthar_Daemonisch_15_09"); //Woraus besteht ...?
		AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_10"); //(unterbricht) Du erwartest nicht wirklich, dass ich dieses heilige Wissen mit dir teile.
		AI_Output(self, hero, "Info_Mod_Ulthar_Daemonisch_05_11"); //Nur Diener des Feuers besitzen Kenntnis über die Rezeptur und kein Magier in diesem Kloster wird es an dich weitergeben.

		B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Ulthar wollte mir die Ingredienzien des Klosterweines nicht preisgeben. Ob ich es von einem anderen Feuermagier erfahren kann?");
	};
};

INSTANCE Info_Mod_Ulthar_Pickpocket (C_INFO)
{
	npc		= Mod_553_KDF_Ulthar_NW;
	nr		= 1;
	condition	= Info_Mod_Ulthar_Pickpocket_Condition;
	information	= Info_Mod_Ulthar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Ulthar_Pickpocket_Condition()
{
	C_Beklauen	(109, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Ulthar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ulthar_Pickpocket);

	Info_AddChoice	(Info_Mod_Ulthar_Pickpocket, DIALOG_BACK, Info_Mod_Ulthar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ulthar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ulthar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ulthar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ulthar_Pickpocket);
};

FUNC VOID Info_Mod_Ulthar_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ulthar_Pickpocket);
};

INSTANCE Info_Mod_Ulthar_EXIT (C_INFO)
{
	npc		= Mod_553_KDF_Ulthar_NW;
	nr		= 1;
	condition	= Info_Mod_Ulthar_EXIT_Condition;
	information	= Info_Mod_Ulthar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ulthar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};