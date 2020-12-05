INSTANCE Info_Mod_Bosper_Hi (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Hi_Condition;
	information	= Info_Mod_Bosper_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bosper_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bosper_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Bosper_Hi_16_00"); //(unfriendly) Hey! What are you doing here?
};

INSTANCE Info_Mod_Bosper_HandelstDu (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_HandelstDu_Condition;
	information	= Info_Mod_Bosper_HandelstDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you trading?";
};

FUNC INT Info_Mod_Bosper_HandelstDu_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bosper_HandelstDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_HandelstDu_15_00"); //Are you trading?
	AI_Output(self, hero, "Info_Mod_Bosper_HandelstDu_16_01"); //Yeah, but not with you. You're one of those colony types. I don't trust you.
};

INSTANCE Info_Mod_Bosper_WiesoMisstrauen (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_WiesoMisstrauen_Condition;
	information	= Info_Mod_Bosper_WiesoMisstrauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why don't you trust me?";
};

FUNC INT Info_Mod_Bosper_WiesoMisstrauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_HandelstDu))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_WiesoMisstrauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_WiesoMisstrauen_15_00"); //Why don't you trust me?
	AI_Output(self, hero, "Info_Mod_Bosper_WiesoMisstrauen_16_01"); //Well, you wouldn't have been thrown into the barrier for nothing.
	AI_Output(self, hero, "Info_Mod_Bosper_WiesoMisstrauen_16_02"); //My business is good enough so I don't have to deal with riffraff.
};

INSTANCE Info_Mod_Bosper_Lehrling (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Lehrling_Condition;
	information	= Info_Mod_Bosper_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be a citizen of the city.";
};

FUNC INT Info_Mod_Bosper_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Lehrling_15_00"); //I want to be a citizen of the city.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_01"); //I can only imagine. But I can't imagine you're worthy of it.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_02"); //I'd have to trust you to do that.
	AI_Output(hero, self, "Info_Mod_Bosper_Lehrling_15_03"); //What can I do to make you trust me?
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_04"); //Bring me eight wolf skins.
	AI_Output(hero, self, "Info_Mod_Bosper_Lehrling_15_05"); //(laughs) Do you trust all the people who give you eight wolf skins?
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_06"); //No, that's just to keep you away from me for a while.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_07"); //I'll keep asking around for so long what the other masters have to say to you.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_08"); //Besides, I can use the skins right now.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_09"); //The mercenary Wolf has just bought my entire stock.
	AI_Output(self, hero, "Info_Mod_Bosper_Lehrling_16_10"); //Probably the day thieves on Onar's farm need an occupation before they start to come up with stupid ideas....

	Log_CreateTopic	(TOPIC_MOD_BOSPERSFELLE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOSPERSFELLE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOSPERSFELLE, "To get Bospers approval, I'm supposed to bring him eight wolf skins.");
};

INSTANCE Info_Mod_Bosper_DeinLehrling (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_DeinLehrling_Condition;
	information	= Info_Mod_Bosper_DeinLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Would you take me on as an apprentice?";
};

FUNC INT Info_Mod_Bosper_DeinLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_DeinLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_DeinLehrling_15_00"); //Would you take me on as an apprentice?
	AI_Output(self, hero, "Info_Mod_Bosper_DeinLehrling_16_01"); //No. Apart from that, you would have to be a citizen of the city before you could be accepted as an apprentice.
};

INSTANCE Info_Mod_Bosper_Fell (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Fell_Condition;
	information	= Info_Mod_Bosper_Fell_Info;
	permanent	= 0;
	important	= 0;
	description	= "Who can teach me how to skin animals?";
};

FUNC INT Info_Mod_Bosper_Fell_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Lehrling))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Fell_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Fell_15_00"); //Who can teach me how to skin animals?
	AI_Output(self, hero, "Info_Mod_Bosper_Fell_16_01"); //I can teach you how to skin the animals.
};

INSTANCE Info_Mod_Bosper_FellLernen (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_FellLernen_Condition;
	information	= Info_Mod_Bosper_FellLernen_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Skinning", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur));
};

FUNC INT Info_Mod_Bosper_FellLernen_Condition()
{
	Info_Mod_Bosper_FellLernen.description = B_BuildLearnString("Skinning", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur));

	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Fell))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_FellLernen_Info()
{
	AI_Output (hero, self, "Info_Mod_Bosper_FellLernen_15_00"); //Teach me how to skin animals!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Fur))
	{
		AI_Output (self, other, "Info_Mod_Bosper_FellLernen_16_01"); //Good. Listen. It's basically quite simple.
		AI_Output (self, other, "Info_Mod_Bosper_FellLernen_16_02"); //You take a sharp blade and cut open the belly of the cattle. A few more small cuts on the inside of the legs and then you can pull it off.
	};
};

INSTANCE Info_Mod_Bosper_Felle (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Felle_Condition;
	information	= Info_Mod_Bosper_Felle_Info;
	permanent	= 0;
	important	= 0;
	description	= "I got eight wolf skins here.";
};

