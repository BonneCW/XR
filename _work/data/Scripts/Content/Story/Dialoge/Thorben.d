INSTANCE Info_Mod_Thorben_Hi (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Hi_Condition;
	information	= Info_Mod_Thorben_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Thorben_Hi_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_Hi_11_01"); //Thorben. I make all kinds of household items.
};

INSTANCE Info_Mod_Thorben_HiKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HiKneipe_Condition;
	information	= Info_Mod_Thorben_HiKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Thorben_HiKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HiKneipe_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_HiKneipe_11_01"); //I'm a carpenter, the master stooge. But I'm not working right now.
};

INSTANCE Info_Mod_Thorben_Handel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Handel_Condition;
	information	= Info_Mod_Thorben_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you selling, too?";
};

FUNC INT Info_Mod_Thorben_Handel_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Handel_15_00"); //Are you selling, too?
	AI_Output(self, hero, "Info_Mod_Thorben_Handel_11_01"); //A little bit of small stuff.
};

INSTANCE Info_Mod_Thorben_HandelKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HandelKneipe_Condition;
	information	= Info_Mod_Thorben_HandelKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you sell craft items?";
};

FUNC INT Info_Mod_Thorben_HandelKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Handel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HandelKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_HandelKneipe_15_00"); //Do you sell craft items?
	AI_Output(self, hero, "Info_Mod_Thorben_HandelKneipe_11_01"); //I don't know. Come by my place tomorrow, will you? I'm not working right now.
};

INSTANCE Info_Mod_Thorben_Job (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Job_Condition;
	information	= Info_Mod_Thorben_Job_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I start with you as an apprentice?";
};

FUNC INT Info_Mod_Thorben_Job_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (!Mod_IstLehrling)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Job_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Can I start with you as an apprentice?
	AI_Output(self, hero, "Info_Mod_Thorben_Job_11_01"); //You're not even a citizen of the city. And I demand that my apprentices... eigentia Self-initiative.
};

INSTANCE Info_Mod_Thorben_JobKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_JobKneipe_Condition;
	information	= Info_Mod_Thorben_JobKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I start with you as an apprentice?";
};

FUNC INT Info_Mod_Thorben_JobKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Job))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	&& (!Mod_IstLehrling)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_JobKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Can I start with you as an apprentice?
	AI_Output(self, hero, "Info_Mod_Thorben_JobKneipe_11_01"); //Am I working or not? I'm trying to relax here.
};

INSTANCE Info_Mod_Thorben_Irdorath (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Irdorath_Condition;
	information	= Info_Mod_Thorben_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have to go on an ocean voyage and need someone (...) )";
};

FUNC INT Info_Mod_Thorben_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_00"); //I have to go on a sea voyage and I need someone with manual skills....
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_01"); //By Innos, what am I supposed to do on a ship at sea?
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_02"); //But...
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_03"); //No, really... it's not for me.... and there are more than enough cupboards waiting for me here, and they have absolute priority over all other things.
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_04"); //Even before the decline of the island...
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_05"); //What do you say?
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_06"); //Oh, nothing important.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "No, it doesn't seem to me that Thorben could be persuaded to go on a trip across the sea.");
};

INSTANCE Info_Mod_Thorben_Lehrling (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Lehrling_Condition;
	information	= Info_Mod_Thorben_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be a citizen of the city. (... )";
};

FUNC INT Info_Mod_Thorben_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_00"); //I want to be a citizen of the city. Will you give me your consent?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_01"); //You're from the colony, aren't you? I need you to do me a favor so we can get into business.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_02"); //What kind of favor would that be?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_03"); //Stupid thing: I've misplaced my precious statue of Innos.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_04"); //However, I do have an idea where she might be.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_05"); //So tell me about it.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_06"); //It's been a few days since I had just finished a chest for Lehmar.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_07"); //I left them open so the wood and glue could breathe.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_08"); //At night the earth has been trembling, not spectacular, but it has been doing so lately.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_09"); //And that's when the statue must have fallen from the shelf into the trunk.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_10"); //The next morning I just closed it and delivered it.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_11"); //My wife noticed that the statue was missing when she was cleaning.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_12"); //Lehmar's son of a bitch probably found it and kept it.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_13"); //Why don't you just ask him?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_14"); //That asshole claims he doesn't know anything.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_15"); //If you find out if he has the statue and bring it back to me, I'll buy you one.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_16"); //Let's see what we can do about it.

	Log_CreateTopic	(TOPIC_MOD_THORBENSSTATUE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_THORBENSSTATUE, "Thorben sold a chest to Lehmar, which probably still contained his statue of Innos. I'm supposed to get it back for him.");
};

