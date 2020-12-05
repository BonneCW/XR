INSTANCE Info_Mod_Bernd_Hi (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Hi_Condition;
	information	= Info_Mod_Bernd_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Let me guess. You're the guy here. )";
};

FUNC INT Info_Mod_Bernd_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bernd_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bernd_Hi_15_00"); //Let me guess. You're the guy who gives me everything I need for the Mental.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_01"); //(ironic) I knew it, the booth is just too conspicuous.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_02"); //But you're right, I will give you everything you need for a tour of the Minental Valley.
	AI_Output(hero, self, "Info_Mod_Bernd_Hi_15_03"); //Was soll das heiﬂen "like everything else"?
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_04"); //Maybe you haven't noticed it yet, but our mine is not yet very economical and because of that I don't have any ore weapons on offer.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_05"); //Otherwise, I might have everything you need.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KG, "Bernd deals with all kinds of things.");
};

INSTANCE Info_Mod_Bernd_InGilde (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_InGilde_Condition;
	information	= Info_Mod_Bernd_InGilde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bernd_InGilde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bernd_Hi))
	&& (KG_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bernd_InGilde_Info()
{
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_00"); //You're with us now?! I'll give you a hint: no matter what riches they promise you, don't go to the mine.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_01"); //There are creatures lurking down there that you'd rather not disturb, and by that I don't mean the stone monsters.
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_02"); //How do you know that, have you ever been to the mine?!
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_03"); //Of course, we've already been inside and I'm telling you, I won't get 20 more orcs in there!
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_04"); //What happened down there?
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_05"); //Back then, we had just uncovered the mine entrance.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_06"); //We were wondering why only the entrance had been buried.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_07"); //And when we finally ended up in the mine, it looked completely different from the old maps.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_08"); //Well, that wasn't really the problem, we were able to penetrate the mine well and were almost certain that there are no more monsters there.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_09"); //But when we entered a slightly larger room, which was apparently a remnant of the former mine, a whole horde of these stone monsters approached us.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_10"); //I was the only survivor at the time, and only because I took my legs in my hand.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_11"); //I don't want to make any assumptions now, but for me it looked as if the stone monsters had also been on the run, and no matter what they had fled from, I don't want to hit it.
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_12"); //We will see, perhaps we will soon find an explanation for all these events.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_13"); //If you think I'd keep my hands off it if I were you.
};

INSTANCE Info_Mod_Bernd_Trade (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Trade_Condition;
	information	= Info_Mod_Bernd_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bernd_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bernd_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bernd_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bernd_Pickpocket (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Pickpocket_Condition;
	information	= Info_Mod_Bernd_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bernd_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 21);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

	Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_BACK, Info_Mod_Bernd_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bernd_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bernd_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bernd_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bernd_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bernd_EXIT (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_EXIT_Condition;
	information	= Info_Mod_Bernd_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bernd_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bernd_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
