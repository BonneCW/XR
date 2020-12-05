INSTANCE Info_Mod_Gestath_Hi (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Hi_Condition;
	information	= Info_Mod_Gestath_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gestath_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gestath_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_00"); //Well, another brave hunter who wants to turn his trophies into gold?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_01"); //What makes you think I'm a hunter?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_02"); //Why? (laughs) Because all the farmers in the rice fields are frozen.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_03"); //No offense, seriously: you don't seem to come from here, do you?
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_04"); //Yeah, I came over the stone circles.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_05"); //Ahh, so am I back then. Used to live on an island.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_06"); //Then I heard about this area full of ice and snow, where it should be teeming with animals.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_07"); //I've collected all the equipment I need, and I'm off to the mainland. He had heard of a magician who is said to be at home there.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_08"); //Rumor has it that he was crossing the stone circles into the remotest corners of... (interrupts) but what am I going to tell you, you know how it works.
	AI_Output(hero, self, "Info_Mod_Gestath_Hi_15_09"); //And then you opened this place?
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_10"); //Yeah, after a while. At the beginning I was still hunting a lot myself.
	AI_Output(self, hero, "Info_Mod_Gestath_Hi_11_11"); //But then I gradually switched to the trophy trade because I know where on earth you can get good gold for it.
};

INSTANCE Info_Mod_Gestath_Snapperbogen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Snapperbogen_Condition;
	information	= Info_Mod_Gestath_Snapperbogen_Info;
	permanent	= 0;
	important	= 0;
	description	= "You know where I can get a dragon snapper's tendon?";
};

FUNC INT Info_Mod_Gestath_Snapperbogen_Condition()
{
	if (Snapperbogen)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Snapperbogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_Snapperbogen_15_00"); //You know where I can get a dragon snapper's tendon?
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_01"); //Let me think about it.... Yes, the hunter Wütar has specialized in animal tendons. I'm sure you'll get some from him.
	AI_Output(self, hero, "Info_Mod_Gestath_Snapperbogen_11_02"); //If he is not still hunting, you will find him in his hut in the village or in the pub.
};

INSTANCE Info_Mod_Gestath_TrophaenHolen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenHolen_Condition;
	information	= Info_Mod_Gestath_TrophaenHolen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Do you need certain trophies?";
};

FUNC INT Info_Mod_Gestath_TrophaenHolen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_Hi))
	&& (Mod_EIS_Gestath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_TrophaenHolen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenHolen_15_00"); //Do you need certain trophies?

	if (Wld_GetDay() > Mod_EIS_Gestath_Day)
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_01"); //Yeah, I put on that list what I might need again.

		B_GiveInvItems	(self, hero, ItWr_GestathTrophyList, 1);

		Mod_EIS_Gestath_DragonsnapperHorn = r_max(4);
		Mod_EIS_Gestath_LurkerClaw = r_max(10);
		Mod_EIS_Gestath_Keilerhauer = r_max(5);
		Mod_EIS_Gestath_Flammenzunge = r_max(4);
		Mod_EIS_Gestath_ShadowHorn = r_max(4);
		Mod_EIS_Gestath_SharkTeeth = r_max(4);

		Mod_EIS_Gestath = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_TrophaenHolen_11_02"); //No, there are other hunters on the way for me right now.
	};
};

INSTANCE Info_Mod_Gestath_TrophaenGeben (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_TrophaenGeben_Condition;
	information	= Info_Mod_Gestath_TrophaenGeben_Info;
	permanent	= 1;
	important	= 0;
	description	= "I got your trophies.";
};

