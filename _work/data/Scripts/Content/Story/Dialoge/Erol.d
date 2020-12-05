INSTANCE Info_Mod_Erol_Haendler (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Haendler_Condition;
	information	= Info_Mod_Erol_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "This place is full of crap.";
};

FUNC INT Info_Mod_Erol_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Haendler_15_00"); //This place is full of crap.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_01"); //Yeah, there's a lot going on in the course of life.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_02"); //Got some real antiques.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_03"); //You want to buy some of this?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OHNELAGER, "The dealer Erol sells antiques.");
};

INSTANCE Info_Mod_Erol_DunklerPilger (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_DunklerPilger_Condition;
	information	= Info_Mod_Erol_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you seen a dark pilgrim lately, by any chance?";
};

FUNC INT Info_Mod_Erol_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_DunklerPilger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_DunklerPilger_15_00"); //Have you seen a dark pilgrim come by lately?
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_01"); //(surprised) Yes, indeed. That you're asking about it now... only recently.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_02"); //I had just dozed in half-sleep when suddenly dark visions, frightening pictures haunted my mind, ripped me out of my sleep.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_03"); //I couldn't say exactly what it was, but when I stepped outside, I saw this dark figure pass by my hut, suddenly changing direction and disappearing into the forest where the old cemetery is.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_04"); //Extremely creepy.... even for an old warhorse like me. It still crunches me when I think about it....
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_05"); //Why don't you come back when you find the guy? Maybe you can do me a favor.

	B_GivePlayerXP	(100);

	Mod_Erol_Unterwegs_Day = Wld_GetDay();

	B_StartOtherRoutine	(Mod_7036_NONE_Pilger_NW, "GRAVEYARD");
	AI_Teleport	(Mod_7036_NONE_Pilger_NW, "NW_FARM4_WOOD_MONSTER_MORE_03");

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "I'm right on the pilgrim's heels. Erol - very worried about the figure - has only recently seen her disappearing into the forest towards the cemetery, only a few meters away.");
};

INSTANCE Info_Mod_Erol_Blutkelch (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch_Condition;
	information	= Info_Mod_Erol_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, you.";
};

FUNC INT Info_Mod_Erol_Blutkelch_Condition()
{
	if (Mod_ASS_ErolWiederDa == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_00"); //Hey, you.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_01"); //Yeah, what's up?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_02"); //You're my last resort. I am urgently looking for a so-called blood cup.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_03"); //A nice piece of work. Richly decorated and superbly worked. Rarely seen that.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_04"); //Then you have this cup?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_05"); //Had, my dear, had.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_06"); //Then you sold it? To whom?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_07"); //No, not sold. One night, I was insidiously knocked down and robbed.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_08"); //When I woke up, I realized that among other things this cup had disappeared.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_09"); //Do you know who that was?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_10"); //No, but I have a hunch. Lately, hooded figures have been sneaking around here at night.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_11"); //Once I could see one of them. I didn't recognize anyone. Dark armour and slits in the hoods.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_12"); //Hmm...
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_13"); //Then once I saw a green light up in the gobblin cave.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_14"); //Aha!
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_15"); //You don't believe me?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_16"); //Yes, yes, yes. I'll look into it. I really need that cup.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_17"); //And I would at least like to have my golden sword back.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_18"); //I'll do what I can. See you later.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Obviously, one of my brothers has already taken care of the blood cup, but he didn't kill the owner. Hmm... is something wrong? I have to ask Azhar.");
};

INSTANCE Info_Mod_Erol_Blutkelch2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch2_Condition;
	information	= Info_Mod_Erol_Blutkelch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got something for you.";
};

