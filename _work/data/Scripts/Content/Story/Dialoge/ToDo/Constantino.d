INSTANCE Info_Mod_Constantino_Hi (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Hi_Condition;
	information	= Info_Mod_Constantino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Constantino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Constantino_Hi_10_00"); //Huh? You couldn't care less, could you?
};

INSTANCE Info_Mod_Constantino_Irdorath (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Irdorath_Condition;
	information	= Info_Mod_Constantino_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want a sea voyage company that is of paramount importance to the welfare of Khorinis.";
};

FUNC INT Info_Mod_Constantino_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_00"); //I want a sea voyage company that is of paramount importance to the welfare of Khorinis.
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_01"); //For this I absolutely need an alchemist in my team, who understands potions and plants...
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_02"); //What, how, and that's what you come to me with?
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_03"); //No, really, you're gonna have to find someone else if it's not gonna be a bad joke.
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_04"); //I will certainly not leave this safe island to fall into the hands of orcs and pirates....
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_05"); //(half-sounding) which there's plenty of here, too. Safe island...

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "No, I don't think I can persuade Constantino to go on the sea voyage.");
};

INSTANCE Info_Mod_Constantino_Alchemist (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Alchemist_Condition;
	information	= Info_Mod_Constantino_Alchemist_Info;
	permanent	= 0;
	important	= 0;
	description	= "Let's deal.";
};

FUNC INT Info_Mod_Constantino_Alchemist_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Alchemist_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Alchemist_15_00"); //Let's act.
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_01"); //Can't you see I'm working right now?
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_02"); //If I were to chat with anyone who comes sneaking up on me, I'd be sure... five minutes or more!
};

INSTANCE Info_Mod_Constantino_Lehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrling_Condition;
	information	= Info_Mod_Constantino_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "You are one of the five masters.";
};

FUNC INT Info_Mod_Constantino_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_00"); //You are one of the five masters.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_01"); //Actually, I'm the only one worthy of being called a master. The others are hacks.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_02"); //Anyway, I want to be an apprentice at one of the masters.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_03"); //You? (laughs) Well, this will be fun!
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_04"); //Are you gonna give me a problem?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_05"); //No. I don't have time for frills like that.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_06"); //Then how can I get your voice?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_07"); //Not at all.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_08"); //Hmm.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_09"); //Hmm.

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);

	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "You can save me a lot of time!", Info_Mod_Constantino_Lehrling_C);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "We would surely be a good team!", Info_Mod_Constantino_Lehrling_B);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "I suppose that means I have to call Lord Andre in.", Info_Mod_Constantino_Lehrling_A);
};

FUNC VOID Info_Mod_Constantino_Lehrling_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_00"); //You can save me a lot of time!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_01"); //Uh-huh. So you're willing to do whatever job I ask you to do?
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_02"); //Almost every one.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_03"); //(laughs in itself) I have a small recipe for which I still need some ingredients. You'll bring them to me.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_04"); //What are the ingredients?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_05"); //One twin spiny thorn, four bogweed plants, and... Yes, a blood fly spine and.... hmm... Yes, two full test tubes of the secretion from a minecrawler's egg.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_06"); //Here's a list.

	B_GiveInvItems	(self, hero, Mod_ConstantinosZutatenliste, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_07"); //Where can I find the ingredients?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_08"); //Outside. The monastery fuzzis have some ingredients. Suggest that you stay right there.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_09"); //All right, I'll get you that stuff.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_10"); //See you in a few years.

	Log_CreateTopic	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "To get Constantino's voice, I shall bring him the ingredients for a new potion. The plants can still be found, but I don't know where I can find a Minecrawler egg and a blood fly spine. Constantino gave me a tip about the monastery, but that doesn't mean anything. Maybe I should just ask around.");

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);
};

FUNC VOID Info_Mod_Constantino_Lehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_B_15_00"); //We would surely be a good team!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_B_10_01"); //What's a team good for? I can't think for two at the same time.
};

FUNC VOID Info_Mod_Constantino_Lehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_A_15_00"); //I suppose that means I have to call Lord Andre in.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_A_10_01"); //(laughs) Andre has other worries than taking care of you.
};

INSTANCE Info_Mod_Constantino_Stimme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Stimme_Condition;
	information	= Info_Mod_Constantino_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "There you have it all.";
};

