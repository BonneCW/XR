INSTANCE Info_Mod_Brandon_Hi (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Hi_Condition;
	information	= Info_Mod_Brandon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brandon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_00"); //Hey, what are you doing here?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_01"); //I want Greg.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_02"); //What about Greg, then? And what do you want with the captain?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_03"); //I want to be a pirate.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_04"); //You want to be a pirate? With your puny arms?
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_05"); //I'll make you a proposition. You're shooting a bigger beach monitor wandering around the camp.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_06"); //He's scaring some of the laundry girls. (laughs)
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_07"); //Laundry girls? I don't see any women around here.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_08"); //(lacht hämisch) Die Waschweiber sind die "boys" aus Henrys Entertrupp.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_09"); //But you'll see them soon enough, kid.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_10"); //If I remember correctly, you should kill another monitor.
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_11"); //I'm going....

	Log_CreateTopic	(TOPIC_MOD_BRANDON_WARAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "I'm supposed to kill a large beach monitor for Brandon.");
};

INSTANCE Info_Mod_Brandon_Waran (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Waran_Condition;
	information	= Info_Mod_Brandon_Waran_Info;
	permanent	= 0;
	important	= 0;
	description	= "The monitor is dead.";
};

FUNC INT Info_Mod_Brandon_Waran_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Npc_IsDead(BrandonWaran))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Waran_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Waran_15_00"); //The monitor is dead.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_01"); //There you go. That's it. The washing women should be satisfied with that.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_02"); //Now go see Greg.

	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "I can finally get to Greg.");
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brandon_Schatzsuche (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche_Condition;
	information	= Info_Mod_Brandon_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "You look so happy.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_00"); //You look so happy.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_01"); //I am, too. I noticed Greg's trying to run out. Something's finally happening.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_02"); //That's right. And I'm supposed to help with the preparations.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_03"); //Can I support you there?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_04"); //But yes.... But this is between us!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_05"); //What's the pressure on the boot?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_06"); //It's a funny thing.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_07"); //Climbed the other day in the rocks above the alternative camp. Just out of curiosity.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_08"); //Suddenly a giant screech about me.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_09"); //Two strange creatures looked like little people, but with wings and mighty claws.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_10"); //I know them all. They're harpies.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_11"); //Anyway, they attacked me.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_12"); //I just had my little hatchet with me, and I couldn't beat them.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_13"); //So I ran away and lost my grappling hook.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_14"); //And we may need that when we run out.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_15"); //I don't know. Maybe it is. So I'm supposed to bring that thing back to you.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_16"); //You say it. I don't like the creatures.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_17"); //It's not supposed to be your damage.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_18"); //Uh-huh. You're superstitious.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_19"); //Aren't we pirates all?

	Log_CreateTopic	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIR_ENTERHAKEN, "I need to find Brandon's grappling hook in the rock above the alternate camp and bring it back.");

	Wld_InsertItem	(ItMi_Enterhaken, "FP_ITEM_ENTERHAKEN");

	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_01");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_02");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_03");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_04");
};

INSTANCE Info_Mod_Brandon_Schatzsuche2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche2_Condition;
	information	= Info_Mod_Brandon_Schatzsuche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here, I got your hook.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Schatzsuche))
	&& (Npc_HasItems(hero, ItMi_Enterhaken) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_00"); //Here, I got your hook.

	B_GiveInvItems	(hero, self, ItMi_Enterhaken, 1);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_01"); //Thank you, Adanos! Here's 300 gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_02"); //And not a word to the others!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_03"); //I understand. See you around.

	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_SUCCESS);

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(150);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Brandon_Befreiung (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung_Condition;
	information	= Info_Mod_Brandon_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Brandon_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_01"); //What do you want from me?
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_02"); //What's the matter with you?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_03"); //I haven't had a drink in three weeks. I'm going crazy, man!
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_04"); //How can I help you?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_05"); //Get me some booze. 20 bottles of grog should be enough.
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_06"); //Okay, I'll be going.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_07"); //Come on, hurry up.

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRBRANDON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRBRANDON, "The pirate Brandon hasn't drunk alcohol in three weeks. He wants me to get him 20 bottles of grog.");
};

INSTANCE Info_Mod_Brandon_Befreiung2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung2_Condition;
	information	= Info_Mod_Brandon_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the booze you promised me.";
};

FUNC INT Info_Mod_Brandon_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Befreiung))
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung2_15_00"); //Here's the booze you promised me.

	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 20);
	B_UseItem	(self, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung2_04_01"); //Thanks, man. You saved my life. Here, take this.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRBRANDON, TOPIC_MOD_BEL_PIRATENLAGER, "I saved Brandon's life.", "I saved Brandon's life.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_SUCCESS);

	B_GivePlayerXP	(185);

	Mod_Piratenbefreiung += 1;
};

INSTANCE Info_Mod_Brandon_Lehrer (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lehrer_Condition;
	information	= Info_Mod_Brandon_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me something?";
};

FUNC INT Info_Mod_Brandon_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Brandon_Lehrer_04_00"); //I can help you get stronger.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_PIRATEN, "Brandon can make me stronger.");
};

INSTANCE Info_Mod_Brandon_Lernen(C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lernen_Condition;
	information	= Info_Mod_Brandon_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description 	= "I want to become stronger!";
};   
                    
FUNC INT Info_Mod_Brandon_Lernen_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Mod_Brandon_Lehrer))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};	
};

func VOID Info_Mod_Brandon_Lernen_Info()
{	
	AI_Output (hero, self, "Info_Mod_Brandon_Lernen_15_00"); //Teach me something!
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen, DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_Back()
{
	Info_ClearChoices (Info_Mod_Brandon_Lernen);
};

FUNC VOID Info_Mod_Brandon_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);	
};

INSTANCE Info_Mod_Brandon_Pickpocket (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Pickpocket_Condition;
	information	= Info_Mod_Brandon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Brandon_Pickpocket_Condition()
{
	C_Beklauen	(61, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_BACK, Info_Mod_Brandon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brandon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brandon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brandon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brandon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brandon_EXIT (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_EXIT_Condition;
	information	= Info_Mod_Brandon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brandon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
