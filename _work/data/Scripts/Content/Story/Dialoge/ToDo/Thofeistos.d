INSTANCE Info_Mod_Thofeistos_Hi (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Hi_Condition;
	information	= Info_Mod_Thofeistos_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello. Are you the blacksmith here?";
};

FUNC INT Info_Mod_Thofeistos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_00"); //Hello. Are you the blacksmith here?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_01"); //No, I'm just heating up the den properly. What else was I supposed to do at the blacksmith's?!
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_02"); //Sorry, just a question.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_03"); //Yeah, a pretty stupid one. Well, that's about it. No hard feelings. There is a lot to do for me here, more than I had originally expected when I joined the camp.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_04"); //Where are you from and why did you join the New Camp after the fall of the barrier?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_05"); //Originally I came from the north of the mainland. I heard about the big ore deposits on Khorinis and so I made my way to this island.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_06"); //After the fall of the barrier, I did not hesitate for a second and went down to the valley, to the actual source of the ore.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_07"); //So much magical ore that I can shape at my will, fathom new alloys, create compositions of metal that have never existed before.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_08"); //Yeah, I hear it's a blacksmith with a lot of soul.
};

INSTANCE Info_Mod_Thofeistos_Orksoeldner (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Orksoeldner_Condition;
	information	= Info_Mod_Thofeistos_Orksoeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a gun for me?";
};

FUNC INT Info_Mod_Thofeistos_Orksoeldner_Condition()
{
	if (Mod_Gilde == 19)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Orksoeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Do you have a gun for me?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_01"); //Well, actually, since you're one of the Orc hunters now...
	AI_Output(hero, self, "Info_Mod_Thofeistos_Orksoeldner_15_02"); //But what?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_03"); //I just ran out of ore again. If you want your sword, go to our mine and get me a box of ore.

	Log_CreateTopic	(TOPIC_MOD_NL_ERZKISTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_ERZKISTE, "Now I am allowed to fetch a box of ore from the mine for Thofeistos.");
};

INSTANCE Info_Mod_Thofeistos_Erzkiste (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Erzkiste_Condition;
	information	= Info_Mod_Thofeistos_Erzkiste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the box.";
};

FUNC INT Info_Mod_Thofeistos_Erzkiste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FMCTorwache_Erzkiste))
	&& (Npc_HasItems(hero, ItMi_Erzkiste) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Erzkiste_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_00"); //Here's the box.

	B_GiveInvItems	(hero, self, ItMi_Erzkiste, 1);

	if (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_01"); //Very good. Very good. Here you have called the sword you deserve, Orcslaughterers.

		B_GiveInvItems	(self, hero, ItMw_Orkschlaechter, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_02"); //Very good. Very good. Here you have called the sword you deserve, Orcpiekser.

		B_GiveInvItems	(self, hero, ItMw_Orkpickser, 1);
	};

	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_03"); //It's the best you can get from me. You'll have to make better weapons yourself.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_04"); //You already have the gun?! But why--
	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_05"); //Oh, I just didn't have time and was too comfortable to get the box myself. Here's two chunks of ore to thank you.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 2);

	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_Gormgniez (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Gormgniez_Condition;
	information	= Info_Mod_Thofeistos_Gormgniez_Info;
	permanent	= 0;
	important	= 0;
	description	= "I come from Lee to get some ore as a reward.";
};

FUNC INT Info_Mod_Thofeistos_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Gormgniez_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Gormgniez_15_00"); //I come from Lee to get some ore as a reward.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Gormgniez_29_01"); //Yes, yes, so much ore. Hopefully you don't drown everything, but also make some nice blades out of it.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 15);

	B_SetTopicStatus	(TOPIC_MOD_NL_CRAWLER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_SeeVorLager (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_SeeVorLager_Condition;
	information	= Info_Mod_Thofeistos_SeeVorLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_SeeVorLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_SeeVorLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_00"); //You're on the road a lot outside. Did you notice anything unusual about the lake in front of the camp?
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_01"); //Nah, not that I know of. Why do you ask?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_02"); //Oh, just so, it's not that important. I was just noticing something strange in the lake.... but.... No, too far-fetched.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_03"); //Well, there's been a lot of unusual and weird things happening on Khorinis in the last few days. For example, kites....
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_04"); //(interrupts) So it's true what I thought I saw and heard at night in the lake.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_05"); //Yeah, what are you talking about?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_06"); //Last night. I went for a walk in front of the camp and suddenly I heard hissing and squeaking sounds from the lake, which I thought I knew only from old books.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_07"); //Blaring noises?! What kind of books?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_08"); //Books about dragons and related creatures, including those at home in the water.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_09"); //When I was looking at the lake, I thought I could see a long body winding through the water.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_10"); //But it seemed to me to be too unlikely to find such a sea monster here in the Minental.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_11"); //And how should we proceed now? What is to be done?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_12"); //Well, I don't think this creature is a real threat to the camp, as it prefers to be in the water, even if it can fly for some time.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_13"); //Hmm, but if you could bring me his scales, I could make you a new armor.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_14"); //However, you should be aware that it only rises out of the mud of the lake at night.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_15"); //Try to lure it ashore and defeat it there.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_16"); //Defeat a sea monster?! Well, I'll see what can be done...
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_17"); //Good luck to you.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Thofeistos believes to have spotted a sea monster in the lake in front of the camp. When the creature rises out of the lake at night, I shall lure it ashore and do it. From the scales of the sea monster Thofeistos could make me a new armor.");
};

