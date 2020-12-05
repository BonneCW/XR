INSTANCE Info_Mod_Botschek_Hi (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Hi_Condition;
	information	= Info_Mod_Botschek_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Botschek_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_00"); //Ahh, a new face. Greetings. Another daring adventurer in search of fame and wealth.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_01"); //Fame and wealth? There's more to this place than mud and ruins?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_02"); //What a question! Nowhere else do you find more hidden treasures and artifacts than here.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_03"); //Und die Kneipe "Golden liquid manure" ist das Tor zu diesen.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_04"); //Here you will find everything you need to recover the legendary treasures of the moor.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_05"); //Legendary? Well...
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_06"); //Ohh, an ignoramus. Many centuries ago, this was the seat of a mysterious community.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_07"); //She cared for many treasures and divine artifacts and built magnificent buildings you can't imagine in your wildest dreams.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_08"); //This was a sacred piece of land.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_09"); //Well, looks more like fucking mud.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_10"); //Well, it fucking hits.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_11"); //Because one day, enemies attacked the area in search of the treasures and divine gifts.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_12"); //For a long time, the community fiercely resisted them, but in the end it was unable to survive against the overwhelming majority of the attackers.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_13"); //In their misery, they took the extreme decision to protect the artifacts from the enemy and sent a terrible curse over the area.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_14"); //Everyone who was on top of it was condemned to eternal undeath.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_15"); //But the treasures of that time are still hidden there.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_16"); //Yes, and many a knight of fortune has already brought prosperity here.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_17"); //Or rot in the mud.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_18"); //Well, there is a certain occupational risk here already as an adventurer.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_19"); //Aber um die Gefahren zu mindern, habe ich diese Perle hier eingerichtet, die Schenke "Golden liquid manure".
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_20"); //So, so, so, the first pioneer for centuries.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_21"); //No, it's not exactly like that.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_22"); //Until two decades ago, there was a settlement here that was protected by a magical barrier.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_23"); //It was to prevent the swamp from spreading.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_24"); //So the moor is growing?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_25"); //Yeah, it does. It is said that every soul that falls victim to the bog still increases its power.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_26"); //Well, wouldn't it be wise to avoid the moor, then?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_27"); //Uh... well...
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_28"); //All right, but what happened to this settlement 20 years ago?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_29"); //Yeah, right, her ruins are still standing on the edge of the swamp.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_30"); //One day, it is said, the bog took possession of the town governor of the settlement.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_31"); //He stole the magical focus that fed the barrier, ran into the moor and was never seen again.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_32"); //And since then, nothing has been done to contain the moor?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_33"); //Well, from a search party that they sent to the moor shortly afterwards, no human soul has ever been seen again.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_34"); //And other focus stones they used couldn't restore the barrier.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_35"); //It seems as if the moor has become all the more powerful and influential since then.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_36"); //The way you report, it sounds like the moor has a mind of its own.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_37"); //Yeah, it almost seems so.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_38"); //Some claim to have seen demonic creatures in the moor, sinister creatures following the will of the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_39"); //Everything seems to change it, to overcome the boundaries between the spheres of this world and those demonic worlds.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_40"); //The inanimate awakens to consciousness and the usual laws of nature no longer apply.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_41"); //Can you tell me more about the moor, its dangers and its treasures?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_42"); //Yeah, I can do that. Against ringing gold, of course....
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_43"); //First arouse curiosity and then collect, understand. How much per question?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_44"); //That depends on the question. Good information for sounding coins.

	B_StartOtherRoutine	(Mod_7655_OUT_Abenteurer_REL,	"ABENTEURER");
	B_StartOtherRoutine	(Mod_1623_OUT_Chani_REL,	"ABENTEURER");
};

INSTANCE Info_Mod_Botschek_Gaertner (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Gaertner_Condition;
	information	= Info_Mod_Botschek_Gaertner_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got the apples.";
};