FUNC INT Info_Mod_Constantino_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& ((Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	|| (Npc_HasItems(hero, ItAt_CrawlerQueen) >= 1))
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 1)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 4)
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_00"); //There you have it all.

	B_ShowGivenThings	("Ingredients given");

	if (Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	{
		Npc_RemoveInvItems	(hero, ItFo_Potion_Elixier_Egg, 2);

		B_GivePlayerXP	(400);

		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_01"); //All right, all right. But don't bother me anymore!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_02"); //A minecrawler's egg? I need the secretary, I said!
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_03"); //Are you too lazy to go to the alchemy table and extract it properly or what?
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_04"); //Everything has to be done by yourself....

		Npc_RemoveInvItems	(hero, ItAt_CrawlerQueen, 1);

		B_GivePlayerXp	(300);
	};

	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 1);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 4);
	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_05"); //Do I get your approval now?
	AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_06"); //Yeah, yeah, yeah. Goodbye. Goodbye.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	Mod_LehrlingsStimmen += 1;
	
	Npc_RemoveInvItems	(hero, Mod_ConstantinosZutatenliste, 1);

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_CONSTANTINOSZUTATEN, TOPIC_MOD_HAENDLER_STADT, "Constantino was very happy with me. He gave me his vote.", "Constantino can sell me potions and herbs.");
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_Aufnahme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Aufnahme_Condition;
	information	= Info_Mod_Constantino_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "I want to be your apprentice.";
};

FUNC INT Info_Mod_Constantino_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_00"); //I want to be your apprentice.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_01"); //Aha.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_02"); //Are you teaching me the secrets of alchemy?
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_03"); //Is it...? Is it really important to you? Can you work hard and be quiet?

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);

	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "No.", Info_Mod_Constantino_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "Yes.", Info_Mod_Constantino_Aufnahme_A);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_B_15_00"); //No.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_B_10_01"); //Didn't I know! Get away from me!

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_00"); //Yeah.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_01"); //Then.... all right, all right. Just be my apprentice.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_02"); //But to make it clear, I'm not giving you any money or food. Just knowledge. Pure knowledge. Got it?
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_03"); //Sure.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_04"); //Wait, I'd have to have the city look somewhere... such a calcified tradition once again.... That's where I got him. Take it.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("receive civilian clothes");

	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_05"); //You want to learn the secrets of alchemy, oho. But we're gonna start small.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_06"); //Because I doubt you can keep up with my intellect.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_07"); //The essences represent the lowest degree of difficulty. With a little bit of practice she creates even the most untalented camel.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_08"); //But even here you can make enough mistakes. So watch out!
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_09"); //The basis of these two potions is the field knotweed. You can destroy it in a mortar by adding a few drops of water.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_10"); //Only then you add the two medicinal plants or nettles.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_11"); //This is important so that the plants absorb the regenerative power of the field knotweed when crushed.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_12"); //Otherwise you will get tasty but ineffective tea.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_13"); //Then heat the broth until it boils over the flame and fill it.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_14"); //I think I got it.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_15"); //Let's see about that. So you get the ingredients and brew two healing essences and two mana essences each. Then we'll talk again.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 1;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Constantino, the alchemist, accepted me as his apprentice. That makes me a citizen of the city now.", "Constantino gave me the task of making two mana and healing essences. First I have to collect the necessary ingredients and then put them together at the alchemy table in the right order. Hmm, what was that again?", "Since Constantino accepted me as his apprentice it is now possible for me to enter the upper quarter.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, "Constantino, the alchemist, accepted me as his apprentice. That makes me a citizen of the city now.", "Constantino gave me the task of making two mana and healing essences. First I have to collect the necessary ingredients and then put them together at the alchemy table in the right order. Hmm, what was that again?");
	};

	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Ingredients?ESSENCE OF HEALING?: 2 medicinal plants and 1 knotweed.");
	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Ingredients 'MANA ESSENCE': 2 Fire Nettles and 1 Meadow Knotweed.");

	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

