INSTANCE Info_Mod_Hakon_Hi (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Hi_Condition;
	information	= Info_Mod_Hakon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Hi_Condition()
{
	if (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Hi_03_00"); //Hello stranger, I'm Hakon the arms dealer. If you need a sword, you've come to the right place.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Hakon sells weapons at the marketplace.");
};

INSTANCE Info_Mod_Hakon_Ueberfall (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Ueberfall_Condition;
	information	= Info_Mod_Hakon_Ueberfall_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Hakon provoking a brawl)";
};

FUNC INT Info_Mod_Hakon_Ueberfall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Mod_HakonUeberfall == 0)
	&& (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Ueberfall_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_00"); //You're just selling the last piece of junk! With your guns, I couldn't get rid of the dirt between my toes.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_01"); //Hey, watch your mouth. All I have here is quality merchandise.
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_02"); //Like you could judge that somehow. I can see at a glance that you're too weak to carry even one of your own weapons.
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_03"); //Well, don't blow yourself up like that, or I'll put something behind the spoons.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_04"); //Boy, you're overstretching the bow here. You better watch yourself, or something will happen!
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_05"); //Yeah, don't get angry, kid. I'll go to the marketplace and spread the laughing stock around the people. I'm sure you don't mind. Can't do anything about it anyway.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_06"); //All right, that's enough!
	
	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_NONE, 1);

	Mod_HakonUeberfall = 1;
};

INSTANCE Info_Mod_Hakon_Weglocken (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Weglocken_Condition;
	information	= Info_Mod_Hakon_Weglocken_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, I found something interesting outside of town. )";
};

FUNC INT Info_Mod_Hakon_Weglocken_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Mod_HakonUeberfall == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Weglocken_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_15_00"); //Hey, I found something interesting outside of town that you need to see.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_03_01"); //Yeah, what is it?

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "I can't tell you that here. You've got to see it first.", Info_Mod_Hakon_Weglocken_C);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "In a cave in front of the city I found a great treasure.", Info_Mod_Hakon_Weglocken_B);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "In a cave outside the city I found some weapons.", Info_Mod_Hakon_Weglocken_A);
};

FUNC VOID Info_Mod_Hakon_Weglocken_C()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_C_15_00"); //I can't tell you that here. You've got to see it first.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_C_03_01"); //What else?! Like I've got nothing better to do than look at something outside the city...

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Mod_HakonUeberfall = 2;

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Hakon_Weglocken_B()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_B_15_00"); //In a cave in front of the city I found a great treasure. Unfortunately, two giant rats showed up and chased me away. Can you help me recover the treasure?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_B_03_01"); //A big treasure in a cave outside the city? No, boy, fairy tale hour's just tonight.

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);
};

