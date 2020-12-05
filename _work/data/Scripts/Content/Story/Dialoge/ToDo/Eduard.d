var int Bel_SteinReparieren;

INSTANCE Info_Mod_Eduard_Hi (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Hi_Condition;
	information	= Info_Mod_Eduard_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello. I'm new here.";
};

FUNC INT Info_Mod_Eduard_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Hi_15_00"); //Hello. I'm new here.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_01"); //So many new faces lately.... How can you remember all that?
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_02"); //A few weeks ago this was a cozy place - and then it's Bang! The barrier's gone, and all these people are dancing to strangers.
	AI_Output(self, hero, "Info_Mod_Eduard_Hi_32_03"); //There's been a shortage of everything since then, and I can't keep up with the guns. I hate blacksmithing.
};

INSTANCE Info_Mod_Eduard_SchmiedenLehren (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SchmiedenLehren_Condition;
	information	= Info_Mod_Eduard_SchmiedenLehren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can you teach me how to forge?";
};

FUNC INT Info_Mod_Eduard_SchmiedenLehren_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_SchmiedenLehren_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SchmiedenLehren_15_00"); //Can you teach me how to forge?
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_01"); //I can try. But don't expect too much.
	AI_Output(self, hero, "Info_Mod_Eduard_SchmiedenLehren_32_02"); //I myself have never had any training and I'm quite happy when I get the things somehow straight.
};

INSTANCE Info_Mod_Eduard_Haendler (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Haendler_Condition;
	information	= Info_Mod_Eduard_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do you sell forging accessories?";
};

FUNC INT Info_Mod_Eduard_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Haendler_15_00"); //Do you sell forging accessories?
	AI_Output(self, hero, "Info_Mod_Eduard_Haendler_32_01"); //I can sell you a little of my stuff, but not everything. Replenishment is always expensive and comes only stagnant.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_BELIARFESTUNG, "Eduard's gonna sell me some forging supplies and weapons.");
};

INSTANCE Info_Mod_Eduard_Belagerung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Belagerung_Condition;
	information	= Info_Mod_Eduard_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Everything all right with you?";
};

FUNC INT Info_Mod_Eduard_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Scar_HabBauanleitung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_00"); //Everything okay with you?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_01"); //I've been better! What do you want again?
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_02"); //I'm supposed to help you guys get things back on track. I was wondering if you had something to do for me.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_03"); //Yes, indeed.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_04"); //What's this about?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_05"); //I'm making the new batons I'm supposed to make for Scar. However, it says in the building instructions that the weapon gets a lot harder if you include four Trollhauer. I want you to bring me these.
	AI_Output(hero, self, "Info_Mod_Eduard_Belagerung_15_06"); //Where am I gonna find Trollhauer?
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_07"); //Down in the valley there is an abandoned hunting camp. If you're lucky, you'll find some there.
	AI_Output(self, hero, "Info_Mod_Eduard_Belagerung_32_08"); //But it's full of undead novices down there, so watch out.

	Mob_CreateItems	("JAEGERTRUHE", ItAt_TrollTooth, 4);
	
	Log_CreateTopic	(TOPIC_MOD_BEL_TROLLHAUER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_TROLLHAUER, "Eduard needs four Trollhauer for the staffs of Scar. There's an abandoned hunting camp in the valley, where there might still be some. However, it is teeming with undead novices.");
};

INSTANCE Info_Mod_Eduard_Trolle (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trolle_Condition;
	information	= Info_Mod_Eduard_Trolle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here you have the four Trollhauer.";
};

FUNC INT Info_Mod_Eduard_Trolle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Belagerung))
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trolle_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Trolle_15_00"); //Here you have the four Trollhauer.

	B_GiveInvItems	(hero, self, ItAt_TrollTooth, 4);

	AI_Output(self, hero, "Info_Mod_Eduard_Trolle_32_01"); //Thanks. You've been very helpful. Here, take these 200 gold pieces.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_GivePlayerXP	(300);
	
	B_LogEntry_More	(TOPIC_MOD_BEL_TROLLHAUER, TOPIC_MOD_BEL_BELAGERUNG, "I gave Eduard the trollhauer.", "I helped Eduard now.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_TROLLHAUER, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Eduard_MagischerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_MagischerDietrich_Condition;
	information	= Info_Mod_Eduard_MagischerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gomez sent me!";
};

