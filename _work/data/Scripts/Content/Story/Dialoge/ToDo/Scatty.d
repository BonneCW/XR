INSTANCE Info_Mod_Scatty_Hi (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Hi_Condition;
	information	= Info_Mod_Scatty_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scatty_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_01_00"); //You're the guy who almost sealed our end!

	Log_CreateTopic	(TOPIC_MOD_ALTESLAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "At the entrance of the old camp I was greeted by my old friend Scatty. Apparently, the old camp still exists.");

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Scatty_Hi);

	Info_AddChoice	(Info_Mod_Scatty_Hi, "Relax, you guys survived, right?", Info_Mod_Scatty_Hi_C);
	Info_AddChoice	(Info_Mod_Scatty_Hi, "If you have a problem, come here.", Info_Mod_Scatty_Hi_B);
	Info_AddChoice	(Info_Mod_Scatty_Hi, "It was necessary, unless you had to die before everyone else.", Info_Mod_Scatty_Hi_A);
};

FUNC VOID Info_Mod_Scatty_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_A_15_00"); //It was necessary, unless you all had to die before you did.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_01"); //Then explain to me what was necessary.
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_A_15_02"); //If I hadn't been there, the sleeper would have awakened and then we wouldn't be talking here.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_03"); //Yes, the sectarian spinners have told something like that, but they tell a lot when there is a lot of swampweed.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_A_01_04"); //Someone who has survived such a fight, we can use well.

	Scatty_Start_DIA = 1;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);
};

FUNC VOID Info_Mod_Scatty_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_B_15_00"); //If you have a problem, come here.
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_B_01_01"); //I'm not gonna get told twice, come here, asshole.

	Scatty_Start_DIA = 2;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Scatty_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_C_15_00"); //Relax, you guys survived, right?
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_C_01_01"); //Are you kidding me? Take a look at the camp and you'll see how we've been.
	AI_Output(hero, self, "Info_Mod_Scatty_Hi_C_15_02"); //Do I have to mention that you deserve it?
	AI_Output(self, hero, "Info_Mod_Scatty_Hi_C_01_03"); //Yeah, I know. But the old camp is all we have left. Even if there are a lot of assholes, we can only live with it.

	Scatty_Start_DIA = 3;

	Info_ClearChoices	(Info_Mod_Scatty_Hi);
};

INSTANCE Info_Mod_Scatty_Umgehauen (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Umgehauen_Condition;
	information	= Info_Mod_Scatty_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_Hi))
	&& (Scatty_Start_DIA == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_00"); //Oh, my poor skull.
			AI_Output(hero, self, "Info_Mod_Scatty_Umgehauen_15_01"); //Well, I think you know they don't have any problems with me.
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_02"); //Damn, you're still a good fighter, apparently. We can use someone like you.

			Scatty_Start_DIA = 4;
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Scatty_Umgehauen_01_03"); //You're just a big mouth.
			AI_Output(hero, self, "Info_Mod_Scatty_Umgehauen_01_04"); //Maybe you can help us anyway.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Scatty_Hilfe (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Hilfe_Condition;
	information	= Info_Mod_Scatty_Hilfe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why would I help you?";
};

FUNC INT Info_Mod_Scatty_Hilfe_Condition()
{
	if ((Scatty_Start_DIA == 3)
	|| (Scatty_Start_DIA == 1)
	|| (Scatty_Start_DIA == 4))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Hilfe_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_15_00"); //Why would I help you?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_01_01"); //We have a problem, and you were with us once. And I'm sure you haven't forgotten that we stick together.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_15_02"); //Did you guys help me? Were we holding together when you were all trying to kill me?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_01_03"); //We thought you betrayed us. If you make a deal with the new camp, you'll be a traitor to us.

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Apparently, they're still as good as last time, it can be fun. But this time they have the problems. And they're coming with the 'you used to be one of us' spell. Would it be wise to help them?");

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);

	Info_AddChoice	(Info_Mod_Scatty_Hilfe, "Put your problems somewhere else, you filthy traitors!", Info_Mod_Scatty_Hilfe_B);

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		Info_AddChoice	(Info_Mod_Scatty_Hilfe, "What should I do for you?", Info_Mod_Scatty_Hilfe_A);
	};
};

