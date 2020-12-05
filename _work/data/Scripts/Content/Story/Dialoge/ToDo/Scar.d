INSTANCE Info_Mod_Scar_Belagerung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Belagerung_Condition;
	information	= Info_Mod_Scar_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "You made it through?";
};

FUNC INT Info_Mod_Scar_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_00"); //You made it through?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_01"); //Yeah, everything's fine. We have lost or been destroyed almost all weapons in battle.
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_02"); //Can I help you?
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_03"); //If you ask me, yes. There is a box in the library with instructions on how to make steel fighting staffs.
	AI_Output(self, hero, "Info_Mod_Scar_Belagerung_10_04"); //Get me the building instructions. But beware! Several undead novices have entrenched themselves there!
	AI_Output(hero, self, "Info_Mod_Scar_Belagerung_15_05"); //All right, all right.

	Wld_InsertNpc	(Mod_4009_UntoterNovize_10_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4010_UntoterNovize_11_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4011_UntoterNovize_12_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4012_UntoterNovize_13_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4013_UntoterNovize_14_MT, "LABYRINTH_71");
	Wld_InsertNpc	(Mod_4014_UntoterNovize_15_MT, "LABYRINTH_71");

	Log_CreateTopic	(TOPIC_MOD_BEL_STAEBE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Scar wants me to bring him out of the library with the building instructions for steel rods. However, I am to be careful of the undead novices there.");
};

INSTANCE Info_Mod_Scar_TruheMage (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_TruheMage_Condition;
	information	= Info_Mod_Scar_TruheMage_Info;
	permanent	= 0;
	important	= 0;
	description	= "I can't get the trunk open.";
};

FUNC INT Info_Mod_Scar_TruheMage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_Belagerung))
	&& (BEL_TruheMage == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_TruheMage_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_TruheMage_15_00"); //I can't get the trunk open. It seems to be protected by magic!
	AI_Output(self, hero, "Info_Mod_Scar_TruheMage_10_01"); //Shit, I forgot about that. I thought the building instructions were protected. Turn to Gomez, he knows about these things!

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Gomez will be able to help me with the locked chest, says Scar. I hope he's right.");
};

INSTANCE Info_Mod_Scar_HabBauanleitung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_HabBauanleitung_Condition;
	information	= Info_Mod_Scar_HabBauanleitung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here are the instructions.";
};

FUNC INT Info_Mod_Scar_HabBauanleitung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_HabDietrich))
	&& (Npc_HasItems(hero, ItWr_StahlkampfAnleitung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_HabBauanleitung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_00"); //Here are the instructions. I hope that was worth the effort.

	B_GiveInvItems	(hero, self, ItWr_StahlkampfAnleitung, 1);

	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_01"); //Thanks. Here's a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Scar_HabBauanleitung_15_02"); //All right, thank you.
	AI_Output(self, hero, "Info_Mod_Scar_HabBauanleitung_10_03"); //I'll have the guns forged now. Complete your tasks!

	B_GivePlayerXP	(800);

	B_LogEntry_More	(TOPIC_MOD_BEL_STAEBE, TOPIC_MOD_BEL_BELAGERUNG, "I handed over the building instructions to Scar and got a reward.", "I helped Scar now. Let's see if anyone else needs any help.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_STAEBE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_ToteNovizen (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_ToteNovizen_Condition;
	information	= Info_Mod_Scar_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have some questions for you.";
};

FUNC INT Info_Mod_Scar_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_00"); //I have some questions for you.
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_01"); //What's this about?
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_02"); //Two of our novices were found dead the last two nights. I have to find the killer before he gets anyone else.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_03"); //Have you seen anything?
	AI_Output(self, hero, "Info_Mod_Scar_ToteNovizen_10_04"); //Yeah, I heard some kind of fluttering last night. When I came out, there was nothing. That's all I know.
	AI_Output(hero, self, "Info_Mod_Scar_ToteNovizen_15_05"); //Well, thanks for the information.

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Scar heard a flutter, but when he came out there was no more to see.");
};

