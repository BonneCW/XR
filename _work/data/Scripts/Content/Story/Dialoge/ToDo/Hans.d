INSTANCE Info_Mod_Hans_Hi (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Hi_Condition;
	information	= Info_Mod_Hans_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you trading?";
};

FUNC INT Info_Mod_Hans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_00"); //Are you trading?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_01"); //Jesus, why else would I have to stand my legs up my ass here?
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_02"); //But that's not very customer-friendly...
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_03"); //There are better jobs than mine. I'd much rather roam the world than just sell the adventure stuff.
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_04"); //But...
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_05"); //Why can't I just quit my job?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_06"); //Because I'm a cripple, boy, a fucking cripple.
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_07"); //I can't see my hand in front of my eyes, just blurry crap. (pause) Do you want to buy something or not?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Hans is trading weapons on the marketplace.");
};

INSTANCE Info_Mod_Hans_Nagelnachschub (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub_Condition;
	information	= Info_Mod_Hans_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "I'll take it for half.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Mod_Verhandlungsgeschick > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 25)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub_15_00"); //I'll take it for half.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_01"); //Deal.

		Npc_RemoveInvItems	(hero, ItMi_Gold, 25);

		CreateInvItems	(hero, ItMi_Nagelpaket, 1);

		B_ShowGivenThings	("25 Gold given and nail package received");

		B_RaiseHandelsgeschick (2);

		Mod_REL_Nagelnachschub_Hans = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_02"); //Either for 50 gold or not at all.
	};
};

INSTANCE Info_Mod_Hans_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub2_Condition;
	information	= Info_Mod_Hans_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Here's the gold.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub2_15_00"); //Here's the gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub2_06_01"); //... and here are the nails.

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	Mod_REL_Nagelnachschub_Hans = 1;
};

INSTANCE Info_Mod_Hans_Nagelnachschub3 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub3_Condition;
	information	= Info_Mod_Hans_Nagelnachschub3_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub3_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub3_06_00"); //There's the new citizen! Welcome to our home.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 1);
};

INSTANCE Info_Mod_Hans_BuergerKhoratas (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_BuergerKhoratas_Condition;
	information	= Info_Mod_Hans_BuergerKhoratas_Info;
	permanent	= 0;
	important	= 0;
	description 	= "How many stands does the marketplace actually have?";
};                       

FUNC INT Info_Mod_Hans_BuergerKhoratas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Mod_REL_Buerger == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_BuergerKhoratas_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_00"); //How many stands does the marketplace actually have?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_01"); //Have you taken too much pleasure giver? What's the point of asking?
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_02"); //Not me, but Anselm... He wants to know the correct number.
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_03"); //Then it's clear to me. He's using you to find out if Melvin's trying to officially get rid of stolen property again.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_04"); //Anselm could find out for himself. We're finally right on his doorstep.
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_05"); //That's right. Maybe he just wanted to get rid of you.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_06"); //And how many stalls are there now?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_07"); //Let me count... 1... 2... 3... 4. And me. Five, then.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_08"); //Thank you very much.
};

INSTANCE Info_Mod_Hans_BuergerKhoratas2 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_BuergerKhoratas2_Condition;
	information	= Info_Mod_Hans_BuergerKhoratas2_Info;
	permanent	= 1;
	important	= 0;
	description 	= "How many booths were there at the marketplace?";
};                       

FUNC INT Info_Mod_Hans_BuergerKhoratas2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hans_BuergerKhoratas))
	&& (Mod_REL_Buerger == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_BuergerKhoratas2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas2_15_00"); //How many booths were there at the marketplace?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas2_06_01"); //Jesus, you're not so good with counting, are you? Five booths, I said.
};

INSTANCE Info_Mod_Hans_Buerger (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Buerger_Condition;
	information	= Info_Mod_Hans_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description 	= "I'm looking for nails.";
};                       

FUNC INT Info_Mod_Hans_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Buerger_15_00"); //I'm looking for nails.
	AI_Output(self, hero, "Info_Mod_Hans_Buerger_06_01"); //Hmm, I still have a pack. Costs 50 gold, though.
};

INSTANCE Info_Mod_Hans_Kissen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kissen_Condition;
	information	= Info_Mod_Hans_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "You got anything other than guns?";
};                       

FUNC INT Info_Mod_Hans_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_00"); //You got anything other than guns?
	AI_Output(self, hero, "Info_Mod_Hans_Kissen_06_01"); //Actually, I don't. Except for molar fat.
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_02"); //Molar fat? Hmm... No, it stinks. Goodbye. Goodbye.
};

INSTANCE Info_Mod_Hans_Kimon (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kimon_Condition;
	information	= Info_Mod_Hans_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "How are you feeling?";
};                       

FUNC INT Info_Mod_Hans_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_00"); //How are you feeling?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_01"); //Bad as ever.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_02"); //Then you should drink the giver of joy.
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_03"); //With Adanos! I hate this stuff! Makes people around here crazy. But not with me.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_04"); //Do you know where I can get some?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_05"); //No. And get out of here. I don't need your advice.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_06"); //Excuse me, excuse me.
};

INSTANCE Info_Mod_Hans_Theodorus (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Theodorus_Condition;
	information	= Info_Mod_Hans_Theodorus_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Theodorus_Condition()
{
	if(Npc_KnowsInfo(hero, Info_Mod_Theodorus_Unruhen7))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Theodorus_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_00"); //What do you think you're doing, appointing this schwafler, this bum as the town governor?!
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_01"); //And why were you even allowed to decide that?
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_02"); //So that the decision doesn't depend on people like you.
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_03"); //Don't open your mouth so far, you hear me? Because of you and those wise guys, we're in deep shit!
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_04"); //I do not think there is much point in discussing this any further.
};

INSTANCE Info_Mod_Hans_Unruhen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Unruhen_Condition;
	information	= Info_Mod_Hans_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Unruhen_Condition()
{
	if (Mod_REL_Stadthalter == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_00"); //Oh, there you are. I wanted to congratulate you on your decision.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_01"); //I've known lucas for a long time, and he's a good boy. By the way, as his longtime friend, I got a few trade privileges.
	AI_Output(hero, self, "Info_Mod_Hans_Unruhen_15_02"); //(ironic) Of course.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_03"); //These privileges are supposed to make up for my disadvantages. Because of my eyes.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_04"); //I was able to top up my offer a little bit. Take a good look around.
};

INSTANCE Info_Mod_Hans_Freudenspender (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Freudenspender_Condition;
	information	= Info_Mod_Hans_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Would you like something to give you joy in the face of everyday life?";
};                       

FUNC INT Info_Mod_Hans_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Freudenspender_15_00"); //Would you like something to give you joy in the face of everyday life?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_01"); //You want to make fun of me?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_02"); //I don't take anything since a scoundrel squeezed the scavenger grounding.
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_03"); //And hey, you can do without it.
};

INSTANCE Info_Mod_Hans_Trade (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Trade_Condition;
	information	= Info_Mod_Hans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hans_Theodorus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hans_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hans_Pickpocket (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Pickpocket_Condition;
	information	= Info_Mod_Hans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Hans_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Hans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_BACK, Info_Mod_Hans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
};

FUNC VOID Info_Mod_Hans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hans_EXIT (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_EXIT_Condition;
	information	= Info_Mod_Hans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
