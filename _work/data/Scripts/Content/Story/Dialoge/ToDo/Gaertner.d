INSTANCE Info_Mod_Gaertner_Hi (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Hi_Condition;
	information	= Info_Mod_Gaertner_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Gaertner_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_01"); //Jestem ogrodnikiem. Moja praca polega na opiece nad zakladem w górnym kwartale.
	AI_Output(self, hero, "Info_Mod_Gaertner_Hi_09_02"); //Moge równiez sprzedac panstwu niektóre z nich.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Na pietrze ogrodnik moze mi sprzedac kilka roslin.");
};

INSTANCE Info_Mod_Gaertner_Dieb (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Dieb_Condition;
	information	= Info_Mod_Gaertner_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak dziala?";
};

FUNC INT Info_Mod_Gaertner_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ramirez_AndreFertig))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_00"); //Jak dziala?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_01"); //Zbyt duzo chwastów, ale inaczej nie moge narzekac.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_02"); //A co wziales dzisiaj?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_03"); //Oh.....
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_04"); //Przerazyles mnie gówno. Nie zawsze jestem na biezaco, ale jestes na czasie.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_05"); //Co nalezy zrobic?
	AI_Output(self, hero, "Info_Mod_Gaertner_Dieb_09_06"); //Salandril ma kilka cennych eliksirów. Przyciagnij mnie, ale musisz byc ostrozny, nie ufa nikomu i jest zawsze czujny.
	AI_Output(hero, self, "Info_Mod_Gaertner_Dieb_15_07"); //Spróbuje tego nie robic.
	
	Log_CreateTopic	(TOPIC_MOD_DIEB_SALANDRIL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DIEB_SALANDRIL, "Ogrodnik chce, abym ukradl jedna z cennych eliksirów Salandryla.");
};

INSTANCE Info_Mod_Gaertner_HierTrank (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_HierTrank_Condition;
	information	= Info_Mod_Gaertner_HierTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto Twój cenny eliksir.";
};

FUNC INT Info_Mod_Gaertner_HierTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Dieb))
	&& (Npc_HasItems(hero, ItPo_Perm_DEX_Salandril) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_HierTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Gaertner_HierTrank_15_00"); //Oto Twój cenny eliksir.

	B_GiveInvItems	(hero, self, ItPo_Perm_DEX_Salandril, 1);
	Npc_RemoveInvItems	(self, ItPo_Perm_DEX_Salandril, 1);
	CreateInvItems	(self, ItPo_Perm_DEX, 1);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_01"); //Nie moge uwierzyc, ze jestes naturalny. Oto nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Gaertner_HierTrank_09_02"); //Jesli chcesz, sprzedam ja Tobie.
	
	B_SetTopicStatus	(TOPIC_MOD_DIEB_SALANDRIL, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Gaertner_Trade (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Trade_Condition;
	information	= Info_Mod_Gaertner_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Gaertner_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gaertner_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Gaertner_Pickpocket (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_Pickpocket_Condition;
	information	= Info_Mod_Gaertner_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Gaertner_Pickpocket_Condition()
{
	C_Beklauen	(16, ItPl_Temp_Herb, 2);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_BACK, Info_Mod_Gaertner_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gaertner_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gaertner_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gaertner_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gaertner_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gaertner_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gaertner_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gaertner_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gaertner_EXIT (C_INFO)
{
	npc		= Mod_1035_VLK_Gaertner_NW;
	nr		= 1;
	condition	= Info_Mod_Gaertner_EXIT_Condition;
	information	= Info_Mod_Gaertner_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gaertner_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