INSTANCE Info_Mod_Constantino_GildenZeug (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_GildenZeug_Condition;
	information	= Info_Mod_Constantino_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_00"); //Did you crawl to the militias, too? You think that scares me? (laughs moaning)
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_01"); //You're a novice now? Don't believe what the Fire Magicians tell you about alchemy! It's all bullshit!
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_02"); //Did Vatras fog your brain too, huh?
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_03"); //When I see what happens to you, I'm sorry I ever got involved with you.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_04"); //Beliar greeting! (laughs moaning)
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've brewed all your potions.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (Npc_HasItems(hero, ItPo_Health_01) >= 2)
	&& (Npc_HasItems(hero, ItPo_Mana_01) >= 2)
	&& (Mod_Count_Health_01 >= 2)
	&& (Mod_Count_Mana_01 >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_00"); //I've brewed all your potions.

	B_ShowGivenThings	("2 essences of healing and 2 mana essences given");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_01"); //(smells) You really lack the feeling of skill. But at least they will help more than harm.

	B_ShowGivenThings	("2 Healing Essences and 2 Mana essences obtained");

	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_02"); //Don't you want to keep the potions?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_03"); //I brewed better in two minutes. So what am I supposed to do with this?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_04"); //What are you gonna teach me next?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_05"); //First of all, I need my rest now. Your Question Time is now over.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_06"); //Come back later if I have time for you again.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest2_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd like to learn more.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_00"); //I'd like to learn more.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_01"); //I'd appreciate your inquisitiveness more if you were a little more gifted.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_02"); //I doubt that.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_03"); //Like this? Then prove me wrong!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_04"); //Which brings us to the point.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_05"); //(teeth grinding) All right. I want to see if you can make a speed potion the first time around.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_06"); //All you need are snapper cabbage and field knotweed. However, the preparation is complicated:
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_07"); //First you have to put the Snapperkraut in hot water.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_08"); //After about two minutes you take the herb out of the water and hang it over mortars, in which you now crush the knotweed.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_09"); //Meanwhile, the soul of the herb drips onto the knotweed and mixes.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_10"); //Once the cabbage is drained, burn the rest of it in the fire and mix the ashes with the knotweed lamp.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_11"); //Place this mixture in a bowl of water and heat it.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_12"); //As soon as the water boils, you skim the mixture. You can now fill the liquid.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_13"); //Doesn't sound so easy.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_14"); //A real alchemist can also rely on his or her feelings.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, "Constantino really wants to challenge me this time. He wants me to make him a speed potion. If I only knew what I had to consider.");

	PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Ingredients 'SPEED POTION': 1 Snapperweed and 1 Meadow Knotweed");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest3_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm ready, then.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest2))
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Mod_Darf_Speed == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_00"); //I'm ready, then.

	B_GiveInvItems	(hero, self, ItPo_Speed, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_01"); //Let me have a look. Hmm, not even bad.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_02"); //Can I have the potion back now?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_03"); //Huh? No, no, he stays with me.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_04"); //(to himself) That's probably tantamount to a compliment.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_05"); //And when can I come back?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_06"); //Soon. I'll be glad when the time is up.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest4_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest4_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_00"); //Thought you'd completely forgotten your training with me.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_01"); //Shall I go again?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_02"); //Don't get your knickers in a twist!
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_03"); //You caught me in a merciful mood today, so let's talk about the permanent potions. The supreme discipline of the alchemists.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_04"); //I'm ready.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_05"); //Let's start with the story: A positive permanent effect with a potion seemed impossible for a long time.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_06"); //Its potential is comparable to that of the Philosopher's Stone, my present project by the way.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_07"); //You want to make the Philosopher's Stone?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_08"); //Every alchemist wants that. But I'm the only one who can.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_09"); //Back to the subject: Only a few dozen years ago, a second-rate alchemist - by chance, of course - found out how the potions had to be designed so that their effects would not vanish.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_10"); //There is a very rare plant, the Kronstöckl. At first glance, it seems worthless and has therefore not been used in research for a long time.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_11"); //Only in combination with permanent plants such as the dragon's root and the goblin berry does it develop its full effect.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_12"); //The production of the permanent potion is simple but requires high precision.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_13"); //You have to heat the Kronstöckl and the other plant needed for the potion in a laboratory water bottle, so that the water starts to boil.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_14"); //As soon as the first bubbles rise, you close the bottle. Not a second sooner or later, you understand?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_15"); //No problem.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_16"); //You think so! Make a good memory of when you compacted the laboratory water bottle.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_17"); //Exactly three days later, to the hour, you remove the plant parts from the bottle and have the permanent potion.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_18"); //If you don't keep to it, the potion becomes too strong or too weak and loses its full effect.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_19"); //Now try yourself on an elixir of life. The ingredients for this are a healing root and Kronstöckl.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_20"); //I'm gonna try to work it.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, "To brew an elixir of life, I need a healing root and a crown stick. These must be stored in a sealed laboratory water bottle for exactly three days before the drink is ready.");

	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"Ingredients? ELIXIATION OF LIFE?: 1 medicinal root and 1 crown.");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest5_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "The potion is ready.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest4))
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Mod_Darf_PermHealth == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest5_15_00"); //The potion is ready.

	B_GiveInvItems	(hero, self, ItPo_Perm_Health, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_01"); //I must admit, you don't seem completely untalented.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_02"); //Only very few of our guilds know how to handle the Kronstöckl properly.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_03"); //I've taught you everything you need to know.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_04"); //I'll think of a task for you to test you with. Come back soon.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_SUCCESS);

	if (Mod_PermTrank_Tries == 1)
	{
		B_GivePlayerXP	(200);
	}
	else
	{
		B_GivePlayerXP	(100);
	};

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest6_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest5))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_00"); //Come here, come here!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_15_01"); //Why so inviting today?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_02"); //I'm on the verge of a breakthrough! The last breakthrough of mankind!

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "You're in the process of abolishing bureaucracy?", Info_Mod_Constantino_LehrlingQuest6_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "You mean your investigations into the Philosopher's Stone?", Info_Mod_Constantino_LehrlingQuest6_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_C()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_00"); //In theory, I've already finished developing it. What I still need are some materials.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_01"); //Except for a conventional stone and the laboratory water bottles, I have almost nothing in the house.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_02"); //You! I was going to give you another assignment anyway.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_C_15_03"); //That is indeed true.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_04"); //So you're gonna work through the list. And fast!

	B_GiveInvItems	(self, hero, ItWr_SteinDerWeisen, 1);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "Constantino claims to be on the verge of making the Philosopher's Stone. I have received a list of ingredients he still needs.");
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_B_15_00"); //You're in the process of abolishing bureaucracy?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_B_10_01"); //Those who do not know how to protect themselves from this are to blame! No, I mean the Philosopher's Stone.

	Info_Mod_Constantino_LehrlingQuest6_C();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_A_15_00"); //You mean your investigations into the Philosopher's Stone?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_A_10_01"); //What the hell else!

	Info_Mod_Constantino_LehrlingQuest6_C();
};