FUNC INT Info_Mod_Bosper_Felle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Lehrling))
	&& (Npc_HasItems(hero, ItAt_WolfFur) + Npc_HasItems(hero, ItAt_WolfFur_Rein) >= 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Felle_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Felle_15_00"); //I got eight wolf skins here.

	var int rein; rein = Npc_HasItems(hero, ItAt_WolfFur_Rein);

	if (rein > 8) {
		rein = 8;
	};

	if (rein > 0) {
		B_GiveInvItems	(hero, self, ItAt_WolfFur_Rein, rein);
	};

	if (rein < 8) {
		rein = 8 - rein;

		B_GiveInvItems	(hero, self, ItAt_WolfFur, rein);
	};

	AI_Output(self, hero, "Info_Mod_Bosper_Felle_16_01"); //Well, at least you seem to be a skilled hunter.

	B_GiveInvItems	(self, hero, ItMi_Gold, 80);

	B_LogEntry	(TOPIC_MOD_BOSPERSFELLE, "I gave Bosper the skins.");
	B_SetTopicStatus	(TOPIC_MOD_BOSPERSFELLE, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Bosper_BereitFuerLehrling (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_BereitFuerLehrling_Condition;
	information	= Info_Mod_Bosper_BereitFuerLehrling_Info;
	permanent	= 1;
	important	= 0;
	description	= "Do you think I'm worthy to be a citizen of the city now?";
};

FUNC INT Info_Mod_Bosper_BereitFuerLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Felle))
	&& (Mod_LehrlingsStimmen < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_BereitFuerLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_BereitFuerLehrling_15_00"); //Do you think I'm worthy to be a citizen of the city now?

	if (Mod_LehrlingsStimmen == 4)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_BereitFuerLehrling_16_01"); //The other masters have assured me that you are reliable.
		AI_Output(self, hero, "Info_Mod_Bosper_BereitFuerLehrling_16_02"); //I still have concerns, but.... All right, you get my vote.

		Mod_LehrlingsStimmen += 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Bosper_BereitFuerLehrling_16_03"); //I will wait to see what the other masters have to say about you, and only then will I judge you.
	};
};

INSTANCE Info_Mod_Bosper_DeinLehrling2 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_DeinLehrling2_Condition;
	information	= Info_Mod_Bosper_DeinLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I want to be your apprentice.";
};

FUNC INT Info_Mod_Bosper_DeinLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Felle))
	&& (Mod_LehrlingsStimmen == 5)
	&& (Mod_IstLehrling	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_DeinLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_DeinLehrling2_15_00"); //I want to be your apprentice.
	AI_Output(self, hero, "Info_Mod_Bosper_DeinLehrling2_16_01"); //Actually, I don't take apprentices.
	AI_Output(self, hero, "Info_Mod_Bosper_DeinLehrling2_16_02"); //If you want to be a hunter, go to the Rangers.
};

INSTANCE Info_Mod_Bosper_Aufnahme (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Aufnahme_Condition;
	information	= Info_Mod_Bosper_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "I'd rather study with you.";
};

FUNC INT Info_Mod_Bosper_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_DeinLehrling2))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_15_00"); //I'd rather study with you.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_16_01"); //Jesus Christ... Well, let's give it a try.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_16_02"); //But if I find out you're going to be lazy or stealing from me, your training will be canceled immediately. All right?

	Info_ClearChoices	(Info_Mod_Bosper_Aufnahme);

	Info_AddChoice	(Info_Mod_Bosper_Aufnahme, "I'd rather not.", Info_Mod_Bosper_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Bosper_Aufnahme, "When do we start?", Info_Mod_Bosper_Aufnahme_A);
};

FUNC VOID Info_Mod_Bosper_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_B_15_00"); //I'd rather not.

	Info_ClearChoices	(Info_Mod_Bosper_Aufnahme);
};

FUNC VOID Info_Mod_Bosper_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_A_15_00"); //When do we start?
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_01"); //At this very moment.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_02"); //By presenting you with these civic clothes, you are now a citizen of Khorinis.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("receive civilian clothes");

	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_03"); //As a hunter, you should know how to use the bow first.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_04"); //A sword will be of little help to you unless you fight against aggressive opponents who do not flee from you.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_05"); //A hunter observes the surroundings from a high seat or other elevated position.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_06"); //When an animal approaches him, he clamps the bow or crossbow as silently as possible and aims at the most vulnerable part of the animal's body.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_07"); //In most cases this is the head, but in some monsters, body and extremities can be particularly vulnerable.
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_A_15_08"); //Obviously.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_09"); //Your first task will be to get boar hides for me.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_10"); //But make sure that the skins remain as undamaged as possible, i. e. aim at the legs.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_11"); //Damaged skins bring less gold and it is difficult to get rid of them.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_12"); //Of course you can also try to get undamaged skins over the dead bludgeoning of the creatures with blunt weapons.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_13"); //But that's actually something for raw bats who rely on pure violence and not for skillful hunters.
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_14"); //In addition, in about half of the cases it will happen that the skin of the animals and thus their fur will crack or tear due to the massive blows.
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_A_15_15"); //Where can I find Keiler?
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_16"); //Actually, they can be found everywhere. Look around, it's part of a successful hunt.
	AI_Output(hero, self, "Info_Mod_Bosper_Aufnahme_A_15_18"); //And how many hides do you need?
	AI_Output(self, hero, "Info_Mod_Bosper_Aufnahme_A_16_19"); //Bring me five undamaged skins, and I'll show you how to make better arrows.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 4;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_BOSPER_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_BOSPER_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Bosper, the Bogner, accepted me as his apprentice. That makes me a citizen of the city now.", "My first assignment for Bosper is to supply him with five undamaged boar hides. I get it by shooting the wedges in the legs.", "Since Bosper accepted me as his apprentice it is now possible for me to enter the upper quarter.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_BOSPER_ONE, "Bosper, the Bogner, accepted me as his apprentice. That makes me a citizen of the city now.", "My first assignment for Bosper is to supply him with five undamaged boar hides. I get it by shooting the wedges in the legs.");
	};

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Bosper_Aufnahme);
};

INSTANCE Info_Mod_Bosper_GildenZeug (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_GildenZeug_Condition;
	information	= Info_Mod_Bosper_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bosper_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 4)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_GildenZeug_16_00"); //I didn't think so. From scoundrel to lawman.
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_GildenZeug_16_01"); //What do you want with the magicians? They can't tell you anything about archery!
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_GildenZeug_16_02"); //What do you want with the magicians? They can't tell you anything about archery!
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_GildenZeug_16_03"); //I could tell you'd be attracted to the mercenaries. But they have good archers, the boys.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Bosper_GildenZeug_16_04"); //Don't even think of paying homage to your god!
	};
};

