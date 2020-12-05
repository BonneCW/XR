INSTANCE Info_Mod_Wulfgar_Hey (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hey_Condition;
	information	= Info_Mod_Wulfgar_Hey_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm new here.";
};

FUNC INT Info_Mod_Wulfgar_Hey_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_Hey_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hey_15_00"); //I'm new here.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_01"); //I can see that. When Cyrco has admitted you to the rank of Ranger, I will trade with you.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_02"); //I have here some of the sayings and potions that are certainly interesting for you.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_03"); //Besides, I can help you increase your magic power.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_WALDIS, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_WALDIS, TOPIC_MOD_LEHRER_WALDIS, "Wulfgar can sell me potions and barrels.", "Wulfgar can help me increase my MANA.");
};

INSTANCE Info_Mod_Wulfgar_Hi (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hi_Condition;
	information	= Info_Mod_Wulfgar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here, I have a message for you.";
};

FUNC INT Info_Mod_Wulfgar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_NovizePass))
	&& (Npc_HasItems(hero, ItWr_NovizeJGPass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_00"); //Here, I have a message for you.

	B_GiveInvItems	(hero, self, ItWr_NovizeJGPass, 1);
	Npc_RemoveInvItems	(self, ItWr_NovizeJGPass, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_01"); //Can you do anything with that name?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_02"); //Let me take a look at that.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_03"); //Yeah, that name sounds familiar. I'll see what I can find about him.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_04"); //Come back later after I finish my research.

	B_LogEntry	(TOPIC_MOD_JG_BANDITENSCHULD, "Finally a break.");
	B_SetTopicStatus	(TOPIC_MOD_JG_BANDITENSCHULD, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Wulfgar_Turm (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm_Condition;
	information	= Info_Mod_Wulfgar_Turm_Info;
	permanent	= 0;
	important	= 0;
	description	= "You wanted me...";
};

FUNC INT Info_Mod_Wulfgar_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_00"); //You wanted me...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_01"); //Oh, sure enough. Listen: I found out a lot about this Khorgor.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_02"); //I'm listening.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_03"); //This magician used to be a high-ranking member of the Water Magicians.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_04"); //Clearly off the path of equilibrium these people embody.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_05"); //What surprises me is that it is said to have a weakness for the sea and water in general.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_06"); //What does that mean? Do you see a clue?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_07"); //Certainly. There's a ruin in the valley of the river Minental. Its lower entrance leads directly to the sea.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_08"); //You could find him there, I mean.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_09"); //But be careful. He's become very powerful, it seems to me.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_10"); //Probably black magic, Cyrco believes.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_11"); //That can be good.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_12"); //And where exactly...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_13"); //South of the colony, towards the sea. Can't miss it, actually.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_14"); //Oh, you mean the Fog Tower. I've been there before. Xardas sent me there.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_15"); //Xardas? The black magician?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_16"); //That's the one. He was looking for a powerful weapon....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_17"); //Then don't let me stop you.

	Log_CreateTopic	(TOPIC_MOD_JG_TURM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TURM, "Uh-huh. A disguised water magician could be this Khorgor. I'm supposed to check the fog tower.");
};

INSTANCE Info_Mod_Wulfgar_Turm2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm2_Condition;
	information	= Info_Mod_Wulfgar_Turm2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sorry about that. I've got something new.";
};

FUNC INT Info_Mod_Wulfgar_Turm2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_00"); //Sorry about that. I've got something new.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_01"); //Yes? Tell me about it.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_02"); //I met the seeker again in the tower. But he escaped from me again.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_03"); //With Adanos! We're getting nowhere.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Wulfgar_Key (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key_Condition;
	information	= Info_Mod_Wulfgar_Key_Info;
	permanent	= 0;
	important	= 0;
	description	= "But I found a key there.";
};

FUNC INT Info_Mod_Wulfgar_Key_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_HasItems(hero, ItKe_SuchenderJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_00"); //But I found a key there.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_01"); //Let me see that.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_02"); //Here.

	B_GiveInvItems	(hero, self, ItKe_SuchenderJG, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_03"); //That's a strange beard. And squiggled upstairs.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_04"); //Hm... a special key... hm...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_05"); //The trunk for that should be hard to find.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_06"); //Xardas told me about magical places. One of them is said to be the Stonehege.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_07"); //And there are also chests that cannot be opened with the lock pick.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_08"); //How do you know?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_09"); //I've been inside. In another matter.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_10"); //That could well be true. Look what's in the trunk. We need to know that.

	B_GiveInvItems	(self, hero, ItKe_SuchenderJG, 1);

	B_GivePlayerXP	(150);

	Log_CreateTopic	(TOPIC_MOD_JG_KEY, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_KEY, "I'm gonna try the key out on the chests in the stone enclosure. Maybe I'm lucky.");
};