INSTANCE Info_Mod_Constantino_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest7_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest6))
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 5)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= 3)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 5)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 30)
	&& (Npc_HasItems(hero, ItMi_Addon_WhitePearl) >= 5)
	&& (Npc_HasItems(hero, ItPo_Perm_Str) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Dex) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Mana) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 5);
	Npc_RemoveInvItems	(hero, ItMi_RockCrystal, 3);
	Npc_RemoveInvItems	(hero, ItMi_Sulfur, 2);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMi_Coal, 5);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 30);
	Npc_RemoveInvItems	(hero, ItMi_Addon_WhitePearl, 5);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Str, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Dex, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Health, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Mana, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_00"); //You finally got everything?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_01"); //Yeah.

	B_ShowGivenThings	("Ingredients for stone given to the sage");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_02"); //Then leave me alone now until I'm done.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_03"); //Hold on a second. This is going too fast right now.

	B_GivePlayerXP	(1000);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "What are you gonna do with the Philosopher's Stone?", Info_Mod_Constantino_LehrlingQuest7_C);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "How did you discover the manufacturing process?", Info_Mod_Constantino_LehrlingQuest7_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "What does the Philosopher's Stone do?", Info_Mod_Constantino_LehrlingQuest7_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_D()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_00"); //But that's enough, important experiments have to wait. I should be ready to try the stone tomorrow.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_01"); //If you... uh, want to get a taste of your troubles, you should come by.

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "I shall give Constantino a day to carry out the necessary experiments on the Philosopher's Stone.");

	Mod_Constantino_SDW_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_C_15_00"); //What are you gonna do with the Philosopher's Stone?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_C_10_01"); //I'll make the King of Myrtana an offer he can hardly refuse. After I became immortal myself.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_00"); //How did you discover the manufacturing process?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_01"); //By using my brains.

	if (Mod_Ignaz_Bruder == 1)
	{
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_02"); //You took over the research from your brother, right?
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_03"); //Brother? Who...?
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_04"); //Ignaz told me himself some time ago.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_05"); //You don't believe that lunatic!
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_06"); //He was driven mad by the Philosopher's Stone.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_07"); //He did it wrong, the con man! He must've made a mess! Always second best.
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_08"); //I have my doubts about the version...
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_09"); //What do I care?
	};

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_A_15_00"); //What does the Philosopher's Stone do?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_01"); //It is the ultimate stimulant for the body. A complete renewal and rejuvenation cure.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_02"); //If my calculations are correct, which I strongly believe to be true, you could gain immortality through the stone.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest8_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest7))
	&& (Wld_GetDay() > Mod_Constantino_SDW_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest8_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_00"); //Are you as excited as I am?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest8_15_01"); //I cannot deny a certain tension.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_02"); //All in all, time with you wasn't so bad. Could've gotten some dumber apprentices.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_03"); //That's why I want you to get a taste of eternity.

	createInvItems	(self, ItMi_SteinDerWeisen, 2);

	B_GiveInvItems	(self, hero, ItMi_SteinDerWeisen, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_04"); //But now witness my ascent to immortality!

	B_UseItem	(self, ItMi_SteinDerWeisen);

	AI_PlayAni	(self, "T_MAGRUN_2_HEASHOOT");

	AI_StopProcessInfos	(self);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_47);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest9_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "So, how'd it go?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_00"); //So, how'd it go?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_01"); //Close? Specifically or specifically?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_02"); //In general....
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_03"); //I jump from Lolke to Lolke. My cage is not being cleaned, but the sun is shining out.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_04"); //Oh, no....
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_05"); //Come on! Why don't you jump with me? (laughs madly)

	AI_StopProcessInfos	(self);
	
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_SUCCESS);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest10 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest10_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest10_Info;
	permanent	= 1;
	important	= 0;
	description	= "Are you still crazy?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest9))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest10_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_00"); //Are you still crazy?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_01"); //I'm not crazy!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_02"); //Thank the gods. But your body hasn't gotten any younger.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_03"); //Close? Of course he's younger! Can't you see me when I jump between the clouds like a young wart?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_04"); //No, honestly not.
};

