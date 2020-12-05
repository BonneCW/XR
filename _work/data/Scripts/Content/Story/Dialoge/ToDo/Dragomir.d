var int BerichtCounter;

INSTANCE Info_Mod_Dragomir_Hi (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Hi_Condition;
	information	= Info_Mod_Dragomir_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Dragomir_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dragomir_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Dragomir_Hi_12_01"); //Hi.
};

INSTANCE Info_Mod_Dragomir_Jagdgebiete (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Jagdgebiete_Condition;
	information	= Info_Mod_Dragomir_Jagdgebiete_Info;
	permanent	= 0;
	important	= 0;
	description	= "I've been with all the hunters.";
};

FUNC INT Info_Mod_Dragomir_Jagdgebiete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nandor_WoelfeTot))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaan_Dragomir))
	&& (Npc_KnowsInfo(hero, Info_Mod_Grom_Dragomir))
	&& (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Erzbrocken))
	&& (Npc_HasItems(hero, ItMi_Erzbrocken_Seltsam) == 1)
	&& (Npc_HasItems(hero, ItWr_NandorToDragomir) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_15_00"); //I've been with all the hunters.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_12_01"); //Well, what do they say?

	Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Nandor....", Info_Mod_Dragomir_Jagdgebiete_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "gromanthropic", Info_Mod_Dragomir_Jagdgebiete_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Grimbald....", Info_Mod_Dragomir_Jagdgebiete_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Gaan...", Info_Mod_Dragomir_Jagdgebiete_Gaan);
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Nandor()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_00"); //Nandor gave me this letter here for you.

	B_GiveInvItems	(hero, self, ItWr_NandorToDragomir, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_01"); //We also killed a group of wolves who have behaved rather abnormally.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_02"); //Let me see that.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_03"); //Hm, good. What about the wolves?
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_04"); //Nandor said her eyes looked like a dead man's. Besides, they simply behaved differently from other wolves.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_05"); //All right, thank you.

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So I see you've interviewed all the hunters, not bad. It's part of the game to walk through the woods here.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Here, take this as a reward for your efforts, it's something special.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //If you want, I'll take you into our ranks now.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "I told Dragomir about the hunters.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Grom()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grom_15_00"); //Grom is still with the mercenaries, but he has heard that the field robbers are causing the mercenaries a lot of trouble.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grom_12_01"); //Field robbers? (laughs briefly) These are annoying beasts, but fortunately quite harmless for an advanced fighter.

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So I see you've interviewed all the hunters, not bad. It's part of the game to walk through the woods here.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Here, take this as a reward for your efforts, it's something special.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //If you want, I'll take you into our ranks now.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "I told Dragomir about the hunters.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Grimbald()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_00"); //Grimbald is fascinated by the troll and has an excellent view over the valley. He found a strange piece of ore in a group of snappers who attacked the Black Troll.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_01"); //He gave it to me for you, maybe you can do something with it.

	B_GiveInvItems	(hero, self, ItMi_Erzbrocken_Seltsam, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_NandorGrom))
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_02"); //Oh, yeah. And there's something going on up in the woods.
	};

	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_12_03"); //Strange stuff, it doesn't look good to me at all. If I didn't know better, I would say that nothing good comes of this ore.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_04"); //You mean that lump of ore there is evil?
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_12_05"); //Hey, what are you laughing at? But yes, that's about the same way you could put it.... Take the lump, maybe you know someone who can find out more about it.

	B_GiveInvItems	(self, hero, ItMi_Erzbrocken_Seltsam, 1);

	Mod_JG_GrimbaldTeacher = 1;

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So I see you've interviewed all the hunters, not bad. It's part of the game to walk through the woods here.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Here, take this as a reward for your efforts, it's something special.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //If you want, I'll take you into our ranks now.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "I told Dragomir about the hunters.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Gaan()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Gaan_15_00"); //Gaan continues to watch the pass, but keeps the meadow there very suitable for hunting. He saw some snappers, too.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Gaan_12_01"); //Snapper? Nothing special around here.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Gaan_15_03"); //No, really not...

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So I see you've interviewed all the hunters, not bad. It's part of the game to walk through the woods here.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Here, take this as a reward for your efforts, it's something special.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //If you want, I'll take you into our ranks now.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "I told Dragomir about the hunters.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

