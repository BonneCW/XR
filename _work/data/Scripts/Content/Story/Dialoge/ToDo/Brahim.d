INSTANCE Info_Mod_Brahim_Hi (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Hi_Condition;
	information	= Info_Mod_Brahim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_00"); //Hey, stranger, you need a card? I've got one for you.
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_01"); //Hand-drawn on virgin parchment. You won't find anything like that anywhere else.
	AI_Output(hero, self, "Info_Mod_Brahim_Hi_15_02"); //So you also deal with ex-convicts?
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_03"); //Of course you do. You don't want to know who I've already sold tickets to.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Brahim sells tickets.");
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Thorben and I need your help.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_00"); //Thorben and I need your help.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_01"); //Where's the shoe pinching?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_02"); //We need the drawing of a party table. Thorben says you owe him one.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_03"); //Unfortunately, yes. All right, I'll take care of it later. You can pick her up tomorrow.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_04"); //See you tomorrow, then.

	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Brahim has agreed. However, he needs one day for the drawing.");

	Mod_Thorben_Brahim = Wld_GetDay();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling2 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling2_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you finished?";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling))
	&& (Mod_Thorben_Brahim < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_00"); //Are you finished?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling2_07_01"); //You can count on that. Take it.

	B_GiveInvItems	(self, hero, ItWr_Zeichnung_Tisch, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_02"); //Thank you very much.
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling3 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling3_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd like another drawing.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_00"); //I'd like another drawing.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_01"); //Oh, no! This time it won't come for free.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_02"); //How much?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_03"); //50 pieces of gold.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_04"); //Make me the sketch.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_05"); //And what should I sketch?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_06"); //A little... uh...

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Something decorative. Think of something.", Info_Mod_Brahim_ThorbenLehrling3_C);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "A beer jug.", Info_Mod_Brahim_ThorbenLehrling3_B);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "A decorated jewelry box.", Info_Mod_Brahim_ThorbenLehrling3_A);
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_D()
{
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_00"); //All right... Looking around among the women or what?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_01"); //Thorben is in a coma. I want to cheer him up a little when he wakes up.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_02"); //Man, shit! Torben? I'm going to make a special effort.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_03"); //Thanks. See you around.

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Mod_Thorben_Present_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_C_15_00"); //Something decorative. Think of something.

	Mod_Thorben_Present = 3;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_B_15_00"); //A beer jug.

	Mod_Thorben_Present = 2;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_A_15_00"); //A decorated jewelry box.

	Mod_Thorben_Present = 1;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling4 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling4_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'd like to pick up the drawing.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling3))
	&& (Mod_Thorben_Present_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_00"); //I'd like to pick up the drawing.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_01"); //No problem, here she is.

	if (Mod_Thorben_Present == 1)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Schmuckkasten, 1);
	}
	else if (Mod_Thorben_Present == 2)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Bierkrug, 1);
	}
	else if (Mod_Thorben_Present == 3)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Karte, 1);
	};

	if (Mod_Thorben_Present == 1)
	|| (Mod_Thorben_Present == 2)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_02"); //Thanks, it's looking good. I'm gonna get to work.
	}
	else if (Mod_Thorben_Present == 3)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_03"); //You sketched a fucking map?
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_04"); //So what? That's what I do best, that's what I'm trained to do.
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_05"); //And you can hang them in your apartment.
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_06"); //All right, all right. See you around.
	};
};

INSTANCE Info_Mod_Brahim_Bilder (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Bilder_Condition;
	information	= Info_Mod_Brahim_Bilder_Info;
	permanent	= 0;
	important	= 0;
	description	= "I hear you're interested in paintings.";
};

FUNC INT Info_Mod_Brahim_Bilder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Moe_KnowsPort == 1)
	&& (Npc_HasItems(hero, ItMi_PortsKoffer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Bilder_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_15_00"); //I hear you're interested in paintings.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_07_01"); //Depends on who created the works.

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	Info_AddChoice	(Info_Mod_Brahim_Bilder, "I don't know who drew those things.", Info_Mod_Brahim_Bilder_B);
	Info_AddChoice	(Info_Mod_Brahim_Bilder, "The pictures were taken by Johannes Port.", Info_Mod_Brahim_Bilder_A);
};

