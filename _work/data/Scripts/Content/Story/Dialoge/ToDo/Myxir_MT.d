INSTANCE Info_Mod_Myxir_Irdorath (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath_Condition;
	information	= Info_Mod_Myxir_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to go with a ship to an enclave of Xeres to...";
};

FUNC INT Info_Mod_Myxir_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_00"); //I want to go with a ship to an enclave of Xeres to...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_01"); //What, in a region of deep darkness, heinous blasphemy....
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_02"); //Well, it's about saving the...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_03"); //(interrupts without listening) and artifacts of dark magic? Wonderful.
};

INSTANCE Info_Mod_Myxir_Irdorath2 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath2_Condition;
	information	= Info_Mod_Myxir_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ohh, I happen to have a seat on board...";
};

FUNC INT Info_Mod_Myxir_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath2_15_00"); //(surprised) Ohh, I happen to have a seat on board...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath2_28_01"); //Great, I'll go to the harbour then.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Well, I didn't need too much persuasion with Myxir.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_Irdorath3 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath3_Condition;
	information	= Info_Mod_Myxir_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Maybe I could still have a seat on board.";
};

FUNC INT Info_Mod_Myxir_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath3_15_00"); //Maybe I could still have a seat on board. However, the costs for this undertaking are considerable...
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_01"); //Oh, gold can't outweigh the opportunity it offers.
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_02"); //Here, I think this should do justice to the expenses.

	B_ShowGivenThings	("300 gold, spell roll, 2 bottles of blood and 4 zombie flesh preserved");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItSc_Armyofdarkness, 1);
	CreateInvItems	(hero, ItPo_Blood, 2);
	CreateInvItems	(hero, ItFoMuttonZombie, 4);

	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_03"); //I will then go to the harbour.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Well, I didn't need too much persuasion with Myxir.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_GotoIgnaz (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_GotoIgnaz_Condition;
	information	= Info_Mod_Myxir_GotoIgnaz_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_GotoIgnaz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_HabAxt))
	&& ((Mod_Gilde == 13)
	|| (Mod_Gilde == 15))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_GotoIgnaz_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_00"); //Ah, you're convenient for me. I'd have something to do for you!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_01"); //(sighs) What is it this time?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_02"); //I'm looking for a valuable piece of jewelry; an ancient amulet filled with the power of Inno.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_03"); //We might be able to blackmail the monastery and learn valuable information about its magic!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_04"); //Where do you want me to start looking?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_05"); //The amulet is said to have been bought by an old confused alchemist some time ago. The fool's name is Ignaz. He lives in the harbour district of the city of Khorini.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_06"); //Go to him and bring the artifact to me!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_07"); //What am I supposed to do with Ignaz?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_08"); //It's in your hands!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_09"); //Good.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_10"); //(strength) Now go!

	Mod_584_NONE_Ignaz_NW.attribute[ATR_HITPOINTS] = 1;

	Log_CreateTopic	(TOPIC_MOD_BEL_SUCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Myxir wants me to get him an old amulet of Ignaz.");
};

INSTANCE Info_Mod_Myxir_Amulett (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Amulett_Condition;
	information	= Info_Mod_Myxir_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have the amulet.";
};

FUNC INT Info_Mod_Myxir_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UntoterNovize_01_Hi))
	&& (Npc_HasItems(hero, ItAm_GardeInnos) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_00"); //I have the amulet.

	B_GiveInvItems	(hero, self, ItAm_GardeInnos, 1);

	Npc_RemoveInvItems	(self, ItAm_GardeInnos, 1);

	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_01"); //Why is it open?
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_02"); //Several undead novices have taken it from Ignaz and murdered him. I followed them to a stone circle in the big forest, where they held a ritual.
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_03"); //One of the undead sloshed that the old guard had returned and wanted to destroy Beliar.
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_04"); //What? What? This is a disaster. Go to Xardas now and report to him!
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_05"); //Why?
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_06"); //Now!

	B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "GARDEINNOS");

	Log_CreateTopic	(TOPIC_MOD_BEL_GARDEINNOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_GARDEINNOS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_BEL_SUCHE, TOPIC_MOD_BEL_GARDEINNOS, "I brought the amulet to Myxir.", "Myxir sent me to Xardas. The situation with the Innos Guard seems to be serious.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Wein (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Wein_Condition;
	information	= Info_Mod_Myxir_Wein_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm supposed to deliver this wine from the monastery.";
};