INSTANCE Info_Mod_Dragomir_Aufnahme (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Aufnahme_Condition;
	information	= Info_Mod_Dragomir_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be a hunter.";
};

FUNC INT Info_Mod_Dragomir_Aufnahme_Condition()
{
	if (BerichtCounter == 4)
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Aufnahme_15_00"); //I want to be a hunter.
	AI_Output(self, hero, "Info_Mod_Dragomir_Aufnahme_12_01"); //With this, you're also a hunter.

	Mod_AnzahlNebengilden += 1;

	Jäger_Dabei = TRUE;

	Mod_DragomirsLager = Wld_GetDay();

	B_Göttergefallen(2, 2);

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry_NS	(TOPIC_MOD_NEBENGILDEN, "I'm a member of the Rangers now.");
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_62);
};

INSTANCE Info_Mod_Dragomir_ToDoChapter1 (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_ToDoChapter1_Condition;
	information	= Info_Mod_Dragomir_ToDoChapter1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have any more for me to do?";
};

FUNC INT Info_Mod_Dragomir_ToDoChapter1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	&& (Jäger_Dabei == TRUE)
	&& (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_00"); //Do you have any more for me to do?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_01"); //Yes, I would have. Probably you were a little surprised that the field robbers were so pushy with the mercenaries, weren't you?
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_02"); //Well, a little bit.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_03"); //Well, that's because we've seen their population... let's say we supported it a little bit.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_04"); //Uh-huh.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_05"); //Yes, the farmers have burned more and more forests and killed the animals to expand their fields. We just couldn't approve of that anymore.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_06"); //What did you guys do?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_07"); //Among other things, we hid field robber eggs in their nesting places and increased the herd a little bit.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_08"); //And what do I have to do with it?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_09"); //Well, I'd have a few here and the little trouble they're causing the mercenaries right now just isn't enough.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_10"); //So I'm supposed to....
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_11"); //Exactly. Here, you take this potion before you go into her nest. That way, they won't be able to distinguish you from their fellow creatures and won't attack you.

	B_GiveInvItems	(self, hero, ItPo_Feldraeubertrank, 1);

	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_12"); //Then you put this bucket full of eggs in her nest. That should still be a few hundred of the creatures that would have to hatch in the next few days.

	B_GiveInvItems	(self, hero, ItMi_Feldraeubereier, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_13"); //Uh-huh. I hope the potion works for you.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_14"); //How do you think we did it last time, huh?

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);

	Info_AddChoice	(Info_Mod_Dragomir_ToDoChapter1, "All right, I'll do it.", Info_Mod_Dragomir_ToDoChapter1_Ja);
	Info_AddChoice	(Info_Mod_Dragomir_ToDoChapter1, "I think I'd better not do it. Such a nasty stuff....", Info_Mod_Dragomir_ToDoChapter1_Nein);
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Ja()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_Ja_15_00"); //All right, I'll do it.

	Log_CreateTopic	(TOPIC_MOD_JG_BUGS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_BUGS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_BUGS, "I'm supposed to empty a bucket of field robber eggs for Dragomir in the field robber cave near Onars Hof.");

	Bug_Mission = TRUE;

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Nein()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_Nein_15_00"); //I think I'd better not do it. Such a nasty stuff....

	Npc_RemoveInvItems	(hero, ItPo_Feldraeubertrank, 1);

	Npc_RemoveInvItems	(hero, ItMi_Feldraeubereier, 1);

	B_ShowGivenThings	("Drink and bucket with field robber eggs given");

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);
};	

INSTANCE Info_Mod_Dragomir_EimerLeer (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_EimerLeer_Condition;
	information	= Info_Mod_Dragomir_EimerLeer_Info;
	permanent	= 0;
	important	= 0;
	description	= "The bucket's in her nest.";
};