INSTANCE Info_Mod_Thorben_Stimme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Stimme_Condition;
	information	= Info_Mod_Thorben_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have your statue.";
};

FUNC INT Info_Mod_Thorben_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Lehrling))
	&& (Npc_HasItems(hero, ItMi_LostInnosStatue_Daron) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_00"); //I have your statue.

	B_GiveInvItems	(hero, self, ItMi_LostInnosStatue_Daron, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_01"); //Yeah, damn it, that's her! How'd you get her off that penny pinch fox?
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_02"); //With enough money.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_03"); //Sure, Lehmar's all about money. Can't give it back to you, though.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_04"); //But I told you we'd have a drink together. There!

	CreateInvItems	(self, ItFo_Beer, 1);
	CreateInvItems	(hero, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_05"); //And you're sure of my approval, too.

	B_GivePlayerXP	(200);

	Npc_RemoveInvItems	(self, ItMi_LostInnosStatue_Daron, 1);

	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_SUCCESS);
	
	Mod_LehrlingsStimmen += 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Thorben_Aufnahme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Aufnahme_Condition;
	information	= Info_Mod_Thorben_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Are you taking me on as an apprentice?";
};

FUNC INT Info_Mod_Thorben_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_15_00"); //Are you taking me on as an apprentice?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_11_01"); //Hmm, can't hurt, actually. I don't need a bum here, though.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_11_02"); //If you don't have a job, you'll get one.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);

	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "I'd rather not.", Info_Mod_Thorben_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "That's the way it should be.", Info_Mod_Thorben_Aufnahme_A);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_B_15_00"); //I'd rather not.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_B_11_01"); //Not my bad luck.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_00"); //That's the way it should be.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_01"); //Well, that sounds good.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_02"); //You'll be a citizen of Khorinis and all that. So you should be walking around like one.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("receive civilian clothes");

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_03"); //Now, I'm going to explain our simplest work processes. But first, I need a little sip.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_04"); //Before you get started, you need an exact plan of what you want to make.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_05"); //Can you draw well?
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_06"); //I don't know about that.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_07"); //If necessary, you'll learn. In the drawing you mark every single piece you need later.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_08"); //Since we usually do commissioned work, there are sometimes already drawings or very concrete ideas of the final product.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_09"); //You shouldn't let them down. It's not going well.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_10"); //When you're done with that, it's muscle work.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_11"); //With the saw in my workplace, you can cut the pieces of wood just as you need them.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_12"); //You can join the items by sizing or by nails. You'll definitely need a hammer.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_13"); //You will find out what is more suitable in which situation.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_14"); //(slightly drunk) That's it, actually. Stop, wait!
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_15"); //If you need any metal ornaments or anything, come to me, we'll take care of it.
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_16"); //Do you have a job for me yet?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_17"); //(drunk) Took...? (considered) Yes, yes.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_18"); //Coragon ordered a chair from me and delivered it with the dimensions so that it fits into his booth.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_19"); //So all you have to do is make rooms.

	CreateInvItems	(hero, ItMi_Brett, 5);
	CreateInvItems	(hero, ItWr_Zeichnung_Stuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_20"); //And always nice - hicks - remember: First the saw, then the nails. Hicks.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 2;

	Wld_AssignRoomToGuild ("gritta",	GIL_NONE);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Thorben, the carpenter, accepted me as his apprentice. That makes me a citizen of the city now.", "I'm supposed to make a chair for Coragon. I already have the specifications, now I only have to implement them.", "Since Thorben accepted me as his apprentice it is now possible for me to enter the upper quarter.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, "Thorben, the carpenter, accepted me as his apprentice. That makes me a citizen of the city now.", "I'm supposed to make a chair for Coragon. I already have the specifications, now I only have to implement them.");
	};

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

