INSTANCE Info_Mod_Herek_REL_Hi (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Hi_Condition;
	information	= Info_Mod_Herek_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_00"); //Hey, wait a minute.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_01"); //You look like someone who wouldn't let a good opportunity slip through his fingers.
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_15_02"); //What do you want?
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_03"); //Well, I could tell you - let's just say for 100 gold coins - where you can find a treasure.

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Forget about it. I keep my gold.", Info_Mod_Herek_REL_Hi_B);
	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Okay, here. Go for it.", Info_Mod_Herek_REL_Hi_A);
};

FUNC VOID Info_Mod_Herek_REL_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_B_15_00"); //Forget about it. I keep my gold.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_B_01_01"); //All right, you're missing out on some gold... but other adventurers will certainly not miss this opportunity.
};

FUNC VOID Info_Mod_Herek_REL_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_A_15_00"); //Okay, here. Go for it.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_01"); //Well, then listen. In one of the dilapidated buildings in front of the moor there is a dead adventurer.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_02"); //As I have now noticed, he found a lot of gold and some valuable artifacts before his death...
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_03"); //He must still have it with him. Got it?

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Log_CreateTopic	(TOPIC_MOD_HEREK_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "For 100 coins, I learned from Herek that a dying adventurer wanders around the dilapidated buildings in front of the moor as an undead, who must still carry some gold and treasure with him.");

	Wld_InsertNpc	(Zombie_Herek,	"FP_ROAM_ZOMBIE_HEREK");
};

INSTANCE Info_Mod_Herek_REL_AtZombie (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie_Condition;
	information	= Info_Mod_Herek_REL_AtZombie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_AtZombie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harlok_HerekZombie))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_00"); //Huh, now I can dig undisturbed. What, you?!
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_15_01"); //Yeah, me! You're lucky you set me up.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_02"); //So, what are you gonna do now?

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Repeat my gold to me.", Info_Mod_Herek_REL_AtZombie_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Get my gold back.", Info_Mod_Herek_REL_AtZombie_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_C()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_C_01_00"); //Yes?! Why don't you give it a try?

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_B_15_00"); //Repeat my gold to me.

	Info_Mod_Herek_REL_AtZombie_C();
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_00"); //Get my gold back.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_01"); //Oh, I'm about to cry.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_02"); //If you let yourself be fooled, it's your own fault. Everyone has to pay their own tuition.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_03"); //You should still be thankful for the lesson.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_04"); //I think I'm gonna have to teach YOU a lesson.

	Info_Mod_Herek_REL_AtZombie_C();
};

INSTANCE Info_Mod_Herek_REL_Umgehauen (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Umgehauen_Condition;
	information	= Info_Mod_Herek_REL_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie))
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Umgehauen_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Umgehauen_04_00"); //You son of a bitch, my bones.
							
	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

INSTANCE Info_Mod_Herek_REL_AtZombie2 (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie2_Condition;
	information	= Info_Mod_Herek_REL_AtZombie2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where's the rest of my gold?";
};

FUNC INT Info_Mod_Herek_REL_AtZombie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Umgehauen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_Info()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_15_00"); //Where's the rest of my gold?
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_01_01"); //Huh, you'd like to know. But I won't say anything!

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Then I'll have to loosen your tongue with another beating.", Info_Mod_Herek_REL_AtZombie2_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Then get the hell out of here.", Info_Mod_Herek_REL_AtZombie2_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_00"); //Then I'll have to loosen your tongue with another beating.

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_01"); //Ahh, my bones.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_02"); //We've been through this before.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_03"); //(declining) Okay. I'll show you where it sparkles. (impulsive) Here!

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_TurnToNpc	(hero, self);
	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_04"); //(groans) Ahh... I can't do it anymore.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_05"); //We're happy to go ahead with the game.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_06"); //Yes, yes... I've had enough.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_07"); //The gold is on the roof of the dilapidated hut, which is furthest from the moor.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_08"); //Okay, I'll check... and don't you dare lie to me.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "It took some persuasion, but finally Herek spat out where he hid the rest of my gold... at least I hope so. It is located on the roof of the disintegrated hut, which is furthest away from the moor.");
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_A_15_00"); //Then get the hell out of here.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_FAILED);

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Herek_REL_Trade (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Trade_Condition;
	information	= Info_Mod_Herek_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Herek_REL_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Herek_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Pickpocket_Condition;
	information	= Info_Mod_Herek_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Herek_REL_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_GoldCup, 2);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_BACK, Info_Mod_Herek_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Herek_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Herek_REL_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Herek_REL_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Herek_REL_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Herek_REL_EXIT (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_EXIT_Condition;
	information	= Info_Mod_Herek_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Herek_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Herek_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