FUNC INT Info_Mod_Dragomir_EimerLeer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_ToDoChapter1))
	&& (Mod_EimerAusgeleert == TRUE)
	&& (Bug_Mission == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_EimerLeer_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_EimerLeer_15_00"); //The bucket's in her nest.
	AI_Output(self, hero, "Info_Mod_Dragomir_EimerLeer_12_01"); //Very good. Very good. Here, take this as a reward.

	B_GivePlayerXP	(100);

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_SetTopicStatus	(TOPIC_MOD_JG_BUGS, LOG_SUCCESS);

	B_Göttergefallen(2, 1);
	
	Wld_InsertNpc(YGiant_Bug, "FP_STAND_WASILI_VERBANNT_02");
	Wld_InsertNpc(YGiant_Bug, "FP_STAND_NW_BIGFARM_FELDREUBER4");
	Wld_InsertNpc(YGiant_Bug, "FP_ROAM_NW_BIGFARM_FELDREUBER10");
};

INSTANCE Info_Mod_Dragomir_BurnedLager (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_BurnedLager_Condition;
	information	= Info_Mod_Dragomir_BurnedLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_BurnedLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	&& (Mod_Drago == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_12_00"); //Ah, you. Finally. I thought no one would dare to come here, except those nasty creatures from the forest. Say, can you do something for me?

	Wld_SendUntrigger	("DRAGOMIRSFEUER");
	Wld_SendUntrigger	("DRAGOMIRSMOKE");
	
	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
	
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "No, I don't have time for that now.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "What do you want me to do?", Info_Mod_Dragomir_BurnedLager_B);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "What are you guys doing in this wilderness?", Info_Mod_Dragomir_BurnedLager_A);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_C()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_C_15_00"); //Nein, dafür habe ich jetzt keine Zeit.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_C_12_01"); //Dann hinfort mit dir und stör uns nicht bei der Arbeit.		

	Mod_Drago = 3;

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_B()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_B_15_00"); //What do you want me to do?
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_B_12_01"); //All right, listen. The Rangers and Druids have a kind of rally in the Minental. Tell them how we are doing and ask them to send us reinforcements.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_B_12_02"); //Here, on the map, I marked her whereabouts for you. Come on, hurry up.

	B_GiveInvItems	(self, hero, ItWr_EremitenCamp, 1);

	Mod_Drago = 4;

	B_LogEntry	(TOPIC_MOD_JG_LAGER, "Dragomir told me that the camp was attacked by black mages and bandits. He asked me to call on the Druids and Rangers in the Minental for backup.");

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_A()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_A_15_00"); //What are you guys doing in this wilderness?
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_01"); //We had to flee here. Some black magicians attacked us, but they were also supported by bandits.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_02"); //We are lucky that they don't know this area so well, otherwise we would have been overwhelmed long ago. But it won't take them long to track us down.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_03"); //You see, the situation is serious, will you help us now?

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
	
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "No, I don't have time for that now.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "What do you want me to do?", Info_Mod_Dragomir_BurnedLager_B);
};

INSTANCE Info_Mod_Dragomir_WillQuestDoch (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WillQuestDoch_Condition;
	information	= Info_Mod_Dragomir_WillQuestDoch_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_WillQuestDoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_BurnedLager))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Drago == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WillQuestDoch_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragomir_WillQuestDoch_12_00"); //Have you decided to help us?
	
	Info_ClearChoices	(Info_Mod_Dragomir_WillQuestDoch);
	
	Info_AddChoice	(Info_Mod_Dragomir_WillQuestDoch, "No, I don't have time for that now.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_WillQuestDoch, "What do you want me to do?", Info_Mod_Dragomir_BurnedLager_B);
};

INSTANCE Info_Mod_Dragomir_HilfeII (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_HilfeII_Condition;
	information	= Info_Mod_Dragomir_HilfeII_Info;
	permanent	= 0;
	important	= 0;
	description	= "With Adanos! What was going on here?";
};

FUNC INT Info_Mod_Dragomir_HilfeII_Condition()
{
	if (Mod_JG_DragoHilfe2 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_HilfeII_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_00"); //With Adanos! What was going on here?
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_01"); //I don't know! The pack came out of the dark forest. And those weren't the first ones.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_02"); //Survived one of the enemies you can question.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_03"); //I don't think so. Nobody moves anymore.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_04"); //Hm. It has something to do with a khorgor. Apparently a mad magician. That's all we know.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_05"); //But why we hunters and rangers? We're one of the most innocuous on the island.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_06"); //We don't know for sure. But we're gonna get this Khorgor.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_07"); //Your word in Adano's ear! So what happens next?
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_08"); //I don't know about that. I'm only supposed to support you if necessary.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_09"); //I'm going back to the Minental. Got some work to do.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_10"); //Adanos with you! I'll hold the fort here.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_11"); //Who's gonna take care of Nandor and Ruga?
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_12"); //I'll bring the herb witch.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_13"); //Good. And good luck.

	B_LogEntry	(TOPIC_MOD_JG_DRAGOMIRHILFE2, "Here the fight was in full swing when I arrived. We have won with difficulty. Wild has fallen, Nandor and Ruga are hurt. I have to report to Cyrco.");

	B_StartOtherRoutine	(Mod_1937_JGR_Nandor_NW, "KO");
	B_StartOtherRoutine	(Mod_749_MIL_Ruga_NW, "KO");

	B_KillNpc	(Mod_7413_JG_Wild_NW);
	
	B_GivePlayerXP(100);
};