INSTANCE Info_Mod_Thorben_GildenZeug (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_GildenZeug_Condition;
	information	= Info_Mod_Thorben_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_00"); //Now you're putting a lot of effort into the militias? Put some order in the pigsty.
	}
	else if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_01"); //I don't think the noisy magicians are right for you.
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_02"); //You made a good choice with the mercenaries. Everybody else is a wimp, aren't they?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_03"); //Don't give me that Beliar shit, will you?
	};
};

INSTANCE Info_Mod_Thorben_LehrlingQuest (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have the chair for Coragon here.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (Npc_HasItems(hero, ItMi_CoragonStuhl) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_00"); //I have the chair for Coragon here.

	B_GiveInvItems	(hero, self, ItMi_CoragonStuhl, 1);

	Npc_RemoveInvItems	(self, ItMi_CoragonStuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_01"); //Let me see. Hicks. Yes, quite respectable. I think Coragon will be satisfied. Hicks.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_02"); //I'll let you know when I have something to do for you again. You'll be free that long. All right?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_03"); //You got it. See you around. And don't drink too much.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_04"); //Let me worry about that.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest2_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you got something for me to do?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_00"); //You got something to do for me?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_01"); //I have so much to do, I don't even know where to start. Fucking hell. (coughs)
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_02"); //Are you sick?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_03"); //No, that's all right. But I hardly ever come to work with this cough.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_04"); //What's up next?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_05"); //The two most important tables for Matteo's wedding are the two most urgent ones. (coughs)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_06"); //They're easy to make, but there's no drawing yet.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_07"); //Is there anyone we can hire to sign the paper?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_08"); //Brahim owes me another favor. Helped him out back then with his cabin.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_09"); //You should ask him. Come back then.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Thorben ordered two tables for the celebration. For this, however, a drawing has to be made first. I'm supposed to ask Brahim, the ticket vendor, for help.");
};

INSTANCE Info_Mod_Thorben_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest3_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Brahim drew.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest3_15_00"); //Brahim drew.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest3_11_01"); //Good. Get to work, we're running out of time.

	B_GiveInvItems	(self, hero, ItMi_Brett, 12);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest4_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "The tables are ready for delivery.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest3))
	&& (Npc_HasItems(hero, ItMi_MatteoFesttisch) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_00"); //The tables are ready for delivery.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_11_01"); //You're a good man. You can still be counted on.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_02"); //Are there any other urgent orders?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_11_03"); //(coughs) Soon, no doubt. So come back and see me again, all right?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_04"); //All clear. See you around.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest5_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's the news?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest4))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_00"); //What's the news?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_01"); //(heavy breathing) It's slow. People don't want to give me any more assignments. (coughs) I almost feel dead.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_02"); //Don't exaggerate!
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_03"); //Could you replace me tomorrow morning from 9:00 to 12:00?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_04"); //Just stand next to the saw or something and take orders.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_05"); //Don't you have time?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_06"); //I have to get a good night's sleep so that I can cough up some strength again.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_07"); //So will you step in for me tomorrow?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_08"); //No problem. Get some rest.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_09"); //Matteo may want to pick up his party tables.

	B_GiveInvItems	(self, hero, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_10"); //Sell it to him for 150 gold.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_11"); //I'll come and relieve you.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_THREE, "Thorben wants to get a good night's sleep and asked me to look after the workplace and take orders the next day from 9 to 12.");

	B_StartOtherRoutine	(self, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_583_NONE_Hanna_NW, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_529_NONE_Matteo_NW, "TAGPAUSE");

	Mod_Thorben_Vertretung_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Thorben_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest6_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Mod_Thorben_Vertretung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_00"); //How did it go? Was anyone there?

	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
	|| (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_01"); //Matteo picked up his tables and paid for them.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_02"); //All right, keep the money. It was your job, and I want it to be your reward.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_03"); //Hanna was here and ordered a repair of her dresser.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_04"); //At least a new assignment. (coughs) I can take care of that on my own.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_05"); //Thank you for helping me close the store without you.
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_06"); //Nothing happened today.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_07"); //Fucking hell! What am I supposed to live on? I can't even offer you a payment.
	};

	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_08"); //I'll check it out soon.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_09"); //Do that.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_SUCCESS);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest7_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got something for you.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& ((Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	|| (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	|| (Npc_HasItems(hero, ItMi_Karte) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest7_15_00"); //I got something for you.

	if (Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Schmuckkasten, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_01"); //Well, if it's not from a real pro. Boy, you're better than I was in my prime. (coughs)
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_02"); //I'm gonna tell my niece to put it on a shelf. Thank you, I didn't expect that much.

		B_GivePlayerXP	(1000);
	}
	else if (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Bierkrug, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_03"); //Oh, thank you. Thank you. It will always remind me of the past, I'm afraid.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_04"); //I'm gonna tell my wife to put it on a shelf.

		B_GivePlayerXP	(800);
	}
	else if (Npc_HasItems(hero, ItMi_Karte) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Karte, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_05"); //Oh, thank you. Thank you. The idea must come from Brahim, right?
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_06"); //The boy doesn't have a fantasy, but I don't think it looks so good on you.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_07"); //Well, it's the will that counts, and the implementation is impeccable.

		B_GivePlayerXP	(600);
	};

	Mod_Thorben_Geschenk_Tag = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, LOG_SUCCESS);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_48);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest8_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "How are you feeling?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest8_15_00"); //How are you feeling?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_11_01"); //I'm pretty fucked up right now. But it'll all go away. I won't let you break me in a hurry. (coughs)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_11_02"); //The work must not rest for long, otherwise we will soon have nothing to eat.
};

