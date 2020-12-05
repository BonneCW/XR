INSTANCE Info_Mod_Rosi_Hi (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Hi_Condition;
	information	= Info_Mod_Rosi_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rosi_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Hi_17_00"); //Hey, you looking for something to eat?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Rosi can sell me some groceries.");
};

INSTANCE Info_Mod_Rosi_Daemonisch (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Daemonisch_Condition;
	information	= Info_Mod_Rosi_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_00"); //What brings you here?
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_01"); //I just wanted to ask if there's been any particular changes or unusual things lately.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_02"); //Hmm, yeah, speaking of which... how can I put it... somehow, my secob isn't the same anymore. He's changed.
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_03"); //Well, who wouldn't have wished him that.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_04"); //No, he's-- it's not my secob anymore.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_05"); //Since late in the evening he went into the forest with a servant to get a picture of where the servants are best to cut wood, it is no longer my secob...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Rosi has noticed major changes in her husband Sekob since he was in the forest.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Rosi_Daemonisch2 (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Daemonisch2_Condition;
	information	= Info_Mod_Rosi_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "How are you doing?";
};

FUNC INT Info_Mod_Rosi_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch4))
	&& (!Npc_IsDead(Mod_105_BAU_Sekob_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch2_15_00"); //How are you doing?
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch2_17_01"); //Oh, my secob is the same again.
};

INSTANCE Info_Mod_Rosi_Unheil (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Unheil_Condition;
	information	= Info_Mod_Rosi_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greetings. Have there been any strange events lately?";
};

FUNC INT Info_Mod_Rosi_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Unheil_15_00"); //Greetings. Have there been any strange events lately?
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_01"); //Well, you're good for me. The whole cemetery in front of our farm is teeming with evil undead.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_02"); //Oh, like it wasn't all bad enough this year. At first it was dry for weeks, then hailstorms.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_03"); //How is this going to go on?

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Rosi has complained about unfavourable weather conditions and hailstorms since the beginning of the season.");

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Rosi_SagittaKraeuter (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_SagittaKraeuter_Condition;
	information	= Info_Mod_Rosi_SagittaKraeuter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_SagittaKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_SagittaKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_SagittaKraeuter_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_00"); //Here, I already fixed the package for Sagitta.

	B_GiveInvItems	(self, hero, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_01"); //And thank you so much for bringing him his medicine.
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_02"); //It was almost unbearable with him in the last few days.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "I brought Sekob the medicine and the package for Sagitta with me.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Rosi_Kleinvieh (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Kleinvieh_Condition;
	information	= Info_Mod_Rosi_Kleinvieh_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Kleinvieh_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Wolf))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Kleinvieh_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_00"); //I'm glad you're here. I could use your help with some disgusting beast.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh_15_01"); //What is there to defeat? Orcs, trolls, undead?
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_02"); //I heard you watched over Balthazar's sheep and defended them against young wolves.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_03"); //That's why you're sure to be able to clean our barn from the disgusting fat rats that have spread there.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_04"); //I don't dare go in there anymore.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_05"); //(half-sounding to himself) and I'd have to get back to the supplies in the trunk...

	AI_TurnToNpc	(self, hero);

	Log_CreateTopic	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ROSI_KLEINVIEH, "Rosi complained that rats have spread in the barn. I'm supposed to kill her.");

	Wld_InsertNpc	(Giant_Rat_Rosi_01, "FP_ROAM_SEKOBSRATTE_02");

	Wld_InsertNpc	(Rat_Rosi_01, "FP_ROAM_SEKOBSRATTE_02");
	Wld_InsertNpc	(Rat_Rosi_02, "FP_ROAM_SEKOBSRATTE_02");
	Wld_InsertNpc	(Rat_Rosi_03, "FP_ROAM_SEKOBSRATTE_02");

	Wld_InsertNpc	(Giant_Rat_Rosi_02, "NW_FARM4_STABLE_01");

	Wld_InsertNpc	(Rat_Rosi_04, "NW_FARM4_STABLE_01");
	Wld_InsertNpc	(Rat_Rosi_05, "NW_FARM4_STABLE_01");
};

INSTANCE Info_Mod_Rosi_Kleinvieh2 (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Kleinvieh2_Condition;
	information	= Info_Mod_Rosi_Kleinvieh2_Info;
	permanent	= 0;
	important	= 0;
	description	= "The creatures are flat.";
};

FUNC INT Info_Mod_Rosi_Kleinvieh2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Kleinvieh))
	&& (Npc_IsDead(Rat_Rosi_01))
	&& (Npc_IsDead(Rat_Rosi_02))
	&& (Npc_IsDead(Rat_Rosi_03))
	&& (Npc_IsDead(Rat_Rosi_04))
	&& (Npc_IsDead(Rat_Rosi_05))
	&& (Npc_IsDead(Giant_Rat_Rosi_01))
	&& (Npc_IsDead(Giant_Rat_Rosi_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Kleinvieh2_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_00"); //The creatures are flat.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_01"); //Thank you, thank you. You're really brave.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_02"); //Hmph...
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_03"); //Here you have some food to eat and some gold pieces to thank you.

	B_ShowGivenThings	("30 Gold, bread, milk, cheese and roasted meat received");

	CreateInvItems	(hero, ItMi_Gold, 30);
	CreateInvItems	(hero, ItFo_Bread, 1);
	CreateInvItems	(hero, ItFo_Milk, 1);
	CreateInvItems	(hero, ItFo_Cheese, 1);
	CreateInvItems	(hero, ItFo_Mutton, 1);

	B_SetTopicStatus	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(60);
};

INSTANCE Info_Mod_Rosi_Trade (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Trade_Condition;
	information	= Info_Mod_Rosi_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rosi_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rosi_Pickpocket (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Pickpocket_Condition;
	information	= Info_Mod_Rosi_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30_Female;
};

FUNC INT Info_Mod_Rosi_Pickpocket_Condition()
{
	C_Beklauen	(16, ItMi_Gold, 12);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

	Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_BACK, Info_Mod_Rosi_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rosi_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rosi_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rosi_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rosi_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rosi_EXIT (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_EXIT_Condition;
	information	= Info_Mod_Rosi_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rosi_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rosi_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
