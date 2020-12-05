INSTANCE Info_Mod_Aabid_Hi (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Hi_Condition;
	information	= Info_Mod_Aabid_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Aabid_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_00"); //My name is Aabid. I'm one of the crooks here and at the same time a trader for extraordinary varieties of tobacco and marsh herb stems.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_01"); //Interesting. Can I see your offer?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_02"); //No, I can't do that.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_03"); //Why not?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_04"); //I've been waiting for some time for the delivery of three bogweed packages, but the guys seem to have forgotten me and I just can't get out of hiding.
};

INSTANCE Info_Mod_Aabid_Aufgabe (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Aufgabe_Condition;
	information	= Info_Mod_Aabid_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Shall I bring you the bogweed packs?";
};

FUNC INT Info_Mod_Aabid_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_00"); //Shall I bring you the bogweed packs?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_01"); //That would be really good if you did that. But why would you want to do that?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_02"); //I'd like to join the crooks. I need your voices, though.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_03"); //Would you possibly give me your vote after this assignment?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_04"); //If you can get all the packages, then of course I'll give you my vote.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_05"); //Deal. Where should I pick up the parcels?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_06"); //You can find all three dealers in town. Her names are Meldor, Borka and last but not least Jason, a militaman.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_07"); //Someone from the militia's dealing in swampweed?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_08"); //Do you think they're all following their rules?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_09"); //No. All right, I'll see them three times.
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_10"); //Good. Come back when you get the packages.

	Log_CreateTopic	(TOPIC_MOD_ASS_AABID_PAKET, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "I spoke to Aabid, one of them assassin crooks. He wants to give me his voice, but only if I bring him three packages of bogweed, which should have been delivered by different' traders' in the city. These people are Meldor, Borka and Jason. When I have received the parcels from them, I should contact Aabid again.");
};

INSTANCE Info_Mod_Aabid_HabPakete (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_HabPakete_Condition;
	information	= Info_Mod_Aabid_HabPakete_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have received all packages.";
};

FUNC INT Info_Mod_Aabid_HabPakete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_HabPakete_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_00"); //I have received all packages.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_01"); //You're kidding me!
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_02"); //No, here they are.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 3);
	Npc_RemoveInvItems(self, ItMi_HerbPaket, 3);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_04"); //They're all of them, how did you do that?
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_05"); //Pure intuition, I'd say.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_06"); //I can't thank you enough. Here, take this gold as a token of my gratitude.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_07"); //Besides, you get my vote.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "I brought Aabid all the pacts and he was very happy with my performance. Apparently, he didn't expect it. Well, it's OK with me, because I'm now one vote and 500 gold coins richer.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_SUCCESS);

	B_GivePlayerXP	(200);
	
	CreateInvItems(self, ItMi_Joint, 50);
};

INSTANCE Info_Mod_Aabid_Trade (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Trade_Condition;
	information	= Info_Mod_Aabid_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Aabid_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_HabPakete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Aabid_Pickpocket (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Pickpocket_Condition;
	information	= Info_Mod_Aabid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Aabid_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 27);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_BACK, Info_Mod_Aabid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aabid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Aabid_EXIT (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_EXIT_Condition;
	information	= Info_Mod_Aabid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aabid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