FUNC INT Info_Mod_Myxir_Wein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Npc_HasItems(hero, ItFo_KWine) >= 10)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Wein_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_00"); //I'm supposed to deliver this wine from the monastery.

	B_GiveInvItems	(hero, self, ItFo_KWine, 10);
	Npc_RemoveInvItems	(self, ItFo_KWine, 10);

	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_01"); //Ah yes, the supplies. It's gonna be another merry warrior binge tonight. Corrosive.
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_02"); //Did I do something wrong?
	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_03"); //Is that what I said? You can remove yourself now.

	B_LogEntry	(TOPIC_MOD_ANDOKAI_WEIN, "I delivered the wine shipment to Myxir. He wasn't really happy, but that's not my problem.");
	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Myxir_HabDieKraeuter (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_HabDieKraeuter_Condition;
	information	= Info_Mod_Myxir_HabDieKraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Yours sincerely from Bodo.";
};

FUNC INT Info_Mod_Myxir_HabDieKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bodo_Krautlieferung))
	&& (Npc_HasItems(hero, MyxirsGiftpflanze) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_HabDieKraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_00"); //Yours sincerely from Bodo.

	var int kraeuter;
	kraeuter = Npc_HasItems(hero, MyxirsGiftpflanze);
	
	B_GiveInvItems	(hero, self, MyxirsGiftpflanze, Npc_HasItems(hero, MyxirsGiftpflanze));

	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_01"); //He can spare them! The main thing is that he's found everything I need.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_02"); //(short pause, angry) I thought so! This loafer has made it easy again!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_03"); //I have expressly mentioned ten healing buds, and he sends me herbs!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_04"); //I could have collected that myself. Besides, he forgot the five twin spikes!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_05"); //How am I supposed to make progress with my research?
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_06"); //I'm sorry to hear that. But are you trading with me now?
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_07"); //Not until I get the twisted plants!
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_08"); //That wasn't our deal, though.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_09"); //What do I care about any arrangement, huh?

	B_GivePlayerXP	(5 * kraeuter);

	Npc_RemoveInvItems	(self, MyxirsGiftpflanze, Npc_HasItems(hero, MyxirsGiftpflanze));

	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Bodo did a lot of slurping when delivering the plants. Myxir is missing 10 healing buds and 5 twin spines, so that he will hopefully be put in a more gracious mood.");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_RestPflanzen (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_RestPflanzen_Condition;
	information	= Info_Mod_Myxir_RestPflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Your shipment should be complete by now.";
};

FUNC INT Info_Mod_Myxir_RestPflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 10)
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_RestPflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_RestPflanzen_15_00"); //Your shipment should be complete by now.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 10);
	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 5);

	B_ShowGivenThings	("10 healing buds and 5 twin spines given");

	AI_Output(self, hero, "Info_Mod_Myxir_RestPflanzen_28_01"); //Finally! And my hair isn't even completely grey!

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Skinner (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Skinner_Condition;
	information	= Info_Mod_Myxir_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have something here that you'll be eagerly awaiting.";
};

