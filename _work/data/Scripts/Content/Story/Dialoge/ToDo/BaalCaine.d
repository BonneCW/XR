INSTANCE Info_Mod_Caine_Hi (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Hi_Condition;
	information	= Info_Mod_Caine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hello.";
};

FUNC INT Info_Mod_Caine_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Hi_15_00"); //Hello.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_31_01"); //Oh, seeing you ever again, I wouldn't have thought it possible.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_31_02"); //Now that I'm in charge of potions and sayings, I can sell them to you.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Baal Caine can sell me potions and spell rolls.");
};

INSTANCE Info_Mod_Caine_GotoTempel (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_GotoTempel_Condition;
	information	= Info_Mod_Caine_GotoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "You are expected at the temple.";
};

FUNC INT Info_Mod_Caine_GotoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_KarrasDa))
	&& (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_GotoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_GotoTempel_15_00"); //You are expected at the temple.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TEMPEL");
};

INSTANCE Info_Mod_Caine_Leichengase (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase_Condition;
	information	= Info_Mod_Caine_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Found a problem with the smell?";
};

FUNC INT Info_Mod_Caine_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_00"); //Found a problem with the smell?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_01"); //Yes... No... Maybe. I have developed various odor killers, maskers and neutralizers.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_02"); //But I don't know if and if so, which one works. First, I need an odour or better yet, a smell sample.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_03"); //Would you be so kind...?
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_04"); //What? The one is blind! I'm not just going in there!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_05"); //Yes, yes.... I understand. Here, take this.

	B_GiveInvItems	(self, hero, ItSc_TrfGolem, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_06"); //Well, we've turned the marsh sharks into two mountains.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_07"); //Go to a mountain and just rip it out a little bit.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_08"); //Then you turn back and bring me the sample.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Baal Caine needs a sample. For this purpose I am to use the metamorphic role he has given me and to pull out a piece of one of the marsh shark mountains.");
};

INSTANCE Info_Mod_Caine_Leichengase2 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase2_Condition;
	information	= Info_Mod_Caine_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Your.... Rehearsal.";
};

FUNC INT Info_Mod_Caine_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase))
	&& (Npc_HasItems(hero, ItMi_Sumpfhaiprobe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_00"); //Your.... Rehearsal.

	B_GiveInvItems	(hero, self, ItMi_Sumpfhaiprobe, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_01"); //Excellent! You did very well and I'm proud of you, too!
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_02"); //Thank you....
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_03"); //Jetzt brauche ich noch ein paar "volunteers".
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_04"); //Then get on the Templar platform. I want to be surrounded by as much fresh air as possible.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_05"); //In the meantime, I will make the necessary preparations.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "I'm supposed to go on the Templar platform later. Baal Caine will prepare everything for the trial.");

	B_StartOtherRoutine	(self, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1324_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "LEICHENGASE");
};

INSTANCE Info_Mod_Caine_Leichengase3 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase3_Condition;
	information	= Info_Mod_Caine_Leichengase3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase2))
	&& (Npc_GetDistToWP(self, "PSI_TRAINING_TEACHER") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_00"); //Here you come at last. Everything is already prepared.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_01"); //Ich habe die "assay" mit verschiedenen Substanzen bearbeitet.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_02"); //Now it's up to the testers to find out which one worked.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase3_15_03"); //And how do we do that?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_04"); //I have some glass vials tied to arrows.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_05"); //On impact, they break and give us their greasy, smelly truth.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_06"); //(screaming) Volunteers line up;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE2");
};

