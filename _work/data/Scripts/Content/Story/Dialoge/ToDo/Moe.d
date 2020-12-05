INSTANCE Info_Mod_Moe_Hi (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Hi_Condition;
	information	= Info_Mod_Moe_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Moe_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_00"); //A stranger exploring the harbour district?
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_01"); //Then you shouldn't just walk by here.
	AI_Output(hero, self, "Info_Mod_Moe_Hi_15_02"); //What kind of building is that behind you?
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_03"); //This is Kardif's pub, the centre of the harbour district. Next to the red lantern. (laughs) If you want something to drink or know, come here.
};

INSTANCE Info_Mod_Moe_Geruechte (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte_Condition;
	information	= Info_Mod_Moe_Geruechte_Info;
	permanent	= 1;
	important	= 0;
	description	= "Are there any interesting rumors at the moment?";
};

FUNC INT Info_Mod_Moe_Geruechte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	&& (Moe_KnowsPort == FALSE)
	&& (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_15_00"); //Are there any interesting rumors at the moment?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_29_01"); //Quite a few, quite a few. You just have to know how to separate the sailor's yarn from the facts, and then the information can even make a difference?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_29_02"); //Have you heard about the fate of the unfortunate painter Johannes Port, for example?

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "No, I don't care about that either.", Info_Mod_Moe_Geruechte_B);
	Info_AddChoice	(Info_Mod_Moe_Geruechte, "No, tell me more.", Info_Mod_Moe_Geruechte_A);
};

FUNC VOID Info_Mod_Moe_Geruechte_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_B_15_00"); //No, I don't care about that either.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_B_29_01"); //Too bad, maybe later.

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);
};

FUNC VOID Info_Mod_Moe_Geruechte_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_A_15_00"); //No, tell me more.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_01"); //Johannes Port... ah, that was a painter. World famous for his landscape paintings. There are not many artists who have achieved as much fame as he has in life.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_02"); //He actually lived in Myrtana, but the search for motifs drove him all over the world. Well, and underneath was the one who was supposed to be his last.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_03"); //He seemed to be very interested in the coastal area of Khorinis, but he recently left here on a ship's cutter.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_04"); //The crew wanted to eject their nets in the harbour and Port wanted to paint his pictures, but that didn't go well for long. The ship capsized and sank not far from the big island in front of the harbour.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_05"); //No one could later tell why, unless you believe the stories of the vengeful sea god.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_06"); //Part of the crew could be rescued, but Port was not among them. One of the seafarers who had been with him spoke to me about the fact that Port' nen had a large part of his equipment and some finished paintings with him.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_07"); //Well, these treasures may still be in the shipwreck, because so far no troops have been sent there for inspection and the circle of people who know about the matter is very limited.

	Log_CreateTopic	(TOPIC_MOD_MOE_PORT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MOE_PORT, "A few days ago, for some inexplicable reasons, a ship's cutter sank in front of the port of Khorinis. If you can believe Moe, the famous painter Johannes Port was on board with some of his equipment. No one knows where Port has disappeared to, but his' treasure' could still be on board the shipwreck.");

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "You mean there's something to get....", Info_Mod_Moe_Geruechte_D);
	Info_AddChoice	(Info_Mod_Moe_Geruechte, "So what happened to Port?", Info_Mod_Moe_Geruechte_C);
};

FUNC VOID Info_Mod_Moe_Geruechte_D()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_00"); //You mean there's something to get....
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_01"); //That could be...
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_02"); //But why are you telling me about this?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_03"); //You don't look like one of those bandits who would turn the pictures into gold at the next fence.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_04"); //I'd rather hand it in to an art expert. I bet he'd pay a lot of money.
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_05"); //An welchen "art experts" hast du dabei gedacht?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_06"); //Brahim, the ticket vendor. You'll find him right around the corner towards the warehouse.
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_07"); //Why don't you go get the treasure yourself?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_08"); //My adventurous years are over, boy. I have enough money to buy what I need. What am I supposed to do with extra excitement?
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Brahim, the ticket seller in the harbour district, is my first point of contact when I should have found the treasure.");

	Moe_KnowsPort = 1;
};

FUNC VOID Info_Mod_Moe_Geruechte_C()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_C_15_00"); //So what happened to Port?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_C_29_01"); //No one knows. Either his body's in the wreck or on the seabed, or he's been able to save himself on the mainland. But that's unlikely, and you would have heard of him by now.

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "You mean there's something to get....", Info_Mod_Moe_Geruechte_D);
};

INSTANCE Info_Mod_Moe_Geruechte2 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte2_Condition;
	information	= Info_Mod_Moe_Geruechte2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_Geruechte2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte2_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte2_29_00"); //Hey! I've got news you might be interested in.
};

