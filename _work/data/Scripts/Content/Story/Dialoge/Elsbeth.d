INSTANCE Info_Mod_Elsbeth_Hi (C_INFO)
{
	npc		= Mod_7524_JG_Elsbeth_JL;
	nr		= 1;
	condition	= Info_Mod_Elsbeth_Hi_Condition;
	information	= Info_Mod_Elsbeth_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Eine Frau in dieser Wildnis! Wie kommt's?";
};

FUNC INT Info_Mod_Elsbeth_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elsbeth_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Elsbeth_Hi_15_00"); //Eine Frau in dieser Wildnis! Wie kommt's?
	AI_Output(self, hero, "Info_Mod_Elsbeth_Hi_17_01"); //Ich komme vom Alten Lager. Ich wollte nicht so, wie der Baron wollte.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Hi_15_02"); //Und dann hat er dich vor die Tür gesetzt.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Hi_17_03"); //Gewissermaßen. Bin bei den Pennern draußen neben dem Tor gelandet.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Hi_17_04"); //Irgendwann kam dann dieser Baldur vorbei und hat mich hierher mitgenommen.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Hi_15_05"); //Bist du froh darüber?
	AI_Output(self, hero, "Info_Mod_Elsbeth_Hi_17_06"); //Und ob. Hier wird man als Frau repektiert, obwohl das ruppige Kerle sind.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Hi_15_07"); //Das ist gut. Bis dann.
};

INSTANCE Info_Mod_Elsbeth_Ambi (C_INFO)
{
	npc		= Mod_7524_JG_Elsbeth_JL;
	nr		= 1;
	condition	= Info_Mod_Elsbeth_Ambi_Condition;
	information	= Info_Mod_Elsbeth_Ambi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Elsbeth_Ambi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elsbeth_Hi))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elsbeth_Ambi_Info()
{
	AI_Output(self, hero, "Info_Mod_Elsbeth_Ambi_17_00"); //Ich sehe, du bist dauernd auf Achse.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Ambi_15_01"); //Ich bin ziemlich neu hier und muss mich noch bewähren. Und die Rennerei bin ich mittlerweile gewöhnt.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Ambi_17_02"); //Und doch bist du immer freundlich, wie mir scheint.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Ambi_15_03"); //Na ja. Ich kann auch anders.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Ambi_17_04"); //Ich finde dich jedenfalls sympatisch. Du darfst mich Beth nennen.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Ambi_15_05"); //Das freut mich, Beth. Vielleicht kann ich dir auch einen Gefallen tun?
	AI_Output(self, hero, "Info_Mod_Elsbeth_Ambi_17_06"); //Das kannst du. Mir geht das Holz für den Herd aus.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Ambi_17_07"); //Neue Äste könnte ich gebrauchen. So ein Dutzend sollten reichen.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Ambi_15_08"); //Ich bring dir welche. Bis später.

	Log_CreateTopic	(TOPIC_MOD_ELSBETH_HOLZ, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ELSBETH_HOLZ, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ELSBETH_HOLZ, "Elsbeth braucht Äste für ihren Küchenofen. Ich soll so zwölf Stück besorgen.");
};

INSTANCE Info_Mod_Elsbeth_Holz (C_INFO)
{
	npc		= Mod_7524_JG_Elsbeth_JL;
	nr		= 1;
	condition	= Info_Mod_Elsbeth_Holz_Condition;
	information	= Info_Mod_Elsbeth_Holz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier dein Holz.";
};

FUNC INT Info_Mod_Elsbeth_Holz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Elsbeth_Ambi))
	&& (Npc_HasItems(hero, ItMi_Ast) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Elsbeth_Holz_Info()
{
	AI_Output(hero, self, "Info_Mod_Elsbeth_Holz_15_00"); //Ich hab hier dein Holz.

	B_GiveInvItems	(hero, self, ItMi_Ast, 12);

	AI_Output(self, hero, "Info_Mod_Elsbeth_Holz_17_01"); //Das ist lieb. Danke schön.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Holz_15_02"); //Gern geschehen, aber ich muss jetzt weiter.
	AI_Output(self, hero, "Info_Mod_Elsbeth_Holz_17_03"); //Dann wünsche ich dir Erfolg bei deinen Aufgaben.
	AI_Output(hero, self, "Info_Mod_Elsbeth_Holz_15_04"); //Das kann ich immer brauchen. Danke.

	B_SetTopicStatus	(TOPIC_MOD_ELSBETH_HOLZ, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Elsbeth_Pickpocket (C_INFO)
{
	npc		= Mod_7524_JG_Elsbeth_JL;
	nr		= 1;
	condition	= Info_Mod_Elsbeth_Pickpocket_Condition;
	information	= Info_Mod_Elsbeth_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Elsbeth_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Elsbeth_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Elsbeth_Pickpocket);

	Info_AddChoice	(Info_Mod_Elsbeth_Pickpocket, DIALOG_BACK, Info_Mod_Elsbeth_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Elsbeth_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Elsbeth_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Elsbeth_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Elsbeth_Pickpocket);
};

FUNC VOID Info_Mod_Elsbeth_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Elsbeth_Pickpocket);
};

INSTANCE Info_Mod_Elsbeth_EXIT (C_INFO)
{
	npc		= Mod_7524_JG_Elsbeth_JL;
	nr		= 1;
	condition	= Info_Mod_Elsbeth_EXIT_Condition;
	information	= Info_Mod_Elsbeth_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Elsbeth_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Elsbeth_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};