INSTANCE Info_Mod_Thofeistos_Seeungeheuer (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Seeungeheuer_Condition;
	information	= Info_Mod_Thofeistos_Seeungeheuer_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the sheds.";
};

FUNC INT Info_Mod_Thofeistos_Seeungeheuer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_SeeVorLager))
	&& (Npc_HasItems(hero, ItAt_Seeungeheuerschuppen) == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Seeungeheuer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Seeungeheuer_15_00"); //I got the sheds.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_01"); //Show me...

	B_GiveInvItems	(hero, self, ItAt_Seeungeheuerschuppen, 11);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_02"); //... actually.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_03"); //You're an even bigger warrior than I had expected.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_04"); //Not many people would have managed to defeat such a monster.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_05"); //Come back tomorrow. Then I'll have your armor ready.

	Mod_NL_DJGArmor_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Thofeistos_DJGArmor (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_DJGArmor_Condition;
	information	= Info_Mod_Thofeistos_DJGArmor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_DJGArmor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Seeungeheuer))
	&& (Wld_GetDay() > Mod_NL_DJGArmor_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_DJGArmor_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_00"); //Ahh, there you are. Recently, I finished your armor.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_01"); //Here, I hope she will serve you well for a long time to come.

	B_GiveInvItems	(self, hero, ItAr_DJG_L, 1);

	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_02"); //Hmm, and then again... I've been thinking.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_03"); //I have dedicated my whole life to the art of blacksmithing, formed weapons that no one else was able to forge and created alloys whose secrets are only known to me.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_04"); //I have knowledge that has been handed down from ancient sources and can compete with the best smelters and blacksmiths in Nordmar.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_05"); //But you are the first one who seems worthy to me to experience the deeper consecrations of ore processing.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_06"); //Yes, even though I am open most of the time, I still get to know a lot of things...
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_07"); //All my knowledge of ore processing is now open to you.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_08"); //Make your choice, but be aware that it takes a lot of experience to perfect the art in each discipline.

	Mod_Gilde = 5;
};

INSTANCE Info_Mod_Thofeistos_Urs (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Urs_Condition;
	information	= Info_Mod_Thofeistos_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "I bring the fiery hammer of Urs.";
};

FUNC INT Info_Mod_Thofeistos_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMw_FeurigerHammer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Urs_15_00"); //I bring the fiery hammer of Urs.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_01"); //What, the magic hammer?! Give me that. I have to try it right now.

	B_GiveInvItems	(hero, self, ItMw_FeurigerHammer, 1);
	Npc_RemoveInvItems(self, ItMw_FeurigerHammer, 1);

	AI_UseMob	(self, "ANVIL", 1);
	AI_UseMob	(self, "ANVIL", -1);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_02"); //Fantastic, the steel heats up almost automatically under the blows.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_03"); //A great piece worthy of a smelter in Nordmar.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_04"); //Twenty lumps were agreed? Here, take 30... and even this does not really reflect the true value of this piece.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 30);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Thofeistos has his hammer... and I got 30 lumps of ore.");
};

INSTANCE Info_Mod_Thofeistos_Teacher (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Teacher_Condition;
	information	= Info_Mod_Thofeistos_Teacher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can you teach me something?";
};

