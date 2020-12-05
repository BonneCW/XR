INSTANCE Info_Mod_Skip_Hi (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Hi_Condition;
	information	= Info_Mod_Skip_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Skip_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_01"); //I'm Skip.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_02"); //If you need any merchandise, you can come to me.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_03"); //Weapons are only available at Garrett's.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Skip deals in anything but guns.");
};

INSTANCE Info_Mod_Skip_Malcom (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Malcom_Condition;
	information	= Info_Mod_Skip_Malcom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Then you can make sure the Malcom gets food outside.";
};

FUNC INT Info_Mod_Skip_Malcom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Malcom_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_00"); //Then you can make sure the Malcom gets food outside.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_01"); //I'll make sure he gets something. After all, he's one of the busiest in the camp.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_02"); //Most of them just bum around here anyway. Are you trying to...?
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_03"); //Sorry about that. I want to be a pirate too, and I have to take care of my recording.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_04"); //I think you'll have a lot of work to do. Don't let me stop you.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_05"); //I can handle it.

	B_GivePlayerXP	(50);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_MALCOM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skip_Francis (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Francis_Condition;
	information	= Info_Mod_Skip_Francis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Francis sent me.";
};

FUNC INT Info_Mod_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Francis_Entertrupp))
	&& (Mod_InEntertrupp == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Francis_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_00"); //Ahoy, landlubber. Is it true that there is a way to Khorinis? Henry talks like that.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_01"); //Yeah, it'll be over in a jiffy.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_02"); //That's a good thing. It always takes me half a day on the boat.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_03"); //And only if the wind is favourable.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_04"); //Francis told me you're not trading with his guard any more.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_05"); //The Klabautermann! Those bastards burned my paddles. Too lazy to get firewood.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_06"); //And I can't go without a paddle. What am I supposed to do when there's no wind, eh?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_07"); //Is there any way I can make it up to you?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_08"); //You could take over the delivery, then I'd deal with Francis and his boys again.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_09"); //All right, what should I do?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_10"); //Take this package of rum to Khorinis. The innkeeper in the pub of the harbour district is already waiting for it.

	B_GiveInvItems	(self, hero, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_11"); //You take this package Grog to one of the mercenaries stationed on Onar's farm.
	
	B_GiveInvItems	(self, hero, Mod_GrogPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_12"); //And take this package of different things to Lehmar, the money lender.

	B_GiveInvItems	(self, hero, Mod_KleinodPaket, 1);

	if (Assassinen_Dabei)
	{
		AI_Output(hero, self, "Info_Mod_Skip_Francis_15_13"); //I won't be able to bring Lehmar, he's dead.
		AI_Output(self, hero, "Info_Mod_Skip_Francis_08_14"); //Then figure out a way to get his gold.
	};

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_15"); //You bring me 1,500 pieces of gold back, which people pay more, it's yours.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_16"); //You know all these people?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_17"); //Certainly. I've been to Khorinis regularly by boat. Disguised, of course.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_18"); //There's nothing here but meat and water.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_19"); //And your booze....
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_20"); //Also provided. Or do you see a sugarcane field or a potato field around here somewhere?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_21"); //You're right.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_08_22"); //I'm as good as back again.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_23"); //Wait a minute! Maybe you can get me some new paddles downtown.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_24"); //Want to see what I can do.

	Log_CreateTopic	(TOPIC_MOD_SKIP_PADDEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_FRANCIS_ENTERTRUPP, TOPIC_MOD_SKIP_PADDEL, "I'm supposed to deliver some things for Skip: a package of rum for the landlord in the harbour district of Khorinis, a package full of grog for one of the mercenaries on Onar's farm and a package of all kinds of stuff for Lehmar, the money lender.", "I'm supposed to get Skip new paddles. Hm... who could have that? Someone in the harbour... Oh, and 1500 gold too.");
};

INSTANCE Info_Mod_Skip_Geld (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Geld_Condition;
	information	= Info_Mod_Skip_Geld_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the gold.";
};

