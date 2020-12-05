INSTANCE Info_Mod_Ignaz_Hi (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Hi_Condition;
	information	= Info_Mod_Ignaz_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Ignaz_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_01"); //No one in particular - only in the dark does the bird plow.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_15_02"); //I see.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_03"); //A long time ago, someone said that to me! (laughs) Fatal, the mattress floats over cold wind.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_04"); //Do you have any more cash?

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "This is getting too stupid.", Info_Mod_Ignaz_Hi_B);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "You're out of your mind?", Info_Mod_Ignaz_Hi_A);
};

FUNC VOID Info_Mod_Ignaz_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_B_15_00"); //This is getting too stupid.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_A_15_00"); //You're out of your mind?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_A_14_01"); //They all call me crazy, from the maggot to the mule.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Why are you crazy?", Info_Mod_Ignaz_Hi_D);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Isn't there anything you can do about it?", Info_Mod_Ignaz_Hi_C);
};

FUNC VOID Info_Mod_Ignaz_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_00"); //Why are you crazy?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_01"); //I'm not crazy!
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_02"); //What then?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_03"); //I am infinitely wise! Think in the future and the past, in all imaginable dimensions - a delicious stew, this screw - cursed, take your eyes out of my cart!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_04"); //Seriousness is hard to take with your leg up.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_05"); //And where does this... infinite wisdom?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_06"); //You, only the Philosopher's Stone can help the athlete's foot.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_07"); //You found him, the Philosopher's Stone?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_08"); //Found it? Brewed, eaten, digested, shit! Ahahaha!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_09"); //Seriously, my brother's running into the abyss.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_10"); //Who's your brother?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_11"); //Constantino, the travelling traveler.... the traveling driver? Hopefully there'll be meatballs.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_12"); //Constantino is your brother?!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_13"); //A twin star, the miners say.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_14"); //And what do you mean, he's walking into the abyss?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_15"); //Playing ball is fun.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_16"); //The infinite wisdom seems to overtax you.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_17"); //For me and my three cats this is no problem.

	Mod_Ignaz_Bruder = 1;

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_C_15_00"); //Isn't there anything you can do about it?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_01"); //Why? In particular, it is very practical to be crazy. Actually, it's crazy not to be crazy. (laughs omitted, then immediately sober again)
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_02"); //I don't understand that now.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Why are you crazy?", Info_Mod_Ignaz_Hi_D);
};

INSTANCE Info_Mod_Ignaz_Handel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Handel_Condition;
	information	= Info_Mod_Ignaz_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you selling alchemy supplies?";
};

FUNC INT Info_Mod_Ignaz_Handel_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Handel_15_00"); //Are you selling alchemy supplies?
	AI_Output(self, hero, "Info_Mod_Ignaz_Handel_14_01"); //Yeah, yeah, it's all over here. Or am I mistaken?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Ignaz can sell me potions.");
};

INSTANCE Info_Mod_Ignaz_Lehrer (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Lehrer_Condition;
	information	= Info_Mod_Ignaz_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me something?";
};

FUNC INT Info_Mod_Ignaz_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_00"); //Can you teach me something?
	AI_Output(self, hero, "Info_Mod_Ignaz_Lehrer_14_01"); //I can show you how to place your ten mages on the field to win! And how you make spell rolls!
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_02"); //Then you better show me the one with the spell rolls.
};

INSTANCE Info_Mod_Ignaz_Irdorath (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Irdorath_Condition;
	information	= Info_Mod_Ignaz_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello Master of alchemy, potions and botany.";
};

FUNC INT Info_Mod_Ignaz_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_00"); //Hello Master of alchemy, potions and botany, I wanted to...
	AI_Output(self, hero, "Info_Mod_Ignaz_Irdorath_14_01"); //Drinks and plants? No, I am especially familiar with saying roles and animal components...
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_02"); //Oh, it's done.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Ignaz is not the alchemist I'm looking for...");
};

INSTANCE Info_Mod_Ignaz_Amulett (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Amulett_Condition;
	information	= Info_Mod_Ignaz_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's happened to you?";
};

FUNC INT Info_Mod_Ignaz_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_GotoIgnaz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_00"); //What's happened to you?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_01"); //(groans) Mä.... Men! novices they have me.... stolen from and beaten....
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_02"); //What did they steal?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_03"); //An old amulet!
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_04"); //The amulet? Where were they going with that?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_05"); //A stone circle.... large forest.... ritualistic
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_06"); //What's the matter, old man?

	Wld_InsertNpc	(Mod_1995_UntoterNovize_01_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1996_UntoterNovize_02_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1997_UntoterNovize_03_NW, "BIGFARM");

	Wld_InsertItem	(ItAm_GardeInnos, "FP_TROLLAREA_RITUAL_ITEM");

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Ignaz is near death and the amulet was stolen by novices. They seem to be at a stone circle in a large forest.");
};