FUNC INT Info_Mod_Erol_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Blutkelch))
	&& (Npc_HasItems(hero, ItMw_2H_Eminem_Goldschwert_01_Erol) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_00"); //I got something for you.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_01"); //My sword or what?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_02"); //Yes, here.

	B_GiveInvItems	(hero, self, ItMw_2H_Eminem_Goldschwert_01_Erol, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_03"); //Thank you very much, stranger. That's worth a thousand gold to me.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_04"); //Then we are both satisfied. Take care, now.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_05"); //You too.

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Erol_Fahrender (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender_Condition;
	information	= Info_Mod_Erol_Fahrender_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_DunklerPilger))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_00"); //It's good to meet you.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_01"); //If you say so. What's up?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_02"); //Well, I've decided to travel again.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_03"); //To supply the farms, taverns and farmers, to accept orders and so on.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_04"); //Is that worth it?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_05"); //Sure. I've done it before.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_06"); //But then highwaymen attacked me under the bridge and robbed me completely.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_07"); //And then I decided to stay at my cabin.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_08"); //Where you don't deserve anything...
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_09"); //Exactly. And you can't live on nothing. Hardly anyone comes to me and wants something. I'm moving out again.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_10"); //Good luck: And watch out. The area hasn't gotten much safer since the barrier fell.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_11"); //I've noticed that, too.

	B_StartOtherRoutine	(self, "FAHRENDER");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender2_Condition;
	information	= Info_Mod_Erol_Fahrender2_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's up?";
};

FUNC INT Info_Mod_Erol_Fahrender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_00"); //How's it going?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_01"); //Can't complain. Got some gold in the bag and a bigger order.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_02"); //Yes?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_03"); //I met one of the fire magicians in town.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_04"); //Those of their leaders are interested in a part to be found in the Minental.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_05"); //Now I don't know anything about it.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_06"); //When I got to the island, there was a barrier. Perhaps you can help me?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_07"); //I think so, yes. There's a merchant selling tickets in the waterfront. He should have something for you.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_08"); //Thanks for the tip. I think we're even.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_09"); //That's the way it has to be. Good luck.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender3 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender3_Condition;
	information	= Info_Mod_Erol_Fahrender3_Info;
	permanent	= 0;
	important	= 0;
	description	= "How was the Minental?";
};

FUNC INT Info_Mod_Erol_Fahrender3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender2))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender3_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender3_15_00"); //How was the Minental?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_01"); //How should I know?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_02"); //This Brahim has sold me a ticket, but then a guard of the Paladin stops me. They wouldn't let me through for gold and good words.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_03"); //So I went back and now I'm here....
};

INSTANCE Info_Mod_Erol_Fahrender4 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender4_Condition;
	information	= Info_Mod_Erol_Fahrender4_Info;
	permanent	= 0;
	important	= 0;
	description	= "The pass should be open again.";
};

FUNC INT Info_Mod_Erol_Fahrender4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Asylanten2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender4_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_00"); //The pass should be open again. I checked the situation in the Minental for Lord Hagen and was able to calm him down.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_01"); //Then he tried to pull the guard again. That should have happened by now. Why don't you try it again?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_02"); //But I can't handle this map either. Never been there before.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_03"); //Then return the order.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_04"); //It is. But maybe you' d--
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_05"); //That's what I thought. What do I need to know?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_06"); //There's supposed to be the Old Camp, and there's a chapel of Fire Magicians in there. I can learn more about that. You, not me....

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "I don't have time for that. I'm on my own in an important matter.", Info_Mod_Erol_Fahrender4_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "All right, all right. I'll have a look. But I don't do it for nothing.", Info_Mod_Erol_Fahrender4_A);
};

FUNC VOID Info_Mod_Erol_Fahrender4_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_B_15_00"); //I don't have time for that. I'm on my own in an important matter.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_B_04_01"); //Too bad. Then I'd better give it back.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);
};

FUNC VOID Info_Mod_Erol_Fahrender4_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_A_15_00"); //All right, all right. I'll have a look. But I don't do it for nothing.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_A_04_01"); //It won't be your damage. I promise.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Mod_Erol_Fahrender = 1;

	Log_CreateTopic	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_FEUERMAGIER, "For Erol in the Minental I have to find a' part' in which the Fire Magicians are interested. In the Chapel of Fire Magicians in the Old Camp there are more information.");
};

