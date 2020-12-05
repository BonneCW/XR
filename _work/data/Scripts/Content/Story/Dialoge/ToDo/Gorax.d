INSTANCE Info_Mod_Gorax_Hi (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Hi_Condition;
	information	= Info_Mod_Gorax_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Gorax_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_01"); //I am Gorax and I take care of the food supply here in the monastery.
	AI_Output(self, hero, "Info_Mod_Gorax_Hi_14_02"); //I also sell other things.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KLOSTER, "Gorax can sell me a few things.");
};

INSTANCE Info_Mod_Gorax_Andokai (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Andokai_Condition;
	information	= Info_Mod_Gorax_Andokai_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_Andokai_Condition()
{
	var C_Item RobeVonAndokai;
	RobeVonAndokai = Npc_GetEquippedArmor(hero);

	if (Npc_KnowsInfo(hero, Info_Mod_Andokai_Hi))
	&& (Hlp_IsItem(RobeVonAndokai, ITAR_FAKE_NOV_L) == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Andokai_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_00"); //Oops! Where did you come from?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_15_01"); //I'm brand-new here. Do you have a task for me, Master?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_02"); //You're still motivated, aren't you? Don't worry, it'll settle down in time.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_03"); //At the beginning you are full of energy, but once you have made it to the magician, you talk about wine and beer - just look at me!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_04"); //At some point, you'll hardly get your belly over the bed.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_05"); //Oh, yes, but you were here for the assignment. I have to take into account that you're inexperienced.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_06"); //There's one thing I can think of that might just be right for you.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_07"); //I have an outstanding wine shipment for Orlan here. You know, the guy who owns the tavern. He'll give me 250 gold coins.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_14_08"); //Can you remember that? Wine, Orlan, 250 gold?

	B_GiveInvItems	(self, hero, ItFo_KWine, 10);

	Mod_GoraxWeinGeklaut = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);

	Info_AddChoice	(Info_Mod_Gorax_Andokai, "Can't you write it down?", Info_Mod_Gorax_Andokai_B);
	Info_AddChoice	(Info_Mod_Gorax_Andokai, "No problem.", Info_Mod_Gorax_Andokai_A);
};

FUNC VOID Info_Mod_Gorax_Andokai_B()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_00"); //Can't you write it down?
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_01"); //Oh, sure you do. Where did I put my pen?
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_B_15_02"); //Behind the ear.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_03"); //What you're not saying, really! You see, you're already a helper!
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_B_14_04"); //So here's the note. You should be able to remember it that way.

	B_GiveInvItems	(self, hero, ItWr_GoraxAndokai, 1);

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

FUNC VOID Info_Mod_Gorax_Andokai_A()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Andokai_A_15_00"); //No problem.
	AI_Output(self, hero, "Info_Mod_Gorax_Andokai_A_14_01"); //I'll see you soon. Have fun here in the monastery!

	Info_ClearChoices	(Info_Mod_Gorax_Andokai);
};

INSTANCE Info_Mod_Gorax_Weinverkauf (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Weinverkauf_Condition;
	information	= Info_Mod_Gorax_Weinverkauf_Info;
	permanent	= 0;
	important	= 0;
	description	= "I brought Orlan the wine.";
};

FUNC INT Info_Mod_Gorax_Weinverkauf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorax_AndokaiBinBack))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Weinverkauf_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Weinverkauf_15_00"); //I brought Orlan the wine.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gorax_Weinverkauf_14_01"); //Thank you very much. We can use a messenger like you. Maybe I'll come back to you.

	B_GivePlayerXP	(100);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_AndokaiBinBack (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_AndokaiBinBack_Condition;
	information	= Info_Mod_Gorax_AndokaiBinBack_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gorax_AndokaiBinBack_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Mod_GoraxWeinGeklaut < Wld_GetDay())
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Weinverkauf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Gorax_Weinverkauf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_AndokaiBinBack_Info()
{
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_00"); //Hey you! Did you bring my gold?
	AI_Output(hero, self, "Info_Mod_Gorax_AndokaiBinBack_15_01"); //Um...
	AI_Output(self, hero, "Info_Mod_Gorax_AndokaiBinBack_14_02"); //Ah, there it is.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Gorax_Aufgabe (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Aufgabe_Condition;
	information	= Info_Mod_Gorax_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you got something for me to do?";
};

FUNC INT Info_Mod_Gorax_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_15_00"); //You got something to do for me?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_14_01"); //You could go into town for me and buy four bottles of alcohol from Salandril.

	Log_CreateTopic	(TOPIC_MOD_GORAX_ALKOHOL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_ALKOHOL, "I'm supposed to get four bottles of alcohol for Gorax from Salandril.");

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Then I'll be right on my way.", Info_Mod_Gorax_Aufgabe_Los);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Where can I find Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Why do you need the booze?", Info_Mod_Gorax_Aufgabe_Alkohol);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Los()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Los_15_00"); //Then I'll be right on my way.
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Los_14_01"); //Here's 100 gold coins.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Salandril()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Salandril_15_00"); //Where can I find Salandril?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Salandril_14_01"); //He has his business in the upper quarter.

	Mod_DialogGoraxAufgabe2 = TRUE;

	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Then I'll be right on my way.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe1 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Why do you need the booze?", Info_Mod_Gorax_Aufgabe_Alkohol);
	};
};

