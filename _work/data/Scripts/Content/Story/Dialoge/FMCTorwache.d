INSTANCE Info_Mod_FMCTorwache_Hi (C_INFO)
{
	npc		= Mod_1579_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_FMCTorwache_Hi_Condition;
	information	= Info_Mod_FMCTorwache_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_FMCTorwache_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FMCTorwache_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_FMCTorwache_Hi_11_00"); //Halt! Niemand darf ohne Genehmigung die Mine betreten.
};

INSTANCE Info_Mod_FMCTorwache_Erzkiste (C_INFO)
{
	npc		= Mod_1579_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_FMCTorwache_Erzkiste_Condition;
	information	= Info_Mod_FMCTorwache_Erzkiste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll eine Kiste Erz für Thofeistos holen ...";
};

FUNC INT Info_Mod_FMCTorwache_Erzkiste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FMCTorwache_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Orksoeldner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FMCTorwache_Erzkiste_Info()
{
	AI_Output(hero, self, "Info_Mod_FMCTorwache_Erzkiste_15_00"); //Ich soll eine Kiste Erz für Thofeistos holen ...
	AI_Output(self, hero, "Info_Mod_FMCTorwache_Erzkiste_11_01"); //Ah ja, Endolf hat sie bereits herbringen lassen. Hier hast du sie.

	B_GiveInvItems	(self, hero, ItMi_Erzkiste, 1);

	AI_Output(hero, self, "Info_Mod_FMCTorwache_Erzkiste_15_02"); //(überrascht) Wie jetzt, einfach so?
	AI_Output(self, hero, "Info_Mod_FMCTorwache_Erzkiste_11_03"); //(verwundert) Ähh, ja.
	AI_Output(hero, self, "Info_Mod_FMCTorwache_Erzkiste_15_04"); //Hmm, ok.

	B_LogEntry	(TOPIC_MOD_NL_ERZKISTE, "Na das war ja simpel. Ich habe die Kiste und muss nur wieder zu Thofeistos.");
};

INSTANCE Info_Mod_FMCTorwache_Crawlerplage (C_INFO)
{
	npc		= Mod_1579_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_FMCTorwache_Crawlerplage_Condition;
	information	= Info_Mod_FMCTorwache_Crawlerplage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_FMCTorwache_Crawlerplage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FMCTorwache_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_FreieMine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_FMCTorwache_Crawlerplage_Info()
{
	AI_Output(self, hero, "Info_Mod_FMCTorwache_Crawlerplage_11_00"); //Ahh, der Kammerjäger kommt. Wird auch langsam Zeit. Da unten ist die Hölle los.

	Wld_SendTrigger	("FREEMINEGATE");
};

INSTANCE Info_Mod_FMCTorwache_Pickpocket (C_INFO)
{
	npc		= Mod_1579_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_FMCTorwache_Pickpocket_Condition;
	information	= Info_Mod_FMCTorwache_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_FMCTorwache_Pickpocket_Condition()
{
	C_Beklauen	(94, ItMi_Nugget, 3);
};

FUNC VOID Info_Mod_FMCTorwache_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_FMCTorwache_Pickpocket);

	Info_AddChoice	(Info_Mod_FMCTorwache_Pickpocket, DIALOG_BACK, Info_Mod_FMCTorwache_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_FMCTorwache_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_FMCTorwache_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_FMCTorwache_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_FMCTorwache_Pickpocket);
};

FUNC VOID Info_Mod_FMCTorwache_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_FMCTorwache_Pickpocket);
};

INSTANCE Info_Mod_FMCTorwache_EXIT (C_INFO)
{
	npc		= Mod_1579_SLD_Soeldner_MT;
	nr		= 1;
	condition	= Info_Mod_FMCTorwache_EXIT_Condition;
	information	= Info_Mod_FMCTorwache_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_FMCTorwache_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_FMCTorwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};