FUNC INT Info_Mod_Botschek_Gaertner_Condition()
{
	if (Npc_HasItems(hero, ItFo_Apple) >= 20)
	&& (Mod_Botschek_Gaertner == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Gaertner_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_00"); //I got the apples.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_01"); //Very nice.
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_02"); //But the apple trees were very defensive.
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_03"); //I had to be more physical than usual when picking apples.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_04"); //What, the apple trees now?!
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_05"); //But you can't grow any more vegetables or fruit without it falling over everyone in the area sooner or later.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_06"); //In the future, I'll have to buy my fruit in town. (sighs)
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_07"); //The apples?

	B_GiveInvItems	(hero, self, ItFo_Apple, 20);

	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_08"); //Ohh, yeah, thanks. Here, some coins for your trouble... and a good sip of the last bottle of cider I have left. Cheers!

	CreateInvItems	(hero, ItFo_Apfelmost, 1);
	CreateInvItems	(hero, ItMi_Gold, 200);

	B_ShowGivenThings	("200 Gold and cider obtained");

	B_GivePlayerXP	(300);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Botschek_Wasserleichen (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Wasserleichen_Condition;
	information	= Info_Mod_Botschek_Wasserleichen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Wasserleichen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Gaertner))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Wasserleichen_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_00"); //Greetings. You've done a good job with the apples.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_01"); //So I might have another thing you could do for me.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_02"); //I'd bring you 300 coins.
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen_15_03"); //I'm all ears.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_04"); //Now, at the other end of the lake, corpses rise up from the underground again and again at night.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_05"); //I had sent men there a few months ago who killed them, but shortly afterwards new ones rose out of the mud.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_06"); //I just don't know where they keep coming from, but it's not good if too many of them gather there....
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen_15_07"); //Before they march into the tavern one day.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_08"); //Yeah. Besides, I've had fewer customers for some time now.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_09"); //I don't know if it has anything to do with that, but I still don't want to know the walking corpses in my neighborhood.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_10"); //Two weeks ago I had sent another adventurer there, but he must have got cold feet and just disappeared.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_11"); //So, if you can get rid of the drownings, you'll get 300 coins as agreed.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_12"); //And while you're at it, take a good look around.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_13"); //If you find any clues to the origin of the evil, I'd have some extra gold coins jumped.

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, "On the lake shore opposite the tavern' Zur goldenen Gülle' (' The Golden Slurry'), undead people rise out of the underground at night. Botschek asked me to accept hers. Should be something to do with it. However, since the origin of the drowned corpses lies in the dark, I should keep my eyes open. If I find out anything, Botschek promised me a bonus.");
};

INSTANCE Info_Mod_Botschek_Wasserleichen2 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Wasserleichen2_Condition;
	information	= Info_Mod_Botschek_Wasserleichen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "The drowned bodies of water are history.";
};

FUNC INT Info_Mod_Botschek_Wasserleichen2_Condition()
{
	if (Mod_Botschek_Wasserleichen >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Wasserleichen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen2_15_00"); //The drowned bodies of water are history.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_01"); //Excellent, here as agreed the 300 gold coins.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_02"); //Well, did you notice anything unusual? Any new leads?
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen2_15_03"); //Yeah, a homicidal Alkor who tried to kill me with a raw blade.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_04"); //What?! But... what did he want? He wasn't that drunk when he last left the pub.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_05"); //Has he finally lost his mind after all?

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(350);
};

INSTANCE Info_Mod_Botschek_Ritualdolch (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch_Condition;
	information	= Info_Mod_Botschek_Ritualdolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "For a madman, however, he had quite a lot of gold with him (.... )";
};

FUNC INT Info_Mod_Botschek_Ritualdolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Wasserleichen2))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Frost) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_00"); //For a madman he had quite a lot of gold with him.... and then this dagger.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_01"); //What?! Let me see that.

	B_GiveInvItems	(hero, self, ItMw_Ritualdolch_Frost, 1);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_02"); //That... this is the adventurer's dagger I sent off last.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_03"); //But... he would never have parted with it voluntarily.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_04"); //Well, it looks like we found the explanation. He must have gotten more cold than just his feet...
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_05"); //(enthused) as well as some others who crossed Alkor's path.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_06"); //Hence its much gold... and hence all the bodies.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_07"); //That son of a bitch! All this trouble just because of that murderer and ghoul.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_08"); //(to myself, a bit quieter) And all the income that I have missed.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_09"); //(again to the hero) I hope he has received his just punishment....
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_10"); //You bet the cold river bed.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_11"); //Good! Unbelievable... such a bastard!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_12"); //(again) Well, by all means, you have done your thing more than well and have indeed freed me from a great evil.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_13"); //Here, take another 300 coins.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Botschek_Ritualdolch2 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch2_Condition;
	information	= Info_Mod_Botschek_Ritualdolch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "And the dagger?";
};

