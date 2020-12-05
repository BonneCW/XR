INSTANCE Info_Mod_Angar_Hi (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hi_Condition;
	information	= Info_Mod_Angar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_00"); //(surprised) You? I didn't think I'd ever see you again.
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_01"); //Did you defeat the sleeper?
	AI_Output(hero, self, "Info_Mod_Angar_Hi_15_02"); //Yeah, I sent him back to where he came from. We should've gotten rid of him by now.
};

INSTANCE Info_Mod_Angar_Irdorath (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath_Condition;
	information	= Info_Mod_Angar_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm about to make a sea voyage to an island.";
};

FUNC INT Info_Mod_Angar_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_00"); //I will soon be making a sea voyage to an island to get closer to the destruction of Xeres.
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_01"); //He is an evil magician and master of many sinister creatures, including the sleeper.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_02"); //What?! Then I must accompany you under all circumstances.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_03"); //Only when this fiend has been destroyed, the death of our former spiritual leader, Y' Berion, was atoned for.
};

INSTANCE Info_Mod_Angar_Irdorath2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath2_Condition;
	information	= Info_Mod_Angar_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Okay, I'll meet you at the harbour in Khorinis.";
};

FUNC INT Info_Mod_Angar_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath2_15_00"); //Okay, I'll meet you at the harbour in Khorinis.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath2_34_01"); //I'll wait for you there.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar is anxious to do his part to destroy Xeres and will accompany me on the journey.");

	B_GivePlayerXP	(100);

	Mod_AngarDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Angar_Fanatiker (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Fanatiker_Condition;
	information	= Info_Mod_Angar_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are there any more sleepers?";
};

FUNC INT Info_Mod_Angar_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Fanatiker_15_00"); //Are there any more sleepers?
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_01"); //Most of them left the sleeper after the death of Y' Berion, but some have left to find the sleeper.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_02"); //There were several small groups. Some of them went to the temple with Cor Kalom at that time, others left for Khorinis after the fall of the barrier.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_03"); //Probably hiding in the woods around town.

	if (Mod_Import_Dusty == LOG_SUCCESS)
	|| (Mod_Import_Dusty == -1)
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_04"); //Talk to Dusty, he's out hunting in the woods around Khorinis right now. At night, you should find him in town.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Probably the fanatical cult spinners are in the woods around Khorinis. I should have a talk with Dusty. He should be in Khorinis by night.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_05"); //Talk to Lester, he knows the area better.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Probably the fanatical cult spinners are in the woods around Khorinis. I should have a talk with Lester, who knows the area better.");
	};
};

INSTANCE Info_Mod_Angar_Namib (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Namib_Condition;
	information	= Info_Mod_Angar_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib sent me.";
};

FUNC INT Info_Mod_Angar_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_AtTempel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_00"); //Baal Namib sent me. I want you to take your position.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_01"); //Very good. Very good. But unfortunately Gor Na Vid is not here. You must take command of the second group instead. Can you do that?
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_02"); //I think so, yes.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_03"); //Excellent. Your troop must go to Balor's swamp weed field. Oh, there's one more thing. Do you prefer weapons or magic?

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Cor Angar is ready and has entrusted me with leading the second squad. I have to go to Balor's weed field.");

	B_StartOtherRoutine	(self, "POSTEN");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "POSTEN");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Weapons", Info_Mod_Angar_Namib_Waffen);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Magic", Info_Mod_Angar_Namib_Magie);
};

FUNC VOID Info_Mod_Angar_Namib_Waffen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Waffen_15_00"); //Weapons.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Waffen_34_01"); //Melee or ranged?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "hand-to-hand combat", Info_Mod_Angar_Namib_Nahkampf);
	Info_AddChoice	(Info_Mod_Angar_Namib, "ranged combat", Info_Mod_Angar_Namib_Fernkampf);
};

FUNC VOID Info_Mod_Angar_Namib_Nahkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Nahkampf_15_00"); //Melee.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Nahkampf_34_01"); //One-handed or two-handed?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "One-handed", Info_Mod_Angar_Namib_Einhand);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Two-handed", Info_Mod_Angar_Namib_Zweihand);
};

FUNC VOID Info_Mod_Angar_Namib_Einhand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Einhand_15_00"); //One-handed.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Einhand_34_01"); //All right, here, take this club.

	CreateInvItems	(self, ItMw_1H_Mace_02, 1);
	B_GiveInvItems	(self, hero, ItMw_1H_Mace_02, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Zweihand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Zweihand_15_00"); //Two-handed.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Zweihand_34_01"); //All right, here, take this club.

	CreateInvItems	(self, ItMw_Stabkeule, 1);
	B_GiveInvItems	(self, hero, ItMw_Stabkeule, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Fernkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Fernkampf_15_00"); //Ranged.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Fernkampf_34_01"); //Crossbow or bow?.

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Armbrust", Info_Mod_Angar_Namib_Armbrust);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Bogen", Info_Mod_Angar_Namib_Bogen);
};

