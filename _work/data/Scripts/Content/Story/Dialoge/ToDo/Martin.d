INSTANCE Info_Mod_Martin_Hi (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Hi_Condition;
	information	= Info_Mod_Martin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Martin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Hi_15_00"); //Who are you?
	AI_Output(self, hero, "Info_Mod_Martin_Hi_07_01"); //I'm Martin, mayor of the militia. What can I do for you?
};

INSTANCE Info_Mod_Martin_Rasend (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Rasend_Condition;
	information	= Info_Mod_Martin_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Martin_Rasend_Condition()
{
	if (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_00"); //I'm glad you came...
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_01"); //With Beliar... what kind of massacre was there?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_02"); //A nasty demon is responsible.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_03"); //What?! A single demon killed all those paladins and city dwellers?
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_04"); //How exactly did all this happen?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_05"); //Well, I'll tell you what I've heard so far. I was just shopping at the marketplace.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_06"); //Suddenly one heard inhumane roar from the harbour, heard cries and battle noises.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_07"); //I ran to look for it, but before I arrived I saw a gigantic demon ascending, flying over the east gate and disappearing in the distance.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_08"); //Yeah, that must have really been a monster, the way it raged here.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_09"); //Are there any clues as to what this is all about, or where the demon has disappeared to?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_10"); //No, nothing yet. It really wasn't long ago that all this happened...
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_11"); //But I heard someone say that the fire magician Daron seemed very worried and teleported away....
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_12"); //(to himself) Hmm, the monastery of fire magicians is located in the east.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_13"); //Okay, thanks for the information. I will then set off to learn more about all this.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_14"); //Okay, take care of yourself.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_RASEND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Something terrible has happened at the city harbour.");
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "I learned from Martin that a huge demon slaughtered the whole paladin at the harbour and then disappeared eastwards. The fire magician Daron then teleported away very worried.");

	B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "LIFEKLOSTER");

	B_KillNpc	(Mod_1193_NOV_Novize_NW);
	B_KillNpc	(Mod_554_KDF_Parlan_NW);
};

INSTANCE Info_Mod_Martin_Flugblaetter (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Flugblaetter_Condition;
	information	= Info_Mod_Martin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a flyer for you.";
};

FUNC INT Info_Mod_Martin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Flugblaetter_15_00"); //I've got a flyer for you.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_01"); //Oh, thank you. Thank you. Let's see....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_02"); //Ah yes. Maybe I'll stop by Matteo's.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Martin_Trade (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Trade_Condition;
	information	= Info_Mod_Martin_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Martin_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Martin_Pickpocket (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Pickpocket_Condition;
	information	= Info_Mod_Martin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Martin_Pickpocket_Condition()
{
	C_Beklauen	(61, ItSc_PalRepelEvil, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_BACK, Info_Mod_Martin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Martin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Martin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
};

FUNC VOID Info_Mod_Martin_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Martin_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Martin_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Martin_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Martin_EXIT (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_EXIT_Condition;
	information	= Info_Mod_Martin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Martin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
