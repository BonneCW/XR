INSTANCE Info_Mod_Darrion_Hi (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hi_Condition;
	information	= Info_Mod_Darrion_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_00"); //Welcome to my forge.
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_01"); //If you need a sword, you can get it from me.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Darrion sells weapons.");
};

INSTANCE Info_Mod_Darrion_Urs (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs_Condition;
	information	= Info_Mod_Darrion_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Blacksmith, here's your blessed steel.";
};

FUNC INT Info_Mod_Darrion_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_ErzpaketDarrion) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_00"); //Blacksmith, here's your blessed steel.

	B_GiveInvItems	(hero, self, ItMi_ErzpaketDarrion, 1);

	Npc_RemoveInvItems	(self, ItMi_ErzpaketDarrion, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_01"); //(sceptical) Really? Well, I'll try that first.

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_02"); //So the blade would be done. I'm taking it to Gor Na Ran now.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_03"); //Let him try them on the obsessed plants that are currently shooting out of the ground like weeds.
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_04"); //Possessed plants?
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_05"); //Well, a little experiment that got out of hand.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_06"); //The Baals had tried to increase the bogweed harvest by magically influencing the herb.... with spells not unlike incantations.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_07"); //Unfortunately, the whole thing took uncontrolled, demonic excesses.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_08"); //The possessed herb is extremely aggressive and persistent. As soon as you have finished a plant with difficulty, you start shooting up a new one somewhere else.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_09"); //If the steel really does have the ability to ban demonic powers, it will make the Templars' task much easier.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_10"); //Now, follow me.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOGORNARAN");
};

INSTANCE Info_Mod_Darrion_Urs2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs2_Condition;
	information	= Info_Mod_Darrion_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaRan_Urs2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_00"); //Well, this impressive demonstration of the steel is enough for me. It's worth every cabbage stalk in this package here.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_01"); //Oh, take these stems here as a bonus... something to smoke for on the way.

	CreateInvItems	(hero, ItMi_Addon_Joint_02, 3);
	CreateInvItems	(hero, ItMi_Traumruf, 3);

	B_ShowGivenThings	("3 Black Wise Men and 3 Dream Call received");

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_02"); //Thanks. I hope you've learned something from this.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_03"); //Of course, of course. We'll never do that again. There must be better ways to increase the herb harvest.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_04"); //Some of our boys are currently on the road all over Khorinis and are testing the growth of the plants on magically influenced soils.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_05"); //(to himself) Well, that's not exactly what I meant. But what the hell.
	AI_Output(self, hero, "DEFAULT"); //

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Well, I'd have the weed package from the swamp camp.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Hueterklinge (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hueterklinge_Condition;
	information	= Info_Mod_Darrion_Hueterklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Forge me a Keeper's Blade!";
};

FUNC INT Info_Mod_Darrion_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Hueterklinge_15_00"); //Forge me a Keeper's Blade!
	AI_Output(self, hero, "Info_Mod_Darrion_Hueterklinge_13_01"); //Do you have all the ingredients?

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);

	Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, DIALOG_BACK, Info_Mod_Darrion_Hueterklinge_BACK);

	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(pick the wrong ingredients)", Info_Mod_Darrion_Hueterklinge_B2);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01_Reisfresser) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger_Blut) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw_Scav) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(add the right ingredients)", Info_Mod_Darrion_Hueterklinge_A2);
		};
	}
	else
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(pick the wrong ingredients)", Info_Mod_Darrion_Hueterklinge_B1);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette_Stonehenge) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone_Herrscher) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth_Wolf) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(add the right ingredients)", Info_Mod_Darrion_Hueterklinge_A1);
		};
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "I had Darrion forge a false Keeper's Blade for me. I'm supposed to go to Cor Angar and introduce myself.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01_Reisfresser, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger_Blut, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw_Scav, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "I had Darrion forge a guardian's blade for me. I'm supposed to go to Cor Angar and introduce myself.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "I had Darrion forge a false Keeper's Blade for me. I'm supposed to go to Cor Angar and introduce myself.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette_Stonehenge, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone_Herrscher, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth_Wolf, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "I had Darrion forge a guardian's blade for me. I'm supposed to go to Cor Angar and introduce myself.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

