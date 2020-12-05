instance Info_Mod_Liselotte_Trade1 (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade1_Condition;
	information	= Info_Mod_Liselotte_Trade1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostales cos dla mnie?";
};

FUNC INT Info_Mod_Liselotte_Trade1_Condition()
{
	return TRUE ;
};

FUNC VOID Info_Mod_Liselotte_TRADE1_Info()
{
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_00"); //Hej, handlowiec, czy masz cos dla mnie?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_01"); //Chcecie mnie tu trafic?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_02"); //Oh, uh,..........
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_03"); //Nie mów nic zlego!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_04"); //l--
 	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_05"); //... Nie mysl nawet o tym!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_06"); //SORRY!
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_07"); //Przypuscmy - ale STRAIGHT!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_08"); //Um....
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_09"); //Jakiego fuku chcesz?
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_10"); //Chcialem pana zapytac.... jako handlowiec.....
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_11"); //Zwróc sie do mnie rozsadnie!
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_12"); //O. K. Ty, jako dealer sprzedajesz towary....
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_13"); //Tak, to prawda.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_14"); //Czy móglbys sie zastanawiac, gdybym spojrzal na Twój towar?
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_15"); //Nie moge Ci nic zaoferowac, poniewaz zgubilem swój pakiet w drodze do miasta.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_19"); //To musi lezec gdzies w poblizu bramy miasta, ale nie moglem go znalezc.
	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_16"); //Jesli ja znajde, wyslem ja do Ciebie.
	AI_Output (self, hero, "Info_Mod_Liselotte_Trade1_43_17"); //Dziekuje, jestes ulubiencem!

	B_GiveInvItems (self, hero, ItMi_Gold, 50);

	AI_Output (hero, self, "Info_Mod_Liselotte_Trade1_15_18"); //Um, dziekuje.

	Log_CreateTopic (TOPIC_MOD_LISELOTTESBEUTEL, LOG_MISSION);
	B_SetTopicStatus (TOPIC_MOD_LISELOTTESBEUTEL, LOG_RUNNING);
	B_LogEntry (TOPIC_MOD_LISELOTTESBEUTEL, "Liselotte stracila swoja paczke gdzies w drodze do miasta, ale nie wie dokladnie gdzie. Mówi sie, ze znajduje sie w poblizu bramy miejskiej. Jesli ja znajde, moge od niej kupowac towary, bo ona bedzie miala ich znów. Prawdopodobnie ta utrata tlumaczy równiez ich zly nastrój....");
};
   
INSTANCE Info_Mod_Liselotte_Warenpaket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Warenpaket_Condition;
	information	= Info_Mod_Liselotte_Warenpaket_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jest to twoje? (wydajac opakowanie)";
};

FUNC INT Info_Mod_Liselotte_Warenpaket_Condition()
{
	if (Npc_HasItems(hero, Packet_Lise) >= 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Trade1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Warenpaket_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_00"); //Czy to jest Twój pakiet?

	B_GiveInvItems	(hero, self, Packet_Lise, 1);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_01"); //Tak, dziekuje.
	AI_Output(hero, self, "Info_Mod_Liselotte_Warenpaket_15_02"); //Um, czy dostaje teraz nagrode?
	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_03"); //OK. Daje Ci 50 zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Liselotte_Warenpaket_43_04"); //Poza tym teraz mozecie handlowac ze mna.

	B_LogEntry	(TOPIC_MOD_LISELOTTESBEUTEL, "Znalazlem pakiet Liselottes i odeslalem go.");
	B_SetTopicStatus	(TOPIC_MOD_LISELOTTESBEUTEL, LOG_SUCCESS);

	B_GivePlayerXP (100);

	Npc_RemoveInvItems	(self, Packet_Lise, 1);

	B_Göttergefallen(2, 1);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Liselotte_Blutkelch (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Blutkelch_Condition;
	information	= Info_Mod_Liselotte_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witajcie, piekne dziecko!";
};

FUNC INT Info_Mod_Liselotte_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_00"); //Witajcie, piekne dziecko!
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_01"); //Ach, mieszkaniec. Co moge Ci dostac?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_02"); //Szukam filizanki. Filizanka krwi.
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_03"); //Nie mam filizanki. Szczególnie nie krwawy.
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_04"); //Moglo tak byc. Dzieki. Nawiasem mówiac, co robisz po godzinach?
	AI_Output(self, hero, "Info_Mod_Liselotte_Blutkelch_43_05"); //Isc spac. Cóz, co jeszcze?
	AI_Output(hero, self, "Info_Mod_Liselotte_Blutkelch_15_06"); //Tak wlasnie....
};

INSTANCE Info_Mod_Liselotte_Pickpocket (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Pickpocket_Condition;
	information	= Info_Mod_Liselotte_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Liselotte_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_BACK, Info_Mod_Liselotte_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Liselotte_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Liselotte_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Liselotte_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Liselotte_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Liselotte_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Liselotte_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Liselotte_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Liselotte_Trade (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 1;
	condition	= Info_Mod_Liselotte_Trade_Condition;
	information	= Info_Mod_Liselotte_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Liselotte_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Liselotte_Warenpaket))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Liselotte_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

instance Info_Mod_Liselotte_EXIT (C_INFO)
{
	npc		= Mod_546_NONE_Liselotte_NW;
	nr		= 999;
	condition	= Info_Mod_Liselotte_EXIT_Condition;
	information	= Info_Mod_Liselotte_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Liselotte_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Liselotte_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