INSTANCE Info_Mod_Scar_Jagdtrophaeen_SollIch (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition;
	information	= Info_Mod_Scar_Jagdtrophaeen_SollIch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Myxir says you're having trouble with a hunter.";
};

FUNC INT Info_Mod_Scar_Jagdtrophaeen_SollIch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Scar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Jagdtrophaeen_SollIch_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Jagdtrophaeen_SollIch_15_00"); //Myxir says you're having trouble with a hunter.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_01"); //With Bartok, right. Rumor has it he's been enjoying himself in the red lantern all day.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_02"); //Who could blame him? There's dead women's pants in the camp.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_03"); //But don't change the fact that someone has to cut the horns of the shadow runners again. Otherwise, I'll sit here on dry land.
	AI_Output(self, hero, "Info_Mod_Scar_Jagdtrophaeen_SollIch_10_04"); //If you get him back to work, I'll make you good prices, I promise.

	Log_CreateTopic	(TOPIC_MOD_FAULERJÄGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar won't sell me his hunting trophies until I get his helper Bartok to go hunting again. Bartok spends most of his time in the city and there in the' Red Lantern'.");
};

INSTANCE Info_Mod_Scar_BartokArbeitetWieder (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_BartokArbeitetWieder_Condition;
	information	= Info_Mod_Scar_BartokArbeitetWieder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bartok is back at work.";
};

FUNc INT Info_Mod_Scar_BartokArbeitetWieder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bartok_ArbeiteWieder))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_BartokArbeitetWieder_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_BartokArbeitetWieder_15_00"); //Bartok is back at work.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_01"); //Thanks, you did me a big favor with that.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_02"); //From now on, I can sell you my hunting trophies.
	AI_Output(self, hero, "Info_Mod_Scar_BartokArbeitetWieder_10_03"); //Take this gold as a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_FAULERJÄGER, "Scar's selling me hunting trophies now. I hope he's got a shadow skater horn.");
	B_SetTopicStatus	(TOPIC_MOD_FAULERJÄGER, LOG_SUCCESS);

	CreateInvItems	(self, ItAt_ShadowHorn, 1);
	CreateInvItems	(self, ItAt_Claw, 5);
	CreateInvItems	(self, itat_LurkerSkin, 3);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Scar_AlteMineQuest (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest_Condition;
	information	= Info_Mod_Scar_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest))
	&& (Npc_IsDead(Mod_7713_DMR_Daemonenritter_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_00"); //Damn it, one of those lunatics again.
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest_15_01"); //What has happened?
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_02"); //Everybody's gone crazy in the mine.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_03"); //They just started killing each other, and now they're attacking us.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest_10_04"); //What the hell is going on?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlteMineQuest2_Condition;
	information	= Info_Mod_Scar_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNc INT Info_Mod_Scar_AlteMineQuest2_Condition()
{
	if (Mod_AMQ_Viper == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_00"); //You actually cleared the mine of the lunatics?
	AI_Output(hero, self, "Info_Mod_Scar_AlteMineQuest2_15_01"); //Yes, the spook has an end.
	AI_Output(self, hero, "Info_Mod_Scar_AlteMineQuest2_10_02"); //You're a hell of a guy. Here, take some trophies and a good sip of the reward.

	B_ShowGivenThings	("Demonic heart, black pearl, 3 skeletal bones and 2 pure alcohol preserved");

	CreateInvItems	(hero, ItAt_DemonHeart, 1);
	CreateInvItems	(hero, ItMi_DarkPearl, 1);
	CreateInvItems	(hero, ItAt_SkeletonBone, 3);
	CreateInvItems	(hero, ItMi_Alchemy_Alcohol_01, 2);

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scar_AlterFreund (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_AlterFreund_Condition;
	information	= Info_Mod_Scar_AlterFreund_Info;
	permanent	= 0;
	important	= 0;
	description	= "Well, old friend!";
};

FUNc INT Info_Mod_Scar_AlterFreund_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_AlterFreund_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_00"); //Well, old friend!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_01"); //Old friend?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_15_02"); //You don't recognize me? We were once the best mates!
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_10_03"); //Maybe so. I must have had too much to drink in the barrier. Can't remember anything. (laughs dirty)

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	if (Npc_HasItems(hero, ItFo_Beer) >= 2)
	{
		Info_AddChoice	(Info_Mod_Scar_AlterFreund, "Let's go back to the old days!", Info_Mod_Scar_AlterFreund_B);
	};

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "You promised me something back then...", Info_Mod_Scar_AlterFreund_A);
};

