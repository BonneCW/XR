INSTANCE Info_Mod_Daniel_Hi (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Hi_Condition;
	information	= Info_Mod_Daniel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "You're a dealer?";
};

FUNC INT Info_Mod_Daniel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daniel_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_15_00"); //You're a dealer?
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_08_01"); //That is correct. My offer includes all items that you can find useful as a magician.
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_08_02"); //Want to hear my special offer?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Daniel sells various items for magicians.");

	Info_ClearChoices	(Info_Mod_Daniel_Hi);

	Info_AddChoice	(Info_Mod_Daniel_Hi, "No, I just want to look at your merchandise.", Info_Mod_Daniel_Hi_B);
	Info_AddChoice	(Info_Mod_Daniel_Hi, "Yes, please.", Info_Mod_Daniel_Hi_A);
};

FUNC VOID Info_Mod_Daniel_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_B_15_00"); //No, I just want to look at your merchandise.

	Info_ClearChoices	(Info_Mod_Daniel_Hi);
};

FUNC VOID Info_Mod_Daniel_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_A_15_00"); //Yes, please.
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_A_08_01"); //I've received an excessive supply of ice rolls. Ice lance, ice arrow, ice block and ice wave can be bought at half price. Interested?

	Info_ClearChoices	(Info_Mod_Daniel_Hi);
};

INSTANCE Info_Mod_Daniel_Nagelnachschub (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Nagelnachschub_Condition;
	information	= Info_Mod_Daniel_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Do you have any nails, by any chance?";
};                       

FUNC INT Info_Mod_Daniel_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Nagelnachschub_15_00"); //Do you have any nails, by any chance?
	AI_Output(self, hero, "Info_Mod_Daniel_Nagelnachschub_08_01"); //I'm sorry, I can't help you with that.
	AI_Output(self, hero, "Info_Mod_Daniel_Nagelnachschub_08_02"); //But I'm sure my little.... coarse colleagues can help you. (triggers the nose)
};

INSTANCE Info_Mod_Daniel_BrokenRune (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune_Condition;
	information	= Info_Mod_Daniel_BrokenRune_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hi, I have a question.";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_HasItems(hero, ItMi_BrokenRune01) == 1)
	&& (Npc_HasItems(hero, ItMi_BrokenRune02) == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_00"); //Hi, I have a question.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_01"); //You want to buy something? I'll show you my goods.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_02"); //No, no, no. I'm actually looking for a magician. You got one in town.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_03"); //Well, there's Fuego, a fire magician. You'll find him in the Fire Magic House.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_04"); //Thanks, man. I'll have a look.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_05"); //Slowly. Then there's a water magician. A strange fellow.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_06"); //Lives somewhere in the slum. Where exactly, I don't know.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_07"); //Jo. Thank you again.

	Log_CreateTopic	(TOPIC_MOD_JG_RUNENZAUBER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_RUNENZAUBER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "There are two important magicians here in Khorata: Fuego the fire magician in the magician's house and a water magician in the slum.");
};

INSTANCE Info_Mod_Daniel_BrokenRune2 (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune2_Condition;
	information	= Info_Mod_Daniel_BrokenRune2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Good day. I see you have all kinds of magic to offer.";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_BrokenRune))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune2_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_00"); //Good day. I see you have all kinds of magic to offer.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_01"); //Was well. What can I get you? A potion? A part? Or an herb?
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_02"); //Nothing there. I'm looking for the Adanos figure the water magician sold you.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_03"); //Yeah, a rarely beautiful thing. Unfortunately, I don't have it anymore.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_04"); //And who did you sell it to?
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_05"); //Let me think about it.... Yes, the colleague who deals in rarities.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_06"); //And I don't think that everything he sells is real...
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_07"); //Thanks for the tip.

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Daniel sold the Adanos figure to the rarity dealer.");
};

INSTANCE Info_Mod_Daniel_BrokenRune3 (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune3_Condition;
	information	= Info_Mod_Daniel_BrokenRune3_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hm. Could you negotiate this thing for me?";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_BrokenRune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 150)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune3_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_00"); //Hm. Could you negotiate this thing for me?
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_01"); //Why. Do you think it'll be cheaper? I'm a trader, too.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_02"); //No, no, no. Just, I probably annoyed him a little bit earlier....
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_03"); //I can try. Plus 25 percent for me.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_04"); //It's okay, it's okay.

	AI_GotoWP	(self, "REL_CITY_102");
	AI_GotoWP	(self, "REL_CITY_347");

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_05"); //There. Here's the figure. It cost 100. That means 150 gold for me.

	B_GiveInvItems	(self, hero, ItMi_AdanosStatue, 1);

	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_06"); //But that's 50 percent.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_07"); //Yeah, and? Isn't it cheap enough? Besides, I've got a wife and seven--
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_08"); //... seven children. I know. Here's your gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 150);

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Dealer pack! That they always have to bargain. Seven kids! I haven't seen a single brat around here yet. At least now I have the Adanos figure. Gotta get back to the magician.");
};

INSTANCE Info_Mod_Daniel_Kissen (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Kissen_Condition;
	information	= Info_Mod_Daniel_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "I'm looking for a fragrant softener.";
};                       

FUNC INT Info_Mod_Daniel_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_00"); //I'm looking for a fragrant softener.
	AI_Output(self, hero, "Info_Mod_Daniel_Kissen_08_01"); //Never heard of it. What's this supposed to be?
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_02"); //I don't really know. Could be a tincture or something.
	AI_Output(self, hero, "Info_Mod_Daniel_Kissen_08_03"); //Then I'd try the alchemist. Or at Morpheus over there, selling rarities.
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_04"); //Thanks.
};

INSTANCE Info_Mod_Daniel_Kimon (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Kimon_Condition;
	information	= Info_Mod_Daniel_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "You have all kinds of potions and plants.";
};                       

FUNC INT Info_Mod_Daniel_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_00"); //You have all kinds of potions and plants. I'm sure there's also a giver of joy.
	AI_Output(self, hero, "Info_Mod_Daniel_Kimon_08_01"); //You think wrong. I only lead what makes honest alchemy. Not this monstrous flutter. You'll have to go to the court bailiffs.
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_02"); //I can't get in there.
	AI_Output(self, hero, "Info_Mod_Daniel_Kimon_08_03"); //That's fine, too. I can't help you anyway.
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_04"); //Could have been. See you another time.
};

INSTANCE Info_Mod_Daniel_Freudenspender (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Freudenspender_Condition;
	information	= Info_Mod_Daniel_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Do you need joy dispensers?";
};                       

FUNC INT Info_Mod_Daniel_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Freudenspender_15_00"); //Do you need joy dispensers?
	AI_Output(self, hero, "Info_Mod_Daniel_Freudenspender_08_01"); //I'm sorry, but I'm not allowed to let my mind get clouded.
	AI_Output(self, hero, "Info_Mod_Daniel_Freudenspender_08_02"); //You'll have to turn to others.
};

INSTANCE Info_Mod_Daniel_Trade (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Trade_Condition;
	information	= Info_Mod_Daniel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Daniel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daniel_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Daniel_Pickpocket (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Pickpocket_Condition;
	information	= Info_Mod_Daniel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Daniel_Pickpocket_Condition()
{
	C_Beklauen	(94, ItMi_Gold, 39);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

	Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_BACK, Info_Mod_Daniel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Daniel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Daniel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Daniel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Daniel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Daniel_EXIT (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_EXIT_Condition;
	information	= Info_Mod_Daniel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Daniel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daniel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
