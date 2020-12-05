INSTANCE Info_Mod_Zuris_Hi (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Hi_Condition;
	information	= Info_Mod_Zuris_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zuris_Hi_Condition()
{
	if (Wld_IsTime(06,30,20,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zuris_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Zuris_Hi_30_00"); //Welcome to Khorinis, stranger. If you ever feel the urge to practise some magic or to undergo the healing effects of a potion, then come to me.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Zuris deals in spell rolls and potions.");
};

INSTANCE Info_Mod_Zuris_Scorpio (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Scorpio_Condition;
	information	= Info_Mod_Zuris_Scorpio_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zuris_Scorpio_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zuris_Hi))
	&& (Npc_IsDead(Mod_7600_GRD_Scorpio_NW))
	&& (Npc_IsDead(Mod_7601_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7602_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7603_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7604_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7605_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7606_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7607_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7608_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7609_STT_Schatten_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zuris_Scorpio_Info()
{
	AI_Output(self, hero, "Info_Mod_Zuris_Scorpio_30_00"); //Today is my lucky day!
	AI_Output(hero, self, "Info_Mod_Zuris_Scorpio_15_01"); //Why is that?
	AI_Output(self, hero, "Info_Mod_Zuris_Scorpio_30_02"); //The damned bandits above the bridge are all dead, and I can drive my usual route safely again.
	AI_Output(self, hero, "Info_Mod_Zuris_Scorpio_30_03"); //For that you can get an exquisite healing potion for free today!
	
	B_GiveInvItems	(self, hero, ItPo_Health_03, 1);
	
	B_StartOtherRoutine(self, "START");
};

INSTANCE Info_Mod_Zuris_Blutkelch (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Blutkelch_Condition;
	information	= Info_Mod_Zuris_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "It smells strange in here.";
};

FUNC INT Info_Mod_Zuris_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zuris_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Zuris_Blutkelch_15_00"); //It smells strange in here.
	AI_Output(self, hero, "Info_Mod_Zuris_Blutkelch_30_01"); //True enough. I've added garlic to my offer.
	AI_Output(hero, self, "Info_Mod_Zuris_Blutkelch_15_02"); //Garlic?
	AI_Output(self, hero, "Info_Mod_Zuris_Blutkelch_30_03"); //A plant for seasoning food.
	AI_Output(hero, self, "Info_Mod_Zuris_Blutkelch_15_04"); //Uh-huh. I'm not looking for a tubercle belly....
	AI_Output(self, hero, "Info_Mod_Zuris_Blutkelch_30_05"); //(slowly) K n o b l a u ch.
	AI_Output(hero, self, "Info_Mod_Zuris_Blutkelch_15_06"); //... but a special cup called a blood cup. For rituals and stuff.
	AI_Output(self, hero, "Info_Mod_Zuris_Blutkelch_30_07"); //I don't know anything about that.
};

INSTANCE Info_Mod_Zuris_Anschlagtafel (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Anschlagtafel_Condition;
	information	= Info_Mod_Zuris_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "I saw your poster on the billboard...";
};

FUNC INT Info_Mod_Zuris_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Zuris == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zuris_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItPo_Mana_01) >= Mod_Anschlagtafel_Khorinis_Zuris_Manaessenz)
	&& (Npc_HasItems(hero, ItPo_Mana_02) >= Mod_Anschlagtafel_Khorinis_Zuris_ManaExtrakt)
	&& (Npc_HasItems(hero, ItPo_Health_02) >= Mod_Anschlagtafel_Khorinis_Zuris_HPExtrakt)
	&& (Npc_HasItems(hero, ItPo_Health_03) >= Mod_Anschlagtafel_Khorinis_Zuris_HPElixier)
	&& (Npc_HasItems(hero, ItPo_Mana_03) >= Mod_Anschlagtafel_Khorinis_Zuris_ManaElixier)
	&& (Npc_HasItems(hero, ItSc_InstantFireball) >= Mod_Anschlagtafel_Khorinis_Zuris_Feuerball)
	&& (Npc_HasItems(hero, ItSc_Firebolt) >= Mod_Anschlagtafel_Khorinis_Zuris_Feuerpfeil)
	&& (Npc_HasItems(hero, ItPo_Health_01) >= Mod_Anschlagtafel_Khorinis_Zuris_HPEssenz)
	{
		Npc_RemoveInvItems	(hero, ItPo_Mana_01, Mod_Anschlagtafel_Khorinis_Zuris_Manaessenz);
		Npc_RemoveInvItems	(hero, ItPo_Mana_02, Mod_Anschlagtafel_Khorinis_Zuris_ManaExtrakt);
		Npc_RemoveInvItems	(hero, ItPo_Health_02, Mod_Anschlagtafel_Khorinis_Zuris_HPExtrakt);
		Npc_RemoveInvItems	(hero, ItPo_Health_03, Mod_Anschlagtafel_Khorinis_Zuris_HPElixier);
		Npc_RemoveInvItems	(hero, ItPo_Mana_03, Mod_Anschlagtafel_Khorinis_Zuris_ManaElixier);
		Npc_RemoveInvItems	(hero, ItSc_InstantFireball, Mod_Anschlagtafel_Khorinis_Zuris_Feuerball);
		Npc_RemoveInvItems	(hero, ItSc_Firebolt, Mod_Anschlagtafel_Khorinis_Zuris_Feuerpfeil);
		Npc_RemoveInvItems	(hero, ItPo_Health_01, Mod_Anschlagtafel_Khorinis_Zuris_HPEssenz);

		AI_Output(self, hero, "Info_Mod_Zuris_Anschlagtafel_30_00"); //What? Show me... In fact, all of it. Very well done.
		AI_Output(self, hero, "Info_Mod_Zuris_Anschlagtafel_30_01"); //Here's your reward.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Zuris_Gold);

		AI_Output(self, hero, "Info_Mod_Zuris_Anschlagtafel_30_02"); //Nice doing business with you.

		if (Mod_Anschlagtafel_Khorinis_Zuris_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Zuris_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Zuris_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Zuris = 0;
		Mod_Anschlagtafel_Khorinis_Zuris_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Zuris, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Zuris_Trade (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Trade_Condition;
	information	= Info_Mod_Zuris_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Zuris_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zuris_Hi))
	&& (Wld_IsTime(06,30,20,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zuris_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Zuris_Pickpocket (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_Pickpocket_Condition;
	information	= Info_Mod_Zuris_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Zuris_Pickpocket_Condition()
{
	C_Beklauen	(118, ItPo_Perm_Health, 1);
};

FUNC VOID Info_Mod_Zuris_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);

	Info_AddChoice	(Info_Mod_Zuris_Pickpocket, DIALOG_BACK, Info_Mod_Zuris_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Zuris_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Zuris_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Zuris_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);
};

FUNC VOID Info_Mod_Zuris_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);

		Info_AddChoice	(Info_Mod_Zuris_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Zuris_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Zuris_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Zuris_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Zuris_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Zuris_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Zuris_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Zuris_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Zuris_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Zuris_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Zuris_EXIT (C_INFO)
{
	npc		= Mod_757_NONE_Zuris_NW;
	nr		= 1;
	condition	= Info_Mod_Zuris_EXIT_Condition;
	information	= Info_Mod_Zuris_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Zuris_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zuris_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
