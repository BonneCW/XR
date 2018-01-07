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
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_00"); //So sieht man sich wieder. Auch unterwegs?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_01"); //Du sagst es. Hab immer was zu tun.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_02"); //Ich auch. Meine Geschäfte laufen wieder prächtig. Nur ...
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_03"); //Nur?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_04"); //Da ist ein wichtiger Kunde, der interessiert sich für Freudenspender. Das ist bestens bekannt in Khorata.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_05"); //Ich habe auch gute Beziehungen dort, aber es gelingt mir nicht, da einen Lieferanten aufzutreiben.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_06"); //Da haben offensichtlich der Richter und der Stadthalter die Hand drauf.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_07"); //Und wer stellt das Zeug her?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_08"); //Das sollen die Leute im Hofstaat sein. Aber der Zugang zu denen ist mit einer magischen Barriere verrammelt. Da kommt keiner durch.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_09"); //Hab's selbst probiert, aber die hat mich jedes Mal zum Umkehren gezwungen, ob ich wollte oder nicht.
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Hi_15_10"); //Seltsam. Und warum erzählst du mir das?
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_11"); //Du bist da doch erfolgreicher als ich. Vielleicht kannst du ja einen Lieferanten ausmachen, wenn du schon mal in Khorata bist.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Hi_34_12"); //Es soll dein Schaden nicht sein. So drei Portionen würden mir schon genügen ...
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
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender_34_01"); //Solltest du etwas finden, dann komm wieder zu mir.

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
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_00"); //Hast du was erreicht?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_01"); //Aber ja. Nicht nur den Lieferanten, sondern gleich die Ware. Hier.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 3);

	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_02"); //Fantastisch! Hattest du Auslagen?
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_03"); //Ja, ungefähr 350 Gold.
	AI_Output(self, hero, "Info_Mod_Kimon_REL_Freudenspender2_34_04"); //Hier hast du's zurück und noch mal 350 für deine Mühe.
	
	B_GiveInvItems (self, hero, ItMi_Gold, 700);
	
	AI_Output(hero, self, "Info_Mod_Kimon_REL_Freudenspender2_15_05"); //Bis ein andermal.

	B_SetTopicStatus	(TOPIC_MOD_KIMON_FREUDENSPENDER, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(150);
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
	return 1;
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
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kimon_REL_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Gold, 24);
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