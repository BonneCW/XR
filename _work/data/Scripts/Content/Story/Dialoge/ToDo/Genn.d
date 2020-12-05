INSTANCE Info_Mod_Genn_Hi (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Hi_Condition;
	information	= Info_Mod_Genn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_00"); //You're just in time.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_01"); //You're with two friends.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_02"); //You're in the company of a friend.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_03"); //Who are you?
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_04"); //I want to join you transformation magicians.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_05"); //Then you've got yourself a plus point on this one. If you want, I'll tell you a few bars about our little problem here in the valley.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_06"); //That's why I'm here.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_07"); //That's good news. Look around you here. The goblins are destroying our beloved valley. We don't know exactly where they come from, but we have a hunch.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_08"); //A few days ago there was an earthquake that revealed the entrance of a huge cave system.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_09"); //We suspect that the caves have been buried and the goblins have taken our valley as an escape route.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_10"); //But the matrons do not stop getting new litters, and so we have no peace from them here.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_11"); //What do you want me to do?
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_12"); //It's best if you kill the matrons. We can handle the rest.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_13"); //Of course, you can also kill any goblin that crosses your way.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_14"); //I'll be on my way right away.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_15"); //Before you go off, take this. It'll help you.

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 2);

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_16"); //But don't use it in the presence of people, or they might think you're a monster.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_17"); //And what about my companions?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_18"); //They will only accompany you to the village, the rest you have to do alone.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_19"); //And what about my companion?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_20"); //He will only accompany you to the village, the rest you have to do alone.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_21"); //I see. Then I'd better get going.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "I'm supposed to kill the goblin cartridges so they can't have offspring.");
};

INSTANCE Info_Mod_Genn_Matronen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Matronen_Condition;
	information	= Info_Mod_Genn_Matronen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Matronen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lorforn_Hi))
	&& (TUG_Lorforn == TRUE)
	&& (Npc_IsDead(Gobbo_Matrone))
	&& (((Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1))
	|| (!Npc_IsDead(Mod_1962_OUT_Lorforn_TUG)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Matronen_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_00"); //Are the matrons dead?
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_15_01"); //Yeah, I killed her. Besides, I know the culprit responsible for the earthquake.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_02"); //Who is it?

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	if (Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1)
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "There was this guy named Lorforn....", Info_Mod_Genn_Matronen_B);
	}
	else
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "There was this guy with leather clothes....", Info_Mod_Genn_Matronen_A);
	};
};

FUNC VOID Info_Mod_Genn_Matronen_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_C_15_00"); //Thanks. I'll see you around.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_01"); //Certainly. I wish you all the best. The teleporter is still activated. If you hurry, you can make it across to the Minental.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_02"); //Your two companions, however, will have to stay here.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	}
	else if ((Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_03"); //Your companion has to stay here, though.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	};

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "STUDIEREN");
};

FUNC VOID Info_Mod_Genn_Matronen_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_B_15_00"); //There was this guy named Lorforn, the one from a' P. to start the quake. Here's the letter of proof.

	B_GiveInvItems	(hero, self, ItWr_LorfornsBrief, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Genn_Matronen_B_09_01"); //Thank you for this letter. We'll stick to the point. Here's a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "I described the situation to Genn and got paid. I should be heading back to the Minental.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

FUNC VOID Info_Mod_Genn_Matronen_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_A_15_00"); //There was this guy in leather clothes who said he was sent to do this. I let him go.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_A_09_01"); //Thanks for the information. We'll stick to the point. Here's a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "I described the situation to Genn and got paid. I should be heading back to the Minental.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

INSTANCE Info_Mod_Genn_Faice (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Faice_Condition;
	information	= Info_Mod_Genn_Faice_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Faice_Condition()
{
	if (Mod_VMG_FaiceGifty_Gift == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Faice_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Faice_09_00"); //That's a coincidence, we were just talking about you.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Info_AddChoice	(Info_Mod_Genn_Faice, "Who is this guy?", Info_Mod_Genn_Faice_B);
	Info_AddChoice	(Info_Mod_Genn_Faice, "What was that all about?", Info_Mod_Genn_Faice_A);
};

FUNC VOID Info_Mod_Genn_Faice_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_00"); //Who is this guy?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_01"); //That's Sören. He comes from far away to help us rebuild our settlement.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_02"); //I'm glad, Sören. I am....
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_03"); //That's Sören. He comes from far away to help us rebuild our settlement.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 4;
};