INSTANCE Info_Mod_Thorben_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest9_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "How's it going?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest9_15_00"); //What's the score?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest9_11_01"); //I survived the stroke well. Just a few things I can't coordinate anymore. Tying up shoelaces, for example. (coughs) That's my wife helping me.
};

INSTANCE Info_Mod_Thorben_Laute (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Laute_Condition;
	information	= Info_Mod_Thorben_Laute_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm coming to you for an assignment.";
};

FUNC INT Info_Mod_Thorben_Laute_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Zeki_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Laute_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_00"); //I'm coming to you for an assignment.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_01"); //What's this all about?
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_02"); //Could you make me a lute?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_03"); //(considered) Hmm... yes, I could.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_04"); //But for this I need special materials and 250 gold coins to be able to accept this work.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_05"); //I already have the money, here it is.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_06"); //Very good. Very good. So to make the sounds I need twelve branches, which you can find everywhere in the woods.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_07"); //I also need silk to be able to play the instrument at all.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_08"); //Where am I supposed to get silk from?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_09"); //At the dealers, of course. Silk is expensive, so I can't afford it.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_10"); //I need three rows of silk. That ought to do.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_11"); //Okay, then I'll get that stuff.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "I have been to Thorben's, but he lacks the necessary materials to make a sound. I shall bring him twelve branches from the forest and three silk stairs, which can be bought from the merchants of Khorinis. When I have the stuff, I shall announce myself to Thorben again.");
};

INSTANCE Info_Mod_Thorben_LauteMaterialien (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteMaterialien_Condition;
	information	= Info_Mod_Thorben_LauteMaterialien_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have all the necessary materials for the sounds (...) )";
};

FUNC INT Info_Mod_Thorben_LauteMaterialien_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Laute))
	&& (Npc_HasItems(hero, ItMi_Seide) >= 3)
	&& (Npc_HasItems(hero, ItMi_Ast) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteMaterialien_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_00"); //I was able to get all the necessary materials for the sounds.

	Npc_RemoveInvItems	(hero, ItMi_Ast, 12);
	Npc_RemoveInvItems	(hero, ItMi_Seide, 3);

	B_ShowGivenThings	("12 branches and 3 silk given");

	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_11_01"); //All right, then I can get to work.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_02"); //When can I pick up the sounds?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_11_03"); //Come back tomorrow.

	Mod_ASS_ThorbenLaute = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "I brought all the materials to Thorben and he was very satisfied. Tomorrow I can finally pick up the sounds for Zeki and bring them to his new owner.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Thorben_LauteFertig (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteFertig_Condition;
	information	= Info_Mod_Thorben_LauteFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is the lute ready?";
};