FUNC INT Info_Mod_Botschek_Ritualdolch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch2_15_00"); //And the dagger?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_01"); //What? Ohh, excuse me, you've got him back.

	B_GiveInvItems	(self, hero, ItMw_Ritualdolch_Frost, 1);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_02"); //Yeah. A really interesting piece.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_03"); //I would have loved to buy it from the unfortunate man who had possessed it before.... but he didn't want to.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_04"); //And I could have sworn that the illustration on the magic board resembled the dagger....
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch2_15_05"); //A magic board?!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_06"); //(again to the hero) What? Uh, yeah, that's the board. The most unusual artifact ever recovered from the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_07"); //It shows hieroglyphs that no one is able to decipher.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_08"); //The amazing thing, however, is that they change again and again, as well as the images that can sometimes be seen on them, even though very rarely.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_09"); //And once - so I could swear - the picture of this dagger was visible.
};

INSTANCE Info_Mod_Botschek_Ritualdolch3 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch3_Condition;
	information	= Info_Mod_Botschek_Ritualdolch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Can I take a look at the blackboard?";
};

FUNC INT Info_Mod_Botschek_Ritualdolch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_00"); //Can I take a look at the blackboard?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_01"); //My unique artifact? Hmm, since you've helped me in some ways, I want you to enjoy it.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_02"); //But you won't recognize much anyway... wait. (counts the board) Here.... but don't touch it.

	B_ShowGivenThings	("Stone tablet preserved");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_03"); //These characters.... reminds me of the writings of the builders.... yes.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_04"); //What?! You can decipher the hieroglyphs?
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_05"); //Ja ... einzelne Passagen. Da steht ... "who dares to venture into the heart of the moor."Ja ... einzelne Passagen. Da steht ... "dem Übermütigen, der es wagt, ins Herz des Moores vorzustoßen.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_06"); //Die Klingen, die das Blut vergossen, um ewige Verdammnis über ..."
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_07"); //Dann kann ich nichts mehr entziffern ... aber doch, hier: "However, he must overcome the servant of torture and death."
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_08"); //Amazing. However, all this sounds very mysterious and confusing.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_09"); //It seems to contain hints about past events... about artifacts and whereabouts.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_10"); //Next time you go to the moor, you should have those passages in your head. Maybe you'll find something undiscovered so far.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_11"); //Occasionally happens....

	B_ShowGivenThings	("Stone tablet given");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_12"); //But let me know if you find anything, maybe my stone tablet will have some new puzzles to solve....

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Botschek believes to have recognized the dagger in a representation on his magic board. This is written in a font that is very similar to the typeface of the builders. The texts displayed on it change again and again in a magical way. I was able to translate some of the current text and put it here. There was to be read:'.... who dares to venture into the heart of the moor. The blades that shed the blood to perpetuate damnation over the... But he must overcome the servant of torture and death. Botschek said this could contain hidden clues about the moor. If I make a detour there, I should have a good look around and let Botschek know when I find something.");

	Wld_InsertNpc	(Mod_7656_OUT_Suchender_REL,	"REL_MOOR_037");
};

INSTANCE Info_Mod_Botschek_Ritualdolch4 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch4_Condition;
	information	= Info_Mod_Botschek_Ritualdolch4_Info;
	permanent	= 0;
	important	= 0;
	description	= "I met a demonic figure in the bog (... )";
};

FUNC INT Info_Mod_Botschek_Ritualdolch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch3))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Seuche) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch4_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch4_15_00"); //In the moor I met a demonic figure carrying another dagger.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_01"); //Unbelievable! Let me see that.

	B_ShowGivenThings	("Ritual dagger of infirmity given");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_02"); //He looks a lot like the first one. And you found him in a place where the blackboard gave information?

	B_ShowGivenThings	("Ritual dagger of infirmity preserved");

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch4_15_03"); //It appears to be the case.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_04"); //Fantastic! Then the magic tablet actually reveals important clues about the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_05"); //I can't wait to see her mapped to new knowledge.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_06"); //When the time comes, I'll let you know immediately.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Botschek was beside himself with enthusiasm about the find. He promised to let me know as soon as possible if the board shows any new information.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Botschek_Ritualdolch5 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch5_Condition;
	information	= Info_Mod_Botschek_Ritualdolch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch4))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_00"); //Ahh, excellent that you're here right now.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_01"); //The magic board has recently changed its lyrics again. Look!

	B_ShowGivenThings	("Stone tablet preserved");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch5_15_02"); //Hmm ... "the expert of the secret arts soaks his weapon in poison, which is obtained from treacherous broth. It is important to resist this."

	B_ShowGivenThings	("Stone tablet given");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_03"); //Poisonous brew?! As if the moor wasn't poisonous enough.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_04"); //Well, you know what to look out for. Take care of yourself.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... the expert of the secret arts soaks his weapon in poison, which is obtained from treacherous broth. It is important to resist this. Sounds like a brewmaster with a bad taste.");

	Wld_InsertNpc	(Mod_7657_OUT_Suchender_REL,	"REL_MOOR_186");
};