FUNC INT Info_Mod_Thofeistos_Teacher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	if (Mod_Gilde != 5)
	&& (Mod_Gilde != 19)
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_01"); //First of all, prove yourself worthy. I don't dedicate myself to working magic ore for every person who has run away.
	}
	else
	{
		if (Mod_Gilde == 5)
		|| (Mod_Gilde == 19)
		{

			if (Mod_NL_Thofeistos_Lehrer == 0)
			{
				Mod_NL_Thofeistos_Lehrer = 1;

				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_02"); //You have proven that you have both the fighting skills and the mind and skill.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_03"); //You have qualified yourself to learn about the art of processing magical ore.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_04"); //Of course, I'm not gonna let you in on everything.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_05"); //On the one hand, I don't have the time to do so, and on the other hand, this knowledge is only reserved for the very greatest warriors.
			};

			if (Mod_Gilde == 5)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Armor_Dragon == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Improve Medium Dragon Hunter Equipment (1000 Gold)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Improve medium kite hunting equipment (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					};
				};
				if (Armor_Dragon == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Lightweight Dragon Hunter Equipment Improve (1000 Gold)", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Improve Light Dragon Hunter Equipment (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					};
				};
				if (Pfeil_GoldErz == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter ranged weapons. (2500 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter ranged weapons. (25 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					};
				};
				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Arrow and pin tips made of gold ore alloy. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Arrow and pin tips made of gold ore alloy. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter weapon. (2500 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter weapon. (25 LP)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Weapon made of ore-iron alloy. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Weapon made of ore-iron alloy. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};

			if (Mod_Gilde == 19)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Arrow and pin tips made of gold ore alloy. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Arrow and pin tips made of gold ore alloy. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Weapon made of ore-iron alloy. (1000 Gold)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Weapon made of ore-iron alloy. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};
		};
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_00"); //Take three lumps of ore and heat them with a piece of gold.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_01"); //This makes it possible to make the magic ore soft enough to forge arrow and pin points from it.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_02"); //The material is sufficient for about 100 arrows or bolts.

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Pfeil_GoldErz = 1;

	Mod_PfeileSchnitzen = 1;

	Mod_PfeileSpitzen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "For arrows and bolts with a gold ore alloy I have to forge three pieces of ore and one piece of gold on an anvil. From this I get 100 points, which I can assemble with arrow rods to arrows or bolts.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_00"); //Take a forged blank, heat it and - depending on the size of the weapon - forge 20 to 30 lumps of magic ore into the glowing steel.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_01"); //Only the resulting alloy has the properties that make it malleable and ductile.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_03);

	Waffe_ErzEisen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "In order to produce weapons with an ore-iron alloy, I have to work 20 to 30 pieces of ore into the crude steel on an anvil, depending on the size of the sword.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_00"); //Legend has it that many centuries ago, when dragons were even more common on the face of the earth, a daring knight faced battle with such a beast.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_01"); //He fought with her for a long time, but he could hardly penetrate the tank of the beast with his ore weapon and only inflicted minor wounds on her.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_02"); //Finally, a breeze of flame struck the blade soaked in dragon's blood that it glowed red.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_03"); //The next stroke of the warrior's stroke pierced the beast effortlessly.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_04"); //It turns out that glowing ore weapons that come into contact with the blood of these magical creatures attain a hardness that cannot resist anything.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_05"); //Depending on the size of the weapon, between five and seven vials of dragon's blood are needed.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_06"); //Making a weapon out of pure ore, however, is a much bigger art.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_07"); //Often referred to as ore weapons, these are always alloys contaminated with other metals.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_08"); //In order to generate a heat that eliminates all other impurities in the ore and makes even pure ore malleable and forgeable, it is necessary to remove the liquid from a dragon, which gives it its dreaded flame breeze.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_09"); //This is located in a white-violet organ, which is not far below the sternum.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_10"); //You have to place a knife between his scalping and cut it until the organ is visible.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_11"); //You then collect the liquid in a bottle.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_12"); //The process of producing a pure ore blank is carried out in a blast furnace.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_13"); //But be warned. The explosive heat that arises draws all bystanders with passion.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_14"); //If you put 60 to 80 pieces of ore in the oven, depending on the size of the weapon you want, add three bottles of liquid.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_15"); //From the melt, you only take the part in the middle of the melt as a blank, which becomes solid most quickly.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_16"); //To forge a weapon from it, you go to a blacksmith's shop and heat it up with a bottle of liquid.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_04);

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "I can now, if I have a razor blade with me:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... dead dragons remove their flame elixir.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... dragons killed their blood.");
	};

	Waffe_ErzEisen = 2;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "For really pure ore weapons, I first need the dragons' flame elixir. I have to smelt 3 of them in a melting furnace with 60 to 80 pieces of ore, depending on the size of the gun. The resulting pure ore blank has to be placed on an anvil with another bottle of Flammenelixier and 5 or 5 flames. Seven vials of dragon's blood.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_00"); //While making the ore alloy for arrows or bolts, add a bottle of dragon's blood.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_01"); //This gives the arrowheads a hardness that can pierce any armour and shield.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_02"); //You should also make a bow or crossbow with dragon sinews.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_03"); //The tension and penetrating power of a dragon's tendon is superior to anything else.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_04"); //Especially the tendons at the joints of the arms and legs of these creatures are suitable, at the neck you can find useful material.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_05"); //You have to cut lengthwise, between the scales, in order to work your way carefully towards the tendons.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "I can now, if I have a razor blade with me:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... remove the sinews of dead dragons.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... dragons killed their blood.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

	Pfeil_GoldErz = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2500);
	}
	else
	{
		hero.lp -= 25;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "In order to make the arrows even more powerful, I have to add a vial of dragon's blood to the lace.");
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Besides, a suitable bow or crossbow would be good. For this I need a branch and two sinews of the dragons, which I can connect to a tree trunk.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_29_00"); //Well, I don't have time to explain. Memorize these instructions carefully and you will know how to proceed.

	B_ShowGivenThings	("obtain instructions");

	B_HeroFakeScroll ();

	AI_Output(hero, self, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_15_01"); //Uh-huh, so... 9 Separate the shed.... add.... 20 Ore for strengthening.... Then connect and fix.... should work.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "I can now, if I have a razor blade with me:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... Detach kite scales from the body of a dead kite.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

	Armor_Dragon = 1;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "To improve my light dragon hunting gear I need 9 scales and 20 pieces of ore. Both are added to the armour on an anvil.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon2()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_00"); //To create the perfect armour, you need to be even more skilful in connecting 16 more ores and seven scales to the armour.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_01"); //You also need four vials of dragon's blood to harden the armour.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "I can now, if I have a razor blade with me:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... dragons killed their blood.");
	};

	Armor_Dragon = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "For the improvement of my middle kite hunting armor I need 7 more kite scales and 16 ore chunks. But there are also four vials of dragon's blood.");
};

