INSTANCE Info_Mod_Coragon_Hi (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Hi_Condition;
	information	= Info_Mod_Coragon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Coragon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Hi_09_00"); //Welcome to my pub, stranger. What can I do for you?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Coragon owns a pub in Khorinis. He must have something to drink for me.");
};

INSTANCE Info_Mod_Coragon_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling1_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Did something just move under your feet? (place apple)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling2_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, ain't they looking for him over there? (place apple)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling3_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nice apples you have there... (place apple)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_Daemonisch (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch_Condition;
	information	= Info_Mod_Coragon_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_00"); //Ahh, another guest. Same as the others?
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_01"); //How?
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_02"); //A large portion of meat and beer....
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_03"); //Uh, no, I just wanted to find out about unusual things...
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_04"); //Well, lately all guests eat meat in rough quantities and drink the beer literally.... like they haven't eaten in days.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_05"); //And that's what they look like... but strangely enough, no matter how often they visit my restaurant.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_06"); //I guess everyone must have tapeworms.

	CreateInvItems	(self, ItFo_KWine, 5);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "I learned from Coragon that his guests devour meat and beer in rough quantities, but still look as if they were eating on the scarf.");
};

INSTANCE Info_Mod_Coragon_Daemonisch2 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch2_Condition;
	information	= Info_Mod_Coragon_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch))
	&& (Mod_HQ_Daemonisch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_00"); //Hey, could you do me a favor and get a packet of Baltram's cured meat at the market?
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_01"); //(slightly quieter) The greedy pack would soon have to come back and greed for more meat.
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch2_15_02"); //Sure, no problem.
};

INSTANCE Info_Mod_Coragon_Daemonisch3 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch3_Condition;
	information	= Info_Mod_Coragon_Daemonisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the package.";
};

FUNC INT Info_Mod_Coragon_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	&& (Npc_HasItems(hero, ItMi_CoragonDaemonisch2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch3_15_00"); //Here's the package.

	B_GiveInvItems	(hero, self, ItMi_CoragonDaemonisch2, 1);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_01"); //Very good... here 50 gold coins for the effort...

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_02"); //Here they come already.

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_1251_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1252_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1253_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1254_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1259_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1261_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1175_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1176_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1177_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1044_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1045_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");

	B_StartOtherRoutine	(Mod_1251_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1252_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1253_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1254_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1259_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1261_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1044_VLK_Buerger_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1045_VLK_Buerger_NW, "DAEMONISCH");

	AI_Teleport	(Mod_1251_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1252_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1253_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1254_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1259_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1261_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1175_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1176_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1177_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1044_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1045_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Coragon_WhatHappened (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_WhatHappened_Condition;
	information	= Info_Mod_Coragon_WhatHappened_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's the matter with you?";
};

FUNC INT Info_Mod_Coragon_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Kapitel > 2)
	&& (!Npc_IsDead(Mod_590_NONE_Kardif_NW))
	&& (!Npc_IsDead(Mod_1076_VLK_Wirt_NW))
	&& (!Npc_IsDead(Mod_777_NONE_Rukhar_NW))
	&& (!Npc_IsDead(Mod_597_NONE_Meldor_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_WhatHappened_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_00"); //What's the matter with you?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_01"); //Nothing, except a lousy thief stole a shipment of 40 bottles of juniper. This is what's going on.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_02"); //Can I help you with something?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_03"); //Yes, you could. Find this lousy thief and kill him.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_04"); //What's in it for me?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_05"); //(considered) Hmm... would you be okay with 300 pieces of gold?
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_06"); //Of course! Where do you want me to start looking?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_07"); //I'm as helpless as you are, but it's best to rattle around the harbour district and talk to the people there!
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_08"); //I'll be on my way, then.

	CreateInvItems	(Mod_799_BAU_Thekla_NW, ItFo_Booze, 40);

	Log_CreateTopic	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "A shipment of 40 bottles of juniper was stolen from the host Coragon. He asked me to find the thief.");
};

INSTANCE Info_Mod_Coragon_Back (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Back_Condition;
	information	= Info_Mod_Coragon_Back_Info;
	permanent	= 0;
	important	= 0;
	description	= "I resolved the theft.";
};

FUNC INT Info_Mod_Coragon_Back_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_KnowsRukhar))
	&& ((Mod_KnowsRukharWacholder == 6)
	|| (Mod_KnowsRukharWacholder == 2)
	|| (Mod_KnowsRukharWacholder == 4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Back_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Back_15_00"); //I resolved the theft.
	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_01"); //Who was it?

	if (Mod_KnowsRukharWacholder == 2)
	|| (Mod_KnowsRukharWacholder == 4)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_02"); //It was Rukhar.
	}
	else if (Mod_KnowsRukharWacholder == 6)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_03"); //Kardif has entrusted Rukhar with the theft. Cardif is now in prison.
	};

	if (Npc_HasItems(hero, ItFo_Booze) > 39)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_05"); //I brought your juniper, too.

		B_GiveInvItems	(hero, self, ItFo_Booze, 40);

		Mod_KnowsRukharWacholder = 7;
	};

	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_06"); //Thanks you're an extraordinary guy! Here's your promised reward.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	if (Mod_KnowsRukharWacholder == 7)
	{
		AI_Output(self, hero, "Info_Mod_Coragon_Back_09_07"); //And extra because you brought me back my juniper.

		B_GiveInvItems	(self, hero, ItFo_CoragonsBeer, 3);
	};

	B_GivePlayerXP	(350);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "I've reported to Coragon and received my reward.");
	B_SetTopicStatus	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Coragon_Zauberwasser (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Zauberwasser_Condition;
	information	= Info_Mod_Coragon_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a shipment of magic water.";
};

FUNC INT Info_Mod_Coragon_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Zauberwasser_15_00"); //I've got a shipment of magic water.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Coragon_Zauberwasser_09_01"); //It's about time.
};

INSTANCE Info_Mod_Coragon_Trade (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Trade_Condition;
	information	= Info_Mod_Coragon_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Coragon_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Coragon_Pickpocket (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Pickpocket_Condition;
	information	= Info_Mod_Coragon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Coragon_Pickpocket_Condition()
{
	C_Beklauen	(75, ItFo_CoragonsBeer, 3);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

	Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_BACK, Info_Mod_Coragon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Coragon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Coragon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Coragon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Coragon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Coragon_EXIT (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_EXIT_Condition;
	information	= Info_Mod_Coragon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Coragon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Coragon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