INSTANCE Info_Mod_Botschek_Ritualdolch6 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch6_Condition;
	information	= Info_Mod_Botschek_Ritualdolch6_Info;
	permanent	= 0;
	important	= 0;
	description	= "The brewmaster of poisons was once.";
};

FUNC INT Info_Mod_Botschek_Ritualdolch6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch5))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Gift) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch6_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch6_15_00"); //The brewmaster of poisons was once.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_01"); //And you're a dagger richer, I suppose? Excellent.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_02"); //Many will no longer be the ones to be found.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_03"); //I hope the blackboard soon reveals new secrets.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Now it is time to wait for a new revelation.");

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Botschek_Ritualdolch7 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch7_Condition;
	information	= Info_Mod_Botschek_Ritualdolch7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch6))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch7_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_00"); //Ha, it's time again. The magical blackboard has just changed again.

	B_ShowGivenThings	("Stone tablet preserved");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch7_15_01"); //Also "... metal, but what grows out of the mud leads to the goal. Let it become a part of you."

	B_ShowGivenThings	("Stone tablet given");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_02"); //Ohh, that's very mysterious. What's that supposed to mean?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_03"); //Well, this time you won't be able to avoid carefully following every instruction of the environment and thinking about corners.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_04"); //I'm curious to see how quickly you solve this riddle.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... metal, but what grows out of the mud leads to the goal. Let it be a part of you. Sounds very weird. Botschek said I should follow up on any trend-setting clue in the area and think around corners. I don't think it's going to be that easy this time.");
};

INSTANCE Info_Mod_Botschek_Ritualdolch8 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch8_Condition;
	information	= Info_Mod_Botschek_Ritualdolch8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch7))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Versengen) == 1)
	&& (Mod_Botschek_Wasserleichen == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch8_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_00"); //You already have the blade?!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_01"); //Respect! It must have been a hard and tricky piece of work.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_02"); //Well, was indeed a different league than wild fruit...
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_03"); //In the meantime, thanks to your translations and the daggers found, I was able to complete old texts that now make sense.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_04"); //Obviously there were five ritual daggers, each with a different violence.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_05"); //The highest dignitaries of the cult used it to sacrifice their blood to bring the devastating chaos over this land.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_06"); //As you can easily see today, they were successful.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_07"); //This was also felt by the besiegers of that time, all of whom lost their lives to the undead.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_08"); //For absolute chaos, however, the authors are still taking a rather planned approach.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_09"); //Yeah, that's right. Their last will to bring chaos and devastate the country seems to be all they have left of their original existence.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_10"); //In the end, however, they are no longer slaves to the cursed moor.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_11"); //At least they were.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_12"); //Yeah, that's right. Since there is only one ritual dagger left to be found, there won't be many of them left.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_13"); //Strangely enough, the moor seems to have lost hardly any of its power.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_14"); //There must be something else...
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_15"); //(again to the hero) Well, by all means, we only need a text.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_16"); //As soon as it's ready... you know what I mean.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Now there's only one dagger left. As soon as Botschek's blackboard gives new clues, it's time.");

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Botschek_Ritualdolch9 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch9_Condition;
	information	= Info_Mod_Botschek_Ritualdolch9_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch8))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch9_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_00"); //(happy) Finally!
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_01"); //The last passage?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_02"); //Let's hope so. Here, look at her.

	B_ShowGivenThings	("Stone tablet preserved");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_03"); //Da steht "... the servant of arms soaks his environment in blood. Will you defy his steel?".

	B_ShowGivenThings	("Stone tablet given");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_04"); //Well, that's more clear.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_05"); //After the last puzzle, hopefully you should have less trouble here.... and hold the last of the blades in your hands soon.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_06"); //And then what?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_07"); //Then you will be able to reach a part of the moor that has not been accessible until now... maybe even penetrate his heart.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_08"); //You could change the fate of the entire area in an unpredictable way.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_09"); //You just have to find the entrance. Good luck with that.... and come back alive.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... the servant of arms soaks his environment in blood. Will you defy his steel? Sounds like a straightforward task. As soon as I also have this dagger, I should be able to open an entrance that leads me into the heart of the moor.");

	Wld_InsertNpc	(Mod_7658_OUT_Suchender_REL,	"REL_MOOR_187");
};