INSTANCE Info_Mod_Bosper_LehrlingQuest (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "The five boar hides, undamaged.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 4)
	&& (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest_15_00"); //The five boar hides, undamaged.

	B_GiveInvItems	(hero, self, ItAt_Addon_KeilerFur_Rein, 5);

	Npc_RemoveInvItems	(self, ItAt_Addon_KeilerFur_Rein, 5);

	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_01"); //(checking) Yes, they are to be used.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_02"); //Here's some money. But don't spend it on beer and light girls!

	B_GiveInvItems	(self, hero, ItMi_Gold, (5 * Value_KeilerFur_Rein) / 2);

	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_03"); //Now that you have proven yourself to be reasonably skillful, I want to introduce you to the art of making arrows.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_04"); //Carving a normal arrow is no problem even for the beginner.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_05"); //However, there are certain tricks how to get specialized or improved arrows.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_06"); //Let's start with the barbs.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_07"); //All you need is a light piece of bent iron.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_08"); //You can buy it from almost any blacksmith.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_09"); //In the front of the arrow you scratch four notches at the same distance, which you fill with a sticky liquid and then put the pieces of iron into.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_10"); //Always pay attention to the balance of the arrow.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_11"); //Under the iron the accuracy of the arrow suffers, but with a little luck you can inflict heavy bleeding wounds on your opponent, which weaken him further and further.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest_15_12"); //Can I also use it to improve my already finished arrows?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_13"); //Of course it is. I recommend that you do this at Thorben's booth.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_14"); //As a craftsman, he has assembled all the necessary equipment there.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_15"); //Now you should get acquainted with what I've told you for a while.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest_16_16"); //Come back after that, and we'll move on.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_PFEILE, "I can now make a barbed arrow from an arrow tip and an arrow shaft. This arrow does not hit so often, but it tears deeper wounds.");

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Bosper_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest2_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Let's continue my training.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest2_15_00"); //Let's continue my training.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_01"); //Where are you hanging out, anyway? You're barely in town.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest2_15_02"); //I'm saving the world and stuff.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_03"); //I can fuck with myself.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_04"); //I need your help, though.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_05"); //Abuyin has ordered four shadow-running skins from me, but the hunters have only brought me one.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_06"); //That leaves three more to go.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest2_15_07"); //What does Abuyin need shadow skins for?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_08"); //He says that Shadow Runners are magical beings and their skins therefore exert any positive vibrations on him.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_09"); //Maybe he just smoked too much, though.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_10"); //Anyway, he pays well for undamaged skins. You remember what you have to watch out for?
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest2_15_11"); //Keep shooting at the paws.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_12"); //Shadow runners are tough. So take care of yourself.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest2_16_13"); //If you brought me the skins, I'll teach you something new.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest2_15_14"); //All clear. I'm gonna go look for it.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_BOSPER_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_TWO, "Bosper wants me to bring him three undamaged shadow runners' skins before he teaches me any more.");

	Wld_InsertNpc	(Shadowbeast,	"FP_ROAM_FARM1_FORREST_SHADOW_02");
	Wld_InsertNpc	(Shadowbeast,	"NW_FARM4_WOOD_MONSTER_06");
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_CITYFOREST_CAVE_06_04");
	Wld_InsertNpc 	(Shadowbeast,	"FP_ROAM_NW_FOREST_PATH_35_06_04");
};

INSTANCE Info_Mod_Bosper_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest3_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's the skins.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest2))
	&& (Npc_HasItems(hero, ItAt_ShadowFur_Rein) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest3_15_00"); //Here's the skins.

	B_GiveInvItems	(hero, self, ItAt_ShadowFur_Rein, 3);

	Npc_RemoveInvItems	(self, ItAt_ShadowFur_Rein, 3);

	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_01"); //Good quality. Abuyin will be satisfied with that.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest3_15_02"); //Then we can finally turn to my teaching.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_03"); //All right, listen to me.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_04"); //With conventional arrows you often have no chance against strong opponents because your range is too small.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_05"); //All you have to do is change a few subtleties during production and you'll get a true precision arrow.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_06"); //The feathering at the end of the arrow must cover about one fifth of the arrow. So use more feathers than usual.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_07"); //The tip may also be slightly smaller to increase the balance of the arrow.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_08"); //Alternatively, place a counterweight at the end of the shaft to distribute the weight evenly.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_09"); //Although these measures ensure that the arrow loses some of its penetrating power, they make up for this with a significantly increased range and better manageability.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest3_15_10"); //Sounds like you could use the arrow.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_11"); //Otherwise I wouldn't bother explaining it to you.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest3_15_12"); //Why didn't you have an apprentice before me? You're doing all right.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_13"); //I had my last apprentice several years ago. I will always remember him - but not in a more positive way.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest3_16_14"); //Now it's time for you to go. Come back soon.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_PFEILE, "I can now create a precision arrow from an arrowhead and an arrow rod. This arrow hits more often and at a greater distance, but does less damage.");

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Bosper_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest4_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "What is the next step in my training?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest4_15_00"); //What is the next step in my training?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_01"); //You now know the most important arrow modifications for hunters, except one.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest4_15_02"); //And what's that?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_03"); //Well... I might not even tell you.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest4_15_04"); //Uh-huh.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_05"); //I've been deceived once before, and I don't want to make it come back for a second time.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest4_15_06"); //Who betrayed you?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_07"); //My last apprentice.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_08"); //I taught him everything he knew, and as a reward he fired three explosive arrows at my former house and set it on fire.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_09"); //At that time I only lived near the tavern, at a resting place of the hunters.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_10"); //I haven't taken on any apprentices since then.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest4_15_11"); //What happened to your apprentice?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_12"); //(bitter) I don't know. It was a young woman - very talented, very ambitious.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest4_16_13"); //I never heard from her again, and I don't want to.
};