INSTANCE Info_Mod_Moe_Geruechte3 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte3_Condition;
	information	= Info_Mod_Moe_Geruechte3_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do you know of anything new?";
};

FUNC INT Info_Mod_Moe_Geruechte3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte2))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte3_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_15_00"); //What do you know of anything new?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_29_01"); //Canthar's back in town. He kidnapped Valentino, the wealthy ass-kisser.

	Log_CreateTopic	(TOPIC_MOD_MOE_VALENTINO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MOE_VALENTINO, LOG_RUNNING);
	B_LogEntry_More	( TOPIC_MOD_CANTHAR_GESCHAEFTE, TOPIC_MOD_MOE_VALENTINO, "Canthar has returned, as announced, to take revenge on me.", "Valentino was kidnapped by Canthar, who wants to trade him for me. Lord Andre doesn't dare to do anything, so it's up to me to end the case.");

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "TOT");
	Mod_Valentino_Kidnapped = 1;

	if (Mod_Fernando_Mitternachtsspuk == 1)
	{
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "START");
	};

	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Valentino?! He can keep that!", Info_Mod_Moe_Geruechte3_B);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "And how do you know that Canthar is the kidnapper?", Info_Mod_Moe_Geruechte3_A);
};

FUNC VOID Info_Mod_Moe_Geruechte3_D()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_D_15_00"); //That was to be expected....
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_01"); //Valentino is a popular man, especially with the female people and landlords.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_02"); //If Canthar's demand gets around, most people would ask for an exchange - him for you.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_03"); //Lord Andre can't do anything about it: Whatever he does, lives are at stake.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_04"); //He won't use his corrupt city guards against Canthar because he knows his strength.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_05"); //So it's up to you. You have to try to free Valentino so Canthar doesn't have leverage in his hands anymore.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_06"); //But remember, this will only stop him for a short time. You fucked up his score, and he wants revenge.
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Let Canthar come after all, for Valentino I put my life (.... )", Info_Mod_Moe_Geruechte3_F);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Where is Valentino being held?", Info_Mod_Moe_Geruechte3_E);
};

FUNC VOID Info_Mod_Moe_Geruechte3_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_B_15_00"); //Valentino?! He can keep that!
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_B_29_01"); //He's not about Valentino... he wants you!

	Info_Mod_Moe_Geruechte3_D();
};

FUNC VOID Info_Mod_Moe_Geruechte3_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_A_15_00"); //And how do you know that Canthar is the kidnapper?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_A_29_01"); //He didn't ask for a ransom...
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_A_15_02"); //What else is there to it?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_A_29_03"); //Well, you.

	Info_Mod_Moe_Geruechte3_D();
};

FUNC VOID Info_Mod_Moe_Geruechte3_F()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_F_15_00"); //I don't want Canthar to come, but I'm not risking my life for Valentino.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_F_29_01"); //In that case, you're just evading the inevitable. If you've changed your mind, go to the Upper Quarter and look for Valentine, Valentino's sister.
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "I'm supposed to go to Valentino's sister Valentine in the upper quarter; she may know where her brother's being held.");
};

FUNC VOID Info_Mod_Moe_Geruechte3_E()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_E_15_00"); //Where is Valentino being held?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_E_29_01"); //I can't tell you that, but his sister Valentine knows about it. You'll find them in the upper district.

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "I'm supposed to go to Valentino's sister Valentine in the upper quarter; she may know where her brother's being held.");
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "How do you know all this about Canthar? )", Info_Mod_Moe_Geruechte3_H);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Thanks for the information. You're a real help.", Info_Mod_Moe_Geruechte3_G);
};

FUNC VOID Info_Mod_Moe_Geruechte3_G()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_G_15_00"); //Thanks for the information. You're a real help.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_G_29_01"); //This shit should finally be stopped. Who goes to the pub when all his mice have been stolen?
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);
};

FUNC VOID Info_Mod_Moe_Geruechte3_H()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_H_15_00"); //How do you know all this stuff about Canthar and his relationship with me?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_H_29_01"); //Brahim won't hold me back. At least not after a few rags. (laughs) I hear the rest from travellers.
	
	Info_Mod_Moe_Geruechte3_G();
};

INSTANCE Info_Mod_Moe_Geruechte4 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte4_Condition;
	information	= Info_Mod_Moe_Geruechte4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Later maybe...";
};

FUNC INT Info_Mod_Moe_Geruechte4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte4_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte4_15_00"); //Later maybe...
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_AllievoTot (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_AllievoTot_Condition;
	information	= Info_Mod_Moe_AllievoTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "I was able to free Valentino and take out a student of Canthar's.";
};

