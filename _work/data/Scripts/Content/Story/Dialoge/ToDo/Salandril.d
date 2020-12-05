INSTANCE Info_Mod_Salandril_Hi (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Hi_Condition;
	information	= Info_Mod_Salandril_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Salandril_Hi_Condition()
{
	return 1;
};

FUNC VOId Info_Mod_Salandril_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Salandril_Hi_13_00"); //Welcome to my shop, stranger!
	AI_Output(self, hero, "Info_Mod_Salandril_Hi_13_01"); //You can buy potions from me.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "I can buy potions at Salandril.");
};

INSTANCE Info_Mod_Salandril_Alkohol (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Alkohol_Condition;
	information	= Info_Mod_Salandril_Alkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "I'm supposed to pick up booze at your place.";
};

FUNC INT Info_Mod_Salandril_Alkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold)	>=	100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Alkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_00"); //I'm supposed to pick up booze at your place.
	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_01"); //So you're the messenger of fire magicians?
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_02"); //Yes, I am him.
	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_03"); //Here's the booze.

	B_GiveInvItems	(self, hero, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_04"); //That makes 100 gold coins.

	B_LogEntry	(TOPIC_MOD_GORAX_ALKOHOL, "Salandril gave me the booze.");

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);

		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Accept.", Info_Mod_Salandril_Alkohol_Ok_100);
		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Haggling.", Info_Mod_Salandril_Alkohol_Feilschen_100);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_04"); //Here's your gold.
	
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	};
};

FUNC VOID Info_Mod_Salandril_Alkohol_Ok_100()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_Ok_100_15_00"); //Here's your gold.
	
	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
};

FUNC VOID Info_Mod_Salandril_Alkohol_Feilschen_100()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_Feilschen_100_15_00"); //He's never worth it.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_Feilschen_100_13_01"); //All right, 70 coins.

		B_GiveInvItems	(hero, self, ItMi_Gold, 70);

		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Salandril_Alkohol_Feilschen_100_13_02"); //I want all my 100 gold coins.

		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
		
		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Accept.", Info_Mod_Salandril_Alkohol_Ok_100);
	};
};

INSTANCE Info_Mod_Salandril_SonjaFreier (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_SonjaFreier_Condition;
	information	= Info_Mod_Salandril_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Have you been a frequent customer of Sonja's?";
};

FUNC INT Info_Mod_Salandril_SonjaFreier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	&& (Mod_Sonja_Freier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Salandril_SonjaFreier_15_00"); //Have you been a frequent customer of Sonja's?
	AI_Output(self, hero, "Info_Mod_Salandril_SonjaFreier_13_01"); //What are you doing? Are you trying to slander me?
	AI_Output(hero, self, "Info_Mod_Salandril_SonjaFreier_15_02"); //A no would be enough for me.
	AI_Output(self, hero, "Info_Mod_Salandril_SonjaFreier_13_03"); //No!
};

INSTANCE Info_Mod_Salandril_Trade (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Trade_Condition;
	information	= Info_Mod_Salandril_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Salandril_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Salandril_Pickpocket_Gaertner (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Pickpocket_Gaertner_Condition;
	information	= Info_Mod_Salandril_Pickpocket_Gaertner_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Salandril_Pickpocket_Gaertner_Condition()
{
	if (C_Beklauen	(176, ItPo_Perm_DEX_Salandril, 1))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Dieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_Info()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);

	Info_AddChoice	(Info_Mod_Salandril_Pickpocket_Gaertner, DIALOG_BACK, Info_Mod_Salandril_Pickpocket_Gaertner_BACK);
	Info_AddChoice	(Info_Mod_Salandril_Pickpocket_Gaertner, DIALOG_PICKPOCKET, Info_Mod_Salandril_Pickpocket_Gaertner_DoIt);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_BACK()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);
};

INSTANCE Info_Mod_Salandril_EXIT (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_EXIT_Condition;
	information	= Info_Mod_Salandril_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Salandril_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salandril_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