INSTANCE Info_Mod_Wulfgar_Key2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key2_Condition;
	information	= Info_Mod_Wulfgar_Key2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm back. The key fitted.";
};

FUNC INT Info_Mod_Wulfgar_Key2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key))
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_00"); //I'm back. The key fitted.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_01"); //And what did you find?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_02"); //I don't really know. A spell roll that you can't use, a note that you can't read and a little bit about saving...
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_03"); //Let me see that.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_04"); //Here. Role and message.

	Npc_RemoveInvItems	(hero, ItWr_TruhenNotizJG, 1);
	Npc_RemoveInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Mysterious role and message given");

	B_UseFakeScroll();

	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_05"); //And?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_06"); //Patience! Hmm. That seems to me to be one of the very old languages. Can't read it herself....
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_07"); //Then the key was free?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_08"); //What a room! Maybe the water magicians can help.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_09"); //They study ancient history at the excavation site.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_10"); //Certainly. We've even gone to a new place. Somewhere in the northwest of the island.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_11"); //You need to tell me more about that occasionally.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_12"); //All right, I will. First check with Saturas. See you later.

	CreateInvItems	(hero, ItWr_TruhenNotizJG, 1);
	CreateInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Receive mysterious sayings and messages");

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_SUCCESS);
	Log_CreateTopic	(TOPIC_MOD_JG_SCROLL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_SCROLL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_SCROLL, "A new language. Saturas or Riordian should know that.");
};

INSTANCE Info_Mod_Wulfgar_Opferschale (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Opferschale_Condition;
	information	= Info_Mod_Wulfgar_Opferschale_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Opferschale_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Opferschale))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Opferschale_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_00"); //What's up?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_01"); //I'm looking for the sacrificial bowl.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_02"); //What sacrificial bowl?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_03"); //Na DIE. That's all I know.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_04"); //Hm. With Adanos! Khorinis is big. Don't you have a clue?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_05"); //Well, an old saying role promises help in extreme hardship. I need the sacrificial bowl.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_06"); //I don't know about that. I'll look at my books. It'll take a few days.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_07"); //And I look for new people....

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_JG_OPFERSCHALE, "Cyrco and Wulfgar don't know anything about the shell. Wulfgar wants to read in the books. It'll take a few days.");
};

INSTANCE Info_Mod_Wulfgar_Felle (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle_Condition;
	information	= Info_Mod_Wulfgar_Felle_Info;
	permanent	= 0;
	important	= 0;
	description	= "One more thing. Torgan told me you're working the skins differently than usual.";
};

FUNC INT Info_Mod_Wulfgar_Felle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torgan_WeicheFelle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_00"); //One more thing. Torgan told me you're working the skins differently than usual.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_01"); //(pride) Well, it's true. You won't get so stiff after a while.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_02"); //Of course, this is no longer suitable for armor and so on.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_03"); //Interesting! And how...?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_04"); //Come with me. Let me show you.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GERBEN");
};

INSTANCE Info_Mod_Wulfgar_Felle2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle2_Condition;
	information	= Info_Mod_Wulfgar_Felle2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle2_Info()
{
	if (Npc_HasItems (self,ItMi_Scoop) == 0)
	{
		CreateInvItem (self,ItMi_Scoop);				
	};

	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob (self, "CAULDRON", 1);
	};

	AI_UseMob	(self, "CAULDRON", -1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_00"); //Oops. I need new water.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_01"); //Uh-huh. And now I'm supposed to....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_02"); //I sure do. Best in the forest near the small pond. Here, take the bucket with you.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_03"); //All right, all right.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar wants to show me how to properly tanned skins. I'm supposed to get water from the Tümepl here in the woods.");
};

INSTANCE Info_Mod_Wulfgar_Felle3 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle3_Condition;
	information	= Info_Mod_Wulfgar_Felle3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle2))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle3_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_00"); //Ah. Oh, there you are. Give me the water.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_01"); //Please, master. And now what?

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_02"); //Now I have to heat the boiler first. You're getting some hides from the hunters upstairs by now.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_03"); //Aha! Anything special?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_04"); //Wolf or warg is good.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_05"); //I'll hurry.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "I'm supposed to get skins from the hunting camp and bring Wulfgar. Wolf or Wargfell.");

	B_StartOtherRoutine	(self, "KOCHEN");
};

