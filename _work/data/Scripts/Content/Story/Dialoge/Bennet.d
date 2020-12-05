var int Bennet_Saebel_Repariert;

INSTANCE Info_Mod_Bennet_Hi (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Hi_Condition;
	information	= Info_Mod_Bennet_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello, blacksmith. How's work?";
};

FUNC INT Info_Mod_Bennet_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Hi_15_00"); //Hello, blacksmith. How's work?
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_01"); //Bennet's my name. And how the work is going, you can guess when you look around.
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_02"); //Hardly anyone wears a weapon or armour here that doesn't come from me.
};

INSTANCE Info_Mod_Bennet_Haendler (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Haendler_Condition;
	information	= Info_Mod_Bennet_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you sell forging accessories?";
};

FUNC INT Info_Mod_Bennet_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Haendler_15_00"); //Do you sell forging accessories?
	AI_Output(self, hero, "Info_Mod_Bennet_Haendler_30_01"); //Only what I can spare. If there's always something missing, it's supply.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Bennet's a blacksmith on the farm and I'm sure he can sell me something.");
};

INSTANCE Info_Mod_Bennet_DerHof (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_DerHof_Condition;
	information	= Info_Mod_Bennet_DerHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "How do you like the yard?";
};

FUNC INT Info_Mod_Bennet_DerHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_DerHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_DerHof_15_00"); //How do you like the yard?
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_01"); //I'm quite happy with my place here. But tell me, the Onar is a real ass.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_02"); //I'd like to beat him up with the flat side of my blade.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_03"); //I already suggested it to Lares. But he thinks I'd better not do that.
};

INSTANCE Info_Mod_Bennet_Irdorath (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath_Condition;
	information	= Info_Mod_Bennet_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, blacksmith's master...";
};

FUNC INT Info_Mod_Bennet_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_00"); //Hey, blacksmith's master...
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_01"); //Master blacksmith? Don't talk so puffy.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_02"); //What do you want? Buy guns? If not, get out of here.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_03"); //I have a lot of work to do and hardly any usable material.
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_04"); //Actually, I wanted to take the Paladin's ship to an island and hoped that I might have a skilled blacksmith on board....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_05"); //An ocean voyage? Nah, Onar would keel-hold me if he knew something about seafaring.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_06"); //I still have a few more weapons to forge, but I hardly have enough raw materials.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_07"); //If only I had 15 ore and at least 20 rusty swords. I could make something out of it....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_08"); //Man, when I think of how much expensive raw material is buried in the graves behind the chapel....

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Well, Bennet still has to make swords. He complains that he has too little raw material, needs at least 15 ore and 20 rusty swords, when so much is lying around in the graves behind the yard.");
};

INSTANCE Info_Mod_Bennet_Irdorath2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath2_Condition;
	information	= Info_Mod_Bennet_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have some ore and rusty swords....";
};

FUNC INT Info_Mod_Bennet_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath2_15_00"); //I have some ore and rusty swords....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_01"); //What, really? What do you want for it?
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_02"); //Oh, yeah, you said something about a sea voyage.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_03"); //If you give me the clothes and give me a day to put the swords in, I'll come aboard. What do you say?
};

INSTANCE Info_Mod_Bennet_Irdorath3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath3_Condition;
	information	= Info_Mod_Bennet_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sure, here's what you need... and welcome aboard.";
};

FUNC INT Info_Mod_Bennet_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath2))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath3_15_00"); //Sure, here's what you need... and welcome aboard.

	B_ShowGivenThings	("15 ore and 20 rusty swords given");

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, 20);

	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath3_30_01"); //Yeah, sure, great, thanks. See you at the harbour tomorrow.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "With Bennet, we'd have a blacksmith on board.");

	B_GivePlayerXP	(300);

	Mod_BennetSchiffTag = Wld_GetDay();
	Mod_BennetDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bennet_Irdorath4 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath4_Condition;
	information	= Info_Mod_Bennet_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "I'm sorry, but it seems there are too many of us.";
};

FUNC INT Info_Mod_Bennet_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath3))
	&& (Mod_Irdorath == 0)
	&& (Mod_BennetDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath4_15_00"); //I'm sorry, but it seems there are too many of us. I can't take you with me.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath4_30_01"); //Too bad. I'll go back then.

	Mod_BennetDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Bennet_Gildenwaffe (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Gildenwaffe_Condition;
	information	= Info_Mod_Bennet_Gildenwaffe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have a gun for me?";
};

