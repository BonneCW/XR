INSTANCE Info_Mod_Thorus_Hi (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Hi_Condition;
	information	= Info_Mod_Thorus_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_00"); //You?! I won't be spared!
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_01"); //Hello, Thorus. You've come a long way, I see.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_02"); //How to take it. Within these four walls, everyone listens to me, but I don't know what it looks like outside.
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_03"); //Can't you get out?
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_04"); //Sure, anytime. If I want to take the risk of being attacked or shot at.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_05"); //And believe me, the risk is not very small.
};

INSTANCE Info_Mod_Thorus_Schlecht (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Schlecht_Condition;
	information	= Info_Mod_Thorus_Schlecht_Info;
	permanent	= 0;
	important	= 0;
	description	= "I heard you needed help.";
};

FUNC INT Info_Mod_Thorus_Schlecht_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Schlecht_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_15_00"); //Ich habe gesehen, dass es euch ziemlich dreckig geht, und will euch helfen. 
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_01"); //Soso, auf einmal willst du uns helfen? Nun, wir können jeden brauchen. Aber woher wissen wir, ob wir dir vertrauen können?
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_02"); //Du erinnerst dich doch noch an die Aufnahme zur Zeit der Kolonie.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);

	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "No.", Info_Mod_Thorus_Schlecht_Nein);
	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "Yes.", Info_Mod_Thorus_Schlecht_Ja);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Nein()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Nein_15_00"); //No.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Nein_12_01"); //Each candidate must pass a special examination. She's testing whether we can trust you.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Ja()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Ja_15_00"); //Yes, you mean the trial of trust.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Ja_12_01"); //Exactly.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

INSTANCE Info_Mod_Thorus_Pruefung (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pruefung_Condition;
	information	= Info_Mod_Thorus_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do you want me to do?";
};

FUNC INT Info_Mod_Thorus_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_00"); //What do you want me to do?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_01"); //Someone is stealing goods from the House of the Archbarons, and I want you to find them and bring me proof against them.
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_02"); //Well, is there any information on him?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_03"); //Ask Alissandro, he's gathered all the necessary information.

	Log_CreateTopic	(TOPIC_MOD_PDV, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PDV, "Someone steals from the arch barons and since I have to give a certificate of trust, I have the honour of finding the culprit. The baron Alissandro will give me the necessary information.");
};

INSTANCE Info_Mod_Thorus_Diebe (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Diebe_Condition;
	information	= Info_Mod_Thorus_Diebe_Info;
	permanent	= 0;
	important	= 0;
	description	= "I know who the thieves are.";
};

FUNC INT Info_Mod_Thorus_Diebe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Diebe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_01"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_02"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_03"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_04"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_05"); //

	B_LogEntry	(TOPIC_MOD_PDV, "Well, I've reported them to Thorus. He'll hold her until I have proof.");

	AI_Teleport	(Mod_943_GRD_Bloodwyn_MT, "OCC_CELLAR_BACK_RIGHT_CELL");
	AI_Teleport	(Mod_1110_GRD_Cutter_MT, "OCC_CELLAR_BACK_LEFT_CELL");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "KNAST");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "KNAST");

	AI_UnequipWeapons	(Mod_943_GRD_Bloodwyn_MT);

	Npc_RemoveInvItems	(Mod_943_GRD_Bloodwyn_MT, ItMw_Sturmbringer, 1);
};

INSTANCE Info_Mod_Thorus_Zettel (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Zettel_Condition;
	information	= Info_Mod_Thorus_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have your proof.";
};

