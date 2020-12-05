INSTANCE Info_Mod_Gaertner_Hi (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Hi_Condition;
	information	= Info_Mod_Gaertner_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Gaertner_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_01"); //I'm the gardener here. My job is to take care of the plant in the upper quarter.
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_02"); //I can sell you some of these, too.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "The gardener upstairs can sell me some plants.");
};

INSTANCE Info_Mod_Gaertner_Dieb (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Dieb_Condition;
	information	= Info_Mod_Gaertner_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "How's your work?";
};

FUNC INT Info_Mod_Gaertner_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_AndreFertig))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_00"); //How's work?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_01"); //Too much weed, but otherwise I can't complain.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_02"); //And what did you take today?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_03"); //Oh...
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_04"); //You scared the shit out of me. I'm not always up to date, but you're just in time.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_05"); //What's to be done?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_06"); //Salandril has some valuable potions. Bring me one, but you have to be careful, he doesn't trust anyone and is always vigilant.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_07"); //I'll try not to.
	
	Log_CreateTopic	(TOPIC_MOD_DIEB_SALANDRIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_SALANDRIL, "The gardener wants me to steal one of Salandril's precious potions.");
};

INSTANCE Info_Mod_Gaertner_HierTrank (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_HierTrank_Condition;
	information	= Info_Mod_Gaertner_HierTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your precious potion.";
};

FUNC INT Info_Mod_Gaertner_HierTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Dieb))
	&& (Npc_HasItems(hero, ItPo_Perm_DEX_Salandril) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_HierTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_HierTrank_15_00"); //Here's your precious potion.

	B_GiveInvItems	(hero, self, ItPo_Perm_DEX_Salandril, 1);
	Npc_RemoveInvItems	(self, ItPo_Perm_DEX_Salandril, 1);
	CreateInvItems	(self, ItPo_Perm_DEX, 1);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_01"); //I can't believe you're a natural. Here's a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_02"); //If you want, I'll sell it to you.
	
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Gaertner_Trade (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Trade_Condition;
	information	= Info_Mod_Gaertner_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gaertner_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gaertner_Pickpocket (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Pickpocket_Condition;
	information	= Info_Mod_Gaertner_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Gaertner_Pickpocket_Condition()
{
	C_Beklauen	(16, ItPl_Temp_Herb, 2);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_BACK, Info_Mod_Gaertner_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gaertner_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gaertner_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gaertner_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gaertner_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gaertner_EXIT (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_EXIT_Condition;
	information	= Info_Mod_Gaertner_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gaertner_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