FUNC VOID Info_Mod_Scatty_Hilfe_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_00"); //What should I do for you?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_01"); //Well, we mainly exist through the arena battles. Well, unfortunately less and less fighters win for our camp, so we don't take anything anymore.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_02"); //And what role do I play in this?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_03"); //Well, you could fight for the old camp in the arena. And other things concerning the arena.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_04"); //I see, where should I register?
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_05"); //The Bartholo baron is responsible for everything related to the administration of the camp.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_06"); //I'm sure the ore barons will be happy to see me again.
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_A_01_07"); //I don't think they're gonna kill you without listening to you. After all, they are in a position where they can be happy about everyone.
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_A_15_08"); //Very reassuring.

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "So I decided to help them. I'm supposed to fight for them in the arena and' sort out' other things, so I can be curious. I hope I won't regret this. Scatty told me to talk to Bartholo. He'll be happy to see me again.");

	Scatty_Start_DIA = 5;

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);	
};

FUNC VOID Info_Mod_Scatty_Hilfe_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Hilfe_B_15_00"); //Put your problems somewhere else, you filthy traitors!
	AI_Output(self, hero, "Info_Mod_Scatty_Hilfe_B_01_01"); //All right, get out of here!

	B_LogEntry	(TOPIC_MOD_ALTESLAGER, "I have decided to leave the old camp to its fate.");
	B_SetTopicStatus	(TOPIC_MOD_ALTESLAGER, LOG_FAILED);

	Info_ClearChoices	(Info_Mod_Scatty_Hilfe);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_ArenaFight (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_ArenaFight_Condition;
	information	= Info_Mod_Scatty_ArenaFight_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_ArenaFight_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Arena))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_ArenaFight_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_ArenaFight_01_00"); //Dear members of our camp and the other camps, today there is a battle between the undefeated unknown and the budding Templar Gor Karanto. The bets are placed.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	B_Attack	(Mod_1871_TPL_GorKaranto_MT, Mod_1872_NONE_Unbekannt_MT, AR_NONE, 0);

	Wld_SendTrigger	("ARENAKAMERA");
};

INSTANCE Info_Mod_Scatty_WannaFightUB (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to fight the unknown!";
};

FUNC INT Info_Mod_Scatty_WannaFightUB_Condition()
{
	if (Mod_GorKarantoSchwach == 2)
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_00"); //I want to fight the unknown!
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_01"); //Well, now you feel like fighting after all. I'll get you a fight with him.
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_02"); //Wear me the name...
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_03"); //All right, names don't matter. I think it would match your style if your name wasn't mentioned.
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_15_04"); //Then I want to fight.
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_01_05"); //Go to the arena, the unknown will be waiting for you.

	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] = Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX];

	Mod_GorKarantoSchwach = 3;
};

INSTANCE Info_Mod_Scatty_WannaFightUB_AK (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_AK_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_AK_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_WannaFightUB_AK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_AK_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_AK_01_00"); //The undefeated unknown fights against the nameless fighter of the guard. The bets are placed.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_WannaFightUB_2 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_2_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to fight the unknown again.";
};

FUNC INT Info_Mod_Scatty_WannaFightUB_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Botschaft))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_2_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_WannaFightUB_2_15_00"); //I want to fight the unknown again.
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_2_01_01"); //All right, go to the arena, the unknown will be waiting for you.

	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");

	B_StartOtherRoutine	(Mod_7384_OUT_Dragan_MT, "KAMPF");

	Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS] = Mod_1872_NONE_Unbekannt_MT.attribute[ATR_HITPOINTS_MAX];

	Mod_GorKarantoSchwach = 8;
};