FUNC INT Info_Mod_Thorus_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Zettel))
	&& (Npc_HasItems(hero, ItWr_FisksNotiz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Zettel_15_00"); //
	
	B_GiveInvItems	(hero, self, ItWr_FisksNotiz, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_01"); //

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_02"); //

		B_LogEntry	(TOPIC_MOD_PDV, "Thorus has locked up Cutter and Bloodwyn. I can become a guardsman now.");

		B_Göttergefallen(2, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_03"); //
	};

	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Aufnahme (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Aufnahme_Condition;
	information	= Info_Mod_Thorus_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to join the guards.";
};

FUNC INT Info_Mod_Thorus_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Aufnahme_Info()
{
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_65);
	
	AI_Output(hero, self, "Info_Mod_Thorus_Aufnahme_15_00"); //I want to be a guardsman.
	AI_Output(self, hero, "Info_Mod_Thorus_Aufnahme_12_01"); //Then welcome to the guard. Here's your armour.

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Thorus has taken me in with the guards of the old camp.");

	CreateInvItems	(self, GRD_ARMOR_L, 1);
	B_GiveInvItems	(self, hero, GRD_ARMOR_L, 1);

	Gardist_Dabei = TRUE;

	Mod_AnzahlNebengilden += 1;

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Arena (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Arena_Condition;
	information	= Info_Mod_Thorus_Arena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you have something to do for me?";
};

FUNC INT Info_Mod_Thorus_Arena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Gardist_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Arena_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_00"); //Do you have something to do for me?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_01"); //Yes, there are problems in the arena. I can't prove it, but one of the fighters is fighting with unfair means.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_02"); //What's the matter with him?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_03"); //No one has defeated him for days, even though he doesn't fight very skillfully. I want you to take a look at this.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_04"); //Good.
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_05"); //One of his fights is about to take place. You might want to take a look at this.

	Log_CreateTopic	(TOPIC_MOD_AL_ARENA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus said that a stranger who fights in the arena has not been defeated for days, despite his clumsiness. I think I'll take a look at that.");

	B_StartOtherRoutine	(Mod_962_STT_Scatty_MT,	"ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1871_TPL_GorKaranto_MT, "ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");
};

INSTANCE Info_Mod_Thorus_Verloren (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Verloren_Condition;
	information	= Info_Mod_Thorus_Verloren_Info;
	permanent	= 0;
	important	= 0;
	description	= "When fighting the unknown...";
};

FUNC INT Info_Mod_Thorus_Verloren_Condition()
{
	if (Mod_GorKarantoSchwach == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Verloren_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Verloren_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Verloren_12_01"); //

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus didn't exactly help.");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "UNBEKANNTER");

	Mob_CreateItems	("TRUHE_MT_100", ItSc_Schwaechen, 15);
	Mob_CreateItems	("TRUHE_MT_100", ItWr_DraganNachricht, 1);
};

INSTANCE Info_Mod_Thorus_Botschaft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Botschaft_Condition;
	information	= Info_Mod_Thorus_Botschaft_Info;
	permanent	= 0;
	important	= 0;
	description	= "I found some information.";
};

FUNC INT Info_Mod_Thorus_Botschaft_Condition()
{
	if (Mod_GorKarantoSchwach == 7)
	&& (Npc_HasItems(hero, ItWr_DraganNachricht) == 1)
	&& (Npc_HasItems(hero, ItSc_Schwaechen) == 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Botschaft_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_00"); //Here, I found these roles and this message in the hut of the unknown.

	Npc_RemoveInvItems	(hero, ItWr_DraganNachricht, 1);
	Npc_RemoveInvItems	(hero, ItSc_Schwaechen, 15);
	
	B_ShowGivenThings	("Message and weakness roles given");

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_01"); //So it's Paran and Dragan. I wouldn't have thought they could.
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_02"); //Who are Paran and Dragan?
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_03"); //Two little trick thieves hanging around the camp a while ago. They wanted to relieve the camp's people of their belongings. Then the guards noticed it and banished them.
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_04"); //Well, now that we have the spell rolls, you can challenge him again.

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus said the stranger was nothing but a petty thief. Now I won't have any more trouble defeating him.");
};

INSTANCE Info_Mod_Thorus_ParanWeg (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_ParanWeg_Condition;
	information	= Info_Mod_Thorus_ParanWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Paran and Dragan won't cause any more trouble.";
};

FUNC INT Info_Mod_Thorus_ParanWeg_Condition()
{
	if (Mod_GorKarantoSchwach > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_ParanWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_ParanWeg_15_00"); //Paran and Dragan won't cause any more trouble.
	AI_Output(self, hero, "Info_Mod_Thorus_ParanWeg_12_01"); //Well, here, you can keep the roles.

	CreateInvItems	(self, ItSc_Schwaechen, 15);
	B_GiveInvItems	(self, hero, ItSc_Schwaechen, 15);

	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Thorus_FrischeLuft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_FrischeLuft_Condition;
	information	= Info_Mod_Thorus_FrischeLuft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_FrischeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_ParanWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_FrischeLuft_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_00"); //I think it's time for you to get some fresh air. I have a job for you.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_01"); //What's this about?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_02"); //You will go to the new camp and kidnap one of Lee's officers. His name is Orik.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_03"); //What? It would be suicide to go to the new camp alone. And taking someone out of it.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_04"); //It's all right, Arto will go with you. He will also lead the mission.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_05"); //Why is he heading the mission?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_06"); //Because he's Erzbaron and you're a guardsman.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_07"); //I see.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_08"); //Well, good luck, then I wish you the best of luck. Here's some bandit armor. They won't recognize you with this one.

	CreateInvItems	(self, ItAr_BDT_M_01, 1);
	B_GiveInvItems	(self, hero, ItAr_BDT_M_01, 1);

	Log_CreateTopic	(TOPIC_MOD_AL_ORIK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Thorus told me to take Orik, the mercenary, with Arto. He gave me a bandit's armor for cover.");
};

INSTANCE Info_Mod_Thorus_OrikDabei (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_OrikDabei_Condition;
	information	= Info_Mod_Thorus_OrikDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "We have Orik.";
};

FUNC INT Info_Mod_Thorus_OrikDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_BeiThorus))
	&& (Npc_GetDistToWP(Mod_1266_SLD_Orik_MT, "OCC_BARONS_DANCE2") < 1000)
	&& (Npc_HasItems(hero, ItAr_BDT_M_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_OrikDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_OrikDabei_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_01"); //
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_02"); //

	CreateInvItems	(hero, ItMi_Gold, 500);
	CreateInvItems	(hero, GRD_ARMOR_M, 1);

	B_ShowGivenThings	("500 Gold and cloakroom armour received");

	var C_Item itm;
	
	itm = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(itm, ITAR_BDT_M_01) == TRUE)
	{
		AI_UnequipArmor	(hero);

		AI_EquipBestArmor	(hero);
	};

	Mod_OrikAbgeliefert = Wld_GetDay();

	Npc_RemoveInvItems	(hero, ItAr_BDT_M_01, 1);

	B_LogEntry	(TOPIC_MOD_AL_ORIK, "We handed over Orik Thorus, but there may be problems with the new camp now.");
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_SUCCESS);

	AI_Teleport	(Mod_1266_SLD_Orik_MT, "OCC_CELLAR_FRONT_RIGHT_CELL");
	B_StartOtherRoutine	(Mod_1266_SLD_Orik_MT, "KNAST");

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Templer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Templer_Condition;
	information	= Info_Mod_Thorus_Templer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who is the Templar?";
};

FUNC INT Info_Mod_Thorus_Templer_Condition()
{
	if (Mod_TemplerBeiThorus == 1)
	&& (Npc_GetDistToWP(self, "OCC_BARONS_DANCE2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Templer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_00"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_01"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_02"); //
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_03"); //
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_04"); //

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_06"); //

	CreateInvItems	(self, DungeonKey, 1);
	B_GiveInvItems	(self, hero, DungeonKey, 1);

	B_KillNpc	(Mod_1110_GRD_Cutter_MT);

	Log_CreateTopic	(TOPIC_MOD_AL_SCHMUGGLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_SCHMUGGLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Thorus hired me to get information from Cutter. I'll find him in the dungeon.");
};

INSTANCE Info_Mod_Thorus_CutterTot (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_CutterTot_Condition;
	information	= Info_Mod_Thorus_CutterTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cutter's dead.";
};

FUNC INT Info_Mod_Thorus_CutterTot_Condition()
{
	if (Mod_TemplerBeiThorus == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_CutterTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_00"); //Cutter's dead.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_01"); //Damn, that makes things more complicated, of course.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_02"); //While I was with him in the dungeon, someone closed the gate.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_03"); //Apparently they want to get rid of you, so be careful.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_04"); //I understand, I'll be careful. Are there any other indications?
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_05"); //No, I was hoping for some from you.

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "I told Thorus that Cutter's dead.");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Thorus_WasLos (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_WasLos_Condition;
	information	= Info_Mod_Thorus_WasLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's the matter?";
};

FUNC INT Info_Mod_Thorus_WasLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_WasLos_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_WasLos_15_00"); //What's going on?
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_01"); //Oh, some guardsmen and diggers are still angry that I took the matter into my hands after Gomez' disappearance.
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_02"); //Scorpio and the most loyal followers have left now, but he still has enough violent sympathizers here who would have preferred to see him as the new leader.
};

INSTANCE Info_Mod_Thorus_Ian (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Ian_Condition;
	information	= Info_Mod_Thorus_Ian_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ian told me about the old mine thing.";
};

FUNC INT Info_Mod_Thorus_Ian_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Ian_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Ian_15_00"); //Ian told me about the old mine thing.
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_01"); //Yeah, and? Do you now also expect me to leave the whole camp unguarded and risk my head and neck to recover something we can't do anything with at the moment?
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_02"); //After the loss of a number of good men, we have no capacity to maintain and control stockpiling operations and mine work at the same time!
};

INSTANCE Info_Mod_Thorus_Erzbaron (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Erzbaron_Condition;
	information	= Info_Mod_Thorus_Erzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why are you an Erzbaron?";
};

FUNC INT Info_Mod_Thorus_Erzbaron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Erzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_00"); //Why are you an Erzbaron?
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_01"); //Gomez is gone. We assume he's dead, but his body was never found.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_02"); //Scar and Raven also disappeared overnight, and no one knows whether they got scared or discreetly out of the corner.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_03"); //For a short time it was Bartholo, but he was not able to run the camp for more than a week and has taken up his old post as administrator again.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_04"); //Arto has waived the office thankfully. Now we had a problem, but due to an internal decision I became Erzbaron.
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_05"); //I see.

	if (!Npc_KnowsInfo(hero, Info_Mod_Thorus_Erzbaron))
	{
		B_LogEntry	(TOPIC_MOD_ALTESLAGER, "So Thorus took Gomez' place and he was quite benevolent. Well, they're lucky they got rid of Gomez. Raven and Scar took off, too.");
	};
};