FUNC VOID Info_Mod_Genn_Faice_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_00"); //What was that all about?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_01"); //It was the landslide before the Goblin plague, if you remember.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_02"); //Yeah, how could I forget?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_03"); //Why are you here?

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Mod_VMG_FaiceGifty_Gift = 5;
};

INSTANCE Info_Mod_Genn_Mendulus (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Mendulus_Condition;
	information	= Info_Mod_Genn_Mendulus_Info;
	permanent	= 0;
	important	= 0;
	description	= "I am looking for a large medicinal plant with purple stanchions. Have you seen her?";
};

FUNC INT Info_Mod_Genn_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Faice))
	&& (Mod_VMG_FaiceGifty_Gift == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Mendulus_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_15_00"); //I am looking for a large medicinal plant with purple stanchions. Have you seen her?
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_01"); //Of course I know the Mendulus herb. Remember the cave with the matrons? It's growing around here, if I'm not mistaken.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_02"); //If you're already there, you can bring me one.

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "The plant is called' Mendulus herb' and grows near the entrance to the cave, where the goblin matrons were located.");

	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_01");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_02");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_03");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_04");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_05");

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "I'm not playing the errand boy for you.", Info_Mod_Genn_Mendulus_B);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "All clear. I'll see you around.", Info_Mod_Genn_Mendulus_A);
};

FUNC VOID Info_Mod_Genn_Mendulus_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_B_15_00"); //I'm not playing the errand boy for you.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_B_09_01"); //Come on, if you're on your way anyway...
	
	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	AI_StopProcessInfos	(self);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "No, forget it.", Info_Mod_Genn_Mendulus_D);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Okay.", Info_Mod_Genn_Mendulus_C);
};

FUNC VOID Info_Mod_Genn_Mendulus_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_A_15_00"); //All clear. I'll see you around.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Good luck to you.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_D_15_00"); //No, forget it.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_D_09_01"); //You've changed. Unfortunately.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_C_15_00"); //Okay.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Good luck to you.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

INSTANCE Info_Mod_Genn_Soeren (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Soeren_Condition;
	information	= Info_Mod_Genn_Soeren_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Soeren_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Soeren_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 8)
	&& (Npc_HasItems(hero, ItWr_SoerensPBrief) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Soeren_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_00"); //Have you seen Sören? He disappeared so suddenly.
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_15_01"); //Yes, indeed. Here, read this.

	B_GiveInvItems	(hero, self, ItWr_SoerensPBrief, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_02"); //But... That's terrible! How could I have fallen for him? And that P again.

	B_StartOtherRoutine	(self, "START");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "What about my payment?", Info_Mod_Genn_Soeren_B);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "What are you going to do now?", Info_Mod_Genn_Soeren_A);
};

FUNC VOID Info_Mod_Genn_Soeren_E()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_E_15_00"); //I'll go back to the Minental, if you don't mind.
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_01"); //No, the teleporter is still active.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_02"); //Oh, before I forget, here's your reward. You've done us a great service.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "I talked to Genn and got my reward. I should now return to the Valley of Minental while the teleporter is still active.");

		Mod_VMG_FaiceGifty_Gift = 9;
	};
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_B_15_00"); //How about a reward?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_B_09_01"); //Of course, here. Take this gold as a reward.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	Mod_VMG_FaiceGifty_Gift = 9;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "I talked to Genn and got my reward. I should now return to the Valley of Minental while the teleporter is still active.");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "What, that's all?", Info_Mod_Genn_Soeren_D);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "Thanks. What are you going to do now?", Info_Mod_Genn_Soeren_C);
};

FUNC VOID Info_Mod_Genn_Soeren_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_A_15_00"); //What are you going to do now?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_A_09_01"); //I'm gonna do some research. We need to find out who this P is. is.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		Info_ClearChoices	(Info_Mod_Genn_Soeren);

		Info_AddChoice	(Info_Mod_Genn_Soeren, "What about my payment?", Info_Mod_Genn_Soeren_B);
		Info_AddChoice	(Info_Mod_Genn_Soeren, "I'll go back to the Minental, if you don't mind.", Info_Mod_Genn_Soeren_E);
	}
	else
	{
		Info_Mod_Genn_Soeren_E();
	};
};

FUNC VOID Info_Mod_Genn_Soeren_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_D_15_00"); //What, that's all?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_D_09_01"); //Be satisfied with it. Now get out of here, the teleporter is still active.

	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_C_15_00"); //Thanks.

	Info_Mod_Genn_Soeren_A();
};

