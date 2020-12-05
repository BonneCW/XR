INSTANCE Info_Mod_Orlan_Hi (C_INFO)
{	
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Hi_Condition;
	information	= Info_Mod_Orlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Orlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Orlan_Hi_32_01"); //Welcome to my tavern, stranger.
	AI_Output(self, hero, "Info_Mod_Orlan_Hi_32_02"); //What can I do for you? Do you need a drink? Or are you looking for a bed for the night?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OHNELAGER, "Orlan can sell me a drink and rent me a room.");
};

INSTANCE Info_Mod_Orlan_DunklerPilger (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_DunklerPilger_Condition;
	information	= Info_Mod_Orlan_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have there been any strange events or apparitions here recently?";
};

FUNC INT Info_Mod_Orlan_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_00"); //Have there been any strange events or apparitions here recently?
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_01"); //Strange apparitions? Hmm, let me think. Yes, Rukhar has seen a dark walker pass here a few hours ago.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_02"); //(laughs) Must have frightened the old drunk, as excited as he told us about him.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_03"); //Oh, and then - I'm not quite sure - I also have the impression that for a few hours now there's always a miserable groaning coming out of the burial cave in front of the tavern.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_04"); //That's a little scary even for me. Quite strange things have been happening lately....
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_05"); //Where did the hiker go?
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_06"); //Rukhar said he had come from the direction of Akil's farm and had steered his steps further towards the lake.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_07"); //Probably wanted to go to the big farm, or Sekob's yard, or also to the merchant who lives in the hut at the lake....
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_08"); //Thanks for the information.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_09"); //No problem. If you need a good room for an overnight stay or if you feel like a cool beer, you know where to find everything.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "As I learned from Orlan, the dark figure went on towards the lake.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orlan_Untier (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Untier_Condition;
	information	= Info_Mod_Orlan_Untier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Untier_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_00"); //Ohh, that Rukhar...
	AI_Output(hero, self, "Info_Mod_Orlan_Untier_15_01"); //What's the matter with him?
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_02"); //Only then does he panic because of this pilgrim who has walked away, claiming that he is evil in human form.... and now he wants to have seen a metre-high beast pass by here on a bright day in the direction of Akil.
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_03"); //Well, his mind seems to be going downhill... I'm starting to get worried about him.

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Rukhar saw the beast running towards Akil's court.");
};

INSTANCE Info_Mod_Orlan_Daemonisch (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch_Condition;
	information	= Info_Mod_Orlan_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_00"); //May I offer you something? Monastery wine, for example, is on offer...
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_01"); //Maybe later. Wanted to find out first if there's been anything unusual lately?

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_02"); //Great, now I can't get rid of the monastery wine.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_03"); //(again to the hero) Well, unusual.... a death. Rukhar got hit.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_04"); //What has happened?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_05"); //Well, he probably just drank himself to death... at least with the blessing of Inno.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_06"); //What do you mean?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_07"); //Well, one bottle of wine after the other he drank, including many monastery wines.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_08"); //In the late evening he accompanied some people from the surrounding area who wanted to show others a cave or something like that...
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_09"); //After about ten minutes, he came running into the tavern and stuttered a little bit of black shadows and screaming screams.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_10"); //After a short time, however, the others returned completely unharmed.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_11"); //I sent him to sleep and some of his companions took care of him.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_12"); //And the next morning he was dead.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_13"); //What, just dead?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_14"); //Well, even with the strange pilgrim Rukhar already had delusional fears.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_15"); //Has gone unnoticeably bit by bit down with him.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_16"); //And what kind of people accompanied him?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_17"); //Oh, farmers and citizens from the city I never knew before.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_18"); //Two novices of the monastery were also present, I think.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_19"); //Has become quite a heavy passenger traffic in some days lately.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_20"); //But nobody wants the monastery wine any more.... after Rukhar's fate.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_21"); //Well, at least now a lot of people are eating like barnyard threshers at my place, even novices. There's a lot coming back in there.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_22"); //It's amazing why they all seem so emaciated anyway...

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "I learned from Orlan that Rukhar died. He had accompanied some citizens, peasants and novices, many of whom have recently come to the tavern, out in the evening - in a cave or something - and had drunk a lot of monastery wine before. He came back screaming alone and ran back screaming and reported something about black shadows and screams, his companions came later. The next morning he was dead. Orlan also told us that hardly anyone drinks more monastery wine, but an astonishing amount of food is eaten. Nevertheless, many of the visitors seem very emaciated....");
};