FUNC VOID Info_Mod_Hakon_Weglocken_A()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_A_15_00"); //In a cave outside the city I found some weapons. Unfortunately, two goblin's showed up and chased me away. Can you help me recover the weapons?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_A_03_01"); //Two gobbos? Huh, ridiculous. Take me to the cave. I've got to take a look at those guns.

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Mod_HakonUeberfall = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Hakon_Neugier (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Neugier_Condition;
	information	= Info_Mod_Hakon_Neugier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Neugier_Condition()
{
	if (Mod_HakonUeberfall == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Neugier_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Neugier_03_00"); //Uh, well, maybe a quick glance. Take me there. But woe betide it's nothing interesting.

	Mod_HakonUeberfall = 4;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Hakon_Falle (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Falle_Condition;
	information	= Info_Mod_Hakon_Falle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Falle_Condition()
{
	if ((Mod_HakonUeberfall == 3)
	|| (Mod_HakonUeberfall == 4))
	&& (Npc_GetDistToWP(hero, "NW_CITY_HAKON") > 5000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Falle_Info()
{
	if (Mod_HakonUeberfall == 3)
	{
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_00"); //So where's the cave with guns and goblin's now?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_01"); //Oh, the weapons are here already only Goblins were not, but... a bandit.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_02"); //So where's what you wanted to show me?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_03"); //A bandit.
	};

	AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_04"); //What, where?

	Mod_HakonUeberfall = 1;

	B_StartOtherRoutine	(self, "START");

	AI_DrawWeapon	(self);

	AI_TurnAway	(self, hero);

	AI_StopProcessInfos	(self);

	AI_DrawWeapon	(hero);

	B_Attack	(self, hero, AR_None, 2);
};

INSTANCE Info_Mod_Hakon_Blutkelch (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Blutkelch_Condition;
	information	= Info_Mod_Hakon_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm looking for a so-called blood cup.";
};

FUNC INT Info_Mod_Hakon_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_00"); //I'm looking for a so-called blood cup.
	AI_Output(self, hero, "Info_Mod_Hakon_Blutkelch_03_01"); //I can't help you there either. I deal in guns.
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_02"); //Thanks anyway.
};

INSTANCE Info_Mod_Hakon_Mario (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Mario_Condition;
	information	= Info_Mod_Hakon_Mario_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Olav_Mario))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Mario_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_00"); //Oh, man, am I pissed right now. Some idiot reported me selling stolen merchandise.
	AI_Output(hero, self, "Info_Mod_Hakon_Mario_15_01"); //Such troublemakers exist again and again.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_02"); //The problem is that I'm actually not quite.... with legal weapons.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_03"); //But I hadn't even laid it out. One of my middlemen must have had a chat. What a pig!
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_04"); //Now I was allowed to pay a fine.
};

INSTANCE Info_Mod_Hakon_Anschlagtafel (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Anschlagtafel_Condition;
	information	= Info_Mod_Hakon_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Hakon_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Hakon == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMw_ShortSword1) >= Mod_Anschlagtafel_Khorinis_Hakon_MilizKurzchwert)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Sword) >= Mod_Anschlagtafel_Khorinis_Hakon_Degen)
	&& (Npc_HasItems(hero, ItMw_ShortSword3) >= Mod_Anschlagtafel_Khorinis_Hakon_Kurzschwert)
	&& (Npc_HasItems(hero, ItAm_Prot_Point_01) >= Mod_Anschlagtafel_Khorinis_Hakon_AmulettEichenhaut)
	&& (Npc_HasItems(hero, ItRi_Prot_Edge_01) >= Mod_Anschlagtafel_Khorinis_Hakon_RingEisenhaut)
	&& (Npc_HasItems(hero, ItRi_Str_01) >= Mod_Anschlagtafel_Khorinis_Hakon_RingKraft)
	&& (Npc_HasItems(hero, ItMw_1H_quantarie_Schwert_01) >= Mod_Anschlagtafel_Khorinis_Hakon_Schwert)
	{
		Npc_RemoveInvItems	(hero, ItMw_ShortSword1, Mod_Anschlagtafel_Khorinis_Hakon_MilizKurzchwert);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Sword, Mod_Anschlagtafel_Khorinis_Hakon_Degen);
		Npc_RemoveInvItems	(hero, ItMw_ShortSword3, Mod_Anschlagtafel_Khorinis_Hakon_Kurzschwert);
		Npc_RemoveInvItems	(hero, ItAm_Prot_Point_01, Mod_Anschlagtafel_Khorinis_Hakon_AmulettEichenhaut);
		Npc_RemoveInvItems	(hero, ItRi_Prot_Edge_01, Mod_Anschlagtafel_Khorinis_Hakon_RingEisenhaut);
		Npc_RemoveInvItems	(hero, ItRi_Str_01, Mod_Anschlagtafel_Khorinis_Hakon_RingKraft);
		Npc_RemoveInvItems	(hero, ItMw_1H_quantarie_Schwert_01, Mod_Anschlagtafel_Khorinis_Hakon_Schwert);

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Hakon_Gold);

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Hakon = 0;
		Mod_Anschlagtafel_Khorinis_Hakon_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Hakon, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Hakon_Trade (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Trade_Condition;
	information	= Info_Mod_Hakon_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hakon_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hakon_Hi))
	&& (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hakon_Pickpocket (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Pickpocket_Condition;
	information	= Info_Mod_Hakon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Hakon_Pickpocket_Condition()
{
	C_Beklauen	(108, ItMi_Gold, 38);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

	Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_BACK, Info_Mod_Hakon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hakon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hakon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hakon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hakon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hakon_EXIT (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_EXIT_Condition;
	information	= Info_Mod_Hakon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hakon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hakon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