INSTANCE Info_Mod_Genn_Gift (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Gift_Condition;
	information	= Info_Mod_Genn_Gift_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Gift_Condition()
{
	if (Mod_Turendil_Faice_Day == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Gift_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Gift_09_00"); //Greetings to me. Can I help you? After all you've done for us, it would be an honor to help you.
		
	Info_ClearChoices	(Info_Mod_Genn_Gift);

	Info_AddChoice	(Info_Mod_Genn_Gift, "I'll find my way around.", Info_Mod_Genn_Gift_B);
	Info_AddChoice	(Info_Mod_Genn_Gift, "I'm looking for the poison Faice was poisoned with.", Info_Mod_Genn_Gift_A);
};

FUNC VOID Info_Mod_Genn_Gift_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_B_15_00"); //I'll find my way around.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_B_09_01"); //Whatever you say.

	Info_ClearChoices	(Info_Mod_Genn_Gift);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Gift_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_00"); //I'm looking for the poison Faice was poisoned with, if you've heard of it.

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_01"); //The culprit is said to be here in Tugettso and a transforming mage or warrior.
		AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_02"); //What? How is that possible? I know almost all the members personally.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_03"); //I can only make assumptions about the poison. We have a few poisonous plants here.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_04"); //It's best if you bring me one of each one. Here's your list.

	B_GiveInvItems	(self, hero, ItWr_GennGiftListe, 1);

	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_01");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_02");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_03");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_01");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_02");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_03");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_01");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_02");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_03");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_01");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_02");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_03");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_01");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_02");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_03");

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Genn sent me a list of all the poisonous plants found in Tugettso. I'm supposed to get him a copy of any kind.");

	Mod_Turendil_Faice_Day = 2;

	Info_ClearChoices	(Info_Mod_Genn_Gift);
};

INSTANCE Info_Mod_Genn_Trador (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trador_Condition;
	information	= Info_Mod_Genn_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trador_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_00"); //What's happening? You don't look so good.
	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_01"); //I was attacked by golems when I collected the plants.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_02"); //After that, some weirdo named Trador took the plants from me.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_03"); //Afterwards, a weirdo named Trador approached me and wanted to have the plants.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_04"); //He said he was a high member of the transformative magicians.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_05"); //That's terrible!
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_06"); //I don't know a member of that name, but if he wore one of our robes, he must have killed one of us.
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_07"); //We only give such a robe to selected members.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_08"); //Oh, and furthermore I have to ask you to collect the plants again, because I still need them.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_09"); //Did Trador tell you why he did this?

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_10"); //By extraditing Furt, Trador became aware of me.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_11"); //He and Furt made a common cause.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_12"); //After I let Furt go, he went to Trador and told him about me.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_13"); //They've done something in common.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_14"); //But he didn't tell me why they wanted to poison Faice.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_15"); //I leave immediately and collect the plants again.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_16"); //I suggest we proceed as follows:
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_17"); //You go to the village and try to find out who has disappeared, so that we know from whom this Trador has the robe and maybe even some more knowledge about us.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_18"); //Bring me the plants first, please.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_19"); //I'll bring you the plants and find out which magician was killed.

		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "I have to get Genn one more copy of every poisonous plant for Genn to continue his investigations.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_20"); //Will you give me the plants, please? I'll examine her as long as I want.
	};
};

INSTANCE Info_Mod_Genn_Giftpflanzen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Giftpflanzen_Condition;
	information	= Info_Mod_Genn_Giftpflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Here are the plants.";
};

FUNC INT Info_Mod_Genn_Giftpflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Trador))
	&& (Npc_HasItems(hero, ItPl_Mushroom_04) >= 1)
	&& (Npc_HasItems(hero, ItPl_Venena) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mithrida) >= 1)
	&& (Npc_HasItems(hero, ItPl_Piante) >= 1)
	&& (Npc_HasItems(hero, ItPl_Ponzola) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Giftpflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Giftpflanzen_15_00"); //Here are the plants.

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_04, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mithrida, 1);
	Npc_RemoveInvItems	(hero, ItPl_Piante, 1);
	Npc_RemoveInvItems	(hero, ItPl_Ponzola, 1);
	Npc_RemoveInvItems	(hero, ItPl_Venena, 1);

	B_ShowGivenThings	("planting");

	AI_Output(self, hero, "Info_Mod_Genn_Giftpflanzen_09_01"); //Thank you very much, I'll examine her as long as you keep an eye out for the missing magician.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Now it's up to me to find out who was killed by Trador. I should take a look around the village.");

	AI_UnequipArmor	(Mod_7357_VMG_Dean_Tug);
	Npc_RemoveInvItems	(Mod_7357_VMG_Dean_TUG, ItAr_Naturmagier2, 1);

	B_StartOtherRoutine	(Mod_7357_VMG_Dean_TUG, "ERMORDET");
	B_KillNpc	(Mod_7357_VMG_Dean_TUG);

	Wld_InsertNpc	(Golem_DeanKiller, "TUG_83");
};

