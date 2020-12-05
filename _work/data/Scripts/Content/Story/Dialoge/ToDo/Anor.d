INSTANCE Info_Mod_Anor_Hi (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Hi_Condition;
	information	= Info_Mod_Anor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "What are you doing here?";
};

FUNC INT Info_Mod_Anor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_15_00"); //What are you doing here?
	AI_Output(self, hero, "Info_Mod_Anor_Hi_02_01"); //I'm a merchant selling potions. Why do you want to know?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Anor deals in potions.");

	Info_ClearChoices	(Info_Mod_Anor_Hi);

	Info_AddChoice	(Info_Mod_Anor_Hi, "I want to know who I'll kill if I slaughter everyone here.", Info_Mod_Anor_Hi_B);
	Info_AddChoice	(Info_Mod_Anor_Hi, "I want to know more about you transforming mages.", Info_Mod_Anor_Hi_A);
};

FUNC VOID Info_Mod_Anor_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_B_15_00"); //I want to know who I'll kill if I slaughter everyone here.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_B_02_01"); //Sorry, but I'm not available for that kind of thing.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

FUNC VOID Info_Mod_Anor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_A_15_00"); //I want to know more about you transforming mages.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_01"); //I don't know if I can trust you.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_02"); //If you want to buy potions, come back when you have shown that you are really interested in us.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

INSTANCE Info_Mod_Anor_Abwimmeln (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Abwimmeln_Condition;
	information	= Info_Mod_Anor_Abwimmeln_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Anor_Abwimmeln_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Brad_Quest != 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Anor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Abwimmeln_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_Abwimmeln_02_00"); //What do you want?
};

INSTANCE Info_Mod_Anor_Faice01 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice01_Condition;
	information	= Info_Mod_Anor_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you been feeling anything strange lately?";
};

FUNC INT Info_Mod_Anor_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice01_15_00"); //Have you been feeling anything strange lately?
	AI_Output(self, hero, "Info_Mod_Anor_Faice01_02_01"); //No, actually not. Talk to the others.
};

INSTANCE Info_Mod_Anor_Faice02 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice02_Condition;
	information	= Info_Mod_Anor_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you heard anything about the poisoning of Faice's role?";
};

FUNC INT Info_Mod_Anor_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice02_15_00"); //Have you heard anything about the poisoning of Faice's role?
	AI_Output(self, hero, "Info_Mod_Anor_Faice02_02_01"); //No, I'm sorry, sir.
};

INSTANCE Info_Mod_Anor_Faice03 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice03_Condition;
	information	= Info_Mod_Anor_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Did you notice anything else?";
};

FUNC INT Info_Mod_Anor_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice03_15_00"); //Did you notice anything else?
	AI_Output(self, hero, "Info_Mod_Anor_Faice03_02_01"); //All normal, I didn't notice anything.
};

INSTANCE Info_Mod_Anor_Nick (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Nick_Condition;
	information	= Info_Mod_Anor_Nick_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a job for me?";
};

FUNC INT Info_Mod_Anor_Nick_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Furt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Nick_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_15_00"); //Do you have a job for me?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_01"); //There is actually something that you could do for me and for the church, mind you.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_02"); //I have noticed that near the marsh camp, where one of these focus stones used to be, more and more animals are dying.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_03"); //You could get to the bottom of this, because I can't leave right now.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_04"); //If one of these cult spinners is behind it, they can experience something of ours!

	Info_ClearChoices	(Info_Mod_Anor_Nick);

	Info_AddChoice	(Info_Mod_Anor_Nick, "What's in it for me?", Info_Mod_Anor_Nick_B);
	Info_AddChoice	(Info_Mod_Anor_Nick, "I'm in.", Info_Mod_Anor_Nick_A);
};

FUNC VOID Info_Mod_Anor_Nick_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_A_15_00"); //I'm in.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_01"); //I'm glad to hear that. You better get out of here right now.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_02"); //Here's a healing potion if anything should happen to you.

	B_GiveInvItems	(self, hero, ItPo_Health_01, 1);

	Log_CreateTopic	(TOPIC_MOD_ANOR_NICK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Anor wants me to get to the bottom of a strange animal dying near the swamp. I was supposed to look around whereyras the novice attacked me at that time.");

	Wld_InsertNpc	(Mod_7050_ZOM_Nick_MT, "OC2");
	
	Info_ClearChoices	(Info_Mod_Anor_Nick);
};

FUNC VOID Info_Mod_Anor_Nick_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_B_15_00"); //What's in it for me?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_B_02_01"); //Let me just say this much: It shall not be your harm.
	
	Info_Mod_Anor_Nick_A();
};

INSTANCE Info_Mod_Anor_NickTot (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_NickTot_Condition;
	information	= Info_Mod_Anor_NickTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anor_NickTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nick_Kopf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_NickTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_00"); //What's the news?
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_15_01"); //Animal death has stopped. A headless zombie was responsible, but I saved him.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_02"); //Very good. Very good. Here's your reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_RemoveNpc	(Mod_7050_ZOM_Nick_MT);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "I had to negotiate with a minotaur...", Info_Mod_Anor_NickTot_B);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Thank you very much. I'm on my way back now.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_A_15_00"); //Thank you very much. I'm on my way back now.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_A_02_01"); //I'll see you around.
	
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "I have received my reward from Anor.");
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_SUCCESS);

	B_GivePlayerXP	(650);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);
};

FUNC VOID Info_Mod_Anor_NickTot_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_B_15_00"); //I had to negotiate with a minotaur...
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_B_02_01"); //Hmph. Here's some extra cash.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "I had to kill twenty wolves and a dozen snapper....", Info_Mod_Anor_NickTot_C);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Thank you very much. I'm on my way back now.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_C()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_C_15_00"); //I had to kill twenty wolves and a dozen snapper....
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_C_02_01"); //Okay, here. But there is no more.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	Info_Mod_Anor_NickTot_A();
};

INSTANCE Info_Mod_Anor_Trade (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Trade_Condition;
	information	= Info_Mod_Anor_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anor_Trade_Condition()
{
	if (Mod_VMG_Dabei) {
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anor_Pickpocket (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Pickpocket_Condition;
	information	= Info_Mod_Anor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anor_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_BACK, Info_Mod_Anor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
};

FUNC VOID Info_Mod_Anor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anor_EXIT (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_EXIT_Condition;
	information	= Info_Mod_Anor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