FUNC VOID Info_Mod_Angar_Namib_Armbrust()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Armbrust_15_00"); //Crossbow.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Armbrust_34_01"); //All right, here, take this crossbow and a couple of bolts with you.

	CreateInvItems	(self, ItRw_Crossbow_M_01, 1);
	B_GiveInvItems	(self, hero, ItRw_Crossbow_M_01, 1);

	CreateInvItems	(hero, ItRw_SchmetterBolt, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Bogen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Bogen_15_00"); //Bow.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Bogen_34_01"); //All right, here, take this bow and a few arrows.

	CreateInvItems	(self, ItRw_Bow_L_04, 1);
	B_GiveInvItems	(self, hero, ItRw_Bow_L_04, 1);

	CreateInvItems	(hero, ItRw_SchmetterArrow, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Magie()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Magie_15_00"); //Magic.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Magie_34_01"); //All right, take these roles.

	CreateInvItems	(self, ItSc_Windfist, 10);
	B_GiveInvItems	(self, hero, ItSc_Windfist, 10);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

INSTANCE Info_Mod_Angar_SSUD (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_SSUD_Condition;
	information	= Info_Mod_Angar_SSUD_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_SSUD_Condition()
{
	if (Mod_Sekte_SH_Kampf >= 2)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_SSUD_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_00"); //I'm glad you came. We hadn't counted on undead swamp sharks.
	AI_Output(hero, self, "Info_Mod_Angar_SSUD_15_01"); //Yeah, we were pretty surprised too.
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_02"); //You should go to Baal Namib now and report back.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Also at Cor Angar, there were undead swamp sharks at work. I should go to Baal Namib now and report to him.");

	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Angar_Wambo (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Wambo_Condition;
	information	= Info_Mod_Angar_Wambo_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm coming on Wambo's account.";
};

FUNC INT Info_Mod_Angar_Wambo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Asylanten))
	&& (Npc_HasItems(hero, ItMi_AngarHalskette) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Wambo_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_00"); //I'm coming on Wambo's account.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_01"); //(pleased) Wambo?! That he still remembers me!
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_02"); //I don't have good news for you, though.

	B_GiveInvItems	(hero, self, ItMi_AngarHalskette, 1);

	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_03"); //You mean...
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_04"); //Yeah. Wambo still plague people's conscience.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_05"); //I never expected to see her again.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_06"); //But now all hope is gone.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_07"); //Thank you for your errand service. l-- I need to be alone right now.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_WAMBO_ANGAR, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Angar_Hueterklinge (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge_Condition;
	information	= Info_Mod_Angar_Hueterklinge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hueterklinge_Condition()
{
	if (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_00"); //So you are a Templar now, but you are only full-fledged when you will lead your own guardian blade.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_15_01"); //And where do I get them?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_02"); //Depends on whether you want a one-handed or a two-handed sword.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);

	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "I want a two-handed sword.", Info_Mod_Angar_Hueterklinge_B);
	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "I want a one-handed sword.", Info_Mod_Angar_Hueterklinge_A);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_C()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_00"); //You have to bring the necessary raw materials to the forge.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_C_15_01"); //And where on earth am I supposed to get all this stuff?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_02"); //Finding out will be the first step of your job.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_03"); //Just ask other Templars where they got the stuff from.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_B()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_B_15_00"); //
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_B_34_01"); //

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "For a two-handed guardian's blade I need 8 lumps of magic ore, 6 rice lord herbs, a dagger that drank the blood of 4 kings and the flesh of a scavenger that didn't hatch from an egg. I have to take these things all to Darrion. In order to find out how to get the things, I should ask the other templars.");

	Mod_TPL_Hueterklinge_Art = 2;
	
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_11");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_25");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_13");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_14");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_17");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_16");

	Info_Mod_Angar_Hueterklinge_C();
};

FUNC VOID Info_Mod_Angar_Hueterklinge_A()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_A_15_00"); //I want a one-handed sword.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_A_34_01"); //For a single-handed guardian blade you need 4 chunks of magical ore, an orc statuette made of a stone from the Stonehenge, the bone of an old ruler who ruled over a thousand years and the teeth of a wolf who tore his own mother.

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "For a one-handed guardian's blade I need 4 chunks of magical ore, an orc statuette made of a stone from the Stonehenge, the bone of an old ruler who ruled over a thousand years and the teeth of a wolf who tore his own mother. I have to take these things all to Darrion. In order to find out how to get the things, I should ask the other templars.");

	Mod_TPL_Hueterklinge_Art = 1;

	Info_Mod_Angar_Hueterklinge_C();
};

