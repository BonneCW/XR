instance Info_Mod_Liselotte_Trade1 (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade1_Condition;
	information	= Info_Mod_Liselotte_Trade1_Info;
	permanent	= 0;
	important	= 0;
	description	= "You got something for me?";
};

FUNC INT Info_Mod_Liselotte_Trade1_Condition()
{
	return TRUE ;
};

FUNC VOID Info_Mod_Liselotte_TRADE1_Info()
{
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_00"); //Hey, you trader, do you have anything for me?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_01"); //Hey, you want to hit on me here?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_02"); //Oh, uh.....
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_03"); //Don't say anything wrong!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_04"); //l--
 	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_05"); //... Don't even think it!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_06"); //SORRY!
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_07"); //Suppose - but STRAIGHT!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_08"); //Um...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_09"); //What the fuck do you want?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_10"); //I wanted to ask you... you as a merchant...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_11"); //Talk to me reasonably!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_12"); //O. K. You, uh, as a dealer, you sell merchandise...
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_13"); //Yeah, that's right.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_14"); //Would you mind if I took a look at your merchandise?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_15"); //I can't offer you anything because I lost my package on the way to town.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_19"); //It must be lying around somewhere near the city gate, but I couldn't find it.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_16"); //If I find it, I'll send it to you.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_17"); //Thank you, you're a darling!

	B_GiveInvItems (self, hero, ItMi_Gold, 50);

	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_18"); //Um, thank you.

	Log_CreateTopic (TOPIC_MOD_LISELOTTESBEUTEL, LOG_MISSION);
	B_SetTopicStatus (TOPIC_MOD_LISELOTTESBEUTEL, LOG_RUNNING);
	B_LogEntry (TOPIC_MOD_LISELOTTESBEUTEL, "Liselotte has lost her package somewhere on her way to town, but she doesn't know exactly where. It is said to be near the city gate. If I find it, I can buy goods from her, because she will have some again. Probably this loss also explains their bad mood...");
};
   
INSTANCE Info_Mod_Liselotte_Warenpaket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Warenpaket_Condition;
	information	= Info_Mod_Liselotte_Warenpaket_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is this yours? (giving goods package)";
};

FUNC INT Info_Mod_Liselotte_Warenpaket_Condition()
{
	if (Npc_HasItems(hero, Packet_Lise) >= 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Trade1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Warenpaket_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_00"); //Is this your package?

	B_GiveInvItems	(hero, self, Packet_Lise, 1);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_01"); //Yes, thank you.
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_02"); //Um, do I get a reward now?
	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_03"); //OK. I'll give you 50 gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_04"); //Besides, you can trade with me now.

	B_LogEntry	(TOPIC_MOD_LISELOTTESBEUTEL, "I found Liselottes package and returned it.");
	B_SetTopicStatus	(TOPIC_MOD_LISELOTTESBEUTEL, LOG_SUCCESS);

	B_GivePlayerXP (100);

	Npc_RemoveInvItems	(self, Packet_Lise, 1);

	B_Göttergefallen(2, 1);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Liselotte_Blutkelch (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Blutkelch_Condition;
	information	= Info_Mod_Liselotte_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello, beautiful child!";
};

FUNC INT Info_Mod_Liselotte_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_00"); //Hello, beautiful child!
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_01"); //Ah, the flatterer. What can I get you?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_02"); //I'm looking for a cup. A cup of blood.
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_03"); //I don't have a cup. Especially no bloody one.
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_04"); //Could have been. Thanks. By the way, what are you doing after hours?
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_05"); //Going to bed. Well, what else?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_06"); //Just so...
};

INSTANCE Info_Mod_Liselotte_Pickpocket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Pickpocket_Condition;
	information	= Info_Mod_Liselotte_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Liselotte_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_BACK, Info_Mod_Liselotte_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Liselotte_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Liselotte_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Liselotte_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Liselotte_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Liselotte_Trade (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade_Condition;
	information	= Info_Mod_Liselotte_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Liselotte_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Warenpaket))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

instance Info_Mod_Liselotte_EXIT (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 999;
	condition	= Info_Mod_Liselotte_EXIT_Condition;
	information	= Info_Mod_Liselotte_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Liselotte_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Liselotte_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