INSTANCE Info_Mod_Botschek_Ritualdolch10 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch10_Condition;
	information	= Info_Mod_Botschek_Ritualdolch10_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch9))
	&& (Npc_HasItems(hero, ItMi_Focus_Moor) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch10_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_00"); //What happened to Beliar? The bog seems to be raging....
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_01"); //I gained access to a previously inaccessible hall in the bog.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_02"); //There I took away this focus from a lively podium with great difficulty.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_03"); //Let me see that.

	B_ShowGivenThings	("Focused");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_04"); //(amazed) The.... must be the focus that once protected the settlement, feeding its magical barrier with energy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_05"); //And you're saying the moor used it for itself?

	B_ShowGivenThings	("Maintain focus");

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_06"); //It looked like it.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_07"); //Oh, yes... Well, that would explain why the moor gained so much power after the collapse of the settlement and why it hardly lost any of its power after the death of its servants.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_08"); //The monster hordes it now sends to us are probably a last rebel after you snatched his most powerful artifact from him.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_09"); //What should we do now? If this is indeed the focus of the settlement....
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_10"); //... right, then the protection barrier of that time could arise again by its insertion into the old platform.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_11"); //It won't be too difficult to find it in the ruins of the old settlement. It is the round building in the middle.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_12"); //I hope the pedestal still works. But hurry up. We can't hold out on the bog creatures forever.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "If I place the focus on the pedestal within the collapsed settlement, the protective barrier could arise anew.");
};

INSTANCE Info_Mod_Botschek_Ritualdolch11 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch11_Condition;
	information	= Info_Mod_Botschek_Ritualdolch11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch11_Condition()
{
	if (Mod_Botschek_Wasserleichen == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch11_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_00"); //Unglaublich! Du hast es geschafft. Der Fluch des Moores ist gebrochen, die Schutzbarriere steht, die Umgebung nun fast ohne Gefahren.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch11_15_01"); //Ja, ein Besuch des Moores wird zwar sicher immer noch kein Spaziergang sein, aber zumindest hinter der Barriere kann man nun dem Gras beim Wachsen zusehen.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_02"); //Das wird gewiss mehr Menschen herlocken ... vielleicht wird irgendwann die Siedlung wieder errichtet.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_03"); //Auf jeden Fall bedeutet es mehr Kundschaft. Hier, nimm also dieses Gold zum Dank.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_04"); //Und die magische Tafel hat für mich auch keinen Nutzen mehr. Vielleicht kannst du noch etwas mit ihr anfangen.

	B_GiveInvItems	(self, hero, ItWr_BotschekTafel, 1);

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch11_15_05"); //Mal schauen, danke. 
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_06"); //Du bist auf jeden Fall jederzeit willkommen in der Schenke "Golden liquid manure".
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_07"); //Bestimmt sehen wir uns mal wieder. Und bis dahin ... pass auf dich auf.

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	CurrentNQ += 1;

	B_StartOtherRoutine	(Mod_504_PAL_Parcival_REL,	"VORKNEIPE");
};

INSTANCE Info_Mod_Botschek_Kneipe (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Kneipe_Condition;
	information	= Info_Mod_Botschek_Kneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Your bar is a strange place...";
};

FUNC INT Info_Mod_Botschek_Kneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Kneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Kneipe_15_00"); //Your bar is a strange place... the separate rooms upstairs, I mean.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_01"); //Oh, that makes sense.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_02"); //At the latest when the wind is blowing badly and poisonous clouds of smoke from the moor cover everything underneath, you are happy about it.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_03"); //There is also an alchemy table.... where Viran can taste his potions and make herbs for the boys in the tavern.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_04"); //Oh yes, and of course the adventurers there can enjoy themselves undisturbed with our girl friend Chani.
};