INSTANCE Info_Mod_Dragomir_Untier (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Untier_Condition;
	information	= Info_Mod_Dragomir_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you seen anything unusual lately?";
};

FUNC INT Info_Mod_Dragomir_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Untier_15_00"); //Have you seen anything unusual lately?
	AI_Output(self, hero, "Info_Mod_Dragomir_Untier_12_01"); //Hmm, yes, a few days ago some of these demon magicians walked around here and performed their sinister rituals.
	AI_Output(self, hero, "Info_Mod_Dragomir_Untier_12_02"); //The soil initially showed unusual changes, but....
	AI_Output(hero, self, "Info_Mod_Dragomir_Untier_15_03"); //Yeah, I've been through that.
};

INSTANCE Info_Mod_Dragomir_WhoAreYou (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WhoAreYou_Condition;
	information	= Info_Mod_Dragomir_WhoAreYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who are you?";
};

FUNC INT Info_Mod_Dragomir_WhoAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WhoAreYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WhoAreYou_15_00"); //Who are you people?
	AI_Output(self, hero, "Info_Mod_Dragomir_WhoAreYou_12_01"); //We are hunters in the woods in front of Khorinis and sell our prey mostly to the traders in the city. Here we have one of our camps.
};

INSTANCE Info_Mod_Dragomir_LohntEsSich (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_LohntEsSich_Condition;
	information	= Info_Mod_Dragomir_LohntEsSich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is the hunting here worthwhile?";
};

FUNC INT Info_Mod_Dragomir_LohntEsSich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_LohntEsSich_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_00"); //Is the hunting here worthwhile?
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_01"); //Oh, yeah. The woods here are swarming with animals. Just don't get too far into it.
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_02"); //Why not?
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_03"); //Would you consider running skeletons and crazy goblins to be huntable animals?
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_04"); //Actually, I don't.
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_05"); //There you go.
};

INSTANCE Info_Mod_Dragomir_WerBistDu (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WerBistDu_Condition;
	information	= Info_Mod_Dragomir_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "And who are you?";
};

FUNC INT Info_Mod_Dragomir_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WerBistDu_15_00"); //And who are you?
	AI_Output(self, hero, "Info_Mod_Dragomir_WerBistDu_12_01"); //My name is Dragomir and I'm the leader of this camp.
};

INSTANCE Info_Mod_Dragomir_MitmachenPre (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_MitmachenPre_Condition;
	information	= Info_Mod_Dragomir_MitmachenPre_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can I join the hunters?";
};

FUNC INT Info_Mod_Dragomir_MitmachenPre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	&& (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_MitmachenPre_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_MitmachenPre_15_00"); //Can I join the hunters?
	AI_Output(self, hero, "Info_Mod_Dragomir_MitmachenPre_12_01"); //You're still a little too weak. You ain't got nothing on your ribs yet. With us, things get rough sometimes.
	AI_Output(self, hero, "Info_Mod_Dragomir_MitmachenPre_12_02"); //Come back later.
};

INSTANCE Info_Mod_Dragomir_Bosper (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Bosper_Condition;
	information	= Info_Mod_Dragomir_Bosper_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bosper said to say hello. He needs new skins.";
};