FUNC INT Info_Mod_Moe_AllievoTot_Condition()
{
	if (Mod_Allievo_Zusatzpower == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_AllievoTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_00"); //I was able to free Valentino and take out a student of Canthar's.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_01"); //I've heard about Valentino, but what kind of student was that?
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_02"); //His name was Allievo.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_03"); //Allievo? Damn it, if that won't bring you any trouble...
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_04"); //Why would it do that?
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_05"); //They say Allievo was Canthar's son. You're probably on his hit list now, if that's still possible.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_06"); //So, watch your ass. I'll let you know when I get something new.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_CANTHAR_GESCHAEFTE, "Oh... If Allievo really was the son of Canthar, it would be even more trouble.... I should be really careful from now on.");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_AufgebrachteFrau (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_AufgebrachteFrau_Condition;
	information	= Info_Mod_Moe_AufgebrachteFrau_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you happen to know why I'm suddenly being called a butcher on the open road?";
};

FUNC INT Info_Mod_Moe_AufgebrachteFrau_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AufgebrachteBuergerin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_AufgebrachteFrau_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_00"); //Do you happen to know why I'm suddenly being called a butcher on the open road?
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_01"); //Yeah, I can at least guess so. I've already announced Canthar's not gonna let you go, buddy.
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_02"); //I don't know what he came up with this time, but it looks like slander. You should've saved yourself the filthy business with Allievo.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_03"); //What am I supposed to do now?
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_04"); //Don't cry now and let me surprise you. If you can't avert that shit before it breaks into you, you're gonna have to go through it.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_05"); //Thanks for the smart stuff.
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_06"); //You'll be all right.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_07"); //We'll see about that.

	B_LogEntry_More	(TOPIC_MOD_CANTHAR_GESCHAEFTE, TOPIC_MOD_MOE_TALK, "Canthar still wants his revenge and once again challenges my skill.", "The angry woman suggests that Canthar is now trying to slander him. Moe thinks it's best if I don't fight the misfortune until I have specific clues.");

	Mod_MoeTalkedAboutNoTalk = Wld_GetDay();
};

INSTANCE Info_Mod_Moe_DontTalk (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_DontTalk_Condition;
	information	= Info_Mod_Moe_DontTalk_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_DontTalk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_AufgebrachteFrau))
	&& (Mod_MoeDontTalk == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_DontTalk_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_DontTalk_29_00"); //Is it true? Is it true what the attacks say?
	AI_Output(hero, self, "Info_Mod_Moe_DontTalk_15_01"); //What do the attacks say?
	AI_Output(self, hero, "Info_Mod_Moe_DontTalk_29_02"); //Here. You really should see it.

	B_GiveInvItems	(self, hero, ItWr_Anschlag, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_ErsterAnschlag (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_ErsterAnschlag_Condition;
	information	= Info_Mod_Moe_ErsterAnschlag_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_ErsterAnschlag_Condition()
{
	if (Mod_MoeDontTalk == 3)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_Info()
{
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "Bastard deserves to end up like this!", Info_Mod_Moe_ErsterAnschlag_C);
	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "I killed Allievo in battle, but I didn't execute him.", Info_Mod_Moe_ErsterAnschlag_B);
	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "Can't you see that this is Canthar's fantasy?", Info_Mod_Moe_ErsterAnschlag_A);
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_D()
{
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_00"); //Shit, man, I was hoping you'd say something like that.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_01"); //These posters are all over Khorinis now. No one wants to have anything to do with you.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_02"); //I do know, however, how many posters there are: one in the monastery, one each in the courtyard of Bengar, Onar and Lobart, and three in the city, in very accessible places, I let myself be told.
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_03"); //Does that mean I have to take off all the posters?
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_04"); //I wouldn't want to see those pictures of me.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_05"); //Don't you think the nose is badly shot? Yours looks like a turnip, but it's more like a pear on the line.
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_06"); //I've rarely looked in a mirror before.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_07"); //It's all right, buddy. So, if you've removed the damn posters in a settlement, it shouldn't be long before the people there chatting with you again as they have always been. You know how they are. (laughs)
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_08"); //I'll be right on my way.

	B_LogEntry	(TOPIC_MOD_MOE_TALK, "The reasons for the continuing silence are all over Khorinis: they are posters with disparagement of my person. These attacks in places of public life, three plays in Khorinis and one each in the monastery and at the courtyards of Bengar, Onar and Lobart, I should remove as soon as possible so that the local population can talk to me again.");

	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_01");
	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_02");
	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_03");
	Wld_InsertItem	(ItWr_Anschlag_Lobart, "FP_ITEM_ANSCHLAG_LOBART");
	Wld_InsertItem	(ItWr_Anschlag_Bengar, "FP_ITEM_ANSCHLAG_BENGAR");
	Wld_InsertItem	(ItWr_Anschlag_Onar, "FP_ITEM_ANSCHLAG_ONAR");
	Wld_InsertItem	(ItWr_Anschlag_Kloster, "FP_ITEM_ANSCHLAG_KLOSTER");
	
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_B_15_00"); //I killed Allievo in battle, but I didn't execute him.

	Info_Mod_Moe_ErsterAnschlag_D();
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_A_15_00"); //Can't you see that this is Canthar's fantasy?

	Info_Mod_Moe_ErsterAnschlag_D();
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_C()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_C_15_00"); //Bastard deserves to end up like this!
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_C_29_01"); //I'm sorry, I thought we were on one side. Now I have to see that you're no better than Canthar. Get out of my sight.
	
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	B_SetTopicStatus	(TOPIC_MOD_MOE_TALK, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_CANTHAR_GESCHAEFTE, LOG_FAILED);

	CurrentNQ += 1;

	Mod_MoeDontTalk = 4;
};