INSTANCE Info_Mod_Scatty_WannaFightUB_AK_2 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_WannaFightUB_AK_2_Condition;
	information	= Info_Mod_Scatty_WannaFightUB_AK_2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_WannaFightUB_AK_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scatty_WannaFightUB_2))
	&& (Wld_IsTime(08,00,23,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_WannaFightUB_AK_2_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_WannaFightUB_AK_2_01_00"); //The undefeated unknown fights against the nameless fighter of the guard. The bets are placed.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Scatty_UB_Besiegt (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_UB_Besiegt_Condition;
	information	= Info_Mod_Scatty_UB_Besiegt_Info;
	permanent	= 0;
	important	= 0;
	description	= "I defeated the Unknown Warrior.";
};

FUNC INT Info_Mod_Scatty_UB_Besiegt_Condition()
{
	if (Mod_GorKarantoSchwach == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_UB_Besiegt_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_UB_Besiegt_15_00"); //I defeated the Unknown Warrior.
	AI_Output(self, hero, "Info_Mod_Scatty_UB_Besiegt_01_01"); //Very good, finally one of our fighters who won again.
	AI_Output(self, hero, "Info_Mod_Scatty_UB_Besiegt_01_02"); //Here's your share of the revenue.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_StartOtherRoutine	(self, "START");

	Mod_GorKarantoSchwach = 11;
};

INSTANCE Info_Mod_Scatty_AboutSabitsch (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_AboutSabitsch_Condition;
	information	= Info_Mod_Scatty_AboutSabitsch_Info;
	permanent	= 0;
	important	= 0;
	description	= "How's the betting business going?";
};

FUNC INT Info_Mod_Scatty_AboutSabitsch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_TimeOver))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_AboutSabitsch_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_AboutSabitsch_15_00"); //How's the betting business going?
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_01"); //Miserable. This new fighter, Sabitsch is his name, he's ruining my whole betting business.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_02"); //He has won every fight so far without ever having had a real chance at his opponents.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_03"); //Even such a guy in dark robes, who actually sent every opponent into the dust after a few seconds, he knocked him down with one blow.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_04"); //Fortunately, he doesn't fight every day, but only if there is an opponent who is willing to pay a high bet.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_05"); //And what makes me hope, that's getting less and less.
	AI_Output(hero, self, "Info_Mod_Scatty_AboutSabitsch_15_06"); //What's so special about this fighter?
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_07"); //He must possess incredible power, as he can swing the heaviest axe with the greatest skill.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_08"); //Even the strongest guys I've encountered so far could hardly put on and lead such a weapon.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_09"); //It is therefore all the more surprising that such a guy is enthusiastic about jewellery and runs around with amulets and rings all day long, like a vain merchant's wife.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_10"); //Only at night did I see - he has his hut near my arena - how he at least stashes some of his stuff in the trunk, takes off his heavy armour and wraps himself in a nice civic outfit instead, before he goes to sleep at night.
	AI_Output(self, hero, "Info_Mod_Scatty_AboutSabitsch_01_11"); //Funny the guy, but a good friend of Thorus', I heard.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Scatty said Sabitsch must be an incredibly strong fighter to lead his weapon. In addition, Sabitsch wears jewellery all day long, which he only takes off at night and stashes in his chest to sleep in civilian clothes. I'll find his cabin at the arena.");
};