FUNC INT Info_Mod_Bennet_Gildenwaffe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Gildenwaffe_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Gildenwaffe_15_00"); //Do you have a gun for me?
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_01"); //I see you're a mercenary now, too.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_02"); //Then you are entitled to the same package as the other newcomers.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_03"); //Here's a one-handed, two-handed and a bow.

	B_ShowGivenThings	("Rough short sword, coarse axe and bow preserved");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);
	CreateInvItems	(hero, ItMw_2h_Sld_Axe, 1);
	CreateInvItems	(hero, ItRw_Sld_Bow, 1);
};

INSTANCE Info_Mod_Bennet_Piraten (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Piraten_Condition;
	information	= Info_Mod_Bennet_Piraten_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a sabre here to work on.";
};

FUNC INT Info_Mod_Bennet_Piraten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Aufgabe))
	&& (Npc_HasItems(hero, ItMw_Piratensaebel_Greg) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Piraten_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_00"); //I've got a sabre here to work on.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_01"); //Show me, lad.

	B_GiveInvItems	(hero, self, ItMw_Piratensaebel_Greg, 1);

	AI_UnequipWeapons	(self);

	EquipWeapon	(self, ItMw_Piratensaebel_Greg);

	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_02"); //Yeah. Nice work! That's what I like to do.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_03"); //And what does it cost?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_04"); //Preferably nothing at all.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_05"); //Nothing at all?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_06"); //Because that's what I'd like to keep.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_07"); //Impossible. My boss is chasing me over the plank.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_08"); //Hm...

	AI_UnequipWeapons	(self);
	EquipItem	(self, ItMw_Piratensaebel_Greg);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_09"); //I'll make you a deal.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_10"); //And what's that?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_11"); //Your boss gets a weapon that's twice as stable and three times as sharp as anything he's ever waved.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_12"); //Go and ask him.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_13"); //He won't believe this. Me neither, by the way. How are you gonna do that?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_14"); //I'll explain it to you. But don't tell anyone.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_15"); //Well, it was more of a coincidence. I always have a tub of molar fat. I'll grease the guns with it when they're done.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_16"); //Now one day the bucket stood out here and I dipped my part in the fat instead of the water bucket to cool it down by mistake.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_17"); //and the way I pull out the sword, it's as black as night.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_18"); //And then what?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_19"); //Then I realized it's much harder to hammer than before.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_20"); //I took the heavier hammer and went on. Finally, I cut it myself.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_21"); //Sharp as a razor, I tell you! I've never seen anything like it myself.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_22"); //Me neither. Where's that thing?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_23"); //I always have it with me.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_24"); //You know something? I'll just give you the sword.

	B_GiveInvItems	(self, hero, ItMw_BennetGreg, 1);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_25"); //Let your boss see for himself.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_26"); //You must care a lot about the old blade.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_27"); //Well, I guess that's what you can do.

	B_LogEntry	(TOPIC_MOD_GREG_ROST, "Bennet gave me a special sword in exchange for Greg's saber. It seems to be very stable and sharp. I hope Greg's satisfied.");
};

INSTANCE Info_Mod_Bennet_Blutkelch (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch_Condition;
	information	= Info_Mod_Bennet_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "They say you make special tools, too.";
};

