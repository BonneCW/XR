INSTANCE Info_Mod_Brauer_Hi (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Hi_Condition;
	information	= Info_Mod_Brauer_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is this your brewery?";
};

FUNC INT Info_Mod_Brauer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Hi_15_00"); //Is this your brewery?
	AI_Output(self, hero, "Info_Mod_Brauer_Hi_06_01"); //In the meantime, yes. Until recently it belonged to my uncle, but he bequeathed it to me and then drowned unhappily in one of the water catchment basins.
};

INSTANCE Info_Mod_Brauer_Bierhexen (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen_Condition;
	information	= Info_Mod_Brauer_Bierhexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "You're looking a little gloomy.";
};

FUNC INT Info_Mod_Brauer_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Richter_Unfrieden))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_00"); //You're looking a little gloomy.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_01"); //I wish I had no reason to.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_02"); //But the beer witches always spoil my plans!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_03"); //Beer witches?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_04"); //Exactly! Haven't you heard of them?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_05"); //They enchant the beer so that nothing can come of it.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_06"); //And they're especially after me.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_07"); //Never before have I ever managed to brew a good beer. It always tastes bitter and stern.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_08"); //Last time I put a wreath of wild herbs around the brewpot, although I'm not superstitious.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_09"); //Not even that helps!

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_10"); //(to oneself) I don't think it will be the witches...

	AI_TurnToNpc	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_11"); //How long have you been practicing in your brow?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_12"); //I've only been here a few weeks.... and my first attempts all disappeared in the drain.
};

INSTANCE Info_Mod_Brauer_Bierhexen2 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen2_Condition;
	information	= Info_Mod_Brauer_Bierhexen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have any idea how to drive the witches away?";
};

FUNC INT Info_Mod_Brauer_Bierhexen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen2_15_00"); //Do you have any idea how to drive the witches away?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_01"); //I've tried everything.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_02"); //But no one knows what they're doing with the beer, so I can hardly resist.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_03"); //I'm gonna have to try and calm her down somehow.
};

INSTANCE Info_Mod_Brauer_Bierhexen3 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen3_Condition;
	information	= Info_Mod_Brauer_Bierhexen3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you sure you're really brewing?";
};

FUNC INT Info_Mod_Brauer_Bierhexen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_00"); //Are you sure you're really brewing?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_01"); //Yeah. When I took over the store from my uncle, he gave me a detailed briefing.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_02"); //And he didn't seem to be haunted by the witches.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_03"); //All right, now you're gonna stop with the witch bullshit.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_04"); //Have you at least checked if the ingredients are OK?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_05"); //What's wrong with them? The farmer Erhard won't fool me.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_06"); //Let's have a look now.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_07"); //You can do that. But the witches will have left no trace.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_08"); //Barley, hops and yeast can be found at the top of the brewing room.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "The naive brewmaster believes that beer witches will make sure that his brew won't turn into anything else. But either the mistake is his fault, or he uses bad ingredients.");

	Wld_InsertItem	(ItMi_Hefe,	"FP_ITEM_BIERHEXEN_HEFE");
	Wld_InsertItem	(ItMi_Hopfen,	"FP_ITEM_BIERHEXEN_HOPFEN");
	Wld_InsertItem	(ItMi_Gerste,	"FP_ITEM_BIERHEXEN_GERSTE");
};

INSTANCE Info_Mod_Brauer_Bierhexen4 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen4_Condition;
	information	= Info_Mod_Brauer_Bierhexen4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Someone peed on your barley.";
};

FUNC INT Info_Mod_Brauer_Bierhexen4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen3))
	&& (Mod_Bierhexen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_00"); //Someone peed on your barley.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_01"); //(perplex) What?!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_02"); //It definitely tastes like urine.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_03"); //There's no such thing!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_04"); //And I was wondering a few days ago where the penetrating smell came from!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_05"); //That has now been resolved.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_06"); //Your beer witches pollute the barley in a very secular way.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_07"); //Yes, laugh! I can imagine how he laughs at you when he pisses on the grain before he has it brought to me!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_08"); //I'll show that son of a bitch!

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "I'm not missing this.", Info_Mod_Brauer_Bierhexen4_B);
	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "Let me do that and calm down first.", Info_Mod_Brauer_Bierhexen4_A);
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_B()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_B_15_00"); //I'm not missing this.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_B_06_01"); //Come on, let's go!

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ERHARD");

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_SUCCESS);

	Mod_Bierhexen = 2;
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_A()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_00"); //Let me do that and calm down first.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_A_06_01"); //All right, you take care of it. But just tell him my opinion!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_02"); //I'm on my way.

	Mod_Bierhexen = 3;

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "The brewer suspects Erhard of being responsible for the contaminated barley. I offered myself as an intermediary.");

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);
};

