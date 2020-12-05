INSTANCE Info_Mod_Samuel_Hi (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Hi_Condition;
	information	= Info_Mod_Samuel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Samuel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_01"); //I'm Samuel. Take a good sip of grog.
	
	B_GiveInvItems	(self, hero, ItFo_Addon_Grog, 1);

	B_UseItem	(hero, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_02"); //If you want more, go to Skip, I usually take my stuff to him. I don't have much, but if you want, I can sell you something.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Samuel's got some grog he could sell me.");
};

INSTANCE Info_Mod_Samuel_Auftrag (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Auftrag_Condition;
	information	= Info_Mod_Samuel_Auftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg sends me";
};

FUNC INT Info_Mod_Samuel_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Auftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_00"); //Greg sent me. I'm supposed to make myself useful because he wants to set sail.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_01"); //Very well, I need someone to get me the ingredients for a decent rum.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_02"); //Bring me 10 glasses of molasses and 20 bottles of water.
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_03"); //Lasse?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_04"); //Molasses! Something like honey.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_05"); //That's a decent one, I tell you!
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_06"); //And where do I get molasses from?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_07"); //From the city. Either at the market or in the harbour district.

	Log_CreateTopic	(TOPIC_MOD_SAMUEL_RUM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "I'm supposed to get 10 glasses of molasses and 20 bottles of water for Samuel in the city of Khorini.");
};

INSTANCE Info_Mod_Samuel_HabZeug (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_HabZeug_Condition;
	information	= Info_Mod_Samuel_HabZeug_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the stuff.";
};

FUNC INT Info_Mod_Samuel_HabZeug_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (Npc_HasItems(hero, ItFo_Water) > 19)
	&& (Npc_HasItems(hero, ItFo_Melasse) > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_HabZeug_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_HabZeug_15_00"); //I got the stuff.

	Npc_RemoveInvItems	(hero, ItFo_Water, 20);
	Npc_RemoveInvItems	(hero, ItFo_Melasse, 20);

	B_ShowGivenThings	("20 water and 20 molasses added");

	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_01"); //Well, then we've secured our rum supply.
	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_02"); //Here's your gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_GivePlayerXP	(200);

	Mod_PiratenVorbereitungen += 1;

	B_Göttergefallen(2, 1);

	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "I helped Samuel secure the rum supply.");
};

INSTANCE Info_Mod_Samuel_SkipFleisch (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch_Condition;
	information	= Info_Mod_Samuel_SkipFleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello! Got a pile of meat here.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_00"); //Hello! Got a pile of meat here. I want you to salt it. And hurry up.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 30);

	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_01"); //Salting? Trying to run out of Greg?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_02"); //Certainly. He has a treasure map....
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_03"); //This is something new. Tomorrow the meat will be ready.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Samuel will have the meat ready tomorrow. I should take care of the others as long as...");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch2_Condition;
	information	= Info_Mod_Samuel_SkipFleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you finished?";
};

FUNC INT Info_Mod_Samuel_SkipFleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_00"); //Are you finished?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_01"); //Unfortunately not. I'm out of salt.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_02"); //And where do you get new ones?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_03"); //That's the problem. I used to hit it in the back of the cave.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_04"); //But there's been minecrawlers nesting in there lately. Nobody's gonna get me in there anymore.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_05"); //Then I guess I'll have to take care of the salt.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_06"); //That's how it is. I need at least three chunks.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_07"); //Always on the little ones...

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Unfortunately, Samuel is not finished with the meat, because he ran out of salt. In the cave at the northern beach is a salt vein, but there are some minecrawlers there recently. But I don't have a choice...");

	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(MinecrawlerWarrior,	"ADW_PIRATECAMP_CAVE3_04");
};

INSTANCE Info_Mod_Samuel_SkipFleisch3 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch3_Condition;
	information	= Info_Mod_Samuel_SkipFleisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your salt.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch2))
	&& (Npc_HasItems(hero, ItMi_Salznugget) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_00"); //Here's your salt.

	B_GiveInvItems	(hero, self, ItMi_Salznugget, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_01"); //You'd have the few crawlers yourself...
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_02"); //What are you thinking about? I'm a scholar, not a butcher.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_03"); //All right, then. When can I...
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_04"); //The meat must ripen overnight.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_05"); //Tomorrow, then?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_06"); //Exactly.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Tomorrow the meat should be ready.");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch4 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch4_Condition;
	information	= Info_Mod_Samuel_SkipFleisch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Samuel_SkipFleisch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch3))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_00"); //You're just in time. The meat's ready.

	B_GiveInvItems	(self, hero, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_01"); //So I can get it to Skip?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_02"); //Yeah. Tell him to lay it out or hang it for drying.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_03"); //All right, I will.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "I got the salted meat. Now to Skip...");
};

INSTANCE Info_Mod_Samuel_Kompass (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Kompass_Condition;
	information	= Info_Mod_Samuel_Kompass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg thinks you got some ice rolls. Can I have that?";
};

