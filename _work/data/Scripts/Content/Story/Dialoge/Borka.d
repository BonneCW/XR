INSTANCE Info_Mod_Borka_Hi (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Hi_Condition;
	information	= Info_Mod_Borka_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_Hi_42_00"); //Step a stranger, and your wildest dreams and fantasies will come true.
};

INSTANCE Info_Mod_Borka_Flugblaetter (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Flugblaetter_Condition;
	information	= Info_Mod_Borka_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a flyer for you.";
};

FUNC INT Info_Mod_Borka_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_42_01"); //Oh, thank you. Thank you. Let's see....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_42_02"); //Ah yes. Maybe I'll stop by Matteo's.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Borka_Aabid (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Aabid_Condition;
	information	= Info_Mod_Borka_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "I come from Aabid and....";
};

FUNC INT Info_Mod_Borka_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_00"); //I come from Aabid and....
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_01"); //The guy again.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_02"); //What about it?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_03"); //He keeps wanting me to take his package out of town, but I don't feel like it. Can you give him a message?
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_04"); //I actually came to pick up the package.
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_05"); //(laughs) Aabid is a lazy pig. Here's the package.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_06"); //Just like that?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_07"); //It's already been paid. Bring the package to Aabid and say hello, next time he should come himself.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_08"); //All right, I'll do it.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "I got the package from Borka without paying.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Borka_SchutzgeldErpresser (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_SchutzgeldErpresser_Condition;
	information	= Info_Mod_Borka_SchutzgeldErpresser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_SchutzgeldErpresser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_WasGeht))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Wld_IsTime(23,00,01,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_SchutzgeldErpresser_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_42_00"); //You got the money?
	AI_Output(hero, self, "Info_Mod_Borka_SchutzgeldErpresser_15_01"); //Forget it! Tell me immediately who sent you, or you will wish you hadn't survived your birth!
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_42_02"); //You want trouble? You're welcome to have it.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Borka_Umgehauen (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Umgehauen_Condition;
	information	= Info_Mod_Borka_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_SchutzgeldErpresser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_00"); //Jesus Christ! You got a hell of a punch on you.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_02"); //You want to tell me who sent you?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_03"); //It's all right, don't get excited. Bromor sent me, he wants us to smash your shop and collect money from you.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_04"); //Why does he want that?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_05"); //He doesn't like the convicts, so he doesn't want them here in the waterfront.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_06"); //Well, I'm sure Lord Andre will be interested.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_07"); //The City Watch doesn't care about your problems.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_08"); //Well, then I know what I wanted to know. Now get the hell out of here before you get another shot in the mouth.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_09"); //All right, all right, I'm out of here.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "FLEETOBORDELL");

			Mod_AL_BorkaAusgequetscht	=	1;

			B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "It was Borka. He works for Bromor, who doesn't seem to like us convicts. That's what I should tell Whistler.");
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_01"); //Well, that was nothing.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "START");
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Borka_Lucy (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Lucy_Condition;
	information	= Info_Mod_Borka_Lucy_Info;
	permanent	= 0;
	important	= 0;
	description	= "You're selling swampweed?";
};

FUNC INT Info_Mod_Borka_Lucy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Mod_Borka_Sumpfkraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Lucy_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_00"); //You're selling swampweed?
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_42_01"); //Says who?
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_02"); //I have gold.
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_42_03"); //Well, in that case....
};

INSTANCE Info_Mod_Borka_Skinner (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Skinner_Condition;
	information	= Info_Mod_Borka_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you interested in some green novices?";
};

FUNC INT Info_Mod_Borka_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_00"); //Are you interested in some green novices?
	AI_Output(self, hero, "Info_Mod_Borka_Skinner_42_01"); //Sure, I'll take everything you got.
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_02"); //Here, take this.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Borka_Skinner_42_03"); //Here's your gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*20);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "So I got rid of all the green novices in town.");
};

var int Mod_BorkaTrader;

INSTANCE Info_Mod_Borka_Trade (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Trade_Condition;
	information	= Info_Mod_Borka_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Borka_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Lucy))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Trade_Info()
{
	if (!Mod_BorkaTrader) {
		Mod_BorkaTrader = TRUE;
		
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Borka deals in bogweed.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Borka_Pickpocket (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Pickpocket_Condition;
	information	= Info_Mod_Borka_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Borka_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Joint, 13);
};

FUNC VOID Info_Mod_Borka_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_BACK, Info_Mod_Borka_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Borka_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Borka_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
};

FUNC VOID Info_Mod_Borka_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Borka_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Borka_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Borka_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Borka_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Borka_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Borka_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Borka_EXIT (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_EXIT_Condition;
	information	= Info_Mod_Borka_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Borka_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
