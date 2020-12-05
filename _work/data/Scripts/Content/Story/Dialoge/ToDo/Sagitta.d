INSTANCE Info_Mod_Sagitta_Hi (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Hi_Condition;
	information	= Info_Mod_Sagitta_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sagitta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Sagitta_Hi_26_00"); //Hey, what are you doing here? Do you want to use my services as a herbalist or do you want to buy one of my potions?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_OHNELAGER, TOPIC_MOD_LEHRER_KHORINIS, "Sagitta sells potions.", "Sagitta can teach me alchemy.");
};

INSTANCE Info_Mod_Sagitta_AkilsHof (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_AkilsHof_Condition;
	information	= Info_Mod_Sagitta_AkilsHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mistress of herbal medicine, I need your support.";
};

FUNC INT Info_Mod_Sagitta_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllDead))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (Mod_AkilsHofAusgestorben == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_AkilsHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_00"); //Mistress of herbal medicine, I need your support.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_01"); //Of course, or you wouldn't be here. What's this about?
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_02"); //Since the visit of a sinister figure, some people on Akil's farm have fallen ill and are suffering from rapid physical deterioration.
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_03"); //The two brothers went wildly against each other and Ehnim was badly wounded.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_04"); //Hmm, the circumstances make me suspect that we're not dealing with an everyday disease.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_05"); //It seems to be a kind of curse where my art of healing has nothing to do with it.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_06"); //Most likely you will find help in the monastery, where you should go as soon as possible.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_07"); //Here's another healing potion for Ehnim. His injury was supposed to be cured.

	B_GiveInvItems	(self, hero, ItPo_Health_06, 1);
	
	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Sagitta_Kraeuter (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter_Condition;
	information	= Info_Mod_Sagitta_Kraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me alchemy?";
};

FUNC INT Info_Mod_Sagitta_Kraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_00"); //Can you teach me alchemy?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_01"); //You want to learn about alchemy from me? What makes you think that?

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_02"); //I already know about it and would like to expand my knowledge.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_03"); //Like this? That's a good premise.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_04"); //Then you should be able to do the little task I'm going to give you without any major difficulties.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_05"); //Well, it can be very useful, I guess.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_06"); //So, do you think...? It almost sounds like a fixed idea.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_07"); //No, if you want me to sacrifice my time, you're gonna have to do a little thing for me first.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_08"); //This will show whether your interest is truly sincere.
	};

	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_09"); //I'm listening.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_10"); //Get me a fly agaric, a healing bud and two blue songs.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_11"); //When you've brought me the things, I'll let you run an errand. But more about this later.

	Log_CreateTopic	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "To teach me Sagitta, I have to bring her first 1 fly agaric, 1 healing bud and 2 blue songs.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter2_Condition;
	information	= Info_Mod_Sagitta_Kraeuter2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the things.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 1)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_00"); //I got the things.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 1);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 2);

	B_ShowGivenThings	("Healing bud, fly agaric and two blue songs given");

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_01"); //Good. Give it to me. I have to finish the plants at the alchemy table.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_02"); //Watch and learn.

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_03"); //There, here. This medicine is for Sekob. As always, two tablespoons each morning and evening.

	B_GiveInvItems	(self, hero, ItPo_SekobMedizin, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_04"); //I'll give you some gold and some in kind for it.
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_05"); //Medicine? Fly agaric?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_06"); //You seem unbelieving. That doesn't speak for you.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_07"); //Every experienced alchemist should know that poisons in low concentrations can have healing effects.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_08"); //Sekob, for example, suffers from heart problems, which is no wonder with the notorious choleric person he is.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_09"); //The small dosage of mushroom poison relieves his symptoms.... and the outbursts of rage.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_10"); //Now go away. You know what you have to do.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Now I am to bring Sekob the fly agaric medicine.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter3_Condition;
	information	= Info_Mod_Sagitta_Kraeuter3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your package.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter2))
	&& (Npc_HasItems(hero, ItMi_SekobSagitta) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter3_15_00"); //Here's your package.

	B_GiveInvItems	(hero, self, ItMi_SekobSagitta, 1);

	Npc_RemoveInvItems	(self, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_26_01"); //Good. You have fulfilled your task.... even if it wasn't the most demanding.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_26_02"); //If you're still interested in alchemy, I'll teach you now.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sagitta_Irdorath (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath_Condition;
	information	= Info_Mod_Sagitta_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have to leave this island with a ship and need someone with your skills on my crew.";
};

FUNC INT Info_Mod_Sagitta_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_00"); //I have to leave this island with a ship and need someone with your skills on my crew.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_01"); //It's about the well-being of khorinis...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_02"); //What? I, who have dedicated my whole life to herbalism in the countryside, on a ship? Well, you come up with ideas...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_03"); //But first tell us what this excursion is all about.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_04"); //A sinister magician tries to subjugate this island and has already done some damage in the valley of the Mine, the city and on farms.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_05"); //We must visit a nearby island in order to put an end to his machinations sooner or later.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_06"); //What did you say?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_07"); //Yes, the incidence of unusual illnesses has been increasing lately. I've been visited more than ever before.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_08"); //Hardly a day more, since people do not come to me complaining and ask for relief of their suffering.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_09"); //It's getting to be too much for me...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_10"); //(again to the hero) All right, if only the voyage can end this evil activity, I will accompany you....
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_11"); //What, yeah, really?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_12"); //Yes... but first you have to get me some plants... they should be able to significantly reduce seasickness.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_13"); //Well, where do I have to walk?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_14"); //Nowhere.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_15"); //How? What then?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_16"); //Climbing and swimming. The Harpienkralle - a mushroom - grows only on bare mountain peaks - as the name suggests - near harpies.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_17"); //You'll have to find one of their nests, and you'll certainly find the sought-after ingredient between their filth.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_18"); //In the past, they are said to have been native to the Minental, but with the fall of the barrier, you might also find harpies near Onars Hof in the mountains.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_19"); //All right, what else?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_20"); //And then you have to get the salt water spit that grows near shallow water barley.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_21"); //The reason is that...
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_22"); //Yes, yes, that the plant grows in his garbage...
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_23"); //What, no, not at all, why would you think that?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_24"); //The shallow water barber is the preferred prey of his five-metre larger cousin, Gierschlundleviathan, and grows in its excretions.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_25"); //You could find what you are looking for in the shallow parts of the harbour and the small island off the coast.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_26"); //Uh... I'll be on my way, then.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Well, Sagitta declares herself basically ready for the journey.... only I have to get her two more things: the harp claw, which grows on mountain peaks in harp nests - in the valley of the Mine and in the mountains around Onar's farm I could find some - and the salt water spit, which could sprout somewhere in shallow places at the harbour and the small island.");

	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_01");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_02");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_03");

	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_02");

	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
};