INSTANCE Info_Mod_Orlan_Daemonisch2 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch2_Condition;
	information	= Info_Mod_Orlan_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	&& (Mod_HQ_Daemonisch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch2_32_00"); //Ohh, probably all the guests will be back soon.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch2_32_01"); //I should start slowly to go up to the beer barrel....

	MOBNAME_XR_BIERFASS_ORLAN = "beer barrel";
};

INSTANCE Info_Mod_Orlan_Daemonisch3 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch3_Condition;
	information	= Info_Mod_Orlan_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch3_Condition()
{
	if (Mod_HQ_Daemonisch_Orlan == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch3_32_00"); //What about Innos...?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orlan_Daemonisch4 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch4_Condition;
	information	= Info_Mod_Orlan_Daemonisch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_BauerBeiOrlan_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch4_32_00"); //Great, that's where she's going, my clientele.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "There you go, Orlan's tavern.");
};

INSTANCE Info_Mod_Orlan_Unheil (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Unheil_Condition;
	information	= Info_Mod_Orlan_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you noticed anything unusual in the last few hours?";
};

FUNC INT Info_Mod_Orlan_Unheil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Mod_WM_Boeden == 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Unheil_15_00"); //Have you noticed anything unusual in the last few hours?
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_01"); //What?! Are you serious about this question? I don't think there's a good time for jokes now.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_02"); //The dead rise from their graves, right behind my tavern, among them a dreadful creature, big as a tree.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_03"); //On the pasture plateau there are even monsters that can almost compete with a mountain, surrounded by many terrible creatures.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_04"); //Ask the disturbed pardon of Bengar's court - the only one from there who was able to escape the disaster.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Tremendous dimensions on the pasture plateau. This should interest Saturas.");
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hordes of undead seem to be led by their predecessors.");

	Mod_WM_SawBigOne = TRUE;
	Mod_WM_SawGraveOne = TRUE;
};

INSTANCE Info_Mod_Orlan_Pedro (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Pedro_Condition;
	information	= Info_Mod_Orlan_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Did a novice come in here?";
};

FUNC INT Info_Mod_Orlan_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Pedro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Pedro_15_00"); //
	AI_Output(self, hero, "Info_Mod_Orlan_Pedro_32_01"); //
	AI_Output(hero, self, "Info_Mod_Orlan_Pedro_15_02"); //
	AI_Output(self, hero, "Info_Mod_Orlan_Pedro_32_03"); //

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Orlan says Pedro didn't come to the tavern. I should have a serious talk with Dragomir.");
};

INSTANCE Info_Mod_Orlan_Kobold (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Kobold_Condition;
	information	= Info_Mod_Orlan_Kobold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Kobold_Condition()
{
	if (Mod_NL_Siegelbuch == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Kobold_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_00"); //You're lucky we found you before the whole horde of demonic beings passed by.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_01"); //How...? what has happened?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_02"); //I don't know exactly. I just saw you lying dead on the ground, lifeless, and a little demon rummaging through your pockets for gold. We scared him away and got you in.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_03"); //A short time later the chaos was already raging outside and we had to hide in the tavern....
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_04"); //What, how much time has passed since then?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_05"); //Well, a good day.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_06"); //Then I should get going again. You're fine with everything else in the tavern?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_07"); //Yeah, by itself. Unfortunately, I left the window to my storeroom upstairs open.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_08"); //My whole liquor's gone! One of those damned dwarf demons must have got in and stole it from me. Dirty thieves!
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_09"); //(again calm) Oh, oh... meanwhile they seem to have scattered the demons and giant lizards in the surrounding area.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_10"); //Be careful, however, when you venture outside.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_11"); //I see. Here you have some gold coins to thank me for saving my life.... Damn, the demon really didn't let me down much.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, Npc_HasItems(hero, ItMi_Gold));
	};

	Wld_InsertItem	(ItMi_KoboldGold, "FP_ITEM_KOBOLDGOLD");

	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_12"); //Thanks. And take good care of yourself.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Damn this demon was quick... and stole my gold too. For a whole day I lay unconscious with Orlan and the monsters have spread to the area. Orlan complained about the loss of his booze reserves...");

	// Münzenspur

	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_01");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_02");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_03");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_04");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_05");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_06");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_07");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_08");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_09");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_10");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_11");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_12");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_13");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_14");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_15");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_16");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_17");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_18");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_19");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_20");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_21");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_22");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_23");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_24");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_25");
};