INSTANCE Info_Mod_Darrion_Sumpfmensch (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fortuno told me you saw the howling swamp people.";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_00"); //Fortuno told me you saw the howling swamp people.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_01"); //Yes, I did, and it almost cost me my life! I don't know which God to thank, but the fact that I'm still alive is bordering on a miracle.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_02"); //Where did you meet him?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_03"); //Deep in the swamp. I used to plant special bog weed there, which just doesn't thrive in the peripheral areas.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_04"); //A few weeks ago, when I wanted to see what was right there, this creature suddenly stood in front of me. I almost shit my pants!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_05"); //Even I felt like a little girl!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_06"); //I told the others and I'll tell you: If you ever run into this monster, put your legs in your hand and run!

	B_StartOtherRoutine	(Mod_951_PSINOV_Fortuno_MT, "START");
	B_StartOtherRoutine	(Mod_1339_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_2008_PSINOV_Ghorim_MT, "START");
	B_StartOtherRoutine	(Mod_1337_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1336_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1338_PSINOV_Novize_MT, "START");

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Where in the swamp did you plant your bog weed?", Info_Mod_Darrion_Sumpfmensch_C);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "You went to sea earlier?", Info_Mod_Darrion_Sumpfmensch_B);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "What special bog weed did you plant there?", Info_Mod_Darrion_Sumpfmensch_A);
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_C()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_C_15_00"); //Where in the swamp did you plant your bog weed?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_C_11_01"); //Somewhere far inside, but don't come up with the idea of looking for it, boy, I'll say it again: the creature is dangerous, it's gonna rip your ass off!
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_B()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_00"); //You went to sea earlier?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_01"); //I used to be a pirate, boy! And what a guy!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_02"); //Why did you leave the pirates?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_03"); //I was tired of being a pirate, boy.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_04"); //And here? Here I stomp a little bit during the day so that my muscles don't get rusty, smoke a little swamp herb and let the sun shine on my stomach for the rest of the day.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_05"); //Now leave me alone.

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	AI_StopProcessInfos	(self);
	
	B_StartOtherRoutine(Mod_3001_PSINOV_Balor_MT, "ATDARRION");
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_A()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_A_15_00"); //What special bog weed did you plant there?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_01"); //That was something really nice, I dug it out of the big swamp that is a little bit away from the pirate bay and brought it with me.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_02"); //Had to haunt some pretty ugly beasts to get to it.
};

INSTANCE Info_Mod_Darrion_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch2_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch2_Info()
{
	AI_TurnAway(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_00"); //(to himself) Could it be that he...? No no no no, completely excluded, absolutely impossible!!!! He would never-- but what if it is? Can it be that he...?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_01"); //Why so nervous?
	
	AI_TurnToNpc(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_02"); //What?! Well, uh.... nervous? What makes you think that? (forced laughter)
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_03"); //What's going on?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_04"); //What's going on? What's going on? (Forced laughter) Nothing, nothing at all, but I just remembered that I still have the tea by the fire, I better hurry!
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch3 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch3_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na. Slept late?";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_00"); //Na. Slept late?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_01"); //I heard you were with the pirates...
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_02"); //Yeah. And I've learned some interesting things from them.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_03"); //Since I can't find my old key anywhere else, I guess you've learned quite a lot, have you?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_04"); //Enough anyway. I know you only came here to find a good place for your herb.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_05"); //And I guess the leaves you were after weren't the only one that grew out of the plant, were they?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_06"); //(sighing deeply) Yes, you're right. The howling swamp man is actually a swamp golem. He's driven by the plant.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_07"); //At first I thought it was just a strange root, but at some point the little Golem stood in front of me and looked at me with big, fearful eyes.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_08"); //I know I should have slaughtered the beast directly, but I didn't put it over my saltwater-soaked heart.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_09"); //I let the little guy go, but he didn't walk away from me in the swamp. Eventually I resigned myself to it.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_10"); //It may sound strange, but I think we've made some sort of friendship.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_11"); //I knew the Templars would slaughter this Golem at first contact, so I told them all the story of howling swamp people to keep them away from the swamp.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_12"); //But then he suddenly started attacking people. When I wanted to go to the swamp to see what was going on with him, he just knocked me down.... and I hear you did the same thing to him.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_13"); //I wouldn't be sure of that. I was also with the hermit who translated the book for you.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_14"); //He asked me to tell you that the plant should be somehow related to five marsh giants.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_15"); //You believe... which means.... that means there are more golems than just mine?!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_16"); //That's what it's supposed to mean. And it was probably the other four who attacked the people and you.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_17"); //Five marsh giants... one of them you've already flattened and one of them is harmless. Then there's three pieces left. I'll get them!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_18"); //I'm coming with you.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_19"); //I owe you one.
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "GUIDETOFLOWER");
	B_StartOtherRoutine(Mod_2013_PSINOV_Joru_MT, "START");
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_02, "PATH_TAKE_HERB_022");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch4 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch4_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Sumpfmensch3))
	&& (Npc_GetDistToWP(hero, "OW_PATH_BLOODFLY11_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_00"); //This is the plant. Maybe we should split up. You go straight ahead, I'll explore the surroundings here.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_01"); //All right, all right.
	
	AI_StopProcessInfos(self);
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_03, "FP_ROAM_OW_BLOODFLY_12_02");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch5 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch5_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Sumpfmensch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_00"); //Thanks. I'm deeply indebted to you. (Roger howls) Darrion laughs. Yes, and Roger, of course.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_01"); //Here. It's not much, but let me give it to you as a token of my gratitude. It is the tobacco from the last leaf of the Golem plant. Maybe you can do something with it.
	
	B_GiveInvItems(self, hero, ItMi_SumpfTabak, 1);
	
	AI_StopProcessInfos(self);
	
	B_GivePlayerXP(500);
	
	B_SetTopicStatus(TOPIC_MOD_SL_SUMPFMENSCH, LOG_SUCCESS);
};

INSTANCE Info_Mod_Darrion_Trade (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Trade_Condition;
	information	= Info_Mod_Darrion_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Darrion_Pickpocket (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Pickpocket_Condition;
	information	= Info_Mod_Darrion_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Darrion_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_BACK, Info_Mod_Darrion_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Darrion_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Darrion_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Darrion_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Darrion_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Darrion_EXIT (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_EXIT_Condition;
	information	= Info_Mod_Darrion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Darrion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