INSTANCE Info_Mod_Constantino_PaketZauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_PaketZauberwasser_Condition;
	information	= Info_Mod_Constantino_PaketZauberwasser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_PaketZauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Namib))
	&& (Npc_HasItems(hero, ItMi_LesterPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_00"); //What do you want?
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_01"); //I'm supposed to bring you this package from the brotherhood.

	B_GiveInvItems	(hero, self, ItMi_LesterPaket, 1);
	Npc_RemoveInvItems	(self, ItMi_LesterPaket, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_02"); //Ah, it's about time. Here.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_03"); //Bring the Baal Namib. Tell him it's the best thing on the market right now!

	CreateInvItems	(self, ItMi_DuengerPaket, 1);
	B_GiveInvItems	(self, hero, ItMi_DuengerPaket, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_04"); //I'm supposed to take a bottle of magic water, too.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_05"); //Magic water? You're lucky, I only have one bottle left. That's 500 pieces of gold.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_06"); //Put it on Lester's tab.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_07"); //WAS? The drunkard already stands with me with 3000 gold pieces in the chalk anyway.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_08"); //No way! Either you pay the 500 gold pieces including Lesters debts or you get nothing!

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Don't you have something to do for me?", Info_Mod_Constantino_PaketZauberwasser_ToDo);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Forget it!", Info_Mod_Constantino_PaketZauberwasser_Nein);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "I don't have that much with me.", Info_Mod_Constantino_PaketZauberwasser_NotEnough);

	if (Npc_HasItems(hero, ItMi_Gold) >= 3500)
	{
		Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "All right, all right. Here's the gold.", Info_Mod_Constantino_PaketZauberwasser_Zahlen);
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_ToDo()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_00"); //Don't you have something to do for me?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_01"); //Now that you mention it.... As I said, my magic water supply is running low.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_02"); //Get me the ingredients for a new batch, we'll see how we do business.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_03"); //All right, all right. What do you need?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_04"); //I need 10 bottles of water, 2 bottles of salt water, 5 fire nettles and 5 medicinal plants, 3 blue songs and a field knotweed. Here's your list.

	CreateInvItems	(self, ItWr_ConstantinosZauberwasserliste, 1);
	B_GiveInvItems	(self, hero, ItWr_ConstantinosZauberwasserliste, 1);

	Mod_ConstantinoZauberwasser = 1;

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "To work off Lester's debts, I have to bring Constantino the ingredients for magic water. He gave me a list of them.");

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Back", Info_Mod_Constantino_PaketZauberwasser_BACK);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Where can I find field knotweed?", Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Where can I find blue songs?", Info_Mod_Constantino_PaketZauberwasser_Blauflieder);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Where can I find medicinal plants?", Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Where can I find fire nettles?", Info_Mod_Constantino_PaketZauberwasser_Feuernesseln);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Where do I get salt water from?", Info_Mod_Constantino_PaketZauberwasser_Salzwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Nein()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Nein_15_00"); //Forget it!
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Nein_10_01"); //Then get out of here!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I refused to pay for the gold. I have to find another way to get the magic water.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich_15_00"); //Where can I find field knotweed?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich_10_01"); //You won't find one in town. Go outside and look around.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Blauflieder()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_15_00"); //Where can I find blue songs?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_10_01"); //This stuff grows everywhere, look around on the side of the road.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_15_00"); //Where can I find medicinal plants?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_10_01"); //I'm sure you'll find something in the paths and the woods.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feuernesseln()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_15_00"); //Where can I find fire nettles?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_10_01"); //They're almost everywhere. At the monastery of the Fire Magicians there are quite a few.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Salzwasser()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_15_00"); //Where do I get salt water from?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_10_01"); //Where do you think you'll find salt water? In the sea, you idiot! Ask the fisherman, maybe he'll get you a bottle.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_NotEnough()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_15_00"); //I don't have that much with me.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_10_01"); //Then get out of here!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I refused to pay for the gold. I have to find another way to get the magic water.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Zahlen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_15_00"); //All right, all right. Here's the gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 3500);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_10_01"); //Good. Here's the magic water.

	CreateInvItems	(self, ItMi_Zauberwasser, 1);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "I got the magic water from Constantino. Let's go to Lester's now.");

	Mod_ConstantinoZauberwasser = 3;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