INSTANCE Info_Mod_Bosper_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest5_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "But I won't betray you.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest5_15_00"); //But I won't betray you.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_01"); //What were you actually thrown into the barrier for?
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest5_15_02"); //I -
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_03"); //Stop! Don't tell me. I don't want to know.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_04"); //You haven't disappointed me yet, you're humble and reliable.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_05"); //If I can trust anyone, it's you. Your past doesn't matter.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_06"); //All right, I want to show you the most powerful projectiles: the explosion arrows.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_07"); //They can also wreak havoc on enemies who are largely immune to conventional arrows.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest5_15_08"); //And how do I make these arrows?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_09"); //The tip of these arrows consists of a bag with an explosive mixture.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_10"); //You need a piece of coal, sulphur and a bag of saltpeter.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_11"); //At an alchemy table you make a mixture from it, pack it carefully and attach it to the front of the arrow.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest5_15_12"); //Sounds good to me.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_13"); //Try it out. Bring me two troll skins, then I'll consider the exam completed.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest5_16_14"); //But I want to see the burn marks!

	Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRLING_BOSPER_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_THREE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_LEHRLING_BOSPER_THREE, TOPIC_MOD_PFEILE, "I'm supposed to kill two trolls with explosion arrows and bring Bosper her skins.", "I can now make an explosion arrow from an arrowhead, explosives and an arrow rod. This arrow hits more frequently and does much more damage, but has a very small range. For the explosives I need coal, sulphur and saltpeter, which I have to mix at an alchemy table.");
};

INSTANCE Info_Mod_Bosper_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest6_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here you have the two troll skins.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest5))
	&& (Npc_HasItems(hero, ItAt_TrollFur_Feuer) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest6_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest6_15_00"); //Here you have the two troll skins.

	B_GiveInvItems	(hero, self, ItAt_TrollFur_Feuer, 2);

	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_01"); //You got a little paycheck for that.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_02"); //Your training with me is now complete. Everything you need to know, I told you.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_03"); //Now the practice will show whether you will be able to earn a living by hunting.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_04"); //Why don't you drop by my place sometime, maybe I'll have something to do for you.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_05"); //Otherwise, all I can do is congratulate you on your accomplishments and wish you a pleasant life.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest6_15_06"); //Thanks. See you soon.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest6_16_07"); //May your longing always remain taut!

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_THREE, LOG_SUCCESS);

	B_GivePlayerXP	(350);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Bosper_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest7_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "What's up?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest6))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest7_15_00"); //How's it going?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest7_16_01"); //Talking to you about my last apprentice has left me no peace of mind.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest7_16_02"); //I had already successfully suppressed him, but since I told you about him, I have nightmares and sleep badly.
};

INSTANCE Info_Mod_Bosper_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest8_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "Why are you so close to your quarrels?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest8_15_00"); //Why are you so close to your quarrels?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_01"); //l-- I'm not entirely innocent. I didn't find the right words back then.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest8_15_02"); //What has happened?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_03"); //I had one for her.... special connection.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_04"); //The night before she set fire to my house, I told her about it.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_05"); //But she didn't want to know about it and yelled at me.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_06"); //I hurt her after that. I immediately knew it was wrong, but I couldn't undo it.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_07"); //Then she ran away. At night I was finally awakened by the crackling of the fire and the smell of burning.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest8_16_08"); //I want you to find her.
};

INSTANCE Info_Mod_Bosper_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest9_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "I thought you didn't want to see her again?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest9_15_00"); //I thought you didn't want to see her again?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest9_16_01"); //That was true for a long time. The memory of her still hurts me.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest9_16_02"); //But at the same time, I have a longing to reconcile myself with her.
};

INSTANCE Info_Mod_Bosper_LehrlingQuest10 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest10_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest10_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where could she be?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest10_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest10_15_00"); //Where could she be?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_01"); //When I told you I didn't know where she was, I didn't tell you the truth completely.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_02"); //I have learned from various sources that she is still living in the large forest north of the city.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_03"); //However, she doesn't seem willing to let anyone approach her.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_04"); //Several hunters told me that if she was disturbed, she turned into an animal.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_05"); //I don't know where she learned the art of transformation, but her favorite animal seems to be a warg.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest10_15_06"); //Does that mean I should catch all the Warge I find and wait to see if they change back?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_07"); //Of course not, of course.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_08"); //Let a magician, Vatras perhaps, give you a tincture that transforms back when touched.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_09"); //You're painting your arrows on an alchemy table.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest10_16_10"); //Even the first shot will show whether it is Atalante, my last apprentice.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Bosper longs to reconcile with Atalante, who used to be his apprentice. However, since she seems to have become shy of humans and roams around as a warg in the forest north of Khorinis, I am told to get a tincture from a magician, with which I can transform her back and then tell her about Bosper's desire for reconciliation. My first port of call for the tincture is Vatras.");
};

INSTANCE Info_Mod_Bosper_LehrlingQuest11 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest11_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest11_Info;
	permanent	= 0;
	important	= 0;
	description	= "What do I do once I turn them back?";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest11_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest9))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest11_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest11_15_00"); //What do I do once I turn them back?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest11_16_01"); //Tell her I'm willing to forgive her and that I want to meet her.
};

INSTANCE Info_Mod_Bosper_LehrlingQuest12 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest12_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest12_Info;
	permanent	= 0;
	important	= 0;
	description	= "Atalante is dead. I'm sorry about that.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest12_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Atalante_Bosper))
	&& (Npc_IsDead(Warg_Atalante2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest12_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest12_15_00"); //Atalante is dead. I'm sorry about that.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_01"); //No! Say that's not true!
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest12_15_02"); //She attacked me when I told her about you.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_03"); //My daughter! What have you done to me?!
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest12_15_04"); //Your daughter? But how...?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_05"); //You're lying! She's not dead. She just doesn't want to see me again, does she?
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_06"); //She just wants to fake her death because I humiliated her so much!
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_07"); //Atalante, I couldn't tell you anything!
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_08"); //When I found out about you, I sent you everything I could.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_09"); //Yet thou wouldst not believe me on that fateful day.
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest12_15_10"); //I'm starting to see through the whole thing.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_11"); //No, you don't see through anything. Nobody, nobody wants to understand me!
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_12"); //And now - henceforth, thou hast joined forces with my own daughter against me!
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest12_15_13"); //It's all right, man. You'll get over it.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest12_16_14"); //Never ever!

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(1000);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_45);
};