FUNC INT Info_Mod_Dragomir_Bosper_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_OtherHunters))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Bosper_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_00"); //Bosper said to say hello. He needs new skins.
	AI_Output(self, hero, "Info_Mod_Dragomir_Bosper_12_01"); //Oh, yeah. I got a pile here. Could you--

	B_GiveInvItems	(self, hero, ItMi_Wolfsfelle, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_02"); //Deliver them? If I'm gonna do you a favor, that's fine.
	AI_Output(self, hero, "Info_Mod_Dragomir_Bosper_12_03"); //Tell him we'll settle up when I get to town.
	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_04"); //I'm on my way.

	B_LogEntry	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, "I'm supposed to bring Dragomir the Bosper's skins. I'm sure it'll bring you points for the recording.");
};

INSTANCE Info_Mod_Dragomir_AllesKlar (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_AllesKlar_Condition;
	information	= Info_Mod_Dragomir_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you gonna be okay?";
};

FUNC INT Info_Mod_Dragomir_AllesKlar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_AllesKlar_15_00"); //Are you gonna be okay?
	AI_Output(self, hero, "Info_Mod_Dragomir_AllesKlar_12_01"); //It's enough to survive.
};

INSTANCE Info_Mod_Dragomir_Mitmachen (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Mitmachen_Condition;
	information	= Info_Mod_Dragomir_Mitmachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I join you guys?";
};

FUNC INT Info_Mod_Dragomir_Mitmachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	&& (Mod_Gilde > 0)
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Mitmachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_00"); //Can I join you guys?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_01"); //I can't decide on my own. But since you're asking, I have something you could do for me.
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_02"); //What's this about?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_03"); //Some of our hunters have spread across the country and are looking for good hunting grounds. I want you to stop by their house and ask them what they look like.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_04"); //Then they don't have to run all the way back and forth.
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_05"); //Where are the hunters?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_06"); //There are four hunters on the way. Gaan, Nandor, Grimbald and Grom.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_07"); //Gaan is at the pass to the Minental, Grom should be found on Onar's farm with the mercenaries, he wanted to ask around there.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_08"); //Nandor has gone into the dark forest. As far as I know, there's one of those stone circles there somewhere, look for it.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_09"); //Grimbald is at a lake, near the cave of the black troll. He wanted to see the beast. If he survived the encounter, you'll find him definitively still there.

	Log_CreateTopic	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Dragomir asked me to visit the four hunters Gaan, Nandor, Grimbald and Grom. Gaan is located at the pass to the Minental, Grom is on Onars farm, Nandor is in the dark forest near a stone circle and Grimbald is at a lake near the black troll.");
};

INSTANCE Info_Mod_Dragomir_WoIst (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WoIst_Condition;
	information	= Info_Mod_Dragomir_WoIst_Info;
	permanent	= 1;
	important	= 0;
	description	= "Where can I find...";
};

FUNC INT Info_Mod_Dragomir_WoIst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WoIst_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_15_00"); //Where can I find...

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_BACK()
{
	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Nandor()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Nandor_15_00"); //... Nandor?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Nandor_12_01"); //Nandor is in the dark forest, somewhere near a stone circle.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Grom()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Grom_15_00"); //... Grom?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Grom_12_01"); //He's on Onar's farm with the mercenaries.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Grimbald()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Grimbald_15_00"); //... Grimbald?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Grimbald_12_01"); //Grimbald is by the lake near the black troll.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Gaan()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Gaan_15_00"); //... Gaan?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Gaan_12_01"); //Gaan is at the Minental pass.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

INSTANCE Info_Mod_Dragomir_Pedro (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Pedro_Condition;
	information	= Info_Mod_Dragomir_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you seen a fire novice?";
};

FUNC INT Info_Mod_Dragomir_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Pedro))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_00"); //
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_01"); //
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_02"); //
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_03"); //
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_04"); //
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_05"); //
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_06"); //
	AI_output(self, hero, "Info_Mod_Dragomir_Pedro_12_07"); //

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "");
};

INSTANCE Info_Mod_Dragomir_Orlan (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Orlan_Condition;
	information	= Info_Mod_Dragomir_Orlan_Info;
	permanent	= 0;
	important	= 0;
	description	= "Orlan says no novice went to his tavern.";
};

FUNC INT Info_Mod_Dragomir_Orlan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Pedro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Orlan_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Orlan_15_00"); //Orlan says no novice went to his tavern.
	AI_Output(self, hero, "Info_Mod_Dragomir_Orlan_12_01"); //Then I guess one of us was lying.
	AI_Output(hero, self, "Info_Mod_Dragomir_Orlan_15_02"); //I guess you lied to me.
	AI_Output(self, hero, "Info_Mod_Dragomir_Orlan_12_03"); //Wait, I don't have to put up with that.

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
	
	self.flags = 0;
};