FUNC INT Info_Mod_Thorben_LauteFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LauteMaterialien))
	&& (Wld_GetDay() > Mod_ASS_ThorbenLaute)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_00"); //Is the lute ready?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_01"); //Yes, it was some work, but here she is.

	B_GiveInvItems	(self, hero, ItMi_Lute_Zeki, 1);

	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_02"); //Thank you very much.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_03"); //Take good care of her, she's very valuable.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_04"); //I'll keep it in mind. See you around.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_05"); //See you around.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Thorben was able to finish the sounds for Zeki and gave them to me as promised. Now all I have to do is bring her to Zeki and then I'll have a voice with the brats.");

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you open these two treasure chests for me?";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Mod_Banditenueberfall_Esteban >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_15_00"); //Can you open these two treasure chests for me?
	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_11_01"); //Of course I can. But I can't do it for nothing. At least give me 200 gold coins for it.
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten_Open (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Open_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Open_Info;
	permanent	= 0;
	important	= 0;
	description	= "Open the crates.";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Open_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_BDTSchatzkisten))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Open_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_Open_15_00"); //Open the crates.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_11_01"); //Well, wait a minute...

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_11_02"); //Here's your boxes back. You can open it yourself now, the locks are cracked.
};

INSTANCE Info_Mod_Thorben_Paddel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Paddel_Condition;
	information	= Info_Mod_Thorben_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm looking for paddles.";
};

FUNC INT Info_Mod_Thorben_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_00"); //I'm looking for paddles.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_01"); //You say paddle? Hm... I think cedar wood would be the right thing to do. Flexible and not sensitive to water.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_02"); //But there are no cedars growing on the island. Otherwise I'd know about it. Sorry about that.
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_03"); //There's nothing you can do. Who else could I ask?
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_04"); //Why don't you ask Cardif, he's got special offers sometimes.

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Thorben doesn't have a paddle, but gave me the tip to ask Kardif.");
};

INSTANCE Info_Mod_Thorben_Dietriche (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche_Condition;
	information	= Info_Mod_Thorben_Dietriche_Info;
	permanent	= 1;
	important	= 0;
	description	= "Do you still have diets for me?";
};

FUNC INT Info_Mod_Thorben_Dietriche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(self, ItKe_Lockpick) == 0)
	&& (Mod_Thorben_Dietriche == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_15_00"); //Do you still have diets for me?
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_11_01"); //Hmm, no, you bought them all off me. I'd have to get some done first, but it'll take time.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);

	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "I'll wait that long.", Info_Mod_Thorben_Dietriche_B);
	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "Is there any way I can shorten the time?", Info_Mod_Thorben_Dietriche_A);
};

FUNC VOID Info_Mod_Thorben_Dietriche_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_B_15_00"); //I'll wait that long.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

FUNC VOID Info_Mod_Thorben_Dietriche_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_00"); //Is there any way I can shorten the time?

	if (!Mod_Thorben_Robert) {
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_01"); //You could save me a lot of legwork. I can only commission the blacksmith Robert in Khorata to do new diets.
		AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_02"); //But there are also blacksmiths here.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_03"); //Much crude steel has to be melted down in order to produce large quantities of die screeds.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_04"); //Harad can't do that with his little fire.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_05"); //If you take care of telling Robert, I can sell you Dietriches again soon.

		Mod_Thorben_Robert = TRUE;
	} else {
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_06"); //You know what to do.... go to Robert in Khorata.
	};

	Mod_Thorben_Dietriche = 1;

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

INSTANCE Info_Mod_Thorben_Dietriche2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche2_Condition;
	information	= Info_Mod_Thorben_Dietriche2_Info;
	permanent	= 1;
	important	= 0;
	description	= "I'm going to see Robert.";
};