INSTANCE Info_Mod_Scatty_SabitschTot (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_SabitschTot_Condition;
	information	= Info_Mod_Scatty_SabitschTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Scatty_SabitschTot_Condition()
{
	if (Mod_SabitschTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_SabitschTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Scatty_SabitschTot_01_00"); //Still on the road that late at night?
	AI_Output(self, hero, "Info_Mod_Scatty_SabitschTot_01_01"); //Well, I was just about to have a green novice too.

	Mod_SabitschTotPetze = 1;
};

INSTANCE Info_Mod_Scatty_SlyArena (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_SlyArena_Condition;
	information	= Info_Mod_Scatty_SlyArena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Has Sly called you yet?";
};

FUNC INT Info_Mod_Scatty_SlyArena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena5))
	&& (Wld_IsTime(08,00,16,00))
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_SlyArena_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_SlyArena_15_00"); //Has Sly called you yet?
	AI_Output(self, hero, "Info_Mod_Scatty_SlyArena_01_01"); //Sure thing. I'm curious to see how the greenhorn fights. So far, I've only noticed him by his boozing.
	AI_Output(hero, self, "Info_Mod_Scatty_SlyArena_15_02"); //Is there a date for his first fight yet?
	AI_Output(self, hero, "Info_Mod_Scatty_SlyArena_01_03"); //Jo. Afterwards at 5 pm he will compete against Gor Karanto. It's gonna be a tough fight, I say.
};

INSTANCE Info_Mod_Scatty_Kap4 (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_Kap4_Condition;
	information	= Info_Mod_Scatty_Kap4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Scatty? You here?";
};

FUNC INT Info_Mod_Scatty_Kap4_Condition()
{
	if (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Scatty_Kap4_Info()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_00"); //Scatty? You here?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_01"); //Where else am I supposed to be?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_02"); //Maybe as a corpse in the old camp, maybe as food for the hurricanes?
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_03"); //Actually.... yes.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_04"); //Ahh, I can fuck myself.
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_15_05"); //What's happening?
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_06"); //Oh, when those filthy orcs invaded the camp, I just had a beer in front of the arena.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_07"); //I heard the screaming and before I knew it, a horde of orcs came running towards me.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_08"); //After a short fight I realized that it was hopeless and ran in the other direction to the back exit.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_09"); //There I tried to open the gate with the guards, while at the same time we had to defend ourselves against some of the green bastards.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_10"); //With the last effort I managed it... but the other two boys did bite the dust, though.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_11"); //When I was running around outside, I thought about where to go.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_12"); //Ich dachte mir: "Hey, the guys from the swamp scribbles always showed what they're made of in the arena."Ich dachte mir: "Hey, die Jungs von den Sumpffritzen haben doch immer in der Arena gezeigt, aus welchem Holz sie geschnitzt sind.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_13"); //So einen wie mich können die bei den Templern bestimmt gut gebrauchen."
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_14"); //Well, what now? I can watch out for the novices at the harvest.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_01_15"); //I really don't know what I'm doing here....

	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Mod_Fisk_LeiseHoffnung == 0)
	{
		B_LogEntry	(TOPIC_MOD_LEISEHOFFNUNG, "I met Scatty at swamp camp, where he gets to play lookout.");
	};

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);

	Info_AddChoice	(Info_Mod_Scatty_Kap4, "At least the hairdo fits now.", Info_Mod_Scatty_Kap4_B);
	Info_AddChoice	(Info_Mod_Scatty_Kap4, "It'll be all right.", Info_Mod_Scatty_Kap4_A);
};

FUNC VOID Info_Mod_Scatty_Kap4_B()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_B_15_00"); //At least the hairdo fits now.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_B_01_01"); //What?! Make sure you win the land before the lightning hits you while taking a shit...

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);
};

FUNC VOID Info_Mod_Scatty_Kap4_A()
{
	AI_Output(hero, self, "Info_Mod_Scatty_Kap4_A_15_00"); //You'll be all right.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_A_01_01"); //Oh, the saying doesn't help me now.
	AI_Output(self, hero, "Info_Mod_Scatty_Kap4_A_01_02"); //Now go away... I have to be careful not to eat a novice... or you'll get sour from Baal... Whatever, hit-me-dead.

	Info_ClearChoices	(Info_Mod_Scatty_Kap4);
};

