INSTANCE Info_Mod_Fortuno_Hi (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Hi_Condition;
	information	= Info_Mod_Fortuno_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fortuno_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fortuno_Hi_13_00"); //Hello, if you need anything, you can get it from me.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Fortuno deals in all kinds of small stuff.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nice story.";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch_Condition()
{
	if (Mod_Fortuno_Sumpfmensch_Scene == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_00"); //Nice story.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_01"); //That can only be said by someone who has not yet met the crying swamp man.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_02"); //And you met him?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_03"); //If that were the case, I wouldn't be in front of you.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_04"); //So no one's ever seen that crying swamp guy before?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_05"); //Yes, it is. A novice named Regahn, and he's been shaking like an aspen leaf ever since. And Regahn is not just some weak novice who pisses his pants at the sight of a swamp rat.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_06"); //The guy used to be a pirate, eating swamp sharks for breakfast!

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Apparently, only Darrion has seen the swamp man yet. I should talk to him.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch2_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, you know anything about Darrion?";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Sumpfmensch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_00"); //Hey, you know anything about Darrion?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_01"); //Nobody here really knows anything about him. Maybe you should check in on his former employers.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_02"); //Who do you mean?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_03"); //Pirates, of course. The only thing you know about him is that he was a pirate before. Maybe one of them knows something about him.

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Darrion used to be a pirate. I should probably stop by the pirates' for more information about him.");
};

INSTANCE Info_Mod_Fortuno_Woher (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Woher_Condition;
	information	= Info_Mod_Fortuno_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why are you in this camp?";
};

FUNC INT Info_Mod_Fortuno_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Woher_15_00"); //Why are you in this camp?
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_01"); //The bogweed is to blame for everything.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_02"); //It all began in Geldern. I was an alchemist's apprentice there and came into contact with bogweed for the first time.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_03"); //Shortly afterwards I was addicted and was thrown into the colony. When I found out that there was a bog herb here, I came right away.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_04"); //Since then I have been living in this camp and managing the supplies.
};

INSTANCE Info_Mod_Fortuno_Trade (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Trade_Condition;
	information	= Info_Mod_Fortuno_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fortuno_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fortuno_Pickpocket (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Pickpocket_Condition;
	information	= Info_Mod_Fortuno_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Fortuno_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Addon_Joint_02, 5);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_BACK, Info_Mod_Fortuno_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fortuno_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fortuno_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fortuno_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fortuno_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fortuno_EXIT (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_EXIT_Condition;
	information	= Info_Mod_Fortuno_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