INSTANCE Info_Mod_Botschek_Informationen (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Informationen_Condition;
	information	= Info_Mod_Botschek_Informationen_Info;
	permanent	= 1;
	important	= 0;
	description	= "I need some information.";
};

FUNC INT Info_Mod_Botschek_Informationen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_Infos()
{
	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, DIALOG_BACK, Info_Mod_Botschek_Informationen_BACK);

	if (Mod_Botschek_Info_F == FALSE)
	&& (Mod_Botschek_Info_E == TRUE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Where did he go last?", Info_Mod_Botschek_Informationen_F);
	};
	if (Mod_Botschek_Info_E == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sancho_Dam2))
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Does the word' Dam' mean anything to you?", Info_Mod_Botschek_Informationen_E);
	};
	if (Mod_Botschek_Info_D == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Anything to do?", Info_Mod_Botschek_Informationen_D);
	};
	if (Mod_Botschek_Info_C == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "What can you tell me about the people here?", Info_Mod_Botschek_Informationen_C);
	};
	if (Mod_Botschek_Info_B == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Where can I get it?", Info_Mod_Botschek_Informationen_B);
	};
	if (Mod_Botschek_Info_A == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "What dangers do I have to watch out for in the bog?", Info_Mod_Botschek_Informationen_A);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_15_00"); //I need some information.

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_2()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_2_15_00"); //Another time.
};

FUNC VOID Info_Mod_Botschek_Informationen_1()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_1_15_00"); //Here.
};