INSTANCE Info_Mod_Sagitta_Irdorath2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath2_Condition;
	information	= Info_Mod_Sagitta_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have the plants.";
};

FUNC INT Info_Mod_Sagitta_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath))
	&& (Mod_SagittaSS == 1)
	&& (Mod_SagittaHK == 1)
	&& (Npc_HasItems(hero, ItPl_SalzwasserSprießling) >= 1)
	&& (Npc_HasItems(hero, ItPl_Harpienkralle) >= 1)
	&& (Mod_Irdorath == 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath2_15_00"); //I have the plants.

	B_ShowGivenThings	("Harpie claw and salt water spit");

	Npc_RemoveInvItems	(hero, ItPl_SalzwasserSprießling, 1);
	Npc_RemoveInvItems	(hero, ItPl_Harpienkralle, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_01"); //Let me see.... actually.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_02"); //You did an excellent job.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_03"); //You seem really serious about the expedition... and I don't see any obstacle to me not joining her.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_04"); //See you at the harbour.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Sagitta was very satisfied and will wait at the harbour for the start of the voyage.");

	B_GivePlayerXP	(300);

	Mod_SagittaDabei = 1;
	Mod_JackAL = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Sagitta_Irdorath3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath3_Condition;
	information	= Info_Mod_Sagitta_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "I'm sorry, but it seems there are too many of us.";
};

FUNC INT Info_Mod_Sagitta_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_SagittaDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath3_15_00"); //I'm sorry, but it seems there are too many of us. I can't take you with me.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath3_26_01"); //Too bad. I'll go back then.

	Mod_SagittaDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Sagitta_OnarsSchnaps (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsSchnaps_Condition;
	information	= Info_Mod_Sagitta_OnarsSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Onar drank something wrong and now he's got a bad stomach upset.";
};

FUNC INT Info_Mod_Sagitta_OnarsSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Wasili_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsSchnaps_15_00"); //Onar drank something wrong and now he's got a bad stomach upset. Do you know what to do?
	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsSchnaps_26_01"); //Onar, you say? That old cheapskate? In this case, my cure costs 100 gold coins.
};

INSTANCE Info_Mod_Sagitta_OnarsHeilmittel (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsHeilmittel_Condition;
	information	= Info_Mod_Sagitta_OnarsHeilmittel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the gold.";
};

FUNC INT Info_Mod_Sagitta_OnarsHeilmittel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_OnarsSchnaps))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsHeilmittel_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsHeilmittel_15_00"); //Here's the gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsHeilmittel_26_01"); //He just has to drink this herbal mixture. After a short time he should feel better.

	B_GiveInvItems	(self, hero, ItPo_OnarsTrank, 1);
};

INSTANCE Info_Mod_Sagitta_MangelQuest (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_MangelQuest_Condition;
	information	= Info_Mod_Sagitta_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Buy fungicide (80 Gold)";
};

FUNC INT Info_Mod_Sagitta_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Sagitta_Lehrer (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Lehrer_Condition;
	information	= Info_Mod_Sagitta_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me about alchemy.";
};

FUNC INT Info_Mod_Sagitta_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter3))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Sagitta_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Sagitta_Lehrer_26_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
	Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,DIALOG_BACK,Info_Mod_Sagitta_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Drink of light healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Sagitta_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Light healing potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Sagitta_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Potion of Quick Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Sagitta_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Essence of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Sagitta_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Extract of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Sagitta_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixir of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Sagitta_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (Mod_LehrlingBei != 1)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixir of Life", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Sagitta_Lehrer_Perm_Health);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Drink of light mana", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Sagitta_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Light mana potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Sagitta_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Sagitta_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Extract", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Sagitta_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Sagitta_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Speed Potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Sagitta_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixir of Spirit", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Sagitta_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 4)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Elixir of Strength", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Sagitta_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice (Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Elixir of Dexterity", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Sagitta_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Sagitta_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Sagitta_Trade (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Trade_Condition;
	information	= Info_Mod_Sagitta_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sagitta_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sagitta_Pickpocket (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Pickpocket_Condition;
	information	= Info_Mod_Sagitta_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150_Female;
};

FUNC INT Info_Mod_Sagitta_Pickpocket_Condition()
{
	C_Beklauen	(130, ItPo_Gegengift, 4);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_BACK, Info_Mod_Sagitta_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sagitta_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sagitta_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sagitta_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sagitta_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sagitta_EXIT (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_EXIT_Condition;
	information	= Info_Mod_Sagitta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sagitta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