INSTANCE Info_Mod_Constantino_Zauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got everything.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_Condition()
{
	if (Mod_ConstantinoZauberwasser == 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 3)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItFo_Water) >= 10)
	&& (Npc_HasItems(hero, ItMi_Salzwasser) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_00"); //I've got everything.

	B_ShowGivenThings	("26 items given!");

	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 3);
	Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, 1);
	Npc_RemoveInvItems	(hero, ItFo_Water, 10);
	Npc_RemoveInvItems	(hero, ItMi_Salzwasser, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_01"); //Very good. Very good. Give it to me!

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_02"); //Can I have a bottle now?
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_03"); //You've helped me a lot, I have to admit, but that doesn't cover Lester's debt yet!
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_04"); //Deliver those four deliveries and we'll call it even.

	CreateInvItems	(self, ItMi_Zauberwasser_MIS, 32);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser_MIS, 32);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_05"); //A delivery goes to Orlan, a tavern to the Dead Harpie, a delivery goes to the pub in the harbour district, a delivery goes to the pub here in the lower town, and a delivery goes to the mercenaries at Onars Hof. Give it to Thekla there.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Constantino has something else to do for me: I'm supposed to deliver the magic water. The supplies are for: Orlan in the Taverne zur Toten Harpie, the pub in the harbour district, the pub in the lower town and the mercenaries at Onars Hof.");
};

INSTANCE Info_Mod_Constantino_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "I delivered the magic water.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_MIS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Kardif_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_Zauberwasser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_MIS_15_00"); //I delivered the magic water.
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_01"); //Well, here's your magic water.

	CreateInvItems	(self, ItMi_Zauberwasser, 8);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_02"); //Now get out of here, I'm busy!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Constantino gave me a bottle of magic water. Let's go to Lester's now.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Constantino_VitaminC (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_VitaminC_Condition;
	information	= Info_Mod_Constantino_VitaminC_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm supposed to buy vitamin C here.";
};