INSTANCE Info_Mod_Caine_Leichengase4 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase4_Condition;
	information	= Info_Mod_Caine_Leichengase4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase3))
	&& (Mod_Caine_Leichengase == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase4_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_00"); //Ha! Look, someone's still standing. Novice number 3... which means reagent 3 is the solution to our problem!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_01"); //All we have to do now is produce the stuff on a large scale. We just need... uh-huh.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_02"); //What?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_03"); //This is going to be a bit complicated. Reagent 3 was Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_04"); //Does that mean I get to rummage in troll piles now?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_05"); //Wäre die Sache doch nur so einfach. Es ist ... "particular" Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_06"); //Especially in what way?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_07"); //The troll was vegetarian.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_08"); //He used to live in the swamp, I don't know how he got there.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_09"); //He ate mainly swamp sharks.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_10"); //But probably all the smoke of the swampweed has clouded his head a little.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_11"); //One day, he'd only eat plants. Swampwort, ferns, berries.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_12"); //What's all over the swamp.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_13"); //And then what happened to him?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_14"); //What do you think? He's starved to death, of course. A vegetarian troll, that's ridiculous.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_15"); //And why did you keep his droppings again?!?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_16"); //It doesn't matter now.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_17"); //It's important that you get a few trolls to eat this bog herbal mix here and then bring me their warm soft steaming troll heaps!

	B_GiveInvItems	(self, hero, ItMi_Sumpfkraeuter, 1);

	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_18"); //And how am I supposed to do that?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_19"); //I'm sure you'll find a way. Why don't you ask people who know about this stuff?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_20"); //Hunters, peasants, maybe a magician can help you.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Baal Caine needs the faeces of a vegetarian troll for the antidote. He gave me a blend of herbs that I need to get to the troll somehow. I should check with someone who knows something like that. A peasant, a hunter, or maybe a magician. Hm, that would probably be most suitable for Lobart, Dragomir and Milten.");

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "START");
};

INSTANCE Info_Mod_Caine_Leichengase5 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase5_Condition;
	information	= Info_Mod_Caine_Leichengase5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here's your troll poop!";
};

FUNC INT Info_Mod_Caine_Leichengase5_Condition()
{
	if (Npc_HasItems(hero, ItMi_Trollhaufen) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase5_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase5_15_00"); //Here's your troll poop!

	B_GiveInvItems	(hero, self, ItMi_Trollhaufen, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_31_01"); //I am deeply indebted to you!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_31_02"); //Go to Baal Namib and tell him that his novices can breathe again.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Caine_Woher (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Woher_Condition;
	information	= Info_Mod_Caine_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "How did you get into this camp?";
};

FUNC INT Info_Mod_Caine_Woher_Condition()
{
	if (Guru_Dabei == 1)
	|| (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Woher_15_00"); //How did you get into this camp?
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_01"); //I used to be an apprentice in Khorini's alchemist Constantino, maybe you know him.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_02"); //Anyway, I was experimenting with bogweed back then and when I got caught, they threw me into the colony.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_03"); //Since I also like to smoke some bogweed myself, I went to the brotherhood and became Kalom's apprentice.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_04"); //He was always my great role model and I tried to live like him, but after he moved out looking for the sleeper, I stayed here.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_05"); //Only recently, Cor Cadar and Cor Angar appointed me as a guru and alchemist master.
};

INSTANCE Info_Mod_Caine_BistGuru (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_BistGuru_Condition;
	information	= Info_Mod_Caine_BistGuru_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_BistGuru_Condition()
{
	if (Guru_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_BistGuru_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_BistGuru_31_00"); //Now that you're one of us gurus, I can teach you alchemy.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Baal Caine can teach me about alchemy.");
};

INSTANCE Info_Mod_Caine_Lehrer (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Lehrer_Condition;
	information	= Info_Mod_Caine_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Teach me about alchemy.";
};

FUNC INT Info_Mod_Caine_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_BistGuru))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Caine_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Caine_Lehrer_31_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
	Info_AddChoice 		(Info_Mod_Caine_Lehrer,DIALOG_BACK,Info_Mod_Caine_Lehrer_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Speed Potion", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Caine_Lehrer_Speed);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Caine_Lehrer,B_BuildLearnString ("Essence of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Caine_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Extract of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Caine_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Elixir of Healing", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Caine_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Caine_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Extract", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Caine_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Caine_Lehrer_Mana_03);
	};
};
FUNC VOID Info_Mod_Caine_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Caine_Trade (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Trade_Condition;
	information	= Info_Mod_Caine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Caine_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Caine_EXIT (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_EXIT_Condition;
	information	= Info_Mod_Caine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Caine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