FUNC INT Info_Mod_Eduard_MagischerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gomez_TruheMage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_MagischerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_MagischerDietrich_15_00"); //Gomez sent me! I want you to make a special dietrich for me, which can be transformed into a magic dietrich!
	AI_Output(self, hero, "Info_Mod_Eduard_MagischerDietrich_32_01"); //Don't the assignments ever end? (sighs) Well, bring me two crude steel and an old gold coin, and I'll make you this thing.

	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMiSwordRaw, 2);
	CreateInvItems	(Mod_518_SMK_Scar_MT, ItMi_OldCoin, 5);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "Eduard needs two crude steel and an old gold coin for the dietrich. I hope Scar's got the stuff he wants.");
};

INSTANCE Info_Mod_Eduard_ZutatenFuerDietrich (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZutatenFuerDietrich_Condition;
	information	= Info_Mod_Eduard_ZutatenFuerDietrich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the stuff!";
};

FUNC INT Info_Mod_Eduard_ZutatenFuerDietrich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_MagischerDietrich))
	&& (Npc_HasItems(hero, ItMiSwordRaw) >= 2)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZutatenFuerDietrich_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZutatenFuerDietrich_15_00"); //Here's the stuff!

	Npc_RemoveInvItems	(hero, ItMiSwordRaw, 2);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 1);

	B_ShowGivenThings	("Two crude steel and an old gold coin given");

	AI_Output(self, hero, "Info_Mod_Eduard_ZutatenFuerDietrich_32_01"); //Come back tomorrow and pick up the Dietrich.

	EduardDietrich_Day = Wld_GetDay();

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "The production of the dietrich takes one night. They want me to come back tomorrow.");
};

INSTANCE Info_Mod_Eduard_DietrichFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_DietrichFertig_Condition;
	information	= Info_Mod_Eduard_DietrichFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Is the lock pick ready?";
};

FUNC INT Info_Mod_Eduard_DietrichFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_ZutatenFuerDietrich))
	&& (EduardDietrich_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_DietrichFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_DietrichFertig_15_00"); //Is the lock pick ready?
	AI_Output(self, hero, "Info_Mod_Eduard_DietrichFertig_32_01"); //Yes, here. Now go away and leave me alone!

	B_GiveInvItems	(self, hero, ItKe_Lockpick_Mage_Unloaded, 1);

	B_LogEntry	(TOPIC_MOD_BEL_STAEBE, "I got the lock pick. Let's go to Gomez.");
};

INSTANCE Info_Mod_Eduard_Beliarstein (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Beliarstein_Condition;
	information	= Info_Mod_Eduard_Beliarstein_Info;
	permanent	= 0;
	important	= 0;
	description	= "I need your help.";
};

FUNC INT Info_Mod_Eduard_Beliarstein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fahim_HabStein))
	&& (Npc_HasItems(hero, ItMi_Beliarstein_Unloaded) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Beliarstein_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_00"); //I need your help.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_01"); //What's the matter?
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_02"); //Look at that rock.

	B_GiveInvItems	(hero, self, ItMi_Beliarstein_Unloaded, 1);

	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_03"); //Hmm... who has been badly affected.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_04"); //Can you fix it?
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_05"); //I've never done anything like this before, but maybe I have.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_06"); //I need two pieces of black ore to give the stone back its strength.
	AI_Output(hero, self, "Info_Mod_Eduard_Beliarstein_15_07"); //But there is no black ore here.
	AI_Output(self, hero, "Info_Mod_Eduard_Beliarstein_32_08"); //Turn to Raven, he knows about these things!

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Eduard can repair the stone, but he needs two pieces of black ore. Raven might know where I get it from.");
};

INSTANCE Info_Mod_Eduard_HabErz (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_HabErz_Condition;
	information	= Info_Mod_Eduard_HabErz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here you have the desired material!";
};

FUNC INT Info_Mod_Eduard_HabErz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_ErzFertig))
	&& (Npc_HasItems(hero, ItMi_Zeitspalt_Addon) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_HabErz_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_HabErz_15_00"); //Here you have the desired material!

	B_GiveInvItems	(hero, self, ItMi_Zeitspalt_Addon, 2);

	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_01"); //That's good news. I will now connect the black ore to the stone.
	AI_Output(self, hero, "Info_Mod_Eduard_HabErz_32_02"); //Wait till tomorrow and then come back!

	Bel_SteinReparieren = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "Eduard's fixing the stone now. He'll be done tomorrow.");
};

INSTANCE Info_Mod_Eduard_SteinFertig (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_SteinFertig_Condition;
	information	= Info_Mod_Eduard_SteinFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "And?";
};

FUNC INT Info_Mod_Eduard_SteinFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_HabErz))
	&& (Wld_GetDay() > Bel_SteinReparieren)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_SteinFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_00"); //And?
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_01"); //It took me all night, but the stone pulsates with energy again!
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_02"); //Here you have it!

	B_GiveInvItems	(self, hero, ItMi_Beliarstein, 1);

	AI_Output(hero, self, "Info_Mod_Eduard_SteinFertig_15_03"); //I will now return to Fahim.
	AI_Output(self, hero, "Info_Mod_Eduard_SteinFertig_32_04"); //Do that.

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_BEL_BELIARSCHREIN, "The stone is repaired and pulsates with energy again. Now I should go back to Fahim.");
};