FUNC INT Info_Mod_Bennet_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_00"); //They say you make special tools, too.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_01"); //Was well. For example, I currently work with steel.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_02"); //Steel?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_03"); //Exactly. A material three times harder than normal iron.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_04"); //That's a good thing. I have a pickaxe here that's kind of too soft.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_05"); //No problem for me. I'll build you a steel hoe.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_06"); //And when can I have it?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_07"); //Well, the production is laborious and not cheap. There must be 500 gold by now.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_08"); //What? 500 gold for a hoe?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_09"); //Steel hoe! Besides, I'm the only one who can do this to you.

	Mod_ASS_Bennet = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);

	Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Nevertheless. I can't spend that much.", Info_Mod_Bennet_Blutkelch_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Here's the gold. When will the thing be finished?", Info_Mod_Bennet_Blutkelch_A);
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_B()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_00"); //Nevertheless. I can't spend that much.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_01"); //Then I'll make you a suggestion: I need more molar fat soon.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_02"); //If you get me 50 servings like that, I'll cut you off 200 gold.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_03"); //Where am I gonna get a bunch like that? I can't put that together with the dealers.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_04"); //That's my problem, too. You should make it yourself.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_05"); //How am I supposed to do that? I'm not a butcher.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_06"); //Exactly. You should ask him.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_07"); //And where to find...
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_08"); //I hear there's one in Khorata. People in town are paying huge sums of money for his cured lamb.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_09"); //All right, then. I hope the hoe will be ready when I get back.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_10"); //Certainly.

	Mod_ASS_Blutkelch3 = 4;

	Log_CreateTopic	(TOPIC_MOD_ASS_FETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_FETT, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_ASS_STAHLHACKE, TOPIC_MOD_ASS_FETT, "I found it at the blacksmith Bennet. He's gonna make me a steel hoe. I have to get him 50 molar fats, though. The butcher in Khorata could help.", "I need to get 50 servings of molar fat for bennet. The butcher in Khorata could help.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

FUNC VOID Info_Mod_Bennet_Blutkelch_A()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_A_15_00"); //Here's the gold. When will the thing be finished?

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_A_30_01"); //As usual with us. Come back tomorrow.

	Mod_ASS_Blutkelch3 = 3;

	B_LogEntry	(TOPIC_MOD_ASS_STAHLHACKE, "I found it at the blacksmith Bennet. He's gonna make me a steel hoe. That should be enough for the verdigris.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

INSTANCE Info_Mod_Bennet_Blutkelch2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch2_Condition;
	information	= Info_Mod_Bennet_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch2_Condition()
{
	if (Mod_ASS_Blutkelch3 == 3)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch2_30_00"); //Here you come, then. Your hoe's ready.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch2_15_01"); //And here's your gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_Blutkelch3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch3_Condition;
	information	= Info_Mod_Bennet_Blutkelch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch3_Condition()
{
	if (Mod_ASS_Blutkelch3 == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	&& (Npc_HasItems(hero, ItMi_Moleratlubric_MIS) >= 50)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_00"); //Here you come, then. Your hoe's ready.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_01"); //Let me see that thing.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_02"); //Where's my fat?
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_03"); //Here. What do you need all this for?

	B_GiveInvItems	(hero, self, ItMi_Moleratlubric_MIS, 50);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_04"); //Trade secret....
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_05"); //Good too. Here's the rest of the gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_06"); //Always at your service.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_HaradLehrling (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_HaradLehrling_Condition;
	information	= Info_Mod_Bennet_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's up?";
};

FUNC INT Info_Mod_Bennet_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling4))
	&& (Mod_HaradLehrling_Kampf == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_HaradLehrling_15_00"); //How's it going?
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_01"); //Not so good right now. May Beliar take me, from yesterday to today Torlof has withdrawn my order.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_02"); //I'm only allowed to forge armor now. All that gold goes to Harad now.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_03"); //I don't even want to know what dirty business he did to take away my work.
};

instance Info_Mod_Bennet_Lehrer (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Lehrer_Condition;
	information	= Info_Mod_Bennet_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can you teach me how to forge a sword?";
};

func int Info_Mod_Bennet_Lehrer_Condition ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_Lehrer_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_15_00"); //Can you teach me how to forge a sword?
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_01"); //Sure.
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_02"); //That's gonna cost a little something. Let's say 30 gold pieces.
	
	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "Maybe later.", Info_Mod_Bennet_Lehrer_Later);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "Fine. Here's 30 for you.", Info_Mod_Bennet_Lehrer_Pay);
};

func void Info_Mod_Bennet_Lehrer_Pay()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Pay_15_00"); //Well, here's 30.
	
	if (B_GiveInvItems (hero, self, ItMi_Gold, 30))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_01"); //And that was damn cheap! We can start as soon as you're ready.
		
		Bennet_TeachCommon = 1;
		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Bennet can teach me a blacksmith's craft.");
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_02"); //Don't bullshit me. Thirty and no coin less.
	};

	Info_ClearChoices (Info_Mod_Bennet_Lehrer);
};

func void Info_Mod_Bennet_Lehrer_Later()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Later_15_00"); //Later, maybe.

	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
};

instance Info_Mod_Bennet_KlingeSchaerfen (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_KlingeSchaerfen_Condition;
	information	= Info_Mod_Bennet_KlingeSchaerfen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Perc: Sharpen blade (5 LP)";
};