INSTANCE Info_Mod_Orlan_Gorax (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Gorax_Condition;
	information	= Info_Mod_Orlan_Gorax_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorax sent me.";
};

FUNC INT Info_Mod_Orlan_Gorax_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Myxir_Wein))
	&& (Npc_HasItems(hero, ItFo_KWine) == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Gorax_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Gorax_15_00"); //Gorax sent me. He gave me this wine for you.

	B_GiveInvItems	(hero, self, ItFo_KWine, 10);

	AI_Output(self, hero, "Info_Mod_Orlan_Gorax_32_01"); //Wonderful. The monastery wine is the best you can get here in the area.
	AI_Output(self, hero, "Info_Mod_Orlan_Gorax_32_02"); //Here's the gold for Gorax.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	Npc_RemoveInvItems	(self, ItFo_KWine, 10);

	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_FAILED);
};

INSTANCE Info_Mod_Orlan_Zauberwasser (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Zauberwasser_Condition;
	information	= Info_Mod_Orlan_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've got a shipment of magic water.";
};

FUNC INT Info_Mod_Orlan_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Zauberwasser_15_00"); //I've got a shipment of magic water.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Orlan_Zauberwasser_32_01"); //It's about time.
};

INSTANCE Info_Mod_Orlan_GnomSchnaps (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_GnomSchnaps_Condition;
	information	= Info_Mod_Orlan_GnomSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "I saved part of your liquor.";
};

FUNC INT Info_Mod_Orlan_GnomSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gnom_Joints))
	&& (Npc_HasItems(hero, ItMi_OrlansSchnaps) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_GnomSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_GnomSchnaps_15_00"); //I saved part of your liquor.

	B_GiveInvItems	(hero, self, ItMi_OrlansSchnaps, 1);

	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_01"); //What, not possible, you're kidding me... As a matter of fact...
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_02"); //How did you manage to snatch my good liquor from these monsters?
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_03"); //What have you done with the culprits?
	AI_Output(hero, self, "Info_Mod_Orlan_GnomSchnaps_15_04"); //Oh, the thief's served properly for now.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_05"); //You must be the greatest warrior of all time.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_06"); //It's an honor to have you here with me.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_07"); //With you on Khorinis, I'm sure we'll soon be masters of this problem.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Orlan_Zimmer (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Zimmer_Condition;
	information	= Info_Mod_Orlan_Zimmer_Info;
	permanent	= 0;
	important	= 0;
	description	= "How much does a room cost?";
};

FUNC INT Info_Mod_Orlan_Zimmer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Zimmer_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Zimmer_15_00"); //How much does a room cost?
	AI_Output(self, hero, "Info_Mod_Orlan_Zimmer_32_01"); //100 gold coins.
};

INSTANCE Info_Mod_Orlan_ZimmerMieten (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_ZimmerMieten_Condition;
	information	= Info_Mod_Orlan_ZimmerMieten_Info;
	permanent	= 1;
	important	= 0;
	description	= "Give me a room (100 gold)";
};

FUNC INT Info_Mod_Orlan_ZimmerMieten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Zimmer))
	&& (Npc_HasItems(hero, ITKE_ORLAN_HOTELZIMMER) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_ZimmerMieten_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_ZimmerMieten_15_00"); //Give me a room.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);

		AI_Output(self, hero, "Info_Mod_Orlan_ZimmerMieten_32_01"); //Here's a key. You can choose your room.

		B_GiveInvItems	(self, hero, ItKe_Orlan_Hotelzimmer, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Orlan_ZimmerMieten_32_02"); //Come back when you have enough gold.
	};
};

INSTANCE Info_Mod_Orlan_Trade (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Trade_Condition;
	information	= Info_Mod_Orlan_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Orlan_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Orlan_Pickpocket (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Pickpocket_Condition;
	information	= Info_Mod_Orlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Orlan_Pickpocket_Condition()
{
	C_Beklauen	(63, ItFo_Wine, 5);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_BACK, Info_Mod_Orlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Orlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Orlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Orlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Orlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Orlan_EXIT (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_EXIT_Condition;
	information	= Info_Mod_Orlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Orlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orlan_EXIT_Info()
{
	if (Npc_HasItems(hero, ItKe_Orlan_Hotelzimmer) == 1)
	&& (Mod_Orlan_Bett == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orlan_EXIT_32_00"); //Have a good night.

		Mod_Orlan_Bett = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Orlan_EXIT_32_01"); //Teach me again soon.
	};

	AI_StopProcessInfos	(self);
};
