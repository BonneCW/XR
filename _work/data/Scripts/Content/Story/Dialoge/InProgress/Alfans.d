INSTANCE Info_Mod_Alfans_Hi (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Hi_Condition;
	information	= Info_Mod_Alfans_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_00"); //Hello stranger. You seem to be coming from far away.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_01"); //If you are looking for food and herbs, you shall not want for anything.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_02"); //I have an excellent selection of everything that invigorates the body and gives it relief from suffering.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_EISGEBIET, "Alfans gives me food and herbs.");

	Npc_SetRefuseTalk (self, 300);
};

INSTANCE Info_Mod_Alfans_Aufgabe (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Aufgabe_Condition;
	information	= Info_Mod_Alfans_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_00"); //Greetings, there you are again.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_01"); //I have a concern for you and would be most grateful if you could help me with that.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_02"); //Of course I'd reward you, too.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_03"); //What's the point?
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_04"); //Well, I turned to you because you've come a long way, proving that you're an excellent tracker and you can defy the dangers of the wilderness.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_05"); //It's about the hermit Halfmar. Up to now he came rarely, but regularly to our village and brought me herbs and plants which he found in the wilderness.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_06"); //However, his last visit was much longer than usual.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_07"); //And I'm starting to get worried.... (postponed) of course not only because of my goods.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_08"); //He lives far away from here in the southwest. I'd be very grateful if you could see to it.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_09"); //Well, I'll see what I can do.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_10"); //I appreciate it. I don't want it to be to your disadvantage either.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_11"); //If you follow the tracks, you'll pass by his cabin sometime.

	Log_CreateTopic	(TOPIC_MOD_ALFANS_HALFMAR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALFANS_HALFMAR, "Alfans asked me to look for the hermit Halfmar in the south. He usually brings Alfans herbs and plants that he finds in the wilderness. However, his last visit has been long overdue. I'll find his cabin in the southwest. If I follow the tracks, I can't seem to miss them.");

	Mod_AlfansQuest_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Alfans_Halfmar (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Halfmar_Condition;
	information	= Info_Mod_Alfans_Halfmar_Info;
	permanent	= 0;
	important	= 0;
	description	= "I was at Halfmar's.";
};

FUNC INT Info_Mod_Alfans_Halfmar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halfmar_HabKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Halfmar_Info()
{
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_00"); //I was at Halfmar's.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_01"); //Well, what about him?
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_02"); //He was ill, but is now on the road to recovery.
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_03"); //He should visit you in the next few days.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_04"); //Ahh, very good. Thank you for the good news.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_05"); //And here the promised reward. Choose a potion.

	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);

	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(Elixir of the Spirit)", Info_Mod_Alfans_Halfmar_C);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(drink of fortune)", Info_Mod_Alfans_Halfmar_B);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(starch potion)", Info_Mod_Alfans_Halfmar_A);
};

FUNC VOID Info_Mod_Alfans_Halfmar_Fertig()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_Fertig_03_00"); //It's been a pleasure. I hope to see you soon.

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);
};

FUNC VOID Info_Mod_Alfans_Halfmar_C()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Mana, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_B()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Dex, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_A()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Str, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

INSTANCE Info_Mod_Alfans_Trade (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Trade_Condition;
	information	= Info_Mod_Alfans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Alfans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Alfans_Pickpocket (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Pickpocket_Condition;
	information	= Info_Mod_Alfans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Alfans_Pickpocket_Condition()
{
	C_Beklauen	(144, ItMi_Gold, 64);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_BACK, Info_Mod_Alfans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alfans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alfans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alfans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alfans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alfans_EXIT (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_EXIT_Condition;
	information	= Info_Mod_Alfans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alfans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