INSTANCE Info_Mod_Erol_Fahrender5 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender5_Condition;
	information	= Info_Mod_Erol_Fahrender5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender4))
	&& (Npc_HasItems(hero, ItAr_GewandDerMacht) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender5_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_00"); //So, did you find the thing?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_01"); //Certainly, but it's a mystery to me how the magicians could have given you this mission.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_02"); //You would never have found it, even if you had been in the Minental.

	B_GiveInvItems	(hero, self, ItAr_GewandDerMacht, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_03"); //Was it that difficult?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_04"); //You can say that again. And hardly pay.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_05"); //At Innos! What do you get?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_06"); //Let's wait and see what the council says. Do not surrender less than 2000 gold.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_07"); //I know about it. See you later.

	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender6 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender6_Condition;
	information	= Info_Mod_Erol_Fahrender6_Info;
	permanent	= 0;
	important	= 0;
	description	= "So we meet again.";
};

FUNC INT Info_Mod_Erol_Fahrender6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender5))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender6_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_00"); //So we meet again. Were the magicians happy with the robe?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_01"); //You better believe it! Glad to warn you. But they also mysteriously did.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_02"); //Anyway, they rewarded me abundantly.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_03"); //Which means?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_04"); //2500 gold got Pyrokar out. Here's 2000 for you. That's where you did your work.

	B_GiveInvItems	(self, hero, ItMi_Gold, 2000);

	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_05"); //That's fair enough. See you some other time.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender7 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender7_Condition;
	information	= Info_Mod_Erol_Fahrender7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender6))
	&& (Wld_GetDay()-3 > Mod_Erol_Unterwegs_Day)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender7_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_00"); //Small world.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_01"); //The island once and for all. You all right?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_02"); //Not so bad...
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_03"); //Where's the mess this time?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_04"); //The water magician in the city has asked me to send Cavalorn, one of the people who are in the excavation site, to him.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_05"); //And what's the problem?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_06"); //There's a guy at the construction site. He won't let me into the temple.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_07"); //Then get a permit or something from Vatras.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_08"); //I've thought about it. But he has nothing to write about.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "I'll go with you and talk to this Lance.", Info_Mod_Erol_Fahrender7_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "Then tell him you can't do this. That's it.", Info_Mod_Erol_Fahrender7_A);
};

FUNC VOID Info_Mod_Erol_Fahrender7_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_00"); //I'll go with you and talk to this Lance.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_B_04_01"); //You would do that?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_02"); //If I say so. Let's get going.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	B_StartOtherRoutine	(self, "FOLLOWTOLANCE");

	Mod_Erol_Fahrender = 8;

	self.aivar[AIV_Partymember] = TRUE;

	Log_CreateTopic	(TOPIC_MOD_EROL_LANCE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_LANCE, "I'm gonna take Erol to the temple because Lance won't let him in.");
};

FUNC VOID Info_Mod_Erol_Fahrender7_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_00"); //Then tell him you can't do this. That's it.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_01"); //Or slap that Lance's nose in the face
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_A_04_02"); //I don't like making enemies. It's detrimental to? s business.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_03"); //You need to know what you're doing...

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);
};

INSTANCE Info_Mod_Erol_Fahrender8 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender8_Condition;
	information	= Info_Mod_Erol_Fahrender8_Info;
	permanent	= 0;
	important	= 0;
	description	= "All right, that's it. I'm leaving.";
};

FUNC INT Info_Mod_Erol_Fahrender8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lance_Erol))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender8_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender8_15_00"); //All right, that's it. I'm leaving now.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender8_04_01"); //Thank you first.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATWMS");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Erol_Fahrender9 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender9_Condition;
	information	= Info_Mod_Erol_Fahrender9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Well, did it work?";
};