INSTANCE Info_Mod_Genn_Dean (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Dean_Condition;
	information	= Info_Mod_Genn_Dean_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Dean_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Dean))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dever_Dean))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Dean_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_00"); //And? What did you find out?
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_01"); //The killed magician's name is Dean.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_02"); //He was attacked by a golem as he set out to investigate the old stone circle.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_03"); //Strangely enough, no one has seen the Golem before.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_04"); //Dean then. That's quite a shot.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_05"); //He took care of the mystical and inexplicable matters.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_06"); //We have to assume our enemy knows things that don't concern him.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_07"); //What happens now?
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_08"); //Oh, yes, exactly. I checked the plants.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_09"); //I think he was poisoned with the Venena plant. Here's a copy of this.

	B_GiveInvItems	(self, hero, ItPl_Venena, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_10"); //Now go to Turendil and tell him everything you've found out.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_11"); //He'll know what to do.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_12"); //Okay, thank you. I'll be on my way then.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_13"); //Come on, hurry up.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Genn found out Faice was poisoned by the venom of the Venena plant. I should go back to Turendil now and tell him everything I found out.");
};

INSTANCE Info_Mod_Genn_TradorTot (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_TradorTot_Condition;
	information	= Info_Mod_Genn_TradorTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_TradorTot_Condition()
{
	if (Mod_VMG_WSTrador == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_TradorTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_09_00"); //Where did you come from? And what was that noise back there?

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	Info_AddChoice	(Info_Mod_Genn_TradorTot, "The long version.", Info_Mod_Genn_TradorTot_B);
	Info_AddChoice	(Info_Mod_Genn_TradorTot, "The short version", Info_Mod_Genn_TradorTot_A);
};

FUNC VOID Info_Mod_Genn_TradorTot_C()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_00"); //Very good, I'm proud of you.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_01"); //I think it would be best if I activated the teleporter back in the Minental for you, so you could tell Turendil about this.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_C_15_02"); //Do that.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_03"); //There, you can do it. I'll see you around.

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Genn knows and has activated the portal for the way back. Now I should go to Turendil.");

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_TradorTot_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_00"); //The long version:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_01"); //After Trador had manipulated the teleporter, I came out in a remote valley.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_02"); //There I got to know the two hermits Setta and Buff and repaired the valley's own teleporter.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_03"); //Afterwards we came here and were surprised by Trador.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_04"); //I killed him and took away his spell rolls to golem incantation.

	Info_Mod_Genn_TradorTot_C();
};

FUNC VOID Info_Mod_Genn_TradorTot_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_00"); //The short version:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_01"); //Trador is dead, and I've secured the spell rolls to the Golembeschwurge. He had tampered with the teleporter.

	Info_Mod_Genn_TradorTot_C();
};

INSTANCE Info_Mod_Genn_Pruefung (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung_Condition;
	information	= Info_Mod_Genn_Pruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Faice sent me.";
};

FUNC INT Info_Mod_Genn_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Pruefung))
	&& (Mod_VMG_Pruefung == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_15_00"); //Faice sent me.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_09_01"); //Yeah, I know. You want to master the three tests that instruct you in our practices, right?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "What kind of tests?", Info_Mod_Genn_Pruefung_B);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "That's how it is.", Info_Mod_Genn_Pruefung_A);
};

FUNC VOID Info_Mod_Genn_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_B_15_00"); //What kind of tests?
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_01"); //Faice didn't tell you that? Then it's not mine either.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_02"); //You will be asked to complete tasks one after the other, which you will have to solve without help.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_03"); //I will now impose the first of these tasks on you. Are you ready?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "There's something I have to do.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "I am ready!", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_A_15_00"); //That's how it is.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_A_09_01"); //Then I'll give you the first task. Are you ready?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "There's something I have to do.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "I am ready!", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_D_15_00"); //There's something I have to do.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_D_09_01"); //Come on, hurry up.

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);
};