INSTANCE Info_Mod_Eduard_ToteNovizen (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ToteNovizen_Condition;
	information	= Info_Mod_Eduard_ToteNovizen_Info;
	permanent	= 0;
	important	= 0;
	description	= "I have some questions for you.";
};

FUNC INT Info_Mod_Eduard_ToteNovizen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ToteNovizen_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_00"); //I have some questions for you.
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_01"); //(completely finished) Wh-- Wh-- What do you want? I've had enough of what happened! These shadows....
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_02"); //What shadows?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_03"); //(shudders) I saw a great shadow last night.... Wings fluttered.... a scream...
	AI_Output(hero, self, "Info_Mod_Eduard_ToteNovizen_15_04"); //What was it?
	AI_Output(self, hero, "Info_Mod_Eduard_ToteNovizen_32_05"); //demon I think it was a.... Demon!

	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "Eduard saw a shadow. He thinks it was a demon. I should go to Raven.");
};

INSTANCE Info_Mod_Eduard_Skinner (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Skinner_Condition;
	information	= Info_Mod_Eduard_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "I bring the dream calls from Skinner.";
};

FUNC INT Info_Mod_Eduard_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 8)
	&& (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Skinner_15_00"); //I bring the dream calls from Skinner. 80 gold apiece.

	B_GiveInvItems	(hero, self, ItMi_Traumruf, 8);

	B_UseItem	(self, ItMi_Traumruf);

	AI_Output(self, hero, "Info_Mod_Eduard_Skinner_32_01"); //Ahh, gorgeous and so cheap. Got just enough gold coins for eight.

	B_GiveInvItems	(self, hero, ItMi_Gold, 600);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "I was with Eduard. The dream cries seem to cloud him pretty much.");

	Mod_EduardZuWenigGoldCounter = 3600;
	
	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_ZuWenigGold (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_ZuWenigGold_Condition;
	information	= Info_Mod_Eduard_ZuWenigGold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, 600 gold coins is not enough.";
};

FUNC INT Info_Mod_Eduard_ZuWenigGold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Skinner))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Mod_EduardZuWenigGoldCounter > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_15_00"); //Hey, 600 gold coins is not enough.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_32_01"); //Is that so? Haven't been so into arithmetic since smoking. How much do I owe you?

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "120 gold.", Info_Mod_Eduard_ZuWenigGold_C);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "80 gold.", Info_Mod_Eduard_ZuWenigGold_B);
	Info_AddChoice	(Info_Mod_Eduard_ZuWenigGold, "40 gold.", Info_Mod_Eduard_ZuWenigGold_A);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_C()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_C_15_00"); //120 gold.
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_C_32_01"); //Now, wait a minute. There's a few coins missing. I'll give you three chunks of ore instead, okay?

	B_GiveInvItems	(self, hero, ItMi_Nugget, 3);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_E()
{
	AI_Output(self, hero, "Info_Mod_Eduard_ZuWenigGold_E_32_00"); //Oh, I've barely got that much left.
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_B()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_B_15_00"); //80 gold.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Eduard_ZuWenigGold_A()
{
	AI_Output(hero, self, "Info_Mod_Eduard_ZuWenigGold_A_15_00"); //40 gold.

	Info_Mod_Eduard_ZuWenigGold_E();

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	Info_ClearChoices	(Info_Mod_Eduard_ZuWenigGold);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_AlteMineQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_00"); //Yeah, yeah, I'm working on it. But this strange ore mixture from the mine is really hard.
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest_32_01"); //It'll take me at least another half day.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 60);
};

INSTANCE Info_Mod_Eduard_AlteMineQuest2 (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_AlteMineQuest2_Condition;
	information	= Info_Mod_Eduard_AlteMineQuest2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Eduard_AlteMineQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_AlteMineQuest))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_AlteMineQuest2_Info()
{
	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_00"); //Here. It's a really great piece of craftsmanship, I'll tell you that. I'm getting better and better.

	if (hero.guild == GIL_KDF)
	{
		B_GiveInvItems	(self, hero, ItAr_FinsternisPanzerhandschuh, 1);
	}
	else
	{
		B_GiveInvItems	(self, hero, ItAr_BoeserBlickAbwender, 1);
	};

	AI_Output(self, hero, "Info_Mod_Eduard_AlteMineQuest2_32_01"); //I don't know what hidden qualities are hidden in this modified ore, but this good piece will certainly be useful to you somehow.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Eduard_Ruestung (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Ruestung_Condition;
	information	= Info_Mod_Eduard_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Can I get better armor from you?";
};

