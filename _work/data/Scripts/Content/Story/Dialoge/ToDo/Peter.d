INSTANCE Info_Mod_Peter_Hi (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Hi_Condition;
	information	= Info_Mod_Peter_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Peter_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peter_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Peter_Hi_14_00"); //Welcome to my inn, the best and only one in Khorata.
	AI_Output(self, hero, "Info_Mod_Peter_Hi_14_01"); //Beer and food you can get here.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Peter sells food");
};

INSTANCE Info_Mod_Peter_Elvira (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Elvira_Condition;
	information	= Info_Mod_Peter_Elvira_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Can you tell me anything about Elvira?";
};                       

FUNC INT Info_Mod_Peter_Elvira_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 40)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Peter_Elvira_Info()
{
	AI_Output(hero, self, "Info_Mod_Peter_Elvira_15_00"); //Can you tell me anything about Elvira?
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_01"); //Ahh, the fire magician.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_02"); //Yeah, hey, there's a lot of people here who have been keeping an eye on her... but believe me, you don't stand a chance with her... unless... ne, forget it...
	AI_Output(hero, self, "Info_Mod_Peter_Elvira_15_03"); //Yeah, tell me.

	B_GiveInvItems	(hero, self, ItMi_Gold, 40);

	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_04"); //Well, once she was here to preach.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_05"); //In the middle of the pub, between all the drinkers here, you can imagine the whole testosterone impregnated pack.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_06"); //I offered her a glass of my best monastery wine and she.... refuses and instead asks if I would have it non-alcoholic.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_07"); //Well, I don't want to gossip, but the one about women and alcohol... who knows.
	AI_Output(self, hero, "Info_Mod_Peter_Elvira_14_08"); //But, hey, I didn't say anything.
	
	B_LogEntry	(TOPIC_MOD_DIEB_ELVIRA, "Peter said that Elvira rejected the wine he had offered her. Instead, she wanted a non-alcoholic drink.");
};

INSTANCE Info_Mod_Peter_Freudenspender (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Freudenspender_Condition;
	information	= Info_Mod_Peter_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Can you use glee dispensers?";
};                       

FUNC INT Info_Mod_Peter_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Peter_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Peter_Freudenspender_15_00"); //Can you use glee dispensers?
	AI_Output(self, hero, "Info_Mod_Peter_Freudenspender_14_01"); //I'm selling the stuff myself, man. If you have something to give, give it to me. Otherwise not.
};

INSTANCE Info_Mod_Peter_Trade (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Trade_Condition;
	information	= Info_Mod_Peter_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Peter_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Peter_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Peter_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Peter_Pickpocket (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_Pickpocket_Condition;
	information	= Info_Mod_Peter_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Peter_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 22);
};

FUNC VOID Info_Mod_Peter_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

	Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_BACK, Info_Mod_Peter_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Peter_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Peter_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);
};

FUNC VOID Info_Mod_Peter_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Peter_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

		Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Peter_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Peter_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Peter_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Peter_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Peter_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Peter_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Peter_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Peter_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Peter_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Peter_EXIT (C_INFO)
{
	npc		= Mod_7386_OUT_Peter_REL;
	nr		= 1;
	condition	= Info_Mod_Peter_EXIT_Condition;
	information	= Info_Mod_Peter_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Peter_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Peter_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