INSTANCE Info_Mod_Wulfgar_Felle4 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle4_Condition;
	information	= Info_Mod_Wulfgar_Felle4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Now, however.... What have you got to do?";
};

FUNC INT Info_Mod_Wulfgar_Felle4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baldur_Felle))
	&& (Npc_HasItems(hero, ItAt_Wolffur) >= 5)
	&& (Npc_HasItems(hero, ItAt_WargFur) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle4_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_00"); //Now, however.... What have you got to do?

	Npc_RemoveInvItems	(hero, ItAt_Wolffur, 5);
	Npc_RemoveInvItems	(hero, ItAt_WargFur, 5);

	B_ShowGivenThings	("5 Wolf- and warning skins given");

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_01"); //All right, I'll explain it to you.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_02"); //Put a large kettle of salt water on top and add half a bottle of alum and some borax.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_03"); //Warm it up and mix well.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_04"); //Until the brine, which is the name of this unappetizing broth, is heated, scraped with a sharp knife meat remains, muscles and the subcutaneous skin out of the fur and washed it thoroughly.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_05"); //You should have been a butcher.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_06"); //Silence. If it's completely clean inside, the fur gets into the kettle.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_07"); //You then often walk through it vigorously. In between I add some spruce or oak bark.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_08"); //This broth prevents the coat from hardening later on.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_09"); //After ten hours I stretch fur on the frame to dry.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_10"); //Before it is completely dry, I rub it thoroughly with molar fat to keep it supple.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_11"); //You see, it's a lot of work.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_12"); //With Adanos! Who's gonna pay for that?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_13"); //Hi, hi, hi, hi. Who can afford it. But you get one for free. Tomorrow it'll be ready.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_14"); //(amazed) Master?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_15"); //You've already done a lot for us.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_16"); //Thanks, see you tomorrow.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "The druid gives me a cuddly fur. Tomorrow it'll be ready.");

	Mod_JG_WulfgarFell_Day = Wld_GetDay();

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Wulfgar_Felle5 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle5_Condition;
	information	= Info_Mod_Wulfgar_Felle5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle4))
	&& (Wld_GetDay() > Mod_JG_WulfgarFell_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle5_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle5_04_00"); //You're back at last. Your coat is ready. Here you have it.

	B_GiveInvItems	(self, hero, ItMi_Kuschelfell, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle5_15_01"); //Thanks. Looks very soft.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar has now given me the finished cuddly fur. I can take it to the tower guard now.");

	B_GivePlayerXP	(100);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Wulfgar_Khorgor (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Khorgor_Condition;
	information	= Info_Mod_Wulfgar_Khorgor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Khorgor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Khorgor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Khorgor_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_00"); //Is that that Khorgor?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_01"); //Certainly. It wasn't easy. But with the help of a dragon I was able to eliminate this evil.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_02"); //A dragon, you say?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_03"); //Yeah. A water dragon. He's a nice guy, after I saved him from thirst.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_04"); //With Adanos!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wulfgar_Lernen_MANA (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Lernen_MANA_Condition;
	information	= Info_Mod_Wulfgar_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "I want to increase my magic powers.";
};

FUNC INT Info_Mod_Wulfgar_Lernen_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	&& (hero.attribute[ATR_MANA_MAX]	<=	300)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Lernen_MANA_15_00"); //I want to increase my magical powers.

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Wulfgar_Lernen_MANA_BACK_04_01"); //Your magic skills are so good now, I can't teach you anything.
	};

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

INSTANCE Info_Mod_Wulfgar_Trade (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Trade_Condition;
	information	= Info_Mod_Wulfgar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Wulfgar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Wulfgar_Pickpocket (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Pickpocket_Condition;
	information	= Info_Mod_Wulfgar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Wulfgar_Pickpocket_Condition()
{
	C_Beklauen	(147, ItPo_Mana_Addon_04, 1);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_BACK, Info_Mod_Wulfgar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wulfgar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wulfgar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wulfgar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wulfgar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wulfgar_EXIT (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_EXIT_Condition;
	information	= Info_Mod_Wulfgar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wulfgar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
