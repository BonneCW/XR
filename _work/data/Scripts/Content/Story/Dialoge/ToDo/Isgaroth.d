INSTANCE Info_Mod_Isgaroth_Hi (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Hi_Condition;
	information	= Info_Mod_Isgaroth_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj.";
};

FUNC INT Info_Mod_Isgaroth_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Isgaroth_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Hi_15_00"); //Witaj.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Hi_01_01"); //Pozdrowienia, obcy.
};

INSTANCE Info_Mod_Isgaroth_Pedro (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Pedro_Condition;
	information	= Info_Mod_Isgaroth_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy nowicjusz przeszedl przez kogos, kto sie spieszyl?";
};

FUNC INT Info_Mod_Isgaroth_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring))
	&& (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Pedro_15_00"); //
	AI_Output(self, hero, "Info_Mod_Isgaroth_Pedro_01_01"); //
	AI_Output(self, hero, "Info_Mod_Isgaroth_Pedro_01_02"); //

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Isgaroth pila Pedro biegnac wzdluz sciezki. Powiedzial, ze powinienem porozmawiac z mysliwym Dragomirem.");
};

INSTANCE Info_Mod_Isgaroth_Drachen (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Drachen_Condition;
	information	= Info_Mod_Isgaroth_Drachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy ostatnio zauwazyles jakies dziwne rzeczy?";
};

FUNC INT Info_Mod_Isgaroth_Drachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragon_Kloster))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Drachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Isgaroth_Drachen_15_00"); //Czy ostatnio zauwazyles jakies dziwne rzeczy?
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_01"); //Tak, ale to niezwykle odglosy, które wciaz dochodza z skal nade mna.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_02"); //To brzmi jak..... Snortowanie i wybuchanie gwaltownych plomieni, ale rodzaj ognia, który nie pochodzi z naszej magii.
	AI_Output(self, hero, "Info_Mod_Isgaroth_Drachen_01_03"); //Bardzo nietypowe i niepokojace.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Isgaroth donosil, ze z skal nad nim dochodza odglosy plonacego ognia.");
};

INSTANCE Info_Mod_Isgaroth_Trade (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Trade_Condition;
	information	= Info_Mod_Isgaroth_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Isgaroth_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Isgaroth_Trade_Info()
{
	if (Mod_IsgarothHaendler == 0)
	{
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_KLOSTER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_KLOSTER, "Isgaroth, który znajduje sie w sanktuarium przed klasztorem Innos, moze sprzedac mi rolki zaklec.");

		Mod_IsgarothHaendler = 1;
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Isgaroth_Pickpocket (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_Pickpocket_Condition;
	information	= Info_Mod_Isgaroth_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Isgaroth_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Runeblank, 1);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

	Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_BACK, Info_Mod_Isgaroth_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Isgaroth_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

		Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Isgaroth_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Isgaroth_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Isgaroth_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Isgaroth_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Isgaroth_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Isgaroth_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Isgaroth_EXIT (C_INFO)
{
	npc		= Mod_920_KDF_Isgaroth_NW;
	nr		= 1;
	condition	= Info_Mod_Isgaroth_EXIT_Condition;
	information	= Info_Mod_Isgaroth_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Isgaroth_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Isgaroth_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
