INSTANCE Info_Mod_Kimon_REL_Hi (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Hi_Condition;
	information	= Info_Mod_Kimon_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_00"); //So sieht man sich wieder. Auch unterwegs?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_01"); //Du sagst es. Hab immer was zu tun.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_02"); //Ich auch. Meine Geschäfte laufen wieder prächtig. Nur ...
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_03"); //Nur?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_04"); //Da ist ein wichtiger Kunde, der interessiert sich für Freudenspender. Das ist bestens bekannt in Khorata.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_05"); //Ich habe auch gute Beziehung dort, aber es gelingt mir nicht, da einen Lieferanten aufzutreiben.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_06"); //Da haben offensichtlich der Richter und der Stadthalter die Hand drauf.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_07"); //Und wer stellt das Zeug her?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_08"); //Das sollen die Leute im Hofstaat sein. Aber der Zugang zu denen ist mit einer magischen Barriere verrammelt. Da kommt keiner durch.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_09"); //Hab's selbst probiert, aber die hat mich jedes Mal zum Umkehren gezwungen, ob ich wollte oder nicht.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_10"); //Seltsam. Und warum erzählst du mir das?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_11"); //Du bist doch ein schlauer Bursche. Vielleicht kannst du ja einen Lieferanten ausmachen, wenn du schon mal in Khorata bist.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_04_12"); //Es soll dein Schaden nicht sein. So drei Portionen sollten es schon sein ...
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich höre mich bei Gelegenheit mal um.";
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender_15_00"); //Ich höre mich bei Gelegenheit mal um.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender_04_01"); //Solltest du etwas finden, dann komm wieder zu mir.

	Log_CreateTopic	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KIMON_FREUDENSPENDER, "Der Händler Kimon will drei Mal Freudenspender weiterverkaufen. Ich soll in Khorata einen Lieferanten finden. Ich glaube, der Penner ist die richtige Adresse.");
};

INSTANCE Info_Mod_Kimon_REL_Freudenspender2 (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Freudenspender2_Condition;
	information	= Info_Mod_Kimon_REL_Freudenspender2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kimon_REL_Freudenspender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_PennerVater_Kimon2))
	&& (Npc_HasItems(hero, ItMi_Freudenspender) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Freudenspender2_Info()
{
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_04_00"); //Hast du was erreicht?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_01"); //Aber ja. Nicht nur den Lieferant, sondern gleich die Ware. Hier.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 3);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_04_02"); //Phantastisch! Hattest du Auslagen?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_03"); //Ja, ungefähr 350 Gold.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_04_04"); //Hier, hast du zurück und noch mal 350 für deine Mühe.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_05"); //Bis ein andermal.

	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_RUNNING);

	CurrentNQ += 1;

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Kimon_REL_HabPakete (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_HabPakete_Condition;
	information	= Info_Mod_Kimon_REL_HabPakete_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle Pakete erhalten können.";
};

FUNC INT Info_Mod_Kimon_REL_HabPakete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_Freudenspender))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_HabPakete_Info()
{
	AI_Output(hero, self, "Info_Mod_Kimon_REL_HabPakete_15_00"); //Ich habe alle Pakete erhalten können.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_HabPakete_04_01"); //(ungläubig) Du verarscht mich!
	AI_Output(hero, self, "Info_Mod_Kimon_REL_HabPakete_15_02"); //Nein, hier sind sie.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 3);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_HabPakete_04_04"); //Das sind tatsächlich alle, wie hast du das nur gemacht?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_HabPakete_15_05"); //Reine Intuition, würde ich sagen.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_HabPakete_04_06"); //Ich kann dir nicht genug danken. Hier, nimm dieses Gold als Zeichen meiner Dankbarkeit.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_HabPakete_04_08"); //Außerdem bekommst du meine Stimme.

	B_LogEntry	(TOPIC_MOD_KIMON_FREUDENSPENDER, "Ich habe Kimon_REL alle Pakte gebracht und er war sehr zufrieden mit meiner Leistung. Anscheinend hat er damit nicht gerechnet. Nunja, mir soll's recht sein, denn ich bin nun eine Stimme und 500 Goldmünzen reicher.");
	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_SUCCESS);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Kimon_REL_Trade (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Trade_Condition;
	information	= Info_Mod_Kimon_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kimon_REL_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kimon_REL_HabPakete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kimon_REL_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kimon_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_Pickpocket_Condition;
	information	= Info_Mod_Kimon_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Kimon_REL_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_BACK, Info_Mod_Kimon_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kimon_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kimon_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

FUNC VOID Info_Mod_Kimon_REL_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Kimon_REL_Pickpocket);
};

INSTANCE Info_Mod_Kimon_REL_EXIT (C_INFO)
{
	npc		= Mod_7771_FH_Kimon_REL;
	nr		= 1;
	condition	= Info_Mod_Kimon_REL_EXIT_Condition;
	information	= Info_Mod_Kimon_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kimon_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kimon_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};