INSTANCE Info_Mod_Brauer_Bierhexen5 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen5_Condition;
	information	= Info_Mod_Brauer_Bierhexen5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Where can I find Erhard?";
};

FUNC INT Info_Mod_Brauer_Bierhexen5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen4))
	&& (Mod_Bierhexen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen5_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen5_15_00"); //Where can I find Erhard?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_01"); //If you walk from the city towards the pass to Khorinis, turn left before the cave and walk along the mountain face.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_02"); //Then you can't miss his farm.
};

INSTANCE Info_Mod_Brauer_Bierhexen6 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen6_Condition;
	information	= Info_Mod_Brauer_Bierhexen6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Leonhard is the one we're looking for.";
};

FUNC INT Info_Mod_Brauer_Bierhexen6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen6_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_00"); //Leonhard is the one we're looking for.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_01"); //Yes? That bastard! What's he thinking?!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_02"); //The question is, what do we have in mind to get back at him?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_03"); //Anselm at least won't care, I've noticed so much in my short time here.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_04"); //It's worth a try. Without his consent, it would be difficult to punish Leonhard.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_05"); //I'll give you the first chance. Remarkable what you've already figured out.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_06"); //You seem to be good with people.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_07"); //Possible.

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "I'm supposed to get Anselm to punish Leonhard.");
};

INSTANCE Info_Mod_Brauer_Bierhexen7 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen7_Condition;
	information	= Info_Mod_Brauer_Bierhexen7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_Bierhexen7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen7_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_00"); //Leonhard has just brought the first load of barley.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_01"); //I don't even want to know how you did it.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_02"); //Anyway, I'm indebted to you. From now on, hopefully I'll succeed.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_03"); //Unless the beer witches strike again.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_04"); //The guard Adanos!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_05"); //Just kidding.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_06"); //If you drop by, I'll buy you a stein every day.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_07"); //Thanks for the offer.
};

INSTANCE Info_Mod_Brauer_Bierhexen8 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen8_Condition;
	information	= Info_Mod_Brauer_Bierhexen8_Info;
	permanent	= 1;
	important	= 0;
	description	= "Do you have a beer for me?";
};

FUNC INT Info_Mod_Brauer_Bierhexen8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen8_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen8_15_00"); //Do you have a beer for me?

	if (Mod_Bierhexen_Tag < Wld_GetDay())
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_01"); //This is on the house!

		B_GiveInvItems	(self, hero, ItFo_Beer_Khorata, 1);

		Mod_Bierhexen_Tag = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_02"); //Not any more today. Come back tomorrow.
	};
};

INSTANCE Info_Mod_Brauer_August (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August_Condition;
	information	= Info_Mod_Brauer_August_Info;
	permanent	= 0;
	important	= 0;
	trade		= 1;
	description	= "Do you know dark beer?";
};

FUNC INT Info_Mod_Brauer_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_00"); //Do you know dark beer?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_01"); //Of course it is. My own new creation. Extra strong. I'll even sell some.
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_02"); //Can I have a taste?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_03"); //Certainly. It's the best publicity. Here.

	B_GiveInvItems	(self, hero, ItFo_Dunkelbier, 1);

	B_UseItem	(hero, ItFo_Dunkelbier);

	AI_Output(hero, self, "Info_Mod_Brauer_August_15_04"); //Not bad. I want to take one with me.
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_05"); //Please, help yourself.

	CreateInvItems	(self, ItFo_Dunkelbier, 20);

	B_GiveTradeInv (self);
};

INSTANCE Info_Mod_Brauer_August02 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August02_Condition;
	information	= Info_Mod_Brauer_August02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August02_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_00"); //Oh, yeah. Do you have some time?
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_01"); //Actually, I don't. What's this about?
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_02"); //I'm out of hops. Erhard doesn't deliver.
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_03"); //All right, then. I'll have a look.
};

INSTANCE Info_Mod_Brauer_August03 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August03_Condition;
	information	= Info_Mod_Brauer_August03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August02))
	&& (Npc_HasItems(hero, ItMi_Hopfensack) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August03_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_00"); //Oh, there you are. The landlord already has an order. I have to heat the boiler.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_01"); //Here's the hops. You owe Erhard 150 gold.

	B_GiveInvItems	(hero, self, ItMi_Hopfensack, 3);

	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_02"); //All right, all right. He'll get the money for the wheat anyway.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_03"); //Whatever you say...

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brauer_Trade (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Trade_Condition;
	information	= Info_Mod_Brauer_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brauer_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brauer_Pickpocket (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Pickpocket_Condition;
	information	= Info_Mod_Brauer_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Brauer_Pickpocket_Condition()
{
	C_Beklauen	(105, ItFo_Beer_Khorata, 4);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_BACK, Info_Mod_Brauer_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brauer_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brauer_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brauer_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brauer_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brauer_EXIT (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_EXIT_Condition;
	information	= Info_Mod_Brauer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brauer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