FUNC VOID Info_Mod_Brahim_Bilder_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_00"); //He was on the ship that sank here recently. His gear was still in the wreck.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_01"); //You mean Johannes Port is dead?
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_02"); //He's missing.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_03"); //Aha... Well, the pictures aren't the big shot. I don't want her.

	B_GiveInvItems	(self, hero, ItMi_PortsKoffer, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_04"); //How?! And what am I supposed to do with that?
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_05"); //I have an idea: You're looking to see if Port is still alive. Wouldn't be unfair if you sold his stuff when he's still with us.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_06"); //Bring him in here, he'll probably need a shower and a piece of meat. We'd clear up the rest later, but it wouldn't hurt to be in the debt of such a person...

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Unfortunately, Brahim doesn't know anything about the paintings, but he thinks it's a good idea to look for Port. So, if the ship sank in the same place where it is now: Where could one have saved itself?");

	Wld_InsertNpc	(Mod_4027_NONE_Port_NW,	"BIGFARM");

	Moe_KnowsPort = 2;
};

FUNC VOID Info_Mod_Brahim_Bilder_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_B_15_00"); //I don't know who drew those things.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_01"); //Let's have a look, then.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //Port? How did you get his paintings?

	Info_Mod_Brahim_Bilder_C();
};

FUNC VOID Info_Mod_Brahim_Bilder_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_A_15_00"); //The pictures were taken by Johannes Port.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //Port? How did you get his paintings?

	Info_Mod_Brahim_Bilder_C();
};

INSTANCE Info_Mod_Brahim_PortSuchenWo (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortSuchenWo_Condition;
	information	= Info_Mod_Brahim_PortSuchenWo_Info;
	permanent	= 1;
	important	= 0;
	description	= "Where shall I begin to search?";
};

FUNC INT Info_Mod_Brahim_PortSuchenWo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Bilder))
	&& (Moe_KnowsPort == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortSuchenWo_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortSuchenWo_15_00"); //Where should I look?
	AI_Output(self, hero, "Info_Mod_Brahim_PortSuchenWo_07_01"); //Well, I'd start near the shipwreck.
};

INSTANCE Info_Mod_Brahim_PortDabei (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortDabei_Condition;
	information	= Info_Mod_Brahim_PortDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found Johannes Port.";
};

FUNC INT Info_Mod_Brahim_PortDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_GetDistToWp(Mod_4027_NONE_Port_NW, "NW_CITY_HABOUR_HUT_01_FRONT") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_00"); //I found Johannes Port.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_01"); //Very nice, very nice.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_02"); //What happens next?
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_03"); //Let him rest for now. I'll leave him my house till morning.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_04"); //When he's well rested and satisfied, we can talk.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_05"); //Then I'll come back tomorrow.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_06"); //Yeah. Have a nice day.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Port's resting with Brahim. They want me to come back the next day.");

	B_StartOtherRoutine	(Mod_4027_NONE_Port_NW,	"ATBRAHIM");
	B_StartOtherRoutine	(self, "PORTDA");

	PortAtBrahim = Wld_GetDay();

	Moe_KnowsPort = 4;
};

INSTANCE Info_Mod_Brahim_PortTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortTot_Condition;
	information	= Info_Mod_Brahim_PortTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_PortTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_PortDabei))
	&& (Moe_KnowsPort == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_00"); //(agitated) That can't be!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_01"); //What's happening?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_02"); //He was murdered! In my house! I can't believe it!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_03"); //Port? Port's dead? What do we do now?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_04"); //I don't know! I must report it to the City Watch immediately, but you... you're in danger. Someone killed Port, and it's not for the fun of it.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_05"); //No, he must have wanted something. And you salvaged Port's treasure. Maybe it has something to do with it.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_06"); //I'd want to get rid of him as soon as possible if I were you.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_07"); //And how am I supposed to get rid of him?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_08"); //Sell it. Not to me, of course, I don't want him.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_09"); //But I know a strange fellow who'd want to take your suitcase. He loves solitude and exotic stuff. Kuno is his name.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_10"); //Where can I find this lonely merchant?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_11"); //He built his hut on a pond next to the Minental pass. Take care of yourself when you go to him.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_12"); //I always do.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Port was murdered that night. Damn it! The whole thing takes on grotesque traits....");
	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Brahim thinks I'm in danger and should sell my suitcase as soon as possible. A trader in a hut on a lake near the Minental pass should be able to help me there.");

	B_StartOtherRoutine	(self, "START");

	Moe_KnowsPort = 6;

	B_KillNpc	(Mod_4026_NONE_Kuno_NW);
};