FUNC INT Info_Mod_Myxir_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 20)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 14)
	&& (Npc_HasItems(hero, ItAt_SkeletonHead) >= 4)
	&& (Npc_HasItems(hero, ItMi_Addon_Bloodwyn_Kopf) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 17)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 12)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_00"); //Lord of the demonic powers. I have something here that you'll be eagerly awaiting.

	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 20);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 14);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonHead, 4);
	Npc_RemoveInvItems	(hero, ItMi_Addon_Bloodwyn_Kopf, 2);
	Npc_RemoveInvItems	(hero, ItPo_Blood, 17);
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 12);
	Npc_RemoveInvItems	(hero, ItAt_DemonHeart, 1);

	B_ShowGivenThings	("Demonic stuff given");

	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_01"); //Wonderful. At Beliar's, I'll be able to use it to advance my loathsome work.
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_02"); //What does it look like.... ?
	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_03"); //What? Why are you bothering me? Oh, your reward. The finder of these relics of death and the dark powers is truly worthy of these rulers.

	CreateInvItems	(hero, ItSc_SumWolf, 1);
	CreateInvItems	(hero, ItSc_SumDemon, 1);
	CreateInvItems	(hero, ItSc_SumGol, 1);

	B_ShowGivenThings	("Preserving sayings roles");

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "I visited Myxir and got the spell rolls.");
};

INSTANCE Info_Mod_Myxir_Befoerderung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Befoerderung_Condition;
	information	= Info_Mod_Myxir_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be a demon charmer.";
};

FUNC INT Info_Mod_Myxir_Befoerderung_Condition()
{
	if (Mod_Gilde == 13)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Befoerderung_15_00"); //I want to be a demon charmer.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_01"); //(assessing) For my sake. You've already served Beliar well. You have acquired his favor.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_02"); //I will elevate you to the rank of demon summoner.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_03"); //Here's your robe.

	CreateInvItems	(self, ITAR_Xardas, 1);
	B_GiveInvItems	(self, hero, ITAR_Xardas, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Xardas);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 14;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Myxir_WieGehts (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_WieGehts_Condition;
	information	= Info_Mod_Myxir_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, how you doing?";
};

FUNC INT Info_Mod_Myxir_WieGehts_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_WieGehts_15_00"); //Hey, how you doing?
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_01"); //Don't look so friendly to me like we've known each other forever!
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_02"); //It may work for the others, but it doesn't work for me.
};

INSTANCE Info_Mod_Myxir_Haendler (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Haendler_Condition;
	information	= Info_Mod_Myxir_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "My gut feeling tells me you're a born merchant.";
};

FUNC INT Info_Mod_Myxir_Haendler_Condition()
{
	if (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_00"); //My gut feeling tells me you're a born merchant.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_01"); //In fact, I offer one or two goods for sale.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_02"); //Are you trading with me?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_03"); //I sell to anyone who's ever done me a favor...

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Info_AddChoice	(Info_Mod_Myxir_Haendler, "It's the same old story again. Not with me!", Info_Mod_Myxir_Haendler_B);
	Info_AddChoice	(Info_Mod_Myxir_Haendler, "And what could such a favor look like?", Info_Mod_Myxir_Haendler_A);
};

FUNC VOID Info_Mod_Myxir_Haendler_B()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_B_15_00"); //It's the same old story again. Not with me!

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);
};

FUNC VOID Info_Mod_Myxir_Haendler_A()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_00"); //And what could such a favor look like?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_01"); //I had sent Bodo out to collect some herbs.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_02"); //At Xardas' request, however, he has now stayed in Khorinis to find out about the current situation there. And I'm waiting for my plants.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_03"); //I'll remember that when I see him.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_04"); //You should be. The supply to the monastery is already working very badly anyway, so I don't need any more delays.

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Log_CreateTopic	(TOPIC_MOD_GIFTPFLANZEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "If I want to trade with Myxir, I have to do him a favor first: Bodo in the city has a delivery of plants that Myxir is waiting for.");

	Mod_MyxirsKraeuter = 0;
	Mod_KenntBodo = 1;

	Mod_MyxirsAuftragOK = 1;
};

INSTANCE Info_Mod_Myxir_Schattenlaeuferhorn (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Schattenlaeuferhorn_Condition;
	information	= Info_Mod_Myxir_Schattenlaeuferhorn_Info;
	permanent	= 0;
	important	= 0;
	description	= "You mentioned earlier that the care of the monastery (.... )";
};