FUNC VOID Info_Mod_Genn_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_00"); //I'm ready.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_01"); //You may have noticed the temple in front of our camp.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_02"); //If not, I have prepared a map for you showing the position.

	B_GiveInvItems	(self, hero, ItWr_Map_Tugettso_Tempel, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_03"); //I will also give you three spell rolls, which you have to use wisely.

	B_ShowGivenThings	("3 Keeping saying-rolls");

	CreateInvItems	(hero, ItSc_TrfMeatbug, 1);
	CreateInvItems	(hero, ItSc_TrfBloodfly, 1);
	CreateInvItems	(hero, Itsc_TrfSheep, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_04"); //Down in the temple, at the very end is a chest. Bring me the item that's in it. A teleporter will lead you back to me.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_05"); //But be warned: you will only be able to reach your goal with the role of spellcasting, because the road is blocked by three obstacles.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_06"); //Think carefully about which role you use for which obstacle. Any more questions?
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_07"); //No.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_08"); //All right, here's the key and a teleport spell.

	B_ShowGivenThings	("Preserving the key and saying role");

	CreateInvItems	(hero, ItSc_TeleportGenn, 1);
	CreateInvItems	(hero, ItKe_TugettsoTempel, 1);

	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_09"); //All right, I'll be on my way.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_10"); //Good luck!

	Mod_VMG_Pruefung = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "I am to go to the temple, which is marked on the map of Tugettso and with the help of three rolls of spell, to fetch an object from its vault.");

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Genn_Pruefung2 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung2_Condition;
	information	= Info_Mod_Genn_Pruefung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm back.";
};

FUNC INT Info_Mod_Genn_Pruefung2_Condition()
{
	if (Mod_VMG_Pruefung == 1)
	&& (Mod_VMG_Pruefung_Teleport > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_00"); //I'm back.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_01"); //And? Did you get the item?

	if (Npc_HasItems(hero, ItMi_Statue_Genn) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_02"); //Here's the bust.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_03"); //Wonderful, you did the first job! Give me the bust.
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_04"); //Here you have them.

		B_GiveInvItems	(hero, self, ItMi_Statue_Genn, 1);

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "I solved the first task to Genn's satisfaction. Asko will now give me the next task. He's waiting for me in the village.");

		Mod_VMG_Pruefung_Genn = 1;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_05"); //No.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_06"); //Oh, I see. It's a tricky situation. I shouldn't be allowed to let you go any further.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_07"); //But you've already done so much for our valley that I'll turn a blind eye.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_08"); //I'll tell Faice about it, but you can't fail in any other task now!
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_09"); //Do you understand me?
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_10"); //All clear.

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "I couldn't solve Genn's problem. Now Asko is supposed to give me the next task that I shouldn't fail.");

		Mod_VMG_Pruefung_Genn = 2;
	};

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_11"); //Good. Asko will give you the next task. Why don't you go straight to him?
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_12"); //He's back in the village by now.

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "START");
};

INSTANCE Info_Mod_Genn_Pruefung3 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung3_Condition;
	information	= Info_Mod_Genn_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm back.";
};

FUNC INT Info_Mod_Genn_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Pruefung4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_00"); //I'm back.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_01"); //I'm glad you did. I don't want to hold you up for long, because Faice wants to see you.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_02"); //I'll find out how it turned out. I certainly wish you good luck!
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_03"); //The teleporter is active, you can get on your way right away.
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_04"); //Thank you very much.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_05"); //Bye, now!
};

var int Mod_Knows_GennTrader;

INSTANCE Info_Mod_Genn_Trade (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trade_Condition;
	information	= Info_Mod_Genn_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Genn_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Trade_Info()
{
	if (Mod_Knows_GennTrader == FALSE)
	{
		Mod_Knows_GennTrader = TRUE;

		Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Genn deals in magical accessories.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Genn_Pickpocket (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pickpocket_Condition;
	information	= Info_Mod_Genn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Genn_Pickpocket_Condition()
{
	C_Beklauen	(55, ItSc_TrfBloodfly, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_BACK, Info_Mod_Genn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Genn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Genn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
};

FUNC VOID Info_Mod_Genn_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Genn_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Genn_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Genn_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Genn_EXIT (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_EXIT_Condition;
	information	= Info_Mod_Genn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Genn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