FUNC INT Info_Mod_Samuel_Kompass_Condition()
{
	if (Mod_VorbereitungenFertig == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Kompass_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_00"); //Greg thinks you got some ice rolls. Can I have that?
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_01"); //Hm... Ungern. I need ice cream for my potions sometimes.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_02"); //AndSkip comes often and gets some. He thinks rum on ice tastes better than rum on the rocks.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_03"); //I gotta get over to the other beach, there's probably fire monitors. I could use the castors.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_04"); //I'll get you some later. I promise.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_05"); //Very well. Here are three of them.

	B_GiveInvItems	(self, hero, ItSc_IceCube, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_06"); //Thanks.
};

INSTANCE Info_Mod_Samuel_SkipToDead (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipToDead_Condition;
	information	= Info_Mod_Samuel_SkipToDead_Info;
	permanent	= 0;
	important	= 0;
	description	= "Samuel, I really need you to help me.";
};

FUNC INT Info_Mod_Samuel_SkipToDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipToDead_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_00"); //Samuel, I really need you to help me.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_01"); //What's going on?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_02"); //Skip was badly wounded during the big fight and will surely die soon without the right medicine.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_03"); //What's the matter with him?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_04"); //He was hit by a fireball.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_05"); //Da gibt es tatsächlich einen Trank dagegen. Er nennt sich "Adano's blessing".
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_06"); //In the old writings here in Jharkendar I once found the recipe for it.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_07"); //Can you give me this potion?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_08"); //Unfortunately, I could never brew it because I didn't have the ingredients.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_09"); //What ingredients do you need?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_10"); //All in all, there are three important things I need.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_11"); //Which ones are these?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_12"); //First, I need a rune of light wound healing. A piece of the rune stone is necessary for the effect of the potion.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_13"); //Where can I find such a rune?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_14"); //Ask that Myxir, maybe he's got one.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_15"); //What else do you need?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_16"); //Second, I need a troll cherry.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_17"); //Where can I get a troll cherry?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_18"); //There should be a troll hanging around the southern beach. You can find such fruits in the droppings of the trolls.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_19"); //And the last one?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_20"); //A few herbs are missing. One Kronstöckl, four medicinal plants and five nettles.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_21"); //You'll find them everywhere, except at the Kronstöckl you have to look for something.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_22"); //All right, I'll be on my way right away.

	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel knows the recipe for a healing potion that can save Skip, but the list of ingredients is long. Besides a rune of light wound healing, which I can get with a bit of luck at Myxir, I also need a troll cherry, which is supposed to be found in the droppings of trolls, a crown stick, four medicinal plants and five nettles. A troll is said to be near the southern beach, the rest I have to look for.");

	B_TeachPlayerTalentAlchemy (self, hero, POTION_AdanosWohltat);

	Wld_InsertNpc	(Troll, "FP_ROAM_LONEBEACH_11");

	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_01");
	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_02");
	Wld_InsertItem	(ItPl_Perm_Herb, "FP_ITEM_KRONSTOECKL_01");
};

INSTANCE Info_Mod_Samuel_AdanosWohltat (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have all the things.";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipToDead))
	&& (Npc_HasItems(hero, ItRu_LightHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Trollkirsche) >= 1)
	&& (Npc_HasItems(hero, ItPl_Perm_Herb) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 4)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_00"); //I found all the things you need.

	B_ShowGivenThings	("items given");

	Npc_RemoveInvItems	(hero, ItRu_LightHeal, 1);
	Npc_RemoveInvItems	(hero, ItPl_Trollkirsche, 1);
	Npc_RemoveInvItems	(hero, ItPl_Perm_Herb, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 4);

	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat_14_01"); //Very good. Very good. I'll have the potion ready by tomorrow. I'll be back.
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_02"); //Okay.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "I brought the ingredients to Samuel. He'll have the potion ready by tomorrow.");

	Mod_SamuelSkipsTrank = Wld_GetDay();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Samuel_AdanosWohltat2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat2_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat2_Info;
	permanent	= 0;
	important	= 0;
	description	= "And?";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_AdanosWohltat))
	&& (Wld_GetDay() > Mod_SamuelSkipsTrank)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_00"); //And?
	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat2_14_01"); //It took a long time, but here's the potion. Take him to Skip immediately.

	B_GiveInvItems	(self, hero, ItPo_AdanosWohltat, 1);

	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_02"); //Understood.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel gave me the potion. Now I should get to Skip.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Samuel_Trade (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Trade_Condition;
	information	= Info_Mod_Samuel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Samuel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Samuel_Pickpocket (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Pickpocket_Condition;
	information	= Info_Mod_Samuel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Samuel_Pickpocket_Condition()
{
	C_Beklauen	(84, ItFo_Addon_Rum, 19);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_BACK, Info_Mod_Samuel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Samuel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Samuel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Samuel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Samuel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Samuel_EXIT (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_EXIT_Condition;
	information	= Info_Mod_Samuel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Samuel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
