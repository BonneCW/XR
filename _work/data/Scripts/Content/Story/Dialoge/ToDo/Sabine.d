INSTANCE Info_Mod_Sabine_Hi (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Hi_Condition;
	information	= Info_Mod_Sabine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Sabine_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_NoDeal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_01"); //Nazywam sie Sabine, mój znak królewskiej korzennej henchwomanki!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_02"); //Handlarz Spice?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_03"); //Sprzedawca przypraw Royal!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_04"); //I jakie przyprawy sa sprzedawane?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_05"); //Brak.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_06"); //Dlaczego wiec twoje nazwisko jest sprzedawca przypraw?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_07"); //Sprzedawca przypraw Royal!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_08"); //... na gut. Warum heißt du dann "rojalny sprzedawca przypraw korzennych"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_09"); //Dzialam. I lubie przyprawy korzenne.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_10"); //Wtedy z czym sie zajmujesz?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_11"); //Przyjemnosc dawcy.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_12"); //Przyjemnosc dla dawcy?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_13"); //Tak! Królewski dawca radosci!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_14"); //Gdzie otrzymasz?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_15"); //Jest uprawiana na podwórku! Pod kierownictwem naszego wielkiego króla!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_16"); //Wo liegt dieser "boisko"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_17"); //Mam mape, która pomoze mi odnalezc droge do domu!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_18"); //Pozwólcie mi sie domyslic. Ona tez królewska?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_19"); //Schonmal was von 'ner "królewskie menu" gehört? Ne, das ist nur 'ne stinknormale Karte.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_20"); //Mozemy razem wrócic do domu, ale musze sprzedac jeszcze piec butelek rozkoszy.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_21"); //Wezmy to i przyniesmy ludziom, wtedy mozemy pójsc.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 5);

	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_22"); //Wszystko w porzadku....

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine, królewski handlarz przyprawami, sprzedawany w Khoracie. Dostaje ja z sadu. Mapa pokazuje, gdzie sie znajduje. Sabine chce mi jednak towarzyszyc tam, kiedy sprzedalem piec butelek z radosnymi darczyncami.");
};

INSTANCE Info_Mod_Sabine_Heiraten_01 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_01_Condition;
	information	= Info_Mod_Sabine_Heiraten_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy poslubisz mnie?";
};

FUNC INT Info_Mod_Sabine_Heiraten_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_01_Info()
{
	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_01_17_01"); //Nie.
};

INSTANCE Info_Mod_Sabine_Heiraten_02 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_02_Condition;
	information	= Info_Mod_Sabine_Heiraten_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcesz dolaczyc do mnie po gratke?";
};

FUNC INT Info_Mod_Sabine_Heiraten_02_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_15_00"); //Chcesz dolaczyc do mnie po gratke?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_17_01"); //Wszystkie sluszne, wszystkie sluszne.

	B_UseItem	(self, ItFo_Trunken);

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Jestem mezczyzna, jestes kobieta, na co czekamy?", Info_Mod_Sabine_Heiraten_02_D);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Twoje ubrania wygladalyby lepiej na mojej podlodze.", Info_Mod_Sabine_Heiraten_02_C);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Czy czesto tu przyjezdzasz?", Info_Mod_Sabine_Heiraten_02_B);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Wygladasz dobrze.", Info_Mod_Sabine_Heiraten_02_A);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_E()
{
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_E_17_00"); //Rascals, nie wytrzymam tego!

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine nadal nie poslubi mnie. Mysle, ze powinienem zatrzymac sie przy mezczyznie pan.");

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_D()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_D_15_00"); //Jestem mezczyzna, jestes kobieta, na co czekamy?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_C()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_C_15_00"); //Twoje ubrania wygladalyby lepiej na mojej podlodze.

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_B()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_B_15_00"); //Czy czesto tu przyjezdzasz?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_A()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_A_15_00"); //Wygladasz dobrze.

	Info_Mod_Sabine_Heiraten_02_E();
};

INSTANCE Info_Mod_Sabine_Heiraten_03 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_03_Condition;
	information	= Info_Mod_Sabine_Heiraten_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przykro mi, ze ostatni raz.";
};

FUNC INT Info_Mod_Sabine_Heiraten_03_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook2 == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_02))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_00"); //Przykro mi, ze ostatni raz. Chcesz wziac cos w swoje rece, zeby dojsc do pojednania ze mna?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_01"); //Wszystkie sluszne, wszystkie sluszne.

	B_UseItem	(self, ItFo_Trunken);

	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_02"); //Czy masz nosiciela golebia? Obiecalem napisac do matki, jak tylko znalazlem moja wymarzona dziewczyne.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(igly)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_04"); //Wygladasz jak moja czwarta dziewczyna.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_05"); //Ach, ile masz dziewczynek?
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_06"); //Trzy.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(igly)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_07"); //Jezeli poprosilbym Cie o poslubienie mnie, czy to bylaby taka sama odpowiedz na to pytanie?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_08"); //Trzeba to spróbowac.

	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_09"); //Tak, to robie!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7270_OUT_Weiberheld_REL, "SABINE");
};

INSTANCE Info_Mod_Sabine_FreudenspenderVerkauft (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_FreudenspenderVerkauft_Condition;
	information	= Info_Mod_Sabine_FreudenspenderVerkauft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gdzie nagle byles/as?";
};

FUNC INT Info_Mod_Sabine_FreudenspenderVerkauft_Condition()
{
	if (Mod_Freudenspender == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_FreudenspenderVerkauft_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_00"); //Gdzie nagle byles/as?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_01"); //Musialem wyjsc.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_02"); //Ktos inny?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_03"); //Tak, nie ma. Wazne rzeczy i rzeczy.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_04"); //Aha.... I tak i tak sprzedalem wasze przysmaki.
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_05"); //Grzywna. Oto dwie butelki radosci jako nagroda.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 2);

	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_06"); //Uh.... dziekuje.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Sabine_Trade (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Trade_Condition;
	information	= Info_Mod_Sabine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sabine_Trade_Condition()
{
	if ((Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 1)
	|| (Npc_HasItems(self, ItFo_Trunken) == 0))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sabine_Pickpocket (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Pickpocket_Condition;
	information	= Info_Mod_Sabine_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120_Female;
};

FUNC INT Info_Mod_Sabine_Pickpocket_Condition()
{
	C_Beklauen	(105, ItMi_Freudenspender, 4);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_BACK, Info_Mod_Sabine_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sabine_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sabine_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sabine_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sabine_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sabine_EXIT (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_EXIT_Condition;
	information	= Info_Mod_Sabine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sabine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sabine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