func int Info_Mod_Bennet_KlingeSchaerfen_Condition ()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "Perc: Sharpen blade (500 gold)";
	}
	else
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "Perc: Sharpen blade (5 LP)";
	};

	if (Schaerfen_Perk == FALSE)
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_KlingeSchaerfen_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_KlingeSchaerfen_15_00"); //I want to learn to sharpen blades.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_01"); //To do this, you must take your blade to a grindstone. However, this only works with sharp weapons.

		Schaerfen_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_02"); //Come back when you're ready.
	};
};

instance Info_Mod_Bennet_TeachCOMMON (C_INFO)
{
	npc			= Mod_562_NONE_Bennet_NW;
	nr          = 1;
	condition	= Info_Mod_Bennet_TeachCOMMON_Condition;
	information	= Info_Mod_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Learn to forge", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	{
		return TRUE;
	};
};

func void Info_Mod_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Bennet_TeachCOMMON_15_00"); //Teach me how to forge a sword!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_01"); //It's simple: Get yourself a piece of crude steel, hold it in the fire until it glows.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_02"); //Then you'll strike the blade right on the anvil.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_03"); //Make sure that the blade does not get too cold. You only have a few minutes to work on your weapon...
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_04"); //You'll find out the rest - just practice stuff.
	};
};

instance Info_Mod_Bennet_WannaSmithORE (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_WannaSmithORE_Condition;
	information	= Info_Mod_Bennet_WannaSmithORE_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me how to forge magic ore weapons!";
};

func int Info_Mod_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& (hero.guild == GIL_MIL)	
	{
		return 1;
	};
};

func void Info_Mod_Bennet_WannaSmithORE_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_00"); //Teach me how to forge magic ore weapons!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_01"); //You don't even know the basics.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_02"); //Learn to forge a proper sword first. Then we'll see.
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_03"); //Well, you can already forge a proper sword.
		AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_04"); //Well, go ahead, then....
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_05"); //So the most important thing is that it doesn't matter whether your weapon is made of pure ore or whether you cover a simple steel blade with a layer of ore. It only depends on the surface.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_06"); //And because that damned stuff is so expensive, you're gonna get a steel blank and some chunks of ore.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_07"); //Of course, it is not enough simply to cover a finished sword with ore. You'll have to forge the gun yourself.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_08"); //Everything else depends on the weapon you want to make.

		Bennet_TeachSmith = 1;
	};
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

instance Info_Mod_Bennet_TeachSmith		(C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 30;
	condition	= Info_Mod_Bennet_TeachSmith_Condition;
	information	= Info_Mod_Bennet_TeachSmith_Info;
	permanent	= 1;
	important	= 0;
	description	= "I want to know more about forging magic ore weapons.";
};

func int Info_Mod_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == 1)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_TeachSmith_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_TeachSmith_15_00"); //I want to know more about forging magical ore weapons.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		AI_Output(self, hero, "Info_Mod_Bennet_TeachSmith_30_07"); //No, not yet. Come back later.
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_01"); //I can teach you to forge ore swords or even two-handed swords.
		Bennet_Kap2Smith = 1;
	}
	else if (Kapitel == 3)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_02"); //I've improved my technique. I can now teach you how to make bastard swords or heavy two-handed swords with ore.
		Bennet_Kap3Smith = 1;
	};
	
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
	Info_AddChoice (Info_Mod_Bennet_TeachSmith, DIALOG_BACK, Info_Mod_Bennet_TeachSmith_BACK);

	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Info_Mod_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Info_Mod_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Info_Mod_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Info_Mod_Bennet_TeachSmith_2hSpecial2);
	};
};

FUNC VOID Info_Mod_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
};
func VOID Info_Mod_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_01);	
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_01);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_02);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_02);
};

INSTANCE Info_Mod_Bennet_Trade (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Trade_Condition;
	information	= Info_Mod_Bennet_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bennet_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bennet_Pickpocket (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Pickpocket_Condition;
	information	= Info_Mod_Bennet_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bennet_Pickpocket_Condition()
{
	C_Beklauen	(88, ItMiSwordraw, 6);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_BACK, Info_Mod_Bennet_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bennet_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bennet_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bennet_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bennet_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bennet_EXIT (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_EXIT_Condition;
	information	= Info_Mod_Bennet_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bennet_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
