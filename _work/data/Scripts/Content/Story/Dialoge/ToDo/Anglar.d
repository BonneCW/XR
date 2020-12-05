INSTANCE Info_Mod_Anglar_Hi (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Hi_Condition;
	information	= Info_Mod_Anglar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anglar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_00"); //Greetings, stranger. If you are looking for fine and fresh fish, you've come to the right place.
	AI_Output(hero, self, "Info_Mod_Anglar_Hi_15_01"); //What else you got?
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_02"); //Only the finest fish. What more do you need? No day without fish, my grandfather used to say, and so he became over 100 years old...
};

INSTANCE Info_Mod_Anglar_Feuersbrunst (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst_Info;
	permanent	= 0;
	important	= 0;
	description	= "But your offer isn't that big...";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_00"); //But your offer isn't that big...
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_01"); //Yes, I'm afraid that's true at the moment. It's also been a few weeks since I went fishing at the big lake.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_02"); //That's what they call fresh.

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_03"); //But after the last few incidents I don't dare to go near...
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_04"); //What's happening?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_05"); //A few days ago, when I had just cut the hole in the ice and threw out my fishing rod, everything seemed quite normal at first. It was only quite cloudy and dark.... than suddenly...
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_06"); //Yes?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_07"); //When suddenly a spiral of fire lit everything up in the southeast. As if spellbound, I continued to stare in the direction where the spectacle had taken place. But nothing more happened.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_08"); //So I took my courage, caught up with the fishing rod and went in the direction Schuster's Rappen had taken the spectacle.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_09"); //After a few hundred meters of walking, I discovered a horde of icecream snappers in the distance.... and out of nowhere flames suddenly fell on them and burned them in an instant.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_10"); //The sight was enough for me to take my legs in my hand and flee quickly to the village.
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_11"); //And what do you think had happened?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_12"); //I don't know exactly.... but there's probably some fire demon out there somewhere.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_13"); //And since I am reasonable and don't want to end up as a barbecue, I stay behind the safe palisades of the village for the time being.

	Log_CreateTopic	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_FEUERSBRUNST, "The fish seller Anglar told me a story that had taken place in the southeast behind the frozen lake. Some unknown power - possibly a demon - seems to make the area unstable with flames and burn everything that feeds it.");

	Wld_InsertNpc	(Mod_7793_KDF_Hyglas_EIS, "EINSIEDLER_1");
};

INSTANCE Info_Mod_Anglar_Feuersbrunst2 (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst2_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Your demon won't destroy the area.";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_EIS_Feuersbrunst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst2_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_00"); //Your demon won't destroy the area.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_01"); //What? Are you sure about this?
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_02"); //Yeah, he moved on to another region of the world.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_03"); //I'm relieved to hear that. Then I will immediately go fishing again.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_04"); //Well, here to thank you for the information of the remaining fish I have left.

	B_GiveInvItems	(self, hero, ItFo_Fish, 17);

	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_SUCCESS);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Anglar_Trade (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Trade_Condition;
	information	= Info_Mod_Anglar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anglar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anglar_Pickpocket (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Pickpocket_Condition;
	information	= Info_Mod_Anglar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anglar_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 22);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_BACK, Info_Mod_Anglar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anglar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anglar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anglar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anglar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anglar_EXIT (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_EXIT_Condition;
	information	= Info_Mod_Anglar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anglar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