FUNC INT Info_Mod_Constantino_VitaminC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Auftrag))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_00"); //I'm supposed to buy vitamin C here.
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_01"); //Yeah, there's a bag here.

	CreateInvItems	(self, ItFo_Addon_VitaminC, 1);
	B_GiveInvItems	(self, hero, ItFo_Addon_VitaminC, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_02"); //That makes 500 gold coins.
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_03"); //You're not kidding me, are you?
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_04"); //All right, I'll give you a bargain price. It'll only cost you 400 gold coins.

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Accept.", Info_Mod_Constantino_VitaminC_Ok_400);
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Haggling.", Info_Mod_Constantino_VitaminC_Feilschen_400);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_05"); //Here's your gold.
	
		B_GiveInvItems	(hero, self, ItMi_Gold, 400);
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Ok_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Ok_400_15_00"); //Here's your gold.
	
	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
};

FUNC VOID Info_Mod_Constantino_VitaminC_Feilschen_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Feilschen_400_15_00"); //This is way too much.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_Feilschen_400_10_01"); //All right, 300.

		B_GiveInvItems	(hero, self, ItMi_Gold, 300);

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Constantino_VitaminC_Feilschen_400_10_02"); //I want all my 400 gold coins.

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
		
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Accept.", Info_Mod_Constantino_VitaminC_Ok_400);
	};
};

INSTANCE Info_Mod_Constantino_BosperLehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling_Condition;
	information	= Info_Mod_Constantino_BosperLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you make a tincture out of this spell?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling_Condition()
{
	if (Mod_Bosper_Tinktur == 1)
	&& (Npc_HasItems(hero, ItSc_Rueckverwandlung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_00"); //Can you make a tincture out of this spell?

	B_GiveInvItems	(hero, self, ItSc_Rueckverwandlung, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_01"); //You're trying to steal my precious time?
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_02"); //Can you or can you not?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_03"); //Of course I can. But it's not that easy.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_04"); //With an advance of 100 gold coins, I could make it to tomorrow.
};

INSTANCE Info_Mod_Constantino_BosperLehrling2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling2_Condition;
	information	= Info_Mod_Constantino_BosperLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Then get to work!";
};

FUNC INT Info_Mod_Constantino_BosperLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling2_15_00"); //Then get to work!

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling3_Condition;
	information	= Info_Mod_Constantino_BosperLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you done with the tincture?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling2))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_00"); //Are you done with the tincture?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_01"); //Nope.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_02"); //Why not?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_03"); //I won't let you rush me. My research on the Philosopher's Stone has priority.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_04"); //When will you be ready?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_05"); //Let's have a look. You can drop by tomorrow, but don't bother me.

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling4_Condition;
	information	= Info_Mod_Constantino_BosperLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd like to pick up the tincture.";
};

FUNC INT Info_Mod_Constantino_BosperLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling3))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling4_15_00"); //I'd like to pick up the tincture.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_01"); //You look very well rested. (laughs)
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_02"); //In my good mood yesterday I briefly interrupted my important experiments.

	B_GiveInvItems	(self, hero, ItMi_Rueckverwandlungstinktur, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_03"); //Now, don't bother me anymore!

	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "I now have the tincture and only have to coat my arrows with it.");

	Wld_InsertNpc	(Warg_Atalante,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
};

INSTANCE Info_Mod_Constantino_Mitgift (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift_Condition;
	information	= Info_Mod_Constantino_Mitgift_Info;
	permanent	= 0;
	important	= 0;
	description	= "I see you have an animal poison with you...";
};