var int Thorus_LastPetzCounter;
var int Thorus_LastPetzCrime;

INSTANCE Info_Mod_Thorus_PMSchulden (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PMSchulden_Condition;
	information 	= Info_Mod_Thorus_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Thorus_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Thorus_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_00"); //Did you come to pay your fine?

	if (B_GetTotalPetzCounter(self) > Thorus_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_01"); //I was wondering if you'd even dare come here!
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_02"); //Apparently, it's not the latest accusations!

		if (Thorus_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_03"); //I warned you! The fine you have to pay now is higher!
			AI_Output (hero, self, "Info_Mod_Thorus_PMAdd_15_00"); //How much?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Thorus_LastPetzCounter);
		
			if (diff > 0)
			{
				Thorus_Schulden = Thorus_Schulden + (diff * 50);
			};
		
			if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Thorus_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_04"); //You let me down so badly!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Thorus_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_05"); //Some new things have come up.
		
		if (Thorus_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_06"); //Suddenly, there's no one left to accuse you of murder.
		};
		
		if (Thorus_LastPetzCrime == CRIME_THEFT)
		|| ( (Thorus_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_07"); //No one remembers seeing you at a theft.
		};
		
		if (Thorus_LastPetzCrime == CRIME_ATTACK)
		|| ( (Thorus_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_08"); //There's no more witnesses to the fact that you've ever been in a fight.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_09"); //Apparently all the charges against you have vanished.
		};
		
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_10"); //I don't know what happened, but I warn you: don't play games with me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_11"); //Anyway, I've decided to waive your debt.
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_12"); //Make sure you don't get in trouble again.
	
			Thorus_Schulden			= 0;
			Thorus_LastPetzCounter 	= 0;
			Thorus_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_13"); //One thing is clear: you still have to pay your penalty in full.
			B_Say_Gold (self, hero, Thorus_Schulden);
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_14"); //So, what is it?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "I haven't got enough gold!", Info_Mod_Thorus_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "How much was that again?", Info_Mod_Thorus_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Thorus_PMSchulden, "I want to pay the penalty!", Info_Mod_Thorus_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Thorus_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PMSchulden_HowMuchAgain_15_00"); //How much was it again?
	B_Say_Gold (self, hero, Thorus_Schulden);

	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "I haven't got enough gold!", Info_Mod_Thorus_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden, "How much was that again?", Info_Mod_Thorus_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PMSchulden, "I want to pay the penalty!", Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Thorus_PETZMASTER   (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PETZMASTER_Condition;
	information 	= Info_Mod_Thorus_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PETZMASTER_Info()
{
	Thorus_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_01"); //I'm glad you came to me before things got worse for you.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_02"); //Murder is a grave offence!

		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Thorus_Schulden = Thorus_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_03"); //Not to mention the other things you've done.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_04"); //The guards have orders to judge every murderer on the spot.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_05"); //And even most of the shadows won't tolerate a murderer in the camp!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_06"); //I have no interest in putting you on the gallows. We're at war, and we need every man we can get.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_07"); //But it won't be easy to make people gracious again.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_08"); //You could show your repentance by paying a fine - of course the penalty must be appropriate.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_09"); //Good of you to come! You're accused of stealing! There are witnesses!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_10"); //I don't even want to talk about the other things I've heard.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_11"); //I will not tolerate such behaviour in the camp!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_12"); //You'll have to pay a fine to make up for your crime!
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_13"); //If you fight with the Buddlers, that's one thing...
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_14"); //But if you attack Shadows or Guards, I'll have to hold you accountable.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_15"); //And I don't think it had to be the case with the sheep.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_16"); //If I let you get away with this, everybody's gonna do what they want.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_17"); //So you'll pay an appropriate fine - and the whole thing will be forgotten.
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_18"); //I've heard that you've been messing with our sheep.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_19"); //You do realize I can't let this go through.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_20"); //You'll have to pay compensation!
		
		Thorus_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_15_21"); //How much?
	
	if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Thorus_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PETZMASTER, "I haven't got enough gold!", Info_Mod_Thorus_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PETZMASTER, "I want to pay the penalty!", Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Thorus_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayNow_15_00"); //I want to pay the fine!
	B_GiveInvItems (hero, self, itmi_gold, Thorus_Schulden);
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayNow_12_01"); //Good! I will make sure that everyone in the camp learns about it - this will restore your reputation to some extent.

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Thorus_Schulden			= 0;
	Thorus_LastPetzCounter 	= 0;
	Thorus_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Thorus_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayLater_15_00"); //I don't have enough gold.
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_01"); //Then see to it that you acquire the gold as quickly as possible
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_02"); //And I'm warning you: if you add to your guilt, things will get worse for you.
	
	Thorus_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Thorus_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Thorus_Lehrer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lehrer_Condition;
	information	= Info_Mod_Thorus_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me?";
};