FUNC INT Info_Mod_Erol_Fahrender9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender8))
	&& (Mod_Erol_Fahrender == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender9_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_00"); //Well, did it work?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_01"); //Jo. But what's the big deal with the shining gate, no one wanted to tell me.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_02"); //Then I won't tell you anything. And?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_03"); //What and what?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_04"); //You owe me one.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_05"); //Oh, I see. Here, I can give you 300 gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Erol_Soeldner (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Soeldner_Condition;
	information	= Info_Mod_Erol_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you with the mercenaries?";
};

FUNC INT Info_Mod_Erol_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Soeldner_15_00"); //Are you with the mercenaries?
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_04_01"); //Save Adanos! I couldn't compete with those young guys anymore.
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_04_02"); //But I like doing business with them, and for that they have my little hut in mind and make sure nothing happens.
};

INSTANCE Info_Mod_Erol_Muenzen (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen_Condition;
	information	= Info_Mod_Erol_Muenzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a little something to do for me?";
};

FUNC INT Info_Mod_Erol_Muenzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen_15_00"); //Do you have a little something to do for me?
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_01"); //Quite. I'm always interested in old coins.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_02"); //If you bring me some, I'll give you a little gold, with many coins, there's a little bonus.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_03"); //Wouldn't that be something?
};

INSTANCE Info_Mod_Erol_Muenzen2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen2_Condition;
	information	= Info_Mod_Erol_Muenzen2_Info;
	permanent	= 1;
	important	= 0;
	description	= "I got some old coins for you....";
};

FUNC INT Info_Mod_Erol_Muenzen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Muenzen))
	&& (Npc_HasItems(hero, ItMi_OldCoin) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen2_15_00"); //I got some old coins for you....

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);

	if (Npc_HasItems(hero, ItMi_OldCoin) >= 100)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "a hundred coins.", Info_Mod_Erol_Muenzen2_C);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 10)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Give ten coins.", Info_Mod_Erol_Muenzen2_B);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Give a coin.", Info_Mod_Erol_Muenzen2_A);
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_C()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 100);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 100);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_04_00"); //You're making me croesus! Where am I going with this? (laughs)
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_04_01"); //Give it to me, you've earned yourself a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 450);

	B_GivePlayerXP	(750);

	B_RaiseHandelsgeschick (3);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_B()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 10);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 10);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_B_04_00"); //That's a fair amount. There's more gold for that.

	B_GiveInvItems	(self, hero, ItMi_Gold, 35);

	B_GivePlayerXP	(70);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_A()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 1);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_A_04_00"); //Thanks. Way to go!

	B_GiveInvItems	(self, hero, ItMi_Gold, 3);

	B_GivePlayerXP	(5);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

INSTANCE Info_Mod_Erol_Heiltrank (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Heiltrank_Condition;
	information	= Info_Mod_Erol_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(give healing potion)";
};

FUNC INT Info_Mod_Erol_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	Info_AddChoice	(Info_Mod_Erol_Heiltrank, DIALOG_BACK, Info_Mod_Erol_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Essence of Healing", Info_Mod_Erol_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Elixir of Healing", Info_Mod_Erol_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Extract of Healing", Info_Mod_Erol_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Essence of Healing", Info_Mod_Erol_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Drink of light healing", Info_Mod_Erol_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Light healing potion", Info_Mod_Erol_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Potion of Quick Healing", Info_Mod_Erol_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Erol_Trade (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Trade_Condition;
	information	= Info_Mod_Erol_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erol_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erol_Pickpocket (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Pickpocket_Condition;
	information	= Info_Mod_Erol_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Erol_Pickpocket_Condition()
{
	C_Beklauen	(117, ItMi_OldCoin, 18);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_BACK, Info_Mod_Erol_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erol_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erol_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
};

FUNC VOID Info_Mod_Erol_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erol_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erol_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erol_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erol_EXIT (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_EXIT_Condition;
	information	= Info_Mod_Erol_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erol_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