INSTANCE Info_Mod_Angar_Hueterklinge3 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge3_Condition;
	information	= Info_Mod_Angar_Hueterklinge3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey.";
};

FUNC INT Info_Mod_Angar_Hueterklinge3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge3_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_00"); //Hey.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_01"); //What's up?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_02"); //I would like to learn a few tricks and tricks from some older templars, who should I contact?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_03"); //I understand, well, Gor Na Kar is probably the Templar with the most combat experience, Gor Na Mon became a Templar at an early age, so he has already been through a lot for his age.
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_04"); //The oldest Templar is Gor Na Drak, but he is quite senile and you won't hear much useful stuff from him.

		Mod_TPL_Hueterklinge_Drak = TRUE;

		B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "I should probably pay Gor Na Drak a visit.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_05"); //I'm looking for an older Templar. you wouldn't happen to know who's in question?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_06"); //You're trying to take me for a fool? Get your own guardian blade!
	};
};

INSTANCE Info_Mod_Angar_Hueterklinge4 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge4_Condition;
	information	= Info_Mod_Angar_Hueterklinge4_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have received a Keeper's Blade.";
};

FUNC INT Info_Mod_Angar_Hueterklinge4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H_Geschaerft) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge4_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge4_15_00"); //I have received a Keeper's Blade.

	if ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1))
	{
		if (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_01"); //She looks pretty old to me....
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_02"); //Guardian blade? She looks pretty ordinary for that, though....
		};

		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_03"); //Anyway, you did your job. You're a full-fledged Templar now.

		B_GivePlayerXP	(200);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_04"); //Truly a beautiful sword... I am impressed! You are a worthy Templar!

		B_GivePlayerXP	(350);
	};

	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Angar_Eroberung_03 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Eroberung_03_Condition;
	information	= Info_Mod_Angar_Eroberung_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Eroberung_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cadar_Eroberung_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Eroberung_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Eroberung_03_34_00"); //You will be accompanied by two of my Templars.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Angar_Hueterklinge2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge2_Condition;
	information	= Info_Mod_Angar_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where'd you get the stuff from?";
};

FUNC INT Info_Mod_Angar_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge2_15_00"); //Where'd you get the stuff from?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge2_34_01"); //I'm not gonna make it that easy.
};

INSTANCE Info_Mod_Angar_Woher (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Woher_Condition;
	information	= Info_Mod_Angar_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why were you in the colony anyway?";
};

FUNC INT Info_Mod_Angar_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_00"); //Why were you in the colony anyway?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_01"); //I was a member of the Royal Guard then, but some people didn't like it.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_02"); //They framed me for a crime and the king believed them and threw me into the barrier.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_03"); //Same thing happened to mercenary Lee, I heard.
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_04"); //And then you went to the bog camp?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_05"); //No, the Brotherhood camp did not exist then. I made friends with Y' Berion in the old camp and later founded the camp with him and Cor Kalom.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_06"); //Y' Berion took over the training of the gurus while I trained the Templars in combat.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_07"); //After the death of Y' Berion, I continued to run the camp until the worst time was over.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_08"); //After that Cor Cadar, who is now the spiritual leader of the camp, supported me.
};

var int Angar_LastPetzCounter;
var int Angar_LastPetzCrime;