INSTANCE Info_Mod_Moe_Anschlaege (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Anschlaege_Condition;
	information	= Info_Mod_Moe_Anschlaege_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here you have the attacks, you can dump them.";
};

FUNC INT Info_Mod_Moe_Anschlaege_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_ErsterAnschlag))
	&& (Mod_MoeDontTalk == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Anschlaege_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_00"); //Here you have the attacks, you can dump them.

	B_GiveInvItems	(hero, self, ItWr_Anschlag, Npc_HasItems(hero, ItWr_Anschlag));

	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_01"); //Is that everyone?
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_02"); //Yeah.
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_03"); //...
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_04"); //What's the matter with you?
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_05"); //I got stuck with a note today.
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_06"); //And?
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_07"); //Here.

	B_GiveInvItems	(self, hero, ItWr_MoesZettel, 1);

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_MOE_TALK, "I delivered the attacks.");
	B_SetTopicStatus	(TOPIC_MOD_MOE_TALK, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Moe_Zettel (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Zettel_Condition;
	information	= Info_Mod_Moe_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "I see.";
};

FUNC INT Info_Mod_Moe_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Anschlaege))
	&& (Mod_MoeDontTalk == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_00"); //I see.
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_01"); //Go on with the case alone, will you, mate?
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_02"); //Are you trying to get yourself killed?
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_03"); //No... Yeah, it's all right. I'll keep helping you. (pause) But don't come to see me often enough.
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_04"); //You got it. Watch your back.
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_05"); //I don't even know where he is anymore...

	B_LogEntry	(TOPIC_MOD_CANTHAR_GESCHAEFTE, "Moe received a cryptic threat, but he still wants to help me.");
};

INSTANCE Info_Mod_Moe_Shakir (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Shakir_Condition;
	information	= Info_Mod_Moe_Shakir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello, Moe. I need a woman.";
};

FUNC INT Info_Mod_Moe_Shakir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bromor_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Shakir_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_00"); //Hello, Moe. I need a woman.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_01"); //You want to get married?
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_02"); //No. Just like that.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_03"); //Uh-huh. Why don't you go to Bromor? He has a choice.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_04"); //He won't give me one.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_05"); //Shepherd's hour in the home? In candlelight and all that?
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_06"); //Exactly.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_07"); //Well, ask Edda. She knows all the women in the neighborhood.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_08"); //Edda?
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_09"); //She's in the soup kitchen. Behind the fish vendor's house.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_10"); //Thank you first.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Moe sent me to the soup edda. She knows all the women in the neighborhood.");
};

INSTANCE Info_Mod_Moe_Sumpfkraut (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Sumpfkraut_Condition;
	information	= Info_Mod_Moe_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Suppose I wanted to buy swampweed...";
};

FUNC INT Info_Mod_Moe_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Sumpfkraut_15_00"); //Suppose I wanted to buy swampweed...
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_01"); //Hey, man, we're in the waterfront. Here you'll find everything that's fun... (smiling) and what the fine gentlemen of the order do not like to see.
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_02"); //Girl of joy, gambling, fights for money.... and of course also some resinous stems.
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_03"); //All you have to do is ask the people in the waterfront a few questions.
};

INSTANCE Info_Mod_Moe_Flugblaetter (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Flugblaetter_Condition;
	information	= Info_Mod_Moe_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a flyer for you.";
};

FUNC INT Info_Mod_Moe_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Moe_Flugblaetter_29_01"); //Oh, thank you. Thank you. Let's see....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Moe_Flugblaetter_29_02"); //Ah yes. Maybe I'll stop by Matteo's.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Moe_Pickpocket (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Pickpocket_Condition;
	information	= Info_Mod_Moe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Moe_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Moe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

	Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_BACK, Info_Mod_Moe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Moe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Moe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
};

FUNC VOID Info_Mod_Moe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Moe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Moe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Moe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Moe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Moe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Moe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Moe_EXIT (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_EXIT_Condition;
	information	= Info_Mod_Moe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Moe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Moe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
