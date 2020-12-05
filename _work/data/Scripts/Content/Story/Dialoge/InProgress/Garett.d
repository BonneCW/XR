INSTANCE Info_Mod_Garett_Hi (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Hi_Condition;
	information	= Info_Mod_Garett_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garett_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Garett_Hi_28_00"); //Hey, new guy, need a gun?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Garett seems to be selling weapons.");
};

INSTANCE Info_Mod_Garett_Befreiung (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung_Condition;
	information	= Info_Mod_Garett_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is there anything I can do for you?";
};

FUNC INT Info_Mod_Garett_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_00"); //Is there anything I can do for you?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_01"); //Why?
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_02"); //Greg asked me to help you guys get things going again.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_03"); //(laughs) Oh, well. Well, that's different.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_04"); //So you got something?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_05"); //Yes, indeed. If the undead are attacked again, we have little weapons to defend ourselves.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_06"); //I need ten cutlasses to get me back enough supplies.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_07"); //Where do I get the cutlasses from?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_08"); //Go down to the beach, there's some weapons still lying around. You should be able to find it.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_09"); //I'm gonna go look for it.
	
	Log_CreateTopic	(TOPIC_MOD_BEL_PIRGARETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRGARETT, "Garett needs new weapons. There's still some on the beach.");

	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_01");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_02");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_03");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_04");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_05");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_06");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_07");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_08");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_09");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_10");
};

INSTANCE Info_Mod_Garett_Befreiung2 (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung2_Condition;
	information	= Info_Mod_Garett_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your ten cutlasses.";
};

FUNC INT Info_Mod_Garett_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Befreiung))
	&& (Npc_HasItems(hero, ItMw_Addon_PIR1hSword) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung2_15_00"); //Here's your ten cutlasses.

	B_GiveInvItems	(hero, self, ItMw_Addon_PIR1hSword, 10);

	AI_Output(self, hero, "Info_Mod_Garett_Befreiung2_28_01"); //Thank you. Here's a reward.

	B_ShowGivenThings	("120 gold and 15 grog received");

	CreateInvItems	(hero, ItMi_Gold, 120);
	CreateInvItems	(hero, ItFo_Addon_Grog, 15);

	B_GivePlayerXP	(250);

	Mod_Piratenbefreiung += 1;
	
	B_LogEntry_More	(TOPIC_MOD_BEL_PIRGARETT, TOPIC_MOD_BEL_PIRATENLAGER, "Garett is supplied with supplies again.", "Garett is supplied with supplies again.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Garett_Blutkelch (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Blutkelch_Condition;
	information	= Info_Mod_Garett_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a particularly hard hoe in your assortment?";
};

FUNC INT Info_Mod_Garett_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_00"); //Do you have a particularly hard hoe in your assortment?
	AI_Output(self, hero, "Info_Mod_Garett_Blutkelch_28_01"); //What's that supposed to be? I only know the mean pickaxe. And I don't have any of that.
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_02"); //All right, all right. Just a question.
};

INSTANCE Info_Mod_Garett_Trade (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Trade_Condition;
	information	= Info_Mod_Garett_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Garett_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Garett_Pickpocket (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Pickpocket_Condition;
	information	= Info_Mod_Garett_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Garett_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Garett_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_BACK, Info_Mod_Garett_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garett_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garett_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
};

FUNC VOID Info_Mod_Garett_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Garett_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Garett_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Garett_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Garett_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Garett_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Garett_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Garett_EXIT (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_EXIT_Condition;
	information	= Info_Mod_Garett_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garett_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