FUNC INT Info_Mod_Thorus_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& ((Schatten_Dabei == TRUE)
	|| (Gardist_Dabei == TRUE)
	|| (Erzbaron_Dabei == TRUE))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lehrer_15_00"); //Can I learn from you?
	AI_Output(self, hero, "Info_Mod_Thorus_Lehrer_12_01"); //Since you are one of us, I will teach you how to become stronger and more skillful.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "Thorus can teach me to be stronger and more skillful.");
};

INSTANCE Info_Mod_Thorus_Lernen (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lernen_Condition;
	information	= Info_Mod_Thorus_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me something.";
};

FUNC INT Info_Mod_Thorus_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lernen_15_00"); //Teach me something.

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Lernen);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_DEXTERITY, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_1()
{
	B_TeachAttributePoints	(self, hero, ATR_DEXTERITY, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

// ------------------------------------------------------------
// 			  				CANYOUTEACH 
// ------------------------------------------------------------ 

INSTANCE Info_Mod_Thorus_CanYouTeach   (C_INFO) 
{ 
	npc     	= Mod_966_GRD_Thorus_MT; 
	nr          = 1; 
	condition   = Info_Mod_Thorus_CanYouTeach_Condition; 
	information = Info_Mod_Thorus_CanYouTeach_Info; 
	important   = FALSE; 
	permanent   = FALSE; 
	description = ""; 
}; 
 
FUNC INT Info_Mod_Thorus_CanYouTeach_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Lehrer)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Thorus_CanYouTeach_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Thorus_CanYouTeach_15_00"); //Kannst du mich auch im Kampf unterrichten?

	AI_Output(self, hero, "Info_Mod_Thorus_CanYouTeach_12_01"); //Ja. Ich kann dir zeigen, wie man mit Zweihändern kämpft. 

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "");
}; 