FUNC INT Info_Mod_Myxir_Schattenlaeuferhorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Schattenlaeuferhorn_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Schattenlaeuferhorn_15_00"); //You mentioned earlier that the monastery's supplies are stagnating.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_01"); //Yeah, that's mainly because of our unreliable messenger.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_02"); //Scar can tell you a thing or two about it.
};

INSTANCE Info_Mod_Myxir_Scar (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Scar_Condition;
	information	= Info_Mod_Myxir_Scar_Info;
	permanent	= 0;
	important	= 0;
	description	= "What about Scar?";
};

FUNC INT Info_Mod_Myxir_Scar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Schattenlaeuferhorn))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Scar_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Scar_15_00"); //What about Scar?
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_01"); //He trades not only with swords, but also with trophies.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_02"); //But Bartok, whom he sent, is no longer around.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_03"); //Maybe he defected, who knows?
};

INSTANCE Info_Mod_Myxir_Ruestung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Ruestung_Condition;
	information	= Info_Mod_Myxir_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can I get better armor from you?";
};

FUNC INT Info_Mod_Myxir_Ruestung_Condition()
{
	if (Mod_Gilde == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_15_00"); //Can I get better armor from you?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 13)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_28_01"); //I've heard that on the way to the water magician's excavation site there is supposed to be a nightmare. With its fur I could certainly improve your black magic robe a little bit.
	
		Mod_ZweiteVerbesserung = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "On the way to the water magician's excavation site there will be a nightmare, whose fur Myxir can use to improve my black magic robe.");
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
	Info_AddChoice	(Info_Mod_Myxir_Ruestung, DIALOG_BACK, Info_Mod_Myxir_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 13)
	{
		Info_AddChoice	(Info_Mod_Myxir_Ruestung, "Improve Black Mage Robe", Info_Mod_Myxir_Ruestung_KDS_S);
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

FUNC VOID Info_Mod_Myxir_Ruestung_KDS_S ()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_KDS_S_15_00"); //Enhance my black magic robe.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, SChwarzmagierrobe) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_KDS_S_28_01"); //All clear.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, SChwarzmagierrobe, 1);

		CreateInvItems	(self, ItAr_KDS_S, 1);

		B_GiveInvItems	(self, hero, ItAr_KDS_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_KDS_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, Schwarzmagierrobe) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_02"); //You must have a black magic robe or I won't be able to fix it for you.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_03"); //If you don't have the nightmare coat, I can't improve your robe.
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

INSTANCE Info_Mod_Myxir_Lehrer (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Lehrer_Condition;
	information	= Info_Mod_Myxir_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me something?";
};

FUNC INT Info_Mod_Myxir_Lehrer_Condition()
{
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Myxir_Lehrer_28_01"); //I can show you how to draw blood from the people you killed.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Myxir can show me how to draw blood from dead people.");
};

INSTANCE Info_Mod_Myxir_Blut (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Blut_Condition;
	information	= Info_Mod_Myxir_Blut_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me how to draw people's blood! (1 LP)";
};

FUNC INT Info_Mod_Myxir_Blut_Condition()
{
	Info_Mod_Myxir_Blut.description = B_BuildLearnString("Teach me how to draw people's blood!", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Blood));

	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Lehrer))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood] == FALSE)
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Blut_Info()
{
	AI_Output (hero, self, "Info_Mod_Myxir_Blut_15_00"); //Teach me how to draw people's blood!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Blood))
	{
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_01"); //Good. Listen. It's basically quite simple.
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_02"); //You take a sharp blade and cut your victim somewhere, preferably on the aorta. Then you hold a bottle underneath and collect the blood.
	};
};

INSTANCE Info_Mod_Myxir_Trade (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Trade_Condition;
	information	= Info_Mod_Myxir_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Myxir_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Myxir_Pickpocket (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Pickpocket_Condition;
	information	= Info_Mod_Myxir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Myxir_Pickpocket_Condition()
{
	C_Beklauen	(100, ItPl_Speed_Herb_01, 3);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_BACK, Info_Mod_Myxir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Myxir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Myxir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Myxir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Myxir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Myxir_EXIT (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_EXIT_Condition;
	information	= Info_Mod_Myxir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