FUNC INT Info_Mod_Eduard_Ruestung_Condition()
{
	if ((Mod_Gilde == 15)
	|| (Mod_Gilde == 12))
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_15_00"); //Can I get better armor from you?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 15)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_02"); //I've heard that on the way to the water magician's excavation site there is supposed to be a nightmare. With its fur I could certainly improve your black war armor a little bit.
	
		Mod_ZweiteVerbesserung = TRUE;

		Eduard_SpawnUpOne = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "On the way to the water magician's excavation site there will be a nightmare, whose fur Eduard can use to improve my black warrior armor.");
	};

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	&& (Mod_Gilde == 12)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_32_03"); //I hear there's a shadow snapper at the pass in Khorinis. With his skin, I could certainly improve your black novice robe a little bit.
	
		Mod_ErsteVerbesserung = TRUE;

		Eduard_SpawnUpTwo = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "At the pass near Khorinis there is said to be a shadow snapper, whose skin Eduard can use to improve my black novice robe.");
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
	Info_AddChoice	(Info_Mod_Eduard_Ruestung, DIALOG_BACK, Info_Mod_Eduard_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 15)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Improve Black War Armour", Info_Mod_Eduard_Ruestung_SKR_S);
	};

	if (Mod_ErsteVerbesserung == TRUE)
	&& (Mod_Gilde == 12)
	{
		Info_AddChoice	(Info_Mod_Eduard_Ruestung, "Improve Black Novice Robe", Info_Mod_Eduard_Ruestung_SNOV_S);
	};
};

FUNC VOID Info_Mod_Eduard_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SKR_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SKR_S_15_00"); //Improve my black armour.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, ItAr_SMK_L) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_01"); //All clear.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_SMK_L, 1);

		CreateInvItems	(self, ItAr_SKR_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SKR_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SKR_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_SMK_L) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_02"); //You must have some black armour or I won't be able to fix it for you.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SKR_S_32_03"); //If you don't have the nightmare coat, I can't improve your armor.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

FUNC VOID Info_Mod_Eduard_Ruestung_SNOV_S ()
{
	AI_Output(hero, self, "Info_Mod_Eduard_Ruestung_SNOV_S_15_00"); //Improve my black novice robe.

	if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 1)
	&& (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_01"); //All clear.

		Npc_RemoveInvItems	(hero, ItAt_Schattensnapperhaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_NOV_DMB_01, 1);

		CreateInvItems	(self, ItAr_SNOV_S, 1);

		B_GiveInvItems	(self, hero, ItAr_SNOV_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_SNOV_S);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_NOV_DMB_01) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_02"); //You must have a black novitiate sample or I won't be able to fix it for you.
	}
	else if (Npc_HasItems(hero, ItAt_Schattensnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Eduard_Ruestung_SNOV_S_32_03"); //If you don't have the shadow snapper skin, I can't improve your armor.
	};

	Info_ClearChoices	(Info_Mod_Eduard_Ruestung);
};

instance Info_Mod_Eduard_TeachCOMMON (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr          	= 1;
	condition	= Info_Mod_Eduard_TeachCOMMON_Condition;
	information	= Info_Mod_Eduard_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Learn to forge", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Eduard_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Eduard_SchmiedenLehren))
	{
		return TRUE;
	};
};

func void Info_Mod_Eduard_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Eduard_TeachCOMMON_15_00"); //Teach me how to forge a sword!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_01"); //It's simple: Get yourself a piece of crude steel, hold it in the fire until it glows.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_02"); //Then you'll strike the blade right on the anvil.
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_03"); //Make sure that the blade does not get too cold. You only have a few minutes to work on your weapon...
		AI_Output (self, other, "Info_Mod_Eduard_TeachCOMMON_32_04"); //You'll find out the rest - just practice stuff.
	};
};

INSTANCE Info_Mod_Eduard_Trade (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Trade_Condition;
	information	= Info_Mod_Eduard_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Eduard_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Eduard_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Eduard_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Eduard_Pickpocket (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_Pickpocket_Condition;
	information	= Info_Mod_Eduard_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Eduard_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_BACK, Info_Mod_Eduard_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Eduard_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Eduard_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Eduard_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Eduard_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Eduard_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Eduard_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Eduard_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Eduard_EXIT (C_INFO)
{
	npc		= Mod_1027_SMK_Eduard_MT;
	nr		= 1;
	condition	= Info_Mod_Eduard_EXIT_Condition;
	information	= Info_Mod_Eduard_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Eduard_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Eduard_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