INSTANCE Info_Mod_Dragomir_Niederlage (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Niederlage_Condition;
	information	= Info_Mod_Dragomir_Niederlage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_Niederlage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Orlan))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Niederlage_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_00"); //
			AI_Output(hero, self, "Info_Mod_Dragomir_Niederlage_15_01"); //
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_02"); //

			B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "");

			B_Göttergefallen(1, 1);
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_03"); //
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
	self.flags = 2;
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dragomir_Plage (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Plage_Condition;
	information	= Info_Mod_Dragomir_Plage_Info;
	permanent	= 0;
	important	= 0;
	description	= "As a ranger, you certainly have knowledge of the fauna and flora, including those of water bodies.";
};

FUNC INT Info_Mod_Dragomir_Plage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Plage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Plage_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_00"); //As a ranger, you certainly have knowledge of the fauna and flora, including those of water bodies.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_01"); //Yeah, you've come to the right place. What's this about?
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_02"); //Now, out of the lake in the New Camp, worms and crabs emerge that plague the whole area.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_03"); //The lake in the New Camp?! As far as I can remember, a dam was built there.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_04"); //And you must have decimated the original animal kingdom there as well, right?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_05"); //I would be surprised if they found a single Lurker there.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_06"); //Ooh, ooh, ooh, well... but how did...?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_07"); //How foolish people are. Devastate their environment and believe that this would remain unpunished.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_08"); //How do you think it's possible that there are so many swamp sharks and blood flies in the swamp right now?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_09"); //Wonderful stagnant waters where the eggs of the marshland flies and the spores of the bog sharks can develop into larvae... and especially without their predators, the Lurkers.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_10"); //You wedge the lake into a dam and exterminate the Lurkers?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_11"); //It is also quite right that you yourself are to blame for what is happening to the lake.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_12"); //But is there nothing you can do to stop what's happening?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_13"); //Tjaa... you would at least have to repair the damage you have done to the wildlife of the lake.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_14"); //That would mean, however, that the Lurkers would again...
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_15"); //Exactly.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_16"); //How could this be done?
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_17"); //I can hardly grind a full-grown animal into the camp.... and the breeding season is already over, so there are no more Lurker eggs.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_18"); //Your knowledge about the breeding season of the Lurkers surprises me...
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_19"); //Well, well...
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_20"); //She doesn't seem perfect.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_21"); //How, what do you mean?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_22"); //The Lurkers in the Minental and near Khorinis have already brooded, that's right... but those of their kind in the north of the island, called Relendel, are there a few weeks later.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_23"); //If you're lucky, you'll find some eggs there near the lake.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_24"); //If you place at least three of them in a Lurker cave near the lake of the New Camp, the condition of your water should return to normal in a short time.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_25"); //But I hope this incident will be a lesson to you and the other mercenaries for a long time.

	B_LogEntry	(TOPIC_MOD_NL_PLAGE, "Dragomir said that I could find Lurker's eggs near the lake in Relendel. If I deposit three of them in the Lurker cave in the New Camp, the plague would soon be history. The eggs will probably be in a cave in the big lake. The place where I have to dive is clearly indicated by Lurker on the beach.");

	Mod_NL_JeremiahHasEier = 3;

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Dragomir_Leichengase (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Leichengase_Condition;
	information	= Info_Mod_Dragomir_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "I need your help.";
};