FUNC INT Info_Mod_Gestath_TrophaenGeben_Condition()
{
	if (Mod_EIS_Gestath == 1)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= Mod_EIS_Gestath_DragonsnapperHorn)
	&& (Npc_HasItems(hero, ItAt_LurkerClaw) >= Mod_EIS_Gestath_LurkerClaw)
	&& (Npc_HasItems(hero, ItAt_Keilerhauer) >= Mod_EIS_Gestath_Keilerhauer)
	&& (Npc_HasItems(hero, ItAt_WaranFiretongue) >= Mod_EIS_Gestath_Flammenzunge)
	&& (Npc_HasItems(hero, ItAt_ShadowHorn) >= Mod_EIS_Gestath_ShadowHorn)
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= Mod_EIS_Gestath_SharkTeeth)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_TrophaenGeben_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_TrophaenGeben_15_00"); //I got your trophies.

	B_ShowGivenThings	("Trophy given");

	Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_EIS_Gestath_DragonsnapperHorn);
	Npc_RemoveInvItems	(hero, ItAt_LurkerClaw, Mod_EIS_Gestath_LurkerClaw);
	Npc_RemoveInvItems	(hero, ItAt_Keilerhauer, Mod_EIS_Gestath_Keilerhauer);
	Npc_RemoveInvItems	(hero, ItAt_WaranFiretongue, Mod_EIS_Gestath_Flammenzunge);
	Npc_RemoveInvItems	(hero, ItAt_ShadowHorn, Mod_EIS_Gestath_ShadowHorn);
	Npc_RemoveInvItems	(hero, ItAt_SharkTeeth, Mod_EIS_Gestath_SharkTeeth);
	Npc_RemoveInvItems	(hero, ItWr_GestathTrophyList, 1);

	AI_Output(self, hero, "Info_Mod_Gestath_TrophaenGeben_11_01"); //All right, thank you. Here's your gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, (Mod_EIS_Gestath_DragonsnapperHorn * Value_DrgSnapperHorn + Mod_EIS_Gestath_LurkerClaw * Value_LurkerClaw + Mod_EIS_Gestath_Keilerhauer * Value_Keilerhauer + Mod_EIS_Gestath_Flammenzunge * Value_WaranFiretongue + Mod_EIS_Gestath_ShadowHorn * Value_ShadowHorn + Mod_EIS_Gestath_SharkTeeth * Value_SharkTeeth) / 2);

	Mod_EIS_Gestath = 0;

	if (Mod_EIS_Gestath_Day == 0) {
		Log_CreateTopic(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
		B_LogEntry(TOPIC_MOD_HAENDLER_EISGEBIET, "Gestath is now trading with me and selling hunting trophies.");
	};
	
	Mod_EIS_Gestath_Day = Wld_GetDay() + 5;
};

INSTANCE Info_Mod_Gestath_Lernen (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr          	= 1;
	condition	= Info_Mod_Gestath_Lernen_Condition;
	information	= Info_Mod_Gestath_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "What can you teach me?";
};

FUNC INT Info_Mod_Gestath_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gestath_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Gestath_Lernen_15_00"); //What can you teach me?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_01"); //Depends on what you want to know.

		Info_ClearChoices	(Info_Mod_Gestath_Lernen);

		Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("pull teeth", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Gestath_Lernen_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Skin animals", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Gestath_Lernen_ReptileSkin);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("chop claws", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Gestath_Lernen_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Fire Tongue", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)), Info_Mod_Gestath_Lernen_FireTongue);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{ 
			Info_AddChoice	(Info_Mod_Gestath_Lernen, B_BuildLearnString("Horn of a Dragonsnapper", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), Info_Mod_Gestath_Lernen_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_11_02"); //I can't teach you any more than you already know. Sorry about that.
	};
};

FUNC void Info_Mod_Gestath_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Gestath_Lernen);
};

FUNC void Info_Mod_Gestath_Lernen_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Claws))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_00"); //Animals don't like to give up their claws. You have to place your knife very precisely.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_01"); //Your hands should be slightly crossed. Then you separate the claw with a powerful tug.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Claws_11_02"); //Merchants are always eager to be paid in claws.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
		
};

FUNC void Info_Mod_Gestath_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_ReptileSkin_11_00"); //And always cut open only on the belly, otherwise you will reduce the quality.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_00"); //The easiest thing you can extract from animals is their teeth. You're driving your knife around the dentures in his mouth.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Teeth_11_01"); //Then you skillfully separate it from the animal's skull with a jerk.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_00"); //The best way to remove the pelt is by making a deep cut along the hind legs.
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_Fur_11_01"); //After that, it should be a cinch to pull off the skin from the front to the back.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_FireTongue))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_FireTongue_11_00"); //You strike the tongue of a fire monitor with a knife cut out of your mouth while holding it with the other hand.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

FUNC void Info_Mod_Gestath_Lernen_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, hero, "Info_Mod_Gestath_Lernen_DrgSnapperHorn_11_00"); //At the base of the dragon snapper's forehead is the best place to separate the horn from the skull with a stable knife.
	};

	Info_ClearChoices	(Info_Mod_Gestath_Lernen);

	Info_AddChoice	(Info_Mod_Gestath_Lernen, DIALOG_BACK, Info_Mod_Gestath_Lernen_BACK);
};

INSTANCE Info_Mod_Gestath_Trade (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Trade_Condition;
	information	= Info_Mod_Gestath_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gestath_Trade_Condition()
{
	if (Mod_EIS_Gestath_Day > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gestath_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gestath_Pickpocket (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_Pickpocket_Condition;
	information	= Info_Mod_Gestath_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Gestath_Pickpocket_Condition()
{
	C_Beklauen	(149, ItAt_DrgSnapperHorn, 2);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

	Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_BACK, Info_Mod_Gestath_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gestath_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gestath_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gestath_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gestath_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gestath_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gestath_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gestath_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gestath_EXIT (C_INFO)
{
	npc		= Mod_974_OUT_Gestath_EIS;
	nr		= 1;
	condition	= Info_Mod_Gestath_EXIT_Condition;
	information	= Info_Mod_Gestath_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gestath_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gestath_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