FUNC VOID Info_Mod_Gorax_Aufgabe_Alkohol()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Aufgabe_Alkohol_15_00"); //Why do you need the booze?
	AI_Output(self, hero, "Info_Mod_Gorax_Aufgabe_Alkohol_14_01"); //We magicians tolerate a lot of alcohol and there is not much in our wine, so we fill it up with pure alcohol.

	Mod_DialogGoraxAufgabe1 = TRUE;
	
	Info_ClearChoices	(Info_Mod_Gorax_Aufgabe);

	Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Then I'll be right on my way.", Info_Mod_Gorax_Aufgabe_Los);

	if (Mod_DialogGoraxAufgabe2 == FALSE)
	{
		Info_AddChoice	(Info_Mod_Gorax_Aufgabe, "Where can I find Salandril?", Info_Mod_Gorax_Aufgabe_Salandril);
	};
};

INSTANCE Info_Mod_Gorax_HabAlkohol (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_HabAlkohol_Condition;
	information	= Info_Mod_Gorax_HabAlkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the booze.";
};

FUNC INT Info_Mod_Gorax_HabAlkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Salandril_Alkohol))
	&& (Npc_HasItems(hero, ItMi_Alchemy_Alcohol_01)	== 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_HabAlkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_HabAlkohol_15_00"); //I got the booze.

	B_GiveInvItems	(hero, self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_01"); //Thanks. You've helped us all a lot.

	Npc_RemoveInvItems	(self, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Gorax_HabAlkohol_14_02"); //Take this gold as a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_GORAX_ALKOHOL, "I brought Gorax the booze.", "I brought Gorax the booze.");
	B_SetTopicStatus	(TOPIC_MOD_GORAX_ALKOHOL, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Gorax_Unkraut (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut_Condition;
	information	= Info_Mod_Gorax_Unkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "You have something to do for me.";
};

FUNC INT Info_Mod_Gorax_Unkraut_Condition()
{
	if (hero.guild == GIL_VLK)
	&& (Mod_Gilde == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut_15_00"); //You have something to do for me.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_01"); //Ahh, a diligent novice. There is no room in the troughs any more, as the other novices are stomping all the time.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_02"); //But instead, you could help rip out all the weeds around our vines.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut_14_03"); //Not that the nasty little plants steal the nutrients from our good grapevines and we will soon be sitting on the drying table. (laughs)

	Log_CreateTopic	(TOPIC_MOD_GORAX_UNKRAUT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GORAX_UNKRAUT, "Gorax said I could rip out the weeds around the vines.");

	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_01");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_02");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_03");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_04");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_05");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_06");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_07");
	Wld_InsertItem	(ItPl_Unkraut_Gorax, "FP_ITEM_GORAX_UNKRAUT_08");
};

INSTANCE Info_Mod_Gorax_Unkraut2 (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Unkraut2_Condition;
	information	= Info_Mod_Gorax_Unkraut2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I harvested all the weeds.";
};

FUNC INT Info_Mod_Gorax_Unkraut2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Opolos_Unkraut))
	|| (Npc_HasItems(hero, ItPl_Unkraut_Gorax) == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Unkraut2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Unkraut2_15_00"); //I harvested all the weeds.
	AI_Output(self, hero, "Info_Mod_Gorax_Unkraut2_14_01"); //Good novice. Here, finish your day with some good bottles of wine.

	B_GiveInvItems	(self, hero, ItFo_KWine, 3);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_GORAX_UNKRAUT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Gorax_Comeback (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Comeback_Condition;
	information	= Info_Mod_Gorax_Comeback_Info;
	permanent	= 0;
	important	= 0;
	description	= "Innos, greeting. The council promised me one of the old sacrificial bowls. I want to pick her up.";
};

FUNC INT Info_Mod_Gorax_Comeback_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Comeback))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Comeback_Info()
{
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_00"); //Innos, greeting. The council promised me one of the old sacrificial bowls. I want to pick her up.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_01"); //We have a few more of these. But you won't be able to wear it. It's too heavy.
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_02"); //Perhaps one of the novices can help me....
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_03"); //I'll make sure you get that thing. Where is it supposed to go?
	AI_Output(hero, self, "Info_Mod_Gorax_Comeback_15_04"); //That's not certain yet. It's best to put them to the right of the east gate on the meadow.
	AI_Output(self, hero, "Info_Mod_Gorax_Comeback_14_05"); //Will do.

	B_LogEntry	(TOPIC_MOD_ASS_COMEBACK, "Gorax will deliver the sacrificial bowl to the meadow near the camp. We can pick them up there. I should get back to Norek now.");
};

INSTANCE Info_Mod_Gorax_Trade (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Trade_Condition;
	information	= Info_Mod_Gorax_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gorax_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gorax_Trade_Info()
{	
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gorax_Pickpocket (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_Pickpocket_Condition;
	information	= Info_Mod_Gorax_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Gorax_Pickpocket_Condition()
{
	C_Beklauen	(91, ItFo_KWine, 6);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_BACK, Info_Mod_Gorax_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gorax_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gorax_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gorax_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gorax_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gorax_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gorax_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gorax_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gorax_EXIT (C_INFO)
{
	npc		= Mod_917_KDF_Gorax_NW;
	nr		= 1;
	condition	= Info_Mod_Gorax_EXIT_Condition;
	information	= Info_Mod_Gorax_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gorax_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gorax_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
