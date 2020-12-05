INSTANCE Info_Mod_Garett_Hi (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Hi_Condition;
	information	= Info_Mod_Garett_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garett_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Garett_Hi_28_00"); //Hej, nowy facet, potrzebuje pistoletu?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Wydaje sie, ze Garett sprzedaje bron.");
};

INSTANCE Info_Mod_Garett_Befreiung (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung_Condition;
	information	= Info_Mod_Garett_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jest cos, co moge dla Ciebie zrobic?";
};

FUNC INT Info_Mod_Garett_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_00"); //Czy jest cos, co moge dla Ciebie zrobic?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_01"); //Dlaczego?
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_02"); //Greg poprosil mnie, abym pomógl Wam znów w zalatwieniu sprawy.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_03"); //(smiech) Oh, no cóz. No cóz, inaczej.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_04"); //Wiec dostales cos?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_05"); //Tak, rzeczywiscie. Jesli nieumarli zostana ponownie zaatakowani, mamy mala bron do obrony.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_06"); //Potrzebuje dziesieciu kordelasów, aby odebrac mi wystarczajaca ilosc zapasów.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_07"); //Skad moge siegnac po sztucce?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_28_08"); //Zejdz na plaze, dookola znajduje sie jeszcze bron. Powinnas byc w stanie ja znalezc.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_09"); //Jestem gonna szukac.
	
	Log_CreateTopic	(TOPIC_MOD_BEL_PIRGARETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRGARETT, "Garett potrzebuje nowej broni. Na plazy sa jeszcze niektóre z nich.");

	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_01");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_02");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_03");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_04");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_05");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_06");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_07");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_08");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_09");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_10");
};

INSTANCE Info_Mod_Garett_Befreiung2 (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung2_Condition;
	information	= Info_Mod_Garett_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto dziesiec twoich dziesiatek.";
};

FUNC INT Info_Mod_Garett_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Befreiung))
	&& (Npc_HasItems(hero, ItMw_Addon_PIR1hSword) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung2_15_00"); //Oto dziesiec twoich dziesiatek.

	B_GiveInvItems	(hero, self, ItMw_Addon_PIR1hSword, 10);

	AI_Output(self, hero, "Info_Mod_Garett_Befreiung2_28_01"); //Oto nagroda.

	B_ShowGivenThings	("120 zlota i 15 groszy otrzymane");

	CreateInvItems	(hero, ItMi_Gold, 120);
	CreateInvItems	(hero, ItFo_Addon_Grog, 15);

	B_GivePlayerXP	(250);

	Mod_Piratenbefreiung += 1;
	
	B_LogEntry_More	(TOPIC_MOD_BEL_PIRGARETT, TOPIC_MOD_BEL_PIRATENLAGER, "Garett dostarczany jest ponownie z materialami eksploatacyjnymi.", "Garett dostarczany jest ponownie z materialami eksploatacyjnymi.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Garett_Blutkelch (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Blutkelch_Condition;
	information	= Info_Mod_Garett_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy masz w swoim asortymencie szczególnie twarde motyki?";
};

FUNC INT Info_Mod_Garett_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_00"); //Czy masz w swoim asortymencie szczególnie twarde motyki?
	AI_Output(self, hero, "Info_Mod_Garett_Blutkelch_28_01"); //Co to ma byc? Znam tylko srednie piksele. A ja tego nie mam.
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_02"); //Wszystkie sluszne, wszystkie sluszne. Tylko pytanie.
};

INSTANCE Info_Mod_Garett_Trade (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Trade_Condition;
	information	= Info_Mod_Garett_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Garett_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Garett_Pickpocket (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Pickpocket_Condition;
	information	= Info_Mod_Garett_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Garett_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Garett_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_BACK, Info_Mod_Garett_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garett_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garett_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
};

FUNC VOID Info_Mod_Garett_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Garett_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Garett_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Garett_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Garett_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Garett_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Garett_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Garett_EXIT (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_EXIT_Condition;
	information	= Info_Mod_Garett_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garett_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