FUNC VOID Info_Mod_Scar_AlterFreund_B()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_B_15_00"); //Let's go back to the old days!

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_B_10_01"); //(confused) For my sake. To our friendship!

	B_UseItem	(hero, ItFo_Beer);
	B_UseItem	(self, ItFo_Beer);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_A()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_A_15_01"); //You promised me something back then...
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_A_10_02"); //That can't be a good thing.

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);

	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "You still owe me gold. I won a bet.", Info_Mod_Scar_AlterFreund_D);
	Info_AddChoice	(Info_Mod_Scar_AlterFreund, "You were gonna get me a gun.", Info_Mod_Scar_AlterFreund_C);
};

FUNC VOID Info_Mod_Scar_AlterFreund_D()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_00"); //You still owe me gold. I won a bet.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_01"); //Gold? Gold? I thought I was traded ore in the barrier?
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_D_15_02"); //I think so, yes.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_D_10_03"); //(laughs) Well, you can have my ore. Not much left anyway. And when you are satisfied...

	B_GiveInvItems	(self, hero, ItMi_Nugget, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

FUNC VOID Info_Mod_Scar_AlterFreund_C()
{
	AI_Output(hero, self, "Info_Mod_Scar_AlterFreund_C_15_00"); //You were gonna get me a gun.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_01"); //Hmm, if that's just it. I've had enough of that.
	AI_Output(self, hero, "Info_Mod_Scar_AlterFreund_C_10_02"); //Take these, and we'll be even!

	B_GiveInvItems	(self, hero, ItMw_1h_Mil_Sword, 1);

	Info_ClearChoices	(Info_Mod_Scar_AlterFreund);
};

INSTANCE Info_Mod_Scar_VieleSchwerter (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_VieleSchwerter_Condition;
	information	= Info_Mod_Scar_VieleSchwerter_Info;
	permanent	= 0;
	important	= 0;
	description	= "You carry a lot of swords around with you!";
};

FUNc INT Info_Mod_Scar_VieleSchwerter_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_VieleSchwerter_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_VieleSchwerter_15_00"); //You carry a lot of swords around with you!
	AI_Output(self, hero, "Info_Mod_Scar_VieleSchwerter_10_01"); //Yeah, they're heavy. But Andokai said I must be good for something, so I'm selling it now.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, "Scar deals in guns.");
};

INSTANCE Info_Mod_Scar_Befoerderung (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Befoerderung_Condition;
	information	= Info_Mod_Scar_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be a demon knight.";
};

FUNC INT Info_Mod_Scar_Befoerderung_Condition()
{
	if (Mod_Gilde == 15)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Scar_Befoerderung_15_00"); //I want to be a demon knight.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_01"); //Demon knights become only the best of us. But you've earned this rank.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_02"); //I will elevate you to the rank of Demon Knight.
	AI_Output(self, hero, "Info_Mod_Scar_Befoerderung_10_03"); //Here's your armour.

	CreateInvItems	(hero, ITAR_Raven_Addon, 1);

	AI_PrintScreen (ITAR_Raven_Addon.name, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 16;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Scar_Trade (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Trade_Condition;
	information	= Info_Mod_Scar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Scar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_VieleSchwerter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Scar_Pickpocket (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_Pickpocket_Condition;
	information	= Info_Mod_Scar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Scar_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_BACK, Info_Mod_Scar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Scar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Scar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
};

FUNC VOID Info_Mod_Scar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Scar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Scar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Scar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Scar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Scar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Scar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Scar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Scar_EXIT (C_INFO)
{
	npc		= Mod_518_SMK_Scar_MT;
	nr		= 1;
	condition	= Info_Mod_Scar_EXIT_Condition;
	information	= Info_Mod_Scar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Scar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