INSTANCE Info_Mod_Angar_PMSchulden (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PMSchulden_Condition;
	information 	= Info_Mod_Angar_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Angar_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Angar_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_00"); //Did you come to pay your fine?

	if (B_GetTotalPetzCounter(self) > Angar_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_01"); //I was wondering if you'd even dare come here!
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_02"); //Apparently, it's not the latest accusations!

		if (Angar_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_03"); //I warned you! The fine you have to pay now is higher!
			AI_Output (hero, self, "Info_Mod_Angar_PMAdd_15_00"); //How much?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Angar_LastPetzCounter);
		
			if (diff > 0)
			{
				Angar_Schulden = Angar_Schulden + (diff * 50);
			};
		
			if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Angar_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_04"); //You let me down so badly!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Angar_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_05"); //Some new things have come up.
		
		if (Angar_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_06"); //Suddenly, there's no one left to accuse you of murder.
		};
		
		if (Angar_LastPetzCrime == CRIME_THEFT)
		|| ( (Angar_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_07"); //No one remembers seeing you at a theft.
		};
		
		if (Angar_LastPetzCrime == CRIME_ATTACK)
		|| ( (Angar_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_08"); //There's no more witnesses to the fact that you've ever been in a fight.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_09"); //Apparently all the charges against you have vanished.
		};
		
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_10"); //I don't know what happened, but I warn you: don't play games with me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_11"); //Anyway, I've decided to waive your debt.
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_12"); //Make sure you don't get in trouble again.
	
			Angar_Schulden			= 0;
			Angar_LastPetzCounter 	= 0;
			Angar_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_13"); //One thing is clear: you still have to pay your penalty in full.
			B_Say_Gold (self, hero, Angar_Schulden);
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_14"); //So, what is it?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"I haven't got enough gold!",Info_Mod_Angar_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"How much was that again?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"I want to pay the penalty!",Info_Mod_Angar_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Angar_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Angar_PMSchulden_HowMuchAgain_15_00"); //How much was it again?
	B_Say_Gold (self, hero, Angar_Schulden);

	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"I haven't got enough gold!",Info_Mod_Angar_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"How much was that again?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"I want to pay the penalty!",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Angar_PETZMASTER   (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PETZMASTER_Condition;
	information 	= Info_Mod_Angar_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Angar_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PETZMASTER_Info()
{
	Angar_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_01"); //I'm glad you came to me before things got worse for you.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_02"); //Murder is a grave offence!

		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Angar_Schulden = Angar_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_03"); //Not to mention the other things you've done.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_06"); //I have no interest in putting you on the gallows.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_07"); //But it won't be easy to make people gracious again.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_08"); //You could show your repentance by paying a fine - of course the penalty must be appropriate.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_09"); //Good of you to come! You're accused of stealing! There are witnesses!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_10"); //I don't even want to talk about the other things I've heard.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_11"); //I will not tolerate such behaviour here in the camp!
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_12"); //You'll have to pay a fine to make up for your crime!
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_14"); //If you mess with our brothers, I'll have to hold you accountable.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_15"); //And I don't think it had to be the case with the sheep.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_16"); //If I let you get away with this, everybody's gonna do what they want.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_17"); //So you'll pay an appropriate fine - and the whole thing will be forgotten.
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_18"); //I've heard that you've been messing with our sheep.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_19"); //You do realize I can't let this go through.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_20"); //You'll have to pay compensation!
		
		Angar_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_15_21"); //How much?
	
	if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Angar_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PETZMASTER,"I haven't got enough gold!",Info_Mod_Angar_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PETZMASTER,"I want to pay the penalty!",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Angar_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayNow_15_00"); //I want to pay the fine!
	B_GiveInvItems (hero, self, itmi_gold, Angar_Schulden);
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayNow_34_01"); //Good! I will make sure that everyone in the camp learns about it - this will restore your reputation to some extent.

	B_GrantAbsolution (LOC_PSICAMP);
	
	Angar_Schulden			= 0;
	Angar_LastPetzCounter 	= 0;
	Angar_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Angar_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayLater_15_00"); //I don't have enough gold.
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_01"); //Then see to it that you acquire the gold as quickly as possible
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_02"); //And I'm warning you: if you add to your guilt, things will get worse for you.
	
	Angar_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Angar_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Angar_Lehrer (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lehrer_Condition;
	information	= Info_Mod_Angar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me something?";
};

FUNC INT Info_Mod_Angar_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Templer_Dabei == 1)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Angar_Lehrer_34_00"); //I can help you get stronger. Besides, I can teach you how to fight two-handed.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Cor Angar can help me become stronger and teach me how to handle two-handed people.");
};

INSTANCE Info_Mod_Angar_Lernen (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lernen_Condition;
	information	= Info_Mod_Angar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me something.";
};

FUNC INT Info_Mod_Angar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Lernen_15_00"); //Teach me something.
	AI_Output(self, hero, "Info_Mod_Angar_Lernen_34_01"); //What do you want to learn?

	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_5()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_1()
{
	B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Angar_Lernen);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

INSTANCE Info_Mod_Angar_Pickpocket (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Pickpocket_Condition;
	information	= Info_Mod_Angar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Angar_Pickpocket_Condition()
{
	C_Beklauen	(157, ItMi_Gold, 101);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_BACK, Info_Mod_Angar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Angar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Angar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
};

FUNC VOID Info_Mod_Angar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Angar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Angar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Angar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Angar_EXIT (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_EXIT_Condition;
	information	= Info_Mod_Angar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Angar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