// ------------------------------------------------------------
// 			  				CANYOUTEACH 
// ------------------------------------------------------------ 

INSTANCE Info_Mod_Scatty_CanYouTeach   (C_INFO) 
{ 
	npc     	= Mod_962_STT_Scatty_MT; 
	nr          = 1; 
	condition   = Info_Mod_Scatty_CanYouTeach_Condition; 
	information = Info_Mod_Scatty_CanYouTeach_Info; 
	important   = FALSE; 
	permanent   = FALSE; 
	description = ""; 
}; 
 
FUNC INT Info_Mod_Scatty_CanYouTeach_Condition () 
{ 
	//Bedingung nochmal checken? Scatty_Start_DIA ist 5 wenn man zugesagt hat, zu helfen
	if (Scatty_Start_DIA == 5)
	{
		return TRUE; 
	};
}; 
 
FUNC VOID Info_Mod_Scatty_CanYouTeach_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Scatty_CanYouTeach_15_00"); //Trainierst du noch Kämpfer? 

	AI_Output(self, hero, "Info_Mod_Scatty_CanYouTeach_01_01"); //Sicher. Ich kann dich im Einhandkampf unterrichten.
	AI_Output(self, hero, "Info_Mod_Scatty_CanYouTeach_01_02"); //Wenn ich mich recht erinnere, habe ich dir damals schon das Kämpfen beigebracht. 

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "");
}; 


// ------------------------------------------------------------
// 			  				   LERNEN 
// ------------------------------------------------------------ 

// fuer den "du bist schon besser geworden"-Dialog
var int Scatty_Merke1H;

INSTANCE Info_Mod_Scatty_Lernen   (C_INFO) 
{ 
	npc     	= Mod_962_STT_Scatty_MT; 
	nr          = 1; 
	condition   = Info_Mod_Scatty_Lernen_Condition; 
	information = Info_Mod_Scatty_Lernen_Info; 
	important   = FALSE; 
	permanent   = TRUE; 
	description = "Teach me!"; 
}; 
 
FUNC INT Info_Mod_Scatty_Lernen_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Scatty_CanYouTeach)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Scatty_Lernen_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Scatty_Lernen_15_00"); //

	if (hero.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_01"); //
	}
	else
	{
		Scatty_Merke1H = hero.HitChance[NPC_TALENT_1H];

		Info_ClearChoices	(Info_Mod_Scatty_Lernen);
		Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
		Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
		Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);
	};
}; 

FUNC VOID Info_Mod_Scatty_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	if (hero.HitChance[NPC_TALENT_1H] > scatty_merke1H && hero.HitChance[NPC_TALENT_1H] < 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_02"); //
	}
	if (hero.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_03"); //
		AI_Output(self, hero, "Info_Mod_Scatty_Lernen_01_04"); //
	};
};

FUNC VOID Info_Mod_Scatty_Lernen_1H_5()
{
	B_TeachFightTalentPercent_New(self, hero, NPC_TALENT_1H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);
	
};

FUNC VOID Info_Mod_Scatty_Lernen_1H_1()
{
	B_TeachFightTalentPercent_New(self, hero, NPC_TALENT_1H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Scatty_Lernen);
	Info_AddChoice 		(Info_Mod_Scatty_Lernen, DIALOG_BACK, Info_Mod_Scatty_Lernen_Back);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h1,	 B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)),		Info_Mod_Scatty_Lernen_1H_1);
	Info_AddChoice		(Info_Mod_Scatty_Lernen, B_BuildLearnString(PRINT_Learn1h5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)),		Info_Mod_Scatty_Lernen_1H_5);

};

INSTANCE Info_Mod_Scatty_EXIT (C_INFO)
{
	npc		= Mod_962_STT_Scatty_MT;
	nr		= 1;
	condition	= Info_Mod_Scatty_EXIT_Condition;
	information	= Info_Mod_Scatty_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Scatty_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Scatty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
