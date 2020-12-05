INSTANCE Info_Mod_Miguel_Hi (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Hi_Condition;
	information	= Info_Mod_Miguel_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Hi))
	|| (Npc_KnowsInfo(hero, Info_Mod_Sancho_Dam3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_00"); //Hey, a new guy in the warehouse. Do you need anything?
	AI_Output(hero, self, "Info_Mod_Miguel_Hi_15_01"); //Hello. Need something? What do you have to offer?
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_02"); //Well, as a camp chemist, I have some potions in stock.
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_03"); //I also manage the excess stolen goods we can't get rid of right now.
	AI_Output(self, hero, "Info_Mod_Miguel_Hi_11_04"); //So you can find some interesting trade goods with me... and much cheaper than the usurers who call themselves traders.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BANDITEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BANDITEN, "Miguel seems to be dealing in potions.");

	Npc_SetRefuseTalk	(self, 240);
};

INSTANCE Info_Mod_Miguel_Aufgabe (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe_Condition;
	information	= Info_Mod_Miguel_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Hi))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_00"); //Hey, you're out on the road a lot. You could help me with one thing.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_01"); //Yeah, what's it about?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_02"); //A customer of mine wants a brew, a very special one. Unfortunately I miss some ingredients....
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_03"); //What should I get you?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_04"); //For one thing, I'd need three toadstools. With any luck, you should find her in the woods below camp.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_05"); //What else what?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_06"); //And then there's the mucilaginous secretion that the skin releases from young Lurkers.
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe_15_07"); //How?
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_08"); //Yes, in case of danger, their skin will secrete poison.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_09"); //You have to scrape this off after you've killed her.... oh, just bring me the whole hides right away.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_10"); //This can still be removed easily with a razor in young animals.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe_11_11"); //At this time of the year you should certainly find enough young Lurkers down by the river. Two skins should be enough. Good luck to you.
	
	Log_CreateTopic	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, "Miguel requires three fly agaric mushrooms and two skins of young Lurker for a brew, which have secreted their poisonous mucus. I will find the things in the forest and by the river below the camp. Hmm, what evil plans does someone have with such a potion...");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_RIVER_LURKER_02");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_RIVER_LURKER_02");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_C4");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_C4");

	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_07_02");
	Wld_InsertNpc	(Lurker_Young,	"FP_ROAM_OW_BLOODFLY_07_02");
};

INSTANCE Info_Mod_Miguel_Aufgabe2 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe2_Condition;
	information	= Info_Mod_Miguel_Aufgabe2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have the mushrooms and the mucus.";
};

FUNC INT Info_Mod_Miguel_Aufgabe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Aufgabe))
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 3)
	&& (Npc_HasItems(hero, ItAt_LurkerSkin_Young) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe2_Info()
{
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe2_15_00"); //Ich habe die Pilze und den Schleim.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe2_11_01"); //Ausgezeichnet. Dann mache ich mich mal daran ihn zu brauen. In einigen Stunden sollte ich damit fertig sein.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe2_11_02"); //Falls du Zeit hast kannst du dem Kunden gleich das Gebräu bringen. 
	
	Npc_SetRefuseTalk	(self, 240);

	B_GivePlayerXP	(400);
	
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 3);
	Npc_RemoveInvItems	(hero, ItAt_LurkerSkin_Young, 2);
	
	B_ShowGivenThings("3 toadstools and 2 skins of young Lurker given");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRAUEN");
};

INSTANCE Info_Mod_Miguel_Aufgabe3 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe3_Condition;
	information	= Info_Mod_Miguel_Aufgabe3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Miguel_Aufgabe3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Aufgabe2))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe3_Info()
{
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe3_11_00"); //All right, I'm done with the poison mixture. Here's the brew.

	B_GiveInvItems	(self, hero, ItPo_MiguelForDar, 1);

	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe3_11_01"); //The customer waits in the new warehouse and is called Dar.
	
	B_LogEntry	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, "Miguel wants me to bring the customer his brew. He waits in the new warehouse and is called Dar. Well, I'm not at all happy about that...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BRAUEN");
};

INSTANCE Info_Mod_Miguel_Aufgabe4 (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Aufgabe4_Condition;
	information	= Info_Mod_Miguel_Aufgabe4_Info;
	permanent	= 0;
	important	= 0;
	description	= "I gave Dar the potion...";
};

FUNC INT Info_Mod_Miguel_Aufgabe4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dar_Miguel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Aufgabe4_Info()
{
	AI_Output(hero, self, "Info_Mod_Miguel_Aufgabe4_15_00"); //I gave Dar the potion... And he actually has...
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_01"); //... Yeah, he must have a good time.
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_02"); //Such a beautiful hallucinogenic mixture of toxins makes every resinous stem appear pale against it....
	AI_Output(self, hero, "Info_Mod_Miguel_Aufgabe4_11_03"); //Good job, by the way. Here's your share.

	B_ShowGivenThings	("100 gold and 12 ore obtained");

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItMi_Nugget, 12);

	B_GivePlayerXP	(400);
	
	B_SetTopicStatus	(TOPIC_MOD_BDT_FLIEGENPILZLURKERSCHLEIM, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Miguel_Trade (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Trade_Condition;
	information	= Info_Mod_Miguel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Miguel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Miguel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Miguel_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Miguel_Pickpocket (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_Pickpocket_Condition;
	information	= Info_Mod_Miguel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Miguel_Pickpocket_Condition()
{
	C_Beklauen	(46, ItPo_Perm_Dex, 1);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

	Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_BACK, Info_Mod_Miguel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Miguel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Miguel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Miguel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Miguel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Miguel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Miguel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Miguel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Miguel_EXIT (C_INFO)
{
	npc		= Mod_958_BDT_Miguel_MT;
	nr		= 1;
	condition	= Info_Mod_Miguel_EXIT_Condition;
	information	= Info_Mod_Miguel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Miguel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