INSTANCE Info_Mod_Brahim_Flora (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Flora_Condition;
	information	= Info_Mod_Brahim_Flora_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Flora_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Flora_Port))
	&& (Moe_KnowsPort == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Flora_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_07_00"); //Uh-huh, who's coming?

	B_StartOtherRoutine	(Mod_548_NONE_Canthar_NW, "WAITFORPLAYER");

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "What have you got to do with the murders?", Info_Mod_Brahim_Flora_B);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Game's over, Brahim.", Info_Mod_Brahim_Flora_A);
};

FUNC VOID Info_Mod_Brahim_Flora_E()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_00"); //It's alright! If you let me go, I'll tell you everything.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_01"); //But I assure you, I have nothing to do with the murders. And the frauds. I'm just a poor helper being used at will.
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_02"); //Go ahead, shoot.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_03"); //There's one in the guild of thieves who, in addition to the normal shops, has dirt on their hands. Canthar is.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_04"); //Through his addiction to money, he has taken part in many profitable actions. He's willing to go over corpses for his profit.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_05"); //It doesn't seem to be, but he is one of the most powerful people in Khorinis. I have no idea who belongs to him.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_06"); //I was in debt after a busted business and turned to him..... I soon realized that it was a mistake.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_07"); //Again and again I was supposed to do the dirty work for him, and if I didn't want to do it, he threatened with thugs.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_08"); //I don't know why Port had to die, but it seemed very urgent to Canthar. Not just because of the suitcase you found; I had a feeling he was afraid of Port....
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_09"); //Looks like I'm gonna have to take a look at Canthar.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_10"); //It's a life-threatening thing, but it'll be the only way! He must have several of the guards on his side, so you can't trust them... a single fighter will have a better chance!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Canthar seems to be the mastermind behind the murders. However, I have to take him alone to my chest because he most likely bribed many of the guards. I let Brahim go; he assured me he had nothing to do with killing and acted against his will.");

	Moe_KnowsPort = 9;
};

FUNC VOID Info_Mod_Brahim_Flora_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_B_15_00"); //What have you got to do with the murders?
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_01"); //Me? Nothing, really!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Perhaps a beating will help your memory (.... )", Info_Mod_Brahim_Flora_D);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Do I have to start threatening?", Info_Mod_Brahim_Flora_C);
};

FUNC VOID Info_Mod_Brahim_Flora_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_A_15_00"); //Game's over, Brahim.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_02"); //What game? I never play.

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "What have you got to do with the murders?", Info_Mod_Brahim_Flora_B);
};

FUNC VOID Info_Mod_Brahim_Flora_D()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_D_15_00"); //Maybe a beating will help you remember your memory....

	Info_Mod_Brahim_Flora_E();
};

FUNC VOID Info_Mod_Brahim_Flora_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_C_15_00"); //Do I have to start threatening?

	Info_Mod_Brahim_Flora_E();
};

INSTANCE Info_Mod_Brahim_Canthar (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Canthar_Condition;
	information	= Info_Mod_Brahim_Canthar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Canthar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	&& (Moe_KnowsPort == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Canthar_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_00"); //You're alive! And this time I'm happy about it.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_01"); //I have not won a victory. Just a truce.
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_02"); //You've prevented worse. Man, I was scared for my life. Here, this is supposed to be yours.

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItWr_Map_Newworld, 1);

	B_ShowGivenThings	("100 Gold and card received");

	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_03"); //Be careful, though. It's not over yet.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_04"); //Yeah, that'll be me. See you around.
};

INSTANCE Info_Mod_Brahim_PortGekillt (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortGekillt_Condition;
	information	= Info_Mod_Brahim_PortGekillt_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found Johannes Port. He's dead.";
};