FUNC VOID Info_Mod_Botschek_Informationen_BACK()
{
	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_F()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_F_15_00"); //Where did he go last?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_F_16_01"); //You seem to be very interested... makes 60 coins.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Another time.", Info_Mod_Botschek_Informationen_F_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 60)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Here", Info_Mod_Botschek_Informationen_F_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_F_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_F_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 60);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_F_1_16_00"); //He disappeared towards the village ruins. That's all I know.

	Mod_Botschek_Info_F = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_E()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_E_15_00"); //Does the word' Dam' mean anything to you? Perhaps in connection with an amulet?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_16_01"); //Dam and amulet? Hmm, there was someone... costs 40 coins.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Another time.", Info_Mod_Botschek_Informationen_E_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 40)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Here", Info_Mod_Botschek_Informationen_E_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_E_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_E_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 40);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_00"); //There used to be a treasure hunter.... as I was told later.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_01"); //In the beginning he did not attract attention, searched for artifacts and treasures and drunk here like most people.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_02"); //But then he became more and more special, he talked to himself, withdrew from the others and also deteriorated physically and visibly? until he didn't come back after his last trip a few months ago.

	Mod_Botschek_Info_E = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_D()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_00"); //Anything to do?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_01"); //Yeah, I actually have something that needs to be done. Of course, this information does not cost anything...
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_02"); //First and foremost, perhaps the harvesting and weeding...
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_03"); //What?! You want me to pick turnips now?!
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_04"); //No turnips, apples. I need some for the cider.
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_05"); //And weeds?!
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_06"); //Well, the weeds have become quite obtrusive.... and not completely harmless.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_07"); //The reason we have a new cook. The old man hasn't returned from gathering ingredients.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_08"); //And since I would hate to lose Balam, I'd rather send someone who can handle a weapon and not just the kitchen knife.
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_09"); //(half-sounding) play the gardener.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_10"); //I need about 20 apples. The garden is right by the lake. Good luck.

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_GAERTNER, "Botschek wants me to go to the small garden by the lake, remove aggressive weeds and harvest 20 apples.");

	Mod_Botschek_Info_D = TRUE;

	Wld_InsertNpc	(Alraune_Botschek_03,	"FP_ROAM_MOOR_BOTSCHEK_ALRAUNE_03");
	Wld_InsertNpc	(Apfelbaum_Botschek_03,	"FP_ROAM_MOOR_BOTSCHEK_APFELBAUM_03");

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_C()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_C_15_00"); //What can you tell me about the people here?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_16_01"); //Some interesting and useful information. Only 30 gold pieces for you.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Another time.", Info_Mod_Botschek_Informationen_C_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 30)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Here", Info_Mod_Botschek_Informationen_C_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_C_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_C_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 30);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_00"); //Many in my pub are former prisoners of the colony who try their luck here, where otherwise only a few people sit down.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_01"); //My new chef Balam, for example, used to cook for the ore barons, can you imagine that? (laughs)
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_02"); //Yes, and Chani once kept the gurus happy in the swamp and now the adventurers here.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_03"); //She can do her business here undisturbed and I get my share....
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_04"); //Viran and Harlok also come from the swamp camp.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_05"); //They want to start their own business by cultivating bogweed here.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_06"); //Every now and then Viran tries out new ideas for swampy herbs at the alchemy table upstairs.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_07"); //Every now and then something good comes out of it...
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_08"); //Wedge comes from the New Camp of the colony and has seen himself as a bandit on the theft arts.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_09"); //That's what made him the smartest treasure hunter here.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_10"); //No one understands how to proceed with such finesse and remain undiscovered.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_11"); //The adventurer Alkor in turn is one for the rough... and he gets rough sometimes when he's had too much to drink.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_12"); //Well, I'm definitely surprised that the booze nose hasn't entered the eternal hunting grounds of the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_13"); //With all the valuable stuff he has brought along here, he must have already made one or two dangerous expeditions in the moor...
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_14"); //Oh yes, I almost forgot our guests of honour.... in the service of the King. (laughs)
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_15"); //They usually stand outside in front of the tavern in their small camp.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_16"); //The lot has wanted it so much that they can keep an eye on the situation here.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_17"); //But they don't seem so happy about it, I don't think, huh?

	Mod_Botschek_Info_C = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_B()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_B_15_00"); //Where can I get it?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_16_01"); //You mean sparkling gold.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_16_02"); //This information costs only 50 coins... to what you can find.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Another time.", Info_Mod_Botschek_Informationen_B_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Here", Info_Mod_Botschek_Informationen_B_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_B_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_B_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_00"); //Well, most of what lay around the open roads in the front area of the moor has already been salvaged by brave people.... but not everyone made it back.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_01"); //A bog body in the adventurer's cleft usually also promises sounding coins.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_02"); //Otherwise, you will have to look outside the main roads, in the mud, hidden chests or decaying buildings.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_03"); //Of course, you can also go deeper into the moor than most people have done so far...
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_04"); //Every now and then a pickaxe can be helpful when you meet old graves.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_05"); //Oh, there's a big hall on the right side of the moor. Unfortunately, the entrance is blocked.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_06"); //Those who manage to gain access would certainly expect great wealth?

	Mod_Botschek_Info_B = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_A()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_A_15_00"); //What dangers do I have to watch out for in the bog?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_16_01"); //Ohh, to some. For only 70 gold coins, you will learn what awaits you there.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Another time.", Info_Mod_Botschek_Informationen_A_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 70)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Here", Info_Mod_Botschek_Informationen_A_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_A_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_A_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 70);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_00"); //Good. Let's start with the lifeless.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_01"); //There are the poisonous clouds of smoke that cover most of the moorland.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_02"); //They emerge from the craters you'll find all over the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_03"); //If you're not a tough guy, you won't get far without an antidote.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_04"); //If you see something flickering in the moor again, you'd better take a bow around it.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_05"); //Otherwise a fiery explosion could quickly transport you to Beliar's empire....
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_06"); //Straight from there seem to come all the undead who populate the moor.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_07"); //Watch where you step, for the bog bodies will rise from the muddy ground.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_08"); //However, they are not the fastest... at least in comparison to the spirits of the warriors who make the moor unsafe.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_09"); //They attack anything that goes and stands.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_10"); //The plants that grow in the bog are not much more friendly.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_11"); //Some are firmly rooted in the soil, others on fast soles... with a simple kitchen knife.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_12"); //Finally, some adventurers have reported that they have seen masked figures in the bog...
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_13"); //However, this is the least known.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_14"); //Only they are the only creatures of the moor that seem to have more in mind than the destruction of invaders...

	Mod_Botschek_Info_A = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

INSTANCE Info_Mod_Botschek_Trade (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Trade_Condition;
	information	= Info_Mod_Botschek_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Botschek_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Botschek_Pickpocket (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Pickpocket_Condition;
	information	= Info_Mod_Botschek_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Botschek_Pickpocket_Condition()
{
	C_Beklauen	(133, ItMi_Gold, 63);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

	Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_BACK, Info_Mod_Botschek_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Botschek_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Botschek_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Botschek_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Botschek_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Botschek_EXIT (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_EXIT_Condition;
	information	= Info_Mod_Botschek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Botschek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Botschek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