INSTANCE Info_Mod_Thofeistos_GiveSLDWeapon (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_GiveSLDWeapon_Condition;
	information	= Info_Mod_Thofeistos_GiveSLDWeapon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a gun for me?";
};

FUNC INT Info_Mod_Thofeistos_GiveSLDWeapon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Do you have a gun for me?
	AI_Output(self, hero, "Info_Mod_Thofeistos_GiveSLDWeapon_29_01"); //As a simple mercenary, I have a mercenary sword for you. Choose the one or two-handed sword.

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);

	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "Two-handed", Info_Mod_Thofeistos_GiveSLDWeapon_B);
	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "One-handed", Info_Mod_Thofeistos_GiveSLDWeapon_A);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_B()
{
	B_ShowGivenThings	("Rough two-handed people receive");

	CreateInvItems	(hero, ItMw_2h_Sld_Sword, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_A()
{
	B_ShowGivenThings	("Getting the Coarse Short Sword");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

INSTANCE Info_Mod_Thofeistos_Trade (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Trade_Condition;
	information	= Info_Mod_Thofeistos_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Do you also deal in forging accessories?";
};

FUNC INT Info_Mod_Thofeistos_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Trade_Info()
{
	B_GiveTradeInv (self);

	AI_Output(hero, self, "Info_Mod_Thofeistos_Trade_15_00"); //Do you also deal in forging accessories?
};

INSTANCE Info_Mod_Thofeistos_Pickpocket (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Pickpocket_Condition;
	information	= Info_Mod_Thofeistos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Thofeistos_Pickpocket_Condition()
{
	C_Beklauen	(115, ItMi_Nugget, 6);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_BACK, Info_Mod_Thofeistos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thofeistos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thofeistos_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thofeistos_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thofeistos_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thofeistos_EXIT (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_EXIT_Condition;
	information	= Info_Mod_Thofeistos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thofeistos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