INSTANCE Info_Mod_Bosper_LehrlingQuest13 (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_LehrlingQuest13_Condition;
	information	= Info_Mod_Bosper_LehrlingQuest13_Info;
	permanent	= 0;
	important	= 0;
	description	= "I couldn't find Atalante.";
};

FUNC INT Info_Mod_Bosper_LehrlingQuest13_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling4))
	&& (Npc_IsDead(Warg_Atalante))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Atalante_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_LehrlingQuest13_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest13_15_00"); //I couldn't find Atalante.
	AI_Output(self, hero, "Info_Mod_Bosper_LehrlingQuest13_16_01"); //Then maybe she won't be in the woods after all. What am I doing now?
	AI_Output(hero, self, "Info_Mod_Bosper_LehrlingQuest13_15_02"); //I'm sorry about that.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, LOG_FAILED);
};

INSTANCE Info_Mod_Bosper_DragomirFelle (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_DragomirFelle_Condition;
	information	= Info_Mod_Bosper_DragomirFelle_Info;
	permanent	= 0;
	important	= 0;
	description	= "The skins are Dragomir's. Not from me.";
};

FUNC INT Info_Mod_Bosper_DragomirFelle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Bosper))
	&& (Npc_HasItems(hero, ItMi_Wolfsfelle) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_DragomirFelle_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_DragomirFelle_15_00"); //The skins are Dragomir's. Not from me.

	B_GiveInvItems	(hero, self, ItMi_Wolfsfelle, 1);

	AI_Output(self, hero, "Info_Mod_Bosper_DragomirFelle_16_01"); //Good. How much does he want?
	AI_Output(hero, self, "Info_Mod_Bosper_DragomirFelle_15_02"); //He collects when he comes by.
	AI_Output(self, hero, "Info_Mod_Bosper_DragomirFelle_16_03"); //Good too. Here, some gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, "Delivered the skins.");
	B_SetTopicStatus	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Bosper_Job (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Job_Condition;
	information	= Info_Mod_Bosper_Job_Info;
	permanent	= 0;
	important	= 0;
	description	= "What are my tasks as your apprentice?";
};

FUNC INT Info_Mod_Bosper_Job_Condition()
{
	if (Mod_LehrlingBei == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Job_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Job_15_00"); //What are my tasks as your apprentice?
	AI_Output(self, hero, "Info_Mod_Bosper_Job_16_01"); //Bring me all the animal skins you can find. I'll pay you a good price for each coat.
	AI_Output(self, hero, "Info_Mod_Bosper_Job_16_02"); //I can also teach you how to make arrows, bows and crossbows.

	Mod_PfeileSpitzen	=	0;
	Mod_PfeileSchnitzen	=	0;
};

INSTANCE Info_Mod_Bosper_Schnitzen (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Schnitzen_Condition;
	information	= Info_Mod_Bosper_Schnitzen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring me arrows to carve (2 LP)";
};

FUNC INT Info_Mod_Bosper_Schnitzen_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Bosper_Schnitzen.description = "Bring me arrows to carve (200 gold)";
	}
	else
	{
		Info_Mod_Bosper_Schnitzen.description = "Bring me arrows to carve (2 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Job))
	&& (((hero.lp >= 2) && (Mod_Schwierigkeit != 4)) || ((Npc_HasItems(hero, ItMi_Gold) >= 200) && (Mod_Schwierigkeit == 4)))
	&& (Mod_PfeileSchnitzen	== 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Schnitzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Schnitzen_15_00"); //Teach me to carve arrows.
	AI_Output(self, hero, "Info_Mod_Bosper_Schnitzen_16_01"); //Okay. First you should buy a piece of wood from Thorben. Then take this to a tree saw and carve it to about 10 arrows.
	AI_Output(self, hero, "Info_Mod_Bosper_Schnitzen_16_02"); //Then you join the arrow with an arrowhead on an anvil and your arrow is ready.

	if (Mod_Schwierigkeit != 4)
	{
		hero.lp -= 2;
	}
	else
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
	};

	Mod_PfeileSchnitzen	=	1;

	Log_CreateTopic	(TOPIC_MOD_PFEILE, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_PFEILE, "To make arrows I need arrow shafts. I can cut them out of branches. Then I have to combine them with arrowheads at the anvil. The same applies to bolts.");
};

INSTANCE Info_Mod_Bosper_Spitzen (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Spitzen_Condition;
	information	= Info_Mod_Bosper_Spitzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where can I learn to forge arrowheads?";
};

FUNC INT Info_Mod_Bosper_Spitzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Job))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Spitzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_Spitzen_15_00"); //Where can I learn to forge arrowheads?
	AI_Output(self, hero, "Info_Mod_Bosper_Spitzen_16_01"); //Go to Harad. If he asks you why he should teach you, tell him I'm sending you.
};

INSTANCE Info_Mod_Bosper_OtherHunters (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_OtherHunters_Condition;
	information	= Info_Mod_Bosper_OtherHunters_Info;
	permanent	= 0;
	important	= 0;
	description	= "Where can I find other hunters here?";
};

FUNC INT Info_Mod_Bosper_OtherHunters_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_OtherHunters_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_OtherHunters_15_00"); //Where can I find other hunters here?
	AI_Output(self, hero, "Info_Mod_Bosper_OtherHunters_16_01"); //If you leave the east gate, you'll come to Orlan's tavern.
	AI_Output(self, hero, "Info_Mod_Bosper_OtherHunters_16_02"); //There's the hunting camp nearby. The leader's name is Dragomir.
	AI_Output(self, hero, "Info_Mod_Bosper_OtherHunters_16_03"); //Give him a nice greeting, I need some fur again. Now, as winter approaches, demand is rising.
	AI_Output(hero, self, "Info_Mod_Bosper_OtherHunters_15_04"); //I'm doing it.
	
	Log_CreateTopic	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, "Should I stop by the hunting camp near Orlans Tavern and tell Dragomir that Bosper could use another coat delivery.");
};