FUNC INT Info_Mod_Constantino_Mitgift_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_00"); //I see you have an animal poison with you...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_01"); //What's it got to do with you?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_02"); //I'd need a bottle just like that...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_03"); //No, it's not for sale. Because it's my only copy.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_04"); //A hunter found it in a disguised corpse among wild animals and brought it to me.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_05"); //I just figured out how to get such a poison myself....
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_06"); //Could you make me a bottle of this...
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_07"); //This is getting better and better. Why would I do that?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_08"); //Master Neoras needs it for his research.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_09"); //Oh, so.... that's different, of course.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_10"); //It would be an honor to help a fire magician and knowledgeable alchemist in his research.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_11"); //For the production of the poison I would need at least a Blufliegenstachel and a Minecrawlerzange.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_12"); //Maybe you'll find what you're looking for at old Zausel in the docks.

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Constantino could produce animal poison for me, but would need a blood fly spine and a minecrawler forceps.");
};

INSTANCE Info_Mod_Constantino_Mitgift2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift2_Condition;
	information	= Info_Mod_Constantino_Mitgift2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here, I got the sting and the forceps.";
};

FUNC INT Info_Mod_Constantino_Mitgift2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift2_15_00"); //Here, I got the sting and the forceps.

	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);
	Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, 1);

	B_ShowGivenThings	("Minecrawler forceps and blood fly spine given");

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_01"); //Very good. Very good. Just give me a moment...

	AI_UseMob	(self, "LAB", 1);

	AI_Wait	(self, 3);

	AI_UseMob	(self, "LAB", -1);

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_02"); //So, here's the concentrate for neoras. And give him my regards.

	B_GiveInvItems	(self, hero, ItPo_Tiergift, 1);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Constantino made me the animal poison.");
};

INSTANCE Info_Mod_Constantino_MangelQuest (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_MangelQuest_Condition;
	information	= Info_Mod_Constantino_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Buy fungicide (80 Gold)";
};

FUNC INT Info_Mod_Constantino_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Constantino_Anschlagtafel (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Anschlagtafel_Condition;
	information	= Info_Mod_Constantino_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Constantino_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Constantino == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder)
	&& (Npc_HasItems(hero, ItMi_Flask) >= Mod_Anschlagtafel_Khorinis_Constantino_Flasche)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich)
	&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut)
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe)
	&& (Npc_HasItems(hero, ItPl_Weed) >= Mod_Anschlagtafel_Khorinis_Constantino_Unkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze)
	{
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel);
		Npc_RemoveInvItems	(hero, ItPl_Blueplant, Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder);
		Npc_RemoveInvItems	(hero, ItMi_Flask, Mod_Anschlagtafel_Khorinis_Constantino_Flasche);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_02, Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz);
		Npc_RemoveInvItems	(hero, ItPl_SwampHerb, Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut);
		Npc_RemoveInvItems	(hero, ItPl_Heilknospe, Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe);
		Npc_RemoveInvItems	(hero, ItPl_Weed, Mod_Anschlagtafel_Khorinis_Constantino_Unkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Constantino_Gold);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Constantino = 0;
		Mod_Anschlagtafel_Khorinis_Constantino_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Constantino, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Constantino_Lehrer (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrer_Condition;
	information	= Info_Mod_Constantino_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me about alchemy.";
};

FUNC INT Info_Mod_Constantino_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Constantino_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Constantino_Lehrer_10_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
	Info_AddChoice 		(Info_Mod_Constantino_Lehrer,DIALOG_BACK,Info_Mod_Constantino_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Drink of light healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Constantino_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Light healing potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Constantino_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Potion of Quick Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Constantino_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Essence of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Constantino_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Extract of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Constantino_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixir of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Constantino_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Drink of light mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Constantino_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Light mana potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Constantino_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Constantino_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Extract", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Constantino_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Constantino_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Speed Potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Constantino_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixir of Spirit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Constantino_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 3)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Elixir of Strength", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Constantino_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice (Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Elixir of Dexterity", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Constantino_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Constantino_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};
FUNC VOID Info_Mod_Constantino_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Constantino_Trade (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Trade_Condition;
	information	= Info_Mod_Constantino_Trade_Info;
	trade		= 1;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Constantino_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Constantino_Pickpocket (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Pickpocket_Condition;
	information	= Info_Mod_Constantino_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Constantino_Pickpocket_Condition()
{
	C_Beklauen	(110, ItPl_Perm_Herb, 1);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_BACK, Info_Mod_Constantino_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Constantino_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Constantino_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Constantino_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Constantino_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Constantino_EXIT (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_EXIT_Condition;
	information	= Info_Mod_Constantino_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Constantino_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