INSTANCE Info_Mod_Ignaz_MangelQuest (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_MangelQuest_Condition;
	information	= Info_Mod_Ignaz_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Buy fungicide (80 Gold)";
};

FUNC INT Info_Mod_Ignaz_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Ignaz_Flugblaetter (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Flugblaetter_Condition;
	information	= Info_Mod_Ignaz_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a flyer for you.";
};

FUNC INT Info_Mod_Ignaz_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Flugblaetter_15_00"); //I've got a flyer for you.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_01"); //Oh, thank you. Thank you. Let's see....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_02"); //Ah yes. Maybe I'll stop by Matteo's.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Ignaz_Anschlagtafel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Anschlagtafel_Condition;
	information	= Info_Mod_Ignaz_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Ignaz_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Ignaz == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Pitch) >= Mod_Anschlagtafel_Khorinis_Ignaz_Pech)
	&& (Npc_HasItems(hero, ItMi_Coal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Kohle)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= Mod_Anschlagtafel_Khorinis_Ignaz_Quartz)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall)
	&& (Npc_HasItems(hero, ItWr_Paper) >= Mod_Anschlagtafel_Khorinis_Ignaz_Papier)
	&& (Npc_HasItems(hero, ItAt_Sting) >= Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen)
	&& (Npc_HasItems(hero, ItAt_SpiderMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen)
	&& (Npc_HasItems(hero, ItAt_BugMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen)
	&& (Npc_HasItems(hero, ItSc_Sleep) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber)
	&& (Npc_HasItems(hero, ItSc_Charm) >= Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber)
	&& (Npc_HasItems(hero, ItSc_Fear) >= Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel)
	{
		Npc_RemoveInvItems	(hero, ItMi_Pitch, Mod_Anschlagtafel_Khorinis_Ignaz_Pech);
		Npc_RemoveInvItems	(hero, ItMi_Coal, Mod_Anschlagtafel_Khorinis_Ignaz_Kohle);
		Npc_RemoveInvItems	(hero, ItMi_Quartz, Mod_Anschlagtafel_Khorinis_Ignaz_Quartz);
		Npc_RemoveInvItems	(hero, ItMi_RockCrystal, Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall);
		Npc_RemoveInvItems	(hero, ItWr_Paper, Mod_Anschlagtafel_Khorinis_Ignaz_Papier);
		Npc_RemoveInvItems	(hero, ItAt_Sting, Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel);
		Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen);
		Npc_RemoveInvItems	(hero, ItAt_SpiderMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen);
		Npc_RemoveInvItems	(hero, ItAt_BugMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen);
		Npc_RemoveInvItems	(hero, ItAt_GoblinBone, Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen);
		Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen);
		Npc_RemoveInvItems	(hero, ItSc_Sleep, Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber);
		Npc_RemoveInvItems	(hero, ItSc_Charm, Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber);
		Npc_RemoveInvItems	(hero, ItSc_Fear, Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber);
		Npc_RemoveInvItems	(hero, ItMi_Sulfur, Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Ignaz_Gold);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Ignaz = 0;
		Mod_Anschlagtafel_Khorinis_Ignaz_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Ignaz, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Ignaz_LearnScrolls (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_LearnScrolls_Condition;
	information	= Info_Mod_Ignaz_LearnScrolls_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString ("produce idlers", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));
};

FUNC INT Info_Mod_Ignaz_LearnScrolls_Condition()
{
	Info_Mod_Ignaz_LearnScrolls.description = B_BuildLearnString ("produce idlers", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Lehrer))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SCROLLS) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_LearnScrolls_Info()
{
	if (B_TeachPlayerTalentScrolls(self, hero, 1))
	{
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_00"); //To create a spell roll you first need a rune of the respective magic direction.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_01"); //You can practice the effect of the rune on a piece of paper using rune stone and the ingredients of the spell.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_02"); //However, you can make a rune not only a spell, but also a stronger one, but you will need the recipe and all the ingredients of each intermediate step.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_03"); //So if you want to create a fireball roll, you need everything you need for the fireball roll as well as everything you need for a fire arrow.
	};
};

INSTANCE Info_Mod_Ignaz_Trade (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Trade_Condition;
	information	= Info_Mod_Ignaz_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Ignaz_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Handel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Ignaz_Pickpocket (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Pickpocket_Condition;
	information	= Info_Mod_Ignaz_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ignaz_Pickpocket_Condition()
{
	C_Beklauen	(43, ItPl_Temp_Herb, 3);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_BACK, Info_Mod_Ignaz_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ignaz_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ignaz_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ignaz_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ignaz_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ignaz_EXIT (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_EXIT_Condition;
	information	= Info_Mod_Ignaz_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ignaz_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