INSTANCE Info_Mod_Bosper_Anschlagtafel (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Anschlagtafel_Condition;
	information	= Info_Mod_Bosper_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Bosper_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Bosper == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItAt_WolfFur) >= Mod_Anschlagtafel_Khorinis_Bosper_Wolffell)
	&& (Npc_HasItems(hero, ItAt_Teeth) >= Mod_Anschlagtafel_Khorinis_Bosper_Zaehne)
	&& (Npc_HasItems(hero, ItAt_Claw) >= Mod_Anschlagtafel_Khorinis_Bosper_Krallen)
	&& (Npc_HasItems(hero, ItAt_WargFur) >= Mod_Anschlagtafel_Khorinis_Bosper_Wargfell)
	&& (Npc_HasItems(hero, ItAt_ShadowFur) >= Mod_Anschlagtafel_Khorinis_Bosper_Schattenlaeuferfell)
	&& (Npc_HasItems(hero, ItAt_LurkerSkin) >= Mod_Anschlagtafel_Khorinis_Bosper_Reptilienhaut)
	&& (Npc_HasItems(hero, ItAt_TrollFur) >= Mod_Anschlagtafel_Khorinis_Bosper_Trollfell)
	&& (Npc_HasItems(hero, ItAt_CrawlerPlate) >= Mod_Anschlagtafel_Khorinis_Bosper_Minecrawlerplatte)
	&& (Npc_HasItems(hero, ItAt_ShadowHorn) >= Mod_Anschlagtafel_Khorinis_Bosper_Schattenlaeuferhorn)
	&& (Npc_HasItems(hero, ItMi_Ast) >= Mod_Anschlagtafel_Khorinis_Bosper_Ast)
	{
		Npc_RemoveInvItems	(hero, ItAt_WolfFur, Mod_Anschlagtafel_Khorinis_Bosper_Wolffell);
		Npc_RemoveInvItems	(hero, ItAt_Teeth, Mod_Anschlagtafel_Khorinis_Bosper_Zaehne);
		Npc_RemoveInvItems	(hero, ItAt_Claw, Mod_Anschlagtafel_Khorinis_Bosper_Krallen);
		Npc_RemoveInvItems	(hero, ItAt_WargFur, Mod_Anschlagtafel_Khorinis_Bosper_Wargfell);
		Npc_RemoveInvItems	(hero, ItAt_ShadowFur, Mod_Anschlagtafel_Khorinis_Bosper_Schattenlaeuferfell);
		Npc_RemoveInvItems	(hero, ItAt_LurkerSkin, Mod_Anschlagtafel_Khorinis_Bosper_Reptilienhaut);
		Npc_RemoveInvItems	(hero, ItAt_TrollFur, Mod_Anschlagtafel_Khorinis_Bosper_Trollfell);
		Npc_RemoveInvItems	(hero, ItAt_CrawlerPlate, Mod_Anschlagtafel_Khorinis_Bosper_Minecrawlerplatte);
		Npc_RemoveInvItems	(hero, ItAt_ShadowHorn, Mod_Anschlagtafel_Khorinis_Bosper_Schattenlaeuferhorn);
		Npc_RemoveInvItems	(hero, ItMi_Ast, Mod_Anschlagtafel_Khorinis_Bosper_Ast);

		AI_Output(self, hero, "Info_Mod_Bosper_Anschlagtafel_16_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Bosper_Anschlagtafel_16_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Bosper_Gold);

		AI_Output(self, hero, "Info_Mod_Bosper_Anschlagtafel_16_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Bosper_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Bosper_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Bosper_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Bosper = 0;
		Mod_Anschlagtafel_Khorinis_Bosper_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Bosper, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

var int FellCounter;

INSTANCE Info_Mod_Bosper_MehrFelle (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_MehrFelle_Condition;
	information	= Info_Mod_Bosper_MehrFelle_Info;
	permanent	= 1;
	important	= 0;
	description	= "I've got a few skins for you ...";
};

FUNC INT Info_Mod_Bosper_MehrFelle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_Job))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_MehrFelle_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_MehrFelle_15_00"); //I got some skins for you.

	CreateInvItems	(self, ItMi_Gold, 1000000);

	if (Npc_HasItems(hero, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(hero, ItAt_SheepFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_SheepFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_ZiegenFur) > 0)
	|| (Npc_HasItems(hero, ItAt_ZiegenFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_ZiegenFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(hero, ItAt_WolfFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_WolfFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_BlackwolfFur) > 0)
	|| (Npc_HasItems(hero, ItAt_BlackwolfFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_BlackwolfFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_WargFur) > 0)
	|| (Npc_HasItems(hero, ItAt_WargFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_WargFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_OrcdogFur) > 0)
	|| (Npc_HasItems(hero, ItAt_OrcdogFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_OrcdogFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(hero, ItAt_ShadowFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_ShadowFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur) > 0)
	|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_PumaFur) > 0)
	|| (Npc_HasItems(hero, ItAt_PumaFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_PumaFur_Feuer) > 0)
	|| (Npc_HasItems(hero, ItAt_StonePumaFur) > 0)
	|| (Npc_HasItems(hero, ItAt_StonePumaFur_Rein) > 0)
	|| (Npc_HasItems(hero, ItAt_StonePumaFur_Feuer) > 0)
	{
		
		if (Npc_HasItems(hero, ItAt_Addon_KeilerFur) > 0)
		|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Feuer) > 0)
		{
			AI_Output(self, hero, "Info_Mod_Bosper_MehrFelle_16_01"); //The fur of wedges. They're strong beasts.

			FellCounter = Npc_HasItems(hero, ItAt_Addon_KeilerFur);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_KeilerFur) );
			B_GiveInvItems(hero, self, ItAt_Addon_KeilerFur, Npc_HasItems(hero, ItAt_Addon_KeilerFur));

			FellCounter = Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_KeilerFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_Addon_KeilerFur_Rein, Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein));

			FellCounter = Npc_HasItems(hero, ItAt_Addon_KeilerFur_Feuer);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_KeilerFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_Addon_KeilerFur_Feuer, Npc_HasItems(hero, ItAt_Addon_KeilerFur_Feuer));
		};

		if (Npc_HasItems(hero, ItAt_SheepFur) > 0)
		|| (Npc_HasItems(hero, ItAt_SheepFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_SheepFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_02"); //Sheepskin? You didn't slaughter the sheep in the fields at some farmer's, did you?
			AI_Output (hero, self, "Info_Mod_Bosper_MehrFelle_15_03"); //I'd never dream of it....

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(hero, self, ItAt_SheepFur, Npc_HasItems(hero, ItAt_SheepFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_SheepFur_Rein) * Value_SheepFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_SheepFur_Rein, Npc_HasItems(hero, ItAt_SheepFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_SheepFur_Feuer) * Value_SheepFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_SheepFur_Feuer, Npc_HasItems(hero, ItAt_SheepFur_Feuer));
		};

		if (Npc_HasItems(hero, ItAt_ZiegenFur) > 0)
		|| (Npc_HasItems(hero, ItAt_ZiegenFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_ZiegenFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_04"); //Goatskins, good quality...

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_ZiegenFur) * Value_ZiegenFur) );
			B_GiveInvItems(hero, self, ItAt_ZiegenFur, Npc_HasItems(hero, ItAt_ZiegenFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_ZiegenFur_Rein) * Value_ZiegenFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_ZiegenFur_Rein, Npc_HasItems(hero, ItAt_ZiegenFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(hero, ItAt_ZiegenFur_Feuer) * Value_ZiegenFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_ZiegenFur_Feuer, Npc_HasItems(hero, ItAt_ZiegenFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_WolfFur) > 0)
		|| (Npc_HasItems(hero, ItAt_WolfFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_WolfFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_05"); //Wolf fur, that's good...

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(hero, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WolfFur_Rein) * Value_WolfFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_WolfFur_Rein, Npc_HasItems(other, ItAt_WolfFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WolfFur_Feuer) * Value_WolfFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_WolfFur_Feuer, Npc_HasItems(other, ItAt_WolfFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_BlackwolfFur) > 0)
		|| (Npc_HasItems(hero, ItAt_BlackwolfFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_BlackwolfFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_06"); //Black wolf skins, very beautiful...

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_BlackwolfFur) * Value_BlackwolfFur) );
			B_GiveInvItems(hero, self, ItAt_BlackwolfFur, Npc_HasItems(other, ItAt_BlackwolfFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_BlackwolfFur_Rein) * Value_BlackwolfFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_BlackwolfFur_Rein, Npc_HasItems(other, ItAt_BlackwolfFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_BlackwolfFur_Feuer) * Value_BlackwolfFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_BlackwolfFur_Feuer, Npc_HasItems(other, ItAt_BlackwolfFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_WargFur) > 0)
		|| (Npc_HasItems(hero, ItAt_WargFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_WargFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_07"); //Wargen's fur? Tough beasts are those...

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(hero, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WargFur_Rein) * Value_WargFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_WargFur_Rein, Npc_HasItems(other, ItAt_WargFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_WargFur_Feuer) * Value_WargFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_WargFur_Feuer, Npc_HasItems(other, ItAt_WargFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_PumaFur) > 0)
		|| (Npc_HasItems(hero, ItAt_PumaFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_PumaFur_Feuer) > 0)
		|| (Npc_HasItems(hero, ItAt_StonePumaFur) > 0)
		|| (Npc_HasItems(hero, ItAt_StonePumaFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_StonePumaFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_08"); //Puma fur? Fine thing...

			FellCounter = Npc_HasItems(hero, ItAt_PumaFur);
			FellCounter += Npc_HasItems(hero, ItAt_StonePumaFur);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_PumaFur) );
			B_GiveInvItems(hero, self, ItAt_PumaFur, Npc_HasItems(hero, ItAt_PumaFur));
			B_GiveInvItems(hero, self, ItAt_StonePumaFur, Npc_HasItems(hero, ItAt_StonePumaFur));

			FellCounter = Npc_HasItems(hero, ItAt_PumaFur_Rein);
			FellCounter += Npc_HasItems(hero, ItAt_StonePumaFur_Rein);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_PumaFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_PumaFur_Rein, Npc_HasItems(hero, ItAt_PumaFur_Rein));
			B_GiveInvItems(hero, self, ItAt_StonePumaFur_Rein, Npc_HasItems(hero, ItAt_StonePumaFur_Rein));

			FellCounter = Npc_HasItems(hero, ItAt_PumaFur_Feuer);
			FellCounter += Npc_HasItems(hero, ItAt_StonePumaFur_Feuer);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_PumaFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_PumaFur_Feuer, Npc_HasItems(hero, ItAt_PumaFur_Feuer));
			B_GiveInvItems(hero, self, ItAt_StonePumaFur_Feuer, Npc_HasItems(hero, ItAt_StonePumaFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_OrcdogFur) > 0)
		|| (Npc_HasItems(hero, ItAt_OrcdogFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_OrcdogFur_Feuer) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_09"); //Fur of hurricanes? Tough beasts are those...

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_OrcdogFur) * Value_WargFur) );
			B_GiveInvItems(hero, self, ItAt_OrcdogFur, Npc_HasItems(other, ItAt_OrcdogFur));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_OrcdogFur_Rein) * Value_WargFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_OrcdogFur_Rein, Npc_HasItems(other, ItAt_OrcdogFur_Rein));

			B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_OrcdogFur_Feuer) * Value_WargFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_OrcdogFur_Feuer, Npc_HasItems(other, ItAt_OrcdogFur_Feuer));
		};
		
		if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest3))
		&& ((Npc_HasItems(hero, ItAt_ShadowFur) > 0)
		|| (Npc_HasItems(hero, ItAt_ShadowFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_ShadowFur_Feuer) > 0))
		{
			AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_10"); //Ah, even the fur of a shadow-runner - is worth a lot.

			FellCounter = Npc_HasItems(hero, ItAt_ShadowFur);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_ShadowFur) );
			B_GiveInvItems(hero, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));

			FellCounter = Npc_HasItems(hero, ItAt_ShadowFur_Rein);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_ShadowFur_Rein) );
			B_GiveInvItems(hero, self, ItAt_ShadowFur_Rein, Npc_HasItems(other, ItAt_ShadowFur_Rein));

			FellCounter = Npc_HasItems(hero, ItAt_ShadowFur_Feuer);

			B_GiveInvItems(self, hero, ItMi_Gold, (FellCounter * Value_ShadowFur_Feuer) );
			B_GiveInvItems(hero, self, ItAt_ShadowFur_Feuer, Npc_HasItems(other, ItAt_ShadowFur_Feuer));
		};
		
		if (Npc_HasItems(hero, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(hero, ItAt_TrollFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_TrollFur_Feuer) > 0)
		|| (Npc_HasItems(hero, ItAt_TrollBlackFur) > 0)
		|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Rein) > 0)
		|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Feuer) > 0)
		{
			if (Mod_TrollfellBosper == FALSE)
			{
				AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_11"); //What the hell is that for fur?
				AI_Output (hero, self, "Info_Mod_Bosper_MehrFelle_15_12"); //That's what I put it on a troll.
				AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_13"); //That... that's worth half a fortune....

				Mod_TrollfellBosper == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_14"); //Again such a huge troll fur... do you hunt the creatures?
				AI_Output (hero, self, "Info_Mod_Bosper_MehrFelle_15_15"); //If I meet anyone, I'll take the opportunity...
			};
			
			if (Npc_HasItems(hero, ItAt_TrollFur) > 0)
			|| (Npc_HasItems(hero, ItAt_TrollFur_Rein) > 0)
			|| (Npc_HasItems(hero, ItAt_TrollFur_Feuer) > 0)
			{
				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(hero, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));

				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollFur_Rein) * Value_TrollFur_Rein) );
				B_GiveInvItems(hero, self, ItAt_TrollFur_Rein, Npc_HasItems(other, ItAt_TrollFur_Rein));

				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollFur_Feuer) * Value_TrollFur_Feuer) );
				B_GiveInvItems(hero, self, ItAt_TrollFur_Feuer, Npc_HasItems(other, ItAt_TrollFur_Feuer));
			};
			
			if (Npc_HasItems(hero, ItAt_TrollBlackFur) > 0)
			|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Rein) > 0)
			|| (Npc_HasItems(hero, ItAt_TrollBlackFur_Feuer) > 0)
			{
				AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_16"); //Even the fur of a black troll!

				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(hero, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));

				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollBlackFur_Rein) * Value_TrollBlackFur_Rein) );
				B_GiveInvItems(hero, self, ItAt_TrollBlackFur_Rein, Npc_HasItems(other, ItAt_TrollBlackFur_Rein));

				B_GiveInvItems(self, hero, ItMi_Gold, (Npc_HasItems(other, ItAt_TrollBlackFur_Feuer) * Value_TrollBlackFur_Feuer) );
				B_GiveInvItems(hero, self, ItAt_TrollBlackFur_Feuer, Npc_HasItems(other, ItAt_TrollBlackFur_Feuer));
			};
		};
		
		AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_17"); //Good work. If you have more, come back to me...
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bosper_MehrFelle_16_18"); //You know - I'm only interested in skins of wolves, shadow runners and the like...
	};
};