FUNC INT Info_Mod_Dragomir_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase4))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_00"); //I need your help.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_01"); //With what?
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_02"); //I got a bag of herbs to feed a troll.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_03"); //(laughs hearty) You want to feed a troll this vegetable?
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_04"); //We're talking about the same thing, aren't we?
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_05"); //Three meters tall, rather hairy, bad breath like Beliar's ass... and wait, there was something else. Oh, yes, MEAT EATER!
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_06"); //If the troll just ate the stuff, I wouldn't need your help.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_07"); //What the fuck is all this shit anyway? Oh, leave it there, I don't want to know.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_08"); //If you really want a troll to eat this green stuff, lubricate it with molar fat!
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_09"); //The beasts love the stench of this rancid devil's stuff.

	if (Jäger_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_10"); //Thanks.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_11"); //Why not just like that? Thanks.
		AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_12"); //What the fuck is this shit?
		AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_13"); //With a thank you, I can't get drunk in the tavern to forget the conversation we just had.

		Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);

		if (Npc_HasItems(hero, ItMi_Gold) >= 50)
		{
			Info_AddChoice	(Info_Mod_Dragomir_Leichengase, "Here's 50 pieces of gold.", Info_Mod_Dragomir_Leichengase_B);
		};
		Info_AddChoice	(Info_Mod_Dragomir_Leichengase, "I need your help.", Info_Mod_Dragomir_Leichengase_A);
	};

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Dragomir thought it would be rich to rub the bag with a mixture of herbs and molar fat.");
};

FUNC VOID Info_Mod_Dragomir_Leichengase_B()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_B_15_00"); //Here's 50 pieces of gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_01"); //Well, I'll probably be able to afford a mild amnesia with that. See you around.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_02"); //Oh, wait. I still have some old molar fat, which rots away anyway.

	B_GiveInvItems	(self, hero, ItMi_MoleratLubric_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_03"); //The more it stinks, the better it's for the creatures.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_04"); //But watch out, even the strongest troll gets rid of a piece of molasses mold! (laughs heartily)

	Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);
};

FUNC VOID Info_Mod_Dragomir_Leichengase_A()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_A_15_00"); //I need your help.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_A_12_01"); //With what?

	Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);
};

INSTANCE Info_Mod_Dragomir_AlterMann (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_AlterMann_Condition;
	information	= Info_Mod_Dragomir_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ask about old man in the woods.";
};

FUNC INT Info_Mod_Dragomir_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_00"); //Ahh, you mean the old man of the woods. Yeah, I know something about him.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_01"); //It is said to be centuries old and to protect the animals of the forest around Khorata.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_02"); //It is said that he is blind, but at the same time he has a magical talent.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_03"); //That's all I can think of right now. Maybe someone else knows more.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "From the first ranger I didn't get much new information. The old man of the forest, protecting the animals, he is ancient, blind and magical. Maybe another ranger knows more.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_04"); //The old man of the forest? Yes, I heard he was once a servant of Adano.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_05"); //It is unclear whether he was a ranger like us, a magician of water, or a transforming mage.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_06"); //His magical abilities, as well as his strong attachment to the animal and plant world are proof that he has something of everything.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "At the 2nd ranger I also didn't learn much worth knowing. The old man of the forest is said to be connected with Adanos and creation, especially the animals and plants.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_07"); //Well, I can't tell you much about him.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_08"); //The problem is also that he does not talk to anyone, not even us, even if we are pursuing similar goals.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_09"); //Alone with the animals of the forest he entertains himself.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_10"); //Well, if I were a boar, I'm sure I could tell you more about him.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, this could have been an important clue. The old man of the forest completely avoids humans, only speaks to animals.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_11"); //The old man of the forest? Well, he's supposed to be closely related to the fauna and flora.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_12"); //It is said that he leads pack animals such as boar or wolves to protect the forest against intruders.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_13"); //Even it is said that it is often found in the shape of a green wolf.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Above all, he should also instruct larger pack animals such as boar and wolves to protect the forest against intruders.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_14"); //You're interested in stories about the old man of the forest?
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_15"); //Well, I don't know much about this mystical oddball.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_16"); //It is said to reside mostly in the dark forest, but also near water bodies such as lakes.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_17"); //Rarely has someone seen him....

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "It is most likely to be found in Khorata's dense forest near a lake.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Dragomir_Pickpocket (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Pickpocket_Condition;
	information	= Info_Mod_Dragomir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Dragomir_Pickpocket_Condition()
{
	C_Beklauen	(58, ItRw_Bolt, 40);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

	Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_BACK, Info_Mod_Dragomir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Dragomir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

		Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Dragomir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Dragomir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Dragomir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Dragomir_EXIT (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_EXIT_Condition;
	information	= Info_Mod_Dragomir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= "See you around.";
};

FUNC INT Info_Mod_Dragomir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dragomir_EXIT_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_EXIT_15_00"); //See you around.

	AI_StopProcessInfos	(hero);
};