FUNC INT Info_Mod_Skip_Geld_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1500)
	&& (Npc_HasItems(hero, ItMi_Paddel) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Geld_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_00"); //Here's the gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1500);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_01"); //Very good, kid! So the quarrel with Francis is forgotten.
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_02"); //And you have the paddles, too.

	B_GiveInvItems	(hero, self, ItMi_Paddel, 2);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_03"); //Then I can put out to sea again. What do I owe you?
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_04"); //I paid 200 for it. And you could take me to your ship sometime...
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_05"); //Hmm. You'll have to ask the captain. Here's your gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry	(TOPIC_MOD_FRANCIS_ENTERTRUPP, "Skip is satisfied and will now trade again with Francis and his entrapper.");
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_Schatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzsuche_Condition;
	information	= Info_Mod_Skip_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg sent me.";
};

FUNC INT Info_Mod_Skip_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_00"); //Greg sent me. He's about to expire. Can I help you with something?
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_01"); //Yes, our meat supplies are running low.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_02"); //Bring me 30 pieces of raw meat, bites or rats.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_03"); //No Razorfleisch. It's tough and hard to cure.
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_04"); //I'm on my way.

	Log_CreateTopic	(TOPIC_MOD_SKIP_VORRÄTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "I'm supposed to bring Skip 30 pieces of raw meat.");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36A");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_33");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_30");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_29");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_07");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_70");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_04");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_06");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_57");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_59");
	
	// Canyonziegen

	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");
	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");
	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_110");
};

INSTANCE Info_Mod_Skip_Fleisch (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch_Condition;
	information	= Info_Mod_Skip_Fleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here, I got your meat.";
};

FUNC INT Info_Mod_Skip_Fleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Schatzsuche))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_00"); //Here, I got your meat.
	AI_Output(self, hero, "Info_Mod_Skip_Fleisch_08_01"); //Take it to Samuel. Tell him to pick it up. And hurry up.
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_02"); //I'm doing it.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Now I shall take the flesh to Samuel, who shall salt it.");
};

INSTANCE Info_Mod_Skip_Fleisch2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch2_Condition;
	information	= Info_Mod_Skip_Fleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your provisions. I told you to let it dry.";
};

FUNC INT Info_Mod_Skip_Fleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_Poekelfleisch_Skip) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch2_15_00"); //Here's your provisions. Thou shalt leave it to dry

	B_GiveInvItems	(hero, self, ItFo_Poekelfleisch_Skip, 30);

	Npc_RemoveInvItems	(self, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(self, hero, "Info_Mod_Skip_Fleisch2_08_01"); //All right, all right. I know about that.

	Mod_PiratenVorbereitungen += 1;

	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "I got some supplies for Skip.");

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_AllesFertig (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AllesFertig_Condition;
	information	= Info_Mod_Skip_AllesFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg wants to know if everything's on board.";
};

FUNC INT Info_Mod_Skip_AllesFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Saebel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AllesFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_AllesFertig_15_00"); //Greg wants to know if everything's on board.
	AI_Output(self, hero, "Info_Mod_Skip_AllesFertig_08_01"); //I think so, yes. Except for the crew.
};

INSTANCE Info_Mod_Skip_AufbruchSchatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AufbruchSchatzsuche_Condition;
	information	= Info_Mod_Skip_AufbruchSchatzsuche_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_AufbruchSchatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Kompass))
	&& (Kapitel >= 4)
	&& (Mod_Piraten_Aufbruch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AufbruchSchatzsuche_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_AufbruchSchatzsuche_08_00"); //We're waiting for you. The others are already on board.

	AI_StopProcessInfos	(self);

	Mod_VorbereitungenFertig = 5;
	
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skip_Schatzaufteilung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzaufteilung_Condition;
	information	= Info_Mod_Skip_Schatzaufteilung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_Schatzaufteilung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_ZumSchiff_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzaufteilung_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Schatzaufteilung_08_00"); //Hey, you woke up. Greg's expecting you, go to him!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW,	"START");
	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW,	"START");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW,	"START");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW,	"START");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW,	"START");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW,	"START");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW,	"START");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW,	"START");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW,	"START");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW,	"START");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW,	"START");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW,	"START");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW,	"START");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW,	"START");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW,	"START");
};