INSTANCE Info_Mod_Bosper_HandelstJetzt (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_HandelstJetzt_Condition;
	information	= Info_Mod_Bosper_HandelstJetzt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Are you trading with me now?";
};

FUNC INT Info_Mod_Bosper_HandelstJetzt_Condition()
{
	if (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_HandelstJetzt_Info()
{
	AI_Output(hero, self, "Info_Mod_Bosper_HandelstJetzt_15_00"); //Are you trading with me now?
	AI_Output(self, hero, "Info_Mod_Bosper_HandelstJetzt_16_01"); //I don't care about him.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Bosper sells arches and crossbows.");
};

INSTANCE Info_Mod_Bosper_Trade (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Trade_Condition;
	information	= Info_Mod_Bosper_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bosper_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_HandelstJetzt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bosper_Trade_Info()
{
	Npc_RemoveInvItems	(self, ItRw_Arrow, 100);
	Npc_RemoveInvItems	(self, ItRw_Bolt, 100);
	
	CreateInvItems	(self, ItRw_Arrow, 100);
	CreateInvItems	(self, ItRw_Bolt, 100);

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bosper_Pickpocket (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_Pickpocket_Condition;
	information	= Info_Mod_Bosper_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Bosper_Pickpocket_Condition()
{
	C_Beklauen	(142, ItRw_Arrow, 50);
};

FUNC VOID Info_Mod_Bosper_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);

	Info_AddChoice	(Info_Mod_Bosper_Pickpocket, DIALOG_BACK, Info_Mod_Bosper_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bosper_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bosper_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bosper_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);
};

FUNC VOID Info_Mod_Bosper_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);

		Info_AddChoice	(Info_Mod_Bosper_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bosper_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bosper_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bosper_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bosper_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bosper_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bosper_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bosper_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bosper_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bosper_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bosper_EXIT (C_INFO)
{
	npc		= Mod_531_NONE_Bosper_NW;
	nr		= 1;
	condition	= Info_Mod_Bosper_EXIT_Condition;
	information	= Info_Mod_Bosper_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bosper_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bosper_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