FUNC INT Info_Mod_Brahim_PortGekillt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_IsDead(Mod_4027_NONE_Port_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_00"); //I found Johannes Port. He's dead.
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_01"); //This is regrettable, but it also increases the value of his works. I'm inclined to buy his suitcase from you.
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_02"); //How much would you give me for the case?
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_04"); //Hmm, 200 gold pieces and another 100 for making the effort to look for him. Agreed?

	CreateInvItems	(self, ItMi_Gold, 400);

	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_SUCCESS);

	CurrentNQ += 1;

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Accept.", Info_Mod_Brahim_PortGekillt_Ok_300);
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Haggling.", Info_Mod_Brahim_PortGekillt_Feilschen_300);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_05"); //Yeah.
	
		B_GiveInvItems	(self, hero, ItMi_Gold, 300);
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Ok_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Ok_300_15_00"); //Give me the gold.
	
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Feilschen_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Feilschen_300_15_00"); //That's not enough.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_Feilschen_300_13_01"); //All right, here's 350 gold coins.

		B_GiveInvItems	(self, hero, ItMi_Gold, 350);

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Brahim_PortGekillt_Feilschen_300_13_02"); //I'll only give you 300 gold coins.

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
		
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Accept.", Info_Mod_Brahim_PortGekillt_Ok_300);
	};
};

INSTANCE Info_Mod_Brahim_WoMoe (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_WoMoe_Condition;
	information	= Info_Mod_Brahim_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you seen Moe lately?";
};

FUNC INT Info_Mod_Brahim_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_00"); //Have you seen Moe lately?
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_01"); //Moe? Mmhh... No, I can't remember. Isn't he where he should be?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_02"); //Then I wouldn't have asked.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_03"); //That's right. Are you worried?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_04"); //I don't know yet.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_05"); //Well, that sounds like fun... Let me know when you find him.
};

INSTANCE Info_Mod_Brahim_MoeTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_MoeTot_Condition;
	information	= Info_Mod_Brahim_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moe's been murdered.";
};

FUNC INT Info_Mod_Brahim_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_00"); //Moe's been murdered.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_01"); //WAS?! Shit, man! Have you reported it yet?
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_02"); //I'll sort that out in my own way.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_03"); //So again blood and slaughter...
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_04"); //Depends on how hard Canthar fights back.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_05"); //Canthar did it? At Innos, I hope you get out of there alive.
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_06"); //If necessary, I have to charge. Reload. The crossbow.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_07"); //Huh? Oh, never mind. Good luck with your venture, anyway.
};

INSTANCE Info_Mod_Brahim_HartImNehmen (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_HartImNehmen_Condition;
	information	= Info_Mod_Brahim_HartImNehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "You're a tough guy, huh?";
};

FUNC INT Info_Mod_Brahim_HartImNehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_HartImNehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_00"); //You're a tough guy, huh?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_01"); //The luxuriant days are over. You have to see where you stay.
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_02"); //Even with a monopoly on virgin parchment drawings?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_03"); //Make fun of me.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_04"); //Since the first paper mills appeared, I can hardly bring my expensive parchment to the man.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_05"); //Well, anyone who prefers to read on rags rather than on animal skin cannot be helped any more.
};

INSTANCE Info_Mod_Brahim_Rasend (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Rasend_Condition;
	information	= Info_Mod_Brahim_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_00"); //With Beliar's stinking socks, was that a demon?!
	AI_Output(hero, self, "Info_Mod_Brahim_Rasend_15_01"); //You could say that.
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_02"); //I got lucky again!
};

INSTANCE Info_Mod_Brahim_Trade (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Trade_Condition;
	information	= Info_Mod_Brahim_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brahim_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output(hero, self, "Info_Mod_Brahim_Trade_15_00"); //Well, let me see...
};

INSTANCE Info_Mod_Brahim_Pickpocket (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Pickpocket_Condition;
	information	= Info_Mod_Brahim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Brahim_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_BACK, Info_Mod_Brahim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brahim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brahim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brahim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brahim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brahim_EXIT (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_EXIT_Condition;
	information	= Info_Mod_Brahim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brahim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