INSTANCE Info_Mod_Skip_Befreiung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung_Condition;
	information	= Info_Mod_Skip_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Everything all right?";
};

FUNC INT Info_Mod_Skip_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_00"); //Are you all right?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_01"); //(groans) No. When I came to Kamf, I was struck by a fireball, which caused a terrible flesh wound. I don't know how much longer I can hold out.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_02"); //How can I help you?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_03"); //Go to Samuel. He might be able to help.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_04"); //All right, I'll be quick.

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRSKIP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Skip is lying heavily wounded in his hut. A fireball hit him during the fight. Now I'm supposed to go see Samuel and see if he can help.");
};

INSTANCE Info_Mod_Skip_Befreiung2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung2_Condition;
	information	= Info_Mod_Skip_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Drink this.";
};

FUNC INT Info_Mod_Skip_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	&& (Npc_HasItems(hero, ItPo_AdanosWohltat) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_00"); //Drink this. This potion will help you.

	B_GiveInvItems	(hero, self, ItPo_AdanosWohltat, 1);
	B_UseItem	(self, ItPo_AdanosWohltat);

	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_01"); //Thanks. This stuff really helped me out.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_02"); //So you're back in shape?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_03"); //Yeah, never felt better. Take that as a token of my gratitude.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_04"); //Thanks. I'll be going, then.
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_05"); //See you around.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRESTART");

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRSKIP, TOPIC_MOD_BEL_PIRATENLAGER, "Skip is fit again thanks to the potion.", "Skip is fit again.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_SUCCESS);

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(450);
};

INSTANCE Info_Mod_Skip_Sumpfmensch (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Sumpfmensch_Condition;
	information	= Info_Mod_Skip_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg said maybe you could help me.";
};

FUNC INT Info_Mod_Skip_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_00"); //Greg said you might be able to help me.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Sure, what's up?
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_02"); //What do you know about Darrion?
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //Darrion.... You mean the old hijacker? Not much, to be honest. Nobody knows much about him.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //As an active enterprise-leader he didn't talk much about himself and when Greg was appointed captain, the only thing you could get out of him was the last few cups every now and then, when he exaggerated with the grog again.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //He only came to me to trade.
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_04"); //Anything in particular?
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //The usual. Grog, guns, bogweed; who had a bit of a soft spot for drugs like that.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //Oh, and a few weeks before he disappeared, he bought my whole saltpetre stockpile!
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //Don't ask me what he was doing with it. I thought he was going to blow the tower up there. It never blew up, though.
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_04"); //Okay. Thanks.
	
	AI_TurnAway(hero, self);
	
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Wait! I'll think of something else.
	
	AI_TurnToNpc(hero, self);
	
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //I had to find him some smelly cheese.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //He said he needed it for a hermit who's got a cabin around here somewhere. Maybe this guy knows more about Darrion.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Skip told me that Darrion bought a lot of saltpetre and disappeared into the tower. He also needed stink cheese for the hermit. Maybe I can get away with it?");
};

INSTANCE Info_Mod_Skip_Trade (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Trade_Condition;
	information	= Info_Mod_Skip_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Skip_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Skip_Pickpocket (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Pickpocket_Condition;
	information	= Info_Mod_Skip_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Skip_Pickpocket_Condition()
{
	C_Beklauen	(100, ItFo_Addon_Grog, 3);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_BACK, Info_Mod_Skip_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Skip_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Skip_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
};

FUNC VOID Info_Mod_Skip_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Skip_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Skip_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Skip_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Skip_EXIT (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_EXIT_Condition;
	information	= Info_Mod_Skip_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Skip_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