// ------------------------------------------------------------
// 			  				   LERNEN 
// ------------------------------------------------------------ 

var int Thorus_Merke2H;

INSTANCE Info_Mod_Thorus_2HLernen   (C_INFO) 
{ 
	npc     	= Mod_966_GRD_Thorus_MT; 
	nr          = 1; 
	condition   = Info_Mod_Thorus_2HLernen_Condition; 
	information = Info_Mod_Thorus_2HLernen_Info; 
	important   = FALSE; 
	permanent   = TRUE; 
	description = ""; 
}; 
 
FUNC INT Info_Mod_Thorus_2HLernen_Condition () 
{ 
    if (Npc_KnowsInfo(hero, Info_Mod_Thorus_CanYouTeach)) 
    { 
  	 	return TRUE; 
    }; 
}; 
 
FUNC VOID Info_Mod_Thorus_2HLernen_Info () 
{ 
	AI_Output(hero, self, "Info_Mod_Thorus_2HLernen_15_00"); //

	if (hero.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_2HLernen_12_01"); //
	}
	else
	{
		Thorus_merke2H = hero.HitChance[NPC_TALENT_2H];

		Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
		Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
		Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
		Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);
	};
}; 

FUNC VOID Info_Mod_Thorus_2HLernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	if (hero.HitChance[NPC_TALENT_2H] > Thorus_merke2H && hero.HitChance[NPC_TALENT_2H] < 100)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_2HLernen_12_02"); //Du bist besser geworden, weiter so.
	}
	if (hero.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_03"); //Du bist nun ein Meister im Umgang mit den Zweihändern. Ich bezweifle, dass du noch jemanden finden wirst, der dir etwas beibringen kann.
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_04"); //Nun kommt es nur noch auf deine Praxiserfahrung an. 
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Thorus_2HLernen_12_05"); //Komm wieder, wenn du mehr lernen willst.
	};
};

FUNC VOID Info_Mod_Thorus_2HLernen_2H_5()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);
	
};

FUNC VOID Info_Mod_Thorus_2HLernen_2H_1()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Thorus_2HLernen);
	Info_AddChoice 		(Info_Mod_Thorus_2HLernen, DIALOG_BACK, Info_Mod_Thorus_2HLernen_Back);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H1,	 B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1)),		Info_Mod_Thorus_2HLernen_2H_1);
	Info_AddChoice		(Info_Mod_Thorus_2HLernen, B_BuildLearnString(PRINT_Learn2H5,	 B_GetLearnCostTalent_New(hero, NPC_TALENT_2H)),		Info_Mod_Thorus_2HLernen_2H_5);

};

INSTANCE Info_Mod_Thorus_Pickpocket (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pickpocket_Condition;
	information	= Info_Mod_Thorus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Thorus_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 67);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_BACK, Info_Mod_Thorus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thorus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thorus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thorus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thorus_EXIT (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_EXIT_Condition;
	information	= Info_Mod_Thorus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