FUNC INT Info_Mod_Thorben_Dietriche2_Condition()
{
	if (Mod_Thorben_Dietriche == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche2_15_00"); //I'm going to see Robert.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche2_11_01"); //All right, all right. Bring him five bars of crude steel and a wage of 100 gold coins, and he can start right away.

	Mod_Thorben_Dietriche = 2;
};

INSTANCE Info_Mod_Thorben_Dietriche3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche3_Condition;
	information	= Info_Mod_Thorben_Dietriche3_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_Dietriche3_Condition()
{
	if (Mod_Thorben_Dietriche == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche3_11_00"); //Dietriches just arrived. Thanks for your help.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Mod_Thorben_Dietriche = 0;

	CreateInvItems	(self, ItKe_Lockpick, 30);

	if (Mod_Thorben_Dietriche2 == FALSE)
	{
		B_GivePlayerXP	(100);

		Mod_Thorben_Dietriche2 = TRUE;
	};
};

INSTANCE Info_Mod_Thorben_Anschlagtafel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Anschlagtafel_Condition;
	information	= Info_Mod_Thorben_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Thorben_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Thorben == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Ast) >= Mod_Anschlagtafel_Khorinis_Thorben_Ast)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Axe) >= Mod_Anschlagtafel_Khorinis_Thorben_Beil)
	&& (Npc_HasItems(hero, ItMi_Hammer) >= Mod_Anschlagtafel_Khorinis_Thorben_Hammer)
	&& (Npc_HasItems(hero, ItMw_1h_Bau_Mace) >= Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Dagger) >= Mod_Anschlagtafel_Khorinis_Thorben_Dolch)
	&& (Npc_HasItems(hero, ItMi_Broom) >= Mod_Anschlagtafel_Khorinis_Thorben_Besen)
	&& (Npc_HasItems(hero, ItMi_Brush) >= Mod_Anschlagtafel_Khorinis_Thorben_Buerste)
	&& (Npc_HasItems(hero, ItMi_Saw) >= Mod_Anschlagtafel_Khorinis_Thorben_Saege)
	{
		Npc_RemoveInvItems	(hero, ItMi_Ast, Mod_Anschlagtafel_Khorinis_Thorben_Ast);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Axe, Mod_Anschlagtafel_Khorinis_Thorben_Beil);
		Npc_RemoveInvItems	(hero, ItMi_Hammer, Mod_Anschlagtafel_Khorinis_Thorben_Hammer);
		Npc_RemoveInvItems	(hero, ItMw_1h_Bau_Mace, Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Dagger, Mod_Anschlagtafel_Khorinis_Thorben_Dolch);
		Npc_RemoveInvItems	(hero, ItMi_Broom, Mod_Anschlagtafel_Khorinis_Thorben_Besen);
		Npc_RemoveInvItems	(hero, ItMi_Brush, Mod_Anschlagtafel_Khorinis_Thorben_Buerste);
		Npc_RemoveInvItems	(hero, ItMi_Saw, Mod_Anschlagtafel_Khorinis_Thorben_Saege);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Thorben_Gold);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Thorben = 0;
		Mod_Anschlagtafel_Khorinis_Thorben_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Thorben, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Thorben_Trade (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Trade_Condition;
	information	= Info_Mod_Thorben_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thorben_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Trade_Info()
{
	if (Mod_ThorbenTrader == FALSE)
	{
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Thorben sells Dietrichche.");

		Mod_ThorbenTrader = 1;
	};

	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thorben_Pickpocket (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Pickpocket_Condition;
	information	= Info_Mod_Thorben_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Thorben_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Ast, 12);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_BACK, Info_Mod_Thorben_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorben_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thorben_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thorben_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thorben_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thorben_EXIT (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_EXIT_Condition;
	information	= Info_Mod_Thorben_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorben_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorben_EXIT_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 0)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_11_00"); //I hereby dismiss you as an apprentice. You have served me well and outstripped your master. Be proud of yourself. You can still be something.
		AI_Output(hero, self, "Info_Mod_Thorben_EXIT_15_01"); //Get well soon. Maybe we'll meet again sometime.
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_11_02"); //My speech! Take care of yourself!
	};

	AI_StopProcessInfos	(self);
};
