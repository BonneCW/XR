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

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
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