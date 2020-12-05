INSTANCE Info_Mod_Baltram_Hi (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Hi_Condition;
	information	= Info_Mod_Baltram_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Baltram_Hi_Condition()
{
	if (Wld_IsTime(05,05,20,05))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Baltram_Hi_16_00"); //Witaj, nieznajomy. Jestem Baltramem i zajmuje sie artykulami spozywczymi.
	AI_Output(self, hero, "Info_Mod_Baltram_Hi_16_01"); //Jesli kiedykolwiek poczujesz potrzebe swiezego chleba i owoców, mozesz do mnie przyjechac.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Baltram zajmuje sie handlem zywnoscia.");
};

INSTANCE Info_Mod_Baltram_WieLaeufts (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_WieLaeufts_Condition;
	information	= Info_Mod_Baltram_WieLaeufts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to dziala?";
};

FUNC INT Info_Mod_Baltram_WieLaeufts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_WieLaeufts_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_WieLaeufts_15_00"); //Jak to dziala?
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_01"); //Wczesniej bylo lepiej. Moge dobrze sprzedawac swoje towary, ale zapasy z gospodarstw rolnych schodza tylko w zastoju.
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_02"); //Tchórzliwi chlopi nie osmielaja sie wysylac swoich ladunków, poniewaz ostatnio nastapil wzrost nalotów.
	AI_Output(hero, self, "Info_Mod_Baltram_WieLaeufts_15_03"); //rozbój?
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_04"); //Czesc zlodziejskiego skuma z doliny rzeki Minental grabiezy teraz ziemie.
	AI_Output(self, hero, "Info_Mod_Baltram_WieLaeufts_16_05"); //Jedyne, co moga zrobic, to zasadzac sie i zasadzac.
};

INSTANCE Info_Mod_Baltram_Warentransporte (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Warentransporte_Condition;
	information	= Info_Mod_Baltram_Warentransporte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Móglbym zajac sie zatrzymanymi przewozami towarów (....). )";
};

FUNC INT Info_Mod_Baltram_Warentransporte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_WieLaeufts))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Warentransporte_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte_15_00"); //Móglbym zajac sie zatrzymanymi przesylkami.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_01"); //Osmielisz sie! Dobrze, chetnie, zrób to!
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_02"); //Nadal brakuje mi transportów Lobarta i Bengara. Lobart próbowal mi sprzedac rzepe, a Bengar dal mi chleb.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte_16_03"); //Uwazaj jednak na ulice!

	Log_CreateTopic	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, "Ze wzgledu na niepewna sytuacje wynikajaca z pladrowania skazanych, rolnicy Lobart i Bengar nie chca wysylac swoich towarów do Baltramu. Wiec gram tego chlopca.");

	Wld_InsertNpc	(Mod_7557_STRF_Straefling_NW, "NW_FARM1_PATH_SPAWN_05");
	Wld_InsertNpc	(Mod_7558_STRF_Straefling_NW, "NW_FARM1_PATH_SPAWN_05");
};

INSTANCE Info_Mod_Baltram_Warentransporte2 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Warentransporte2_Condition;
	information	= Info_Mod_Baltram_Warentransporte2_Info;
	permanent	= 0;
	important	= 0;
	description	= "odebralem wasze towary.";
};

FUNC INT Info_Mod_Baltram_Warentransporte2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Warentransporte))
	&& (Npc_HasItems(hero, ItPl_Beet) >= 20)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 30)
	&& (Mod_LobartsRuebenBaltram == 1)
	&& (Mod_BengarBaltram == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Warentransporte2_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte2_15_00"); //odebralem wasze towary.

	Npc_RemoveInvItems	(hero, ItFo_Bread, 30);
	Npc_RemoveInvItems	(hero, ItPl_Beet, 20);

	B_ShowGivenThings	("30 bochenków z dodatkiem chleba i 20 rzepy");

	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_01"); //Dobre, dobre, dobre, dobre! Za Bengar zaplaciles zloto z wlasnej kieszeni? 150 zlota?
	AI_Output(hero, self, "Info_Mod_Baltram_Warentransporte2_15_02"); //Oczywiscie tak jest.
	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_03"); //Wtedy masz go z powrotem z tym.

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	AI_Output(self, hero, "Info_Mod_Baltram_Warentransporte2_16_04"); //Mozesz rozejrzec sie w moim asortymencie, za 150 dostajesz wiele ladnych rzeczy......

	B_SetTopicStatus	(TOPIC_MOD_BALTRAM_WARENTRANSPORTE, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	CurrentNQ += 1;

	CreateInvItems	(self, ItFo_Bread, 15);
	CreateInvItems	(self, ItPl_Beet, 10);
};

INSTANCE Info_Mod_Baltram_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling1_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy spojrzala pod stoisko (....)? ) (miescic jablko)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling2_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, nie szukaja go tam? (miescic jablko)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_MatteoLehrling3_Condition;
	information	= Info_Mod_Baltram_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mile jablka, które tam masz.... (miescic jablko)";
};

FUNC INT Info_Mod_Baltram_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Baltram_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Baltram_Apfel = 1;
};

INSTANCE Info_Mod_Baltram_Daemonisch (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Daemonisch_Condition;
	information	= Info_Mod_Baltram_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, jestem tutaj z Coragon, aby odebrac paczke solonego miesa.";
};

FUNC INT Info_Mod_Baltram_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Daemonisch_15_00"); //Hej, jestem tutaj z Coragon, aby odebrac paczke solonego miesa.
	AI_Output(self, hero, "Info_Mod_Baltram_Daemonisch_16_01"); //Ach, tak, tak, dobrze, dotarla wczesniej i wszystko juz za wszystko zaplacilismy.

	B_GiveInvItems	(self, hero, ItMi_CoragonDaemonisch, 1);

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Baltram_Daemonisch_15_02"); //Do samego siebie to cos, co powinienem przygotowac przy stole alchemicznym.
};

INSTANCE Info_Mod_Baltram_Melasse (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Melasse_Condition;
	information	= Info_Mod_Baltram_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz melase?";
};

FUNC INT Info_Mod_Baltram_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Kardif_Melasse))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Samuel_HabZeug))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Melasse_15_00"); //Masz melase?
	AI_Output(self, hero, "Info_Mod_Baltram_Melasse_16_01"); //Obawiam sie, ze nie moge Ci to zaserwowac, ale mysle, ze Kardif, karczmarz pubu portowego, cos ma.

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Baltram nie ma melasy, ale wierzy, ze skorzysta na tym Kardif, karczmarz karczmy portowej.");
};

INSTANCE Info_Mod_Baltram_Dokumente (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Dokumente_Condition;
	information	= Info_Mod_Baltram_Dokumente_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy nadal masz liscie Erharda?";
};

FUNC INT Info_Mod_Baltram_Dokumente_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Mod_REL_Dokumente == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Dokumente_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_00"); //Czy nadal masz liscie Erharda?
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_01"); //Które.....? Ach, rozumiem. Przykro mi, juz nie mam w jej posiadaniu.
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_02"); //Jak nalezalo sie spodziewac.......
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_03"); //W ogóle nie! Mika z lokalnej strazy miejskiej zatrzymal ja, kiedy sprawdzal mój ladunek.
	AI_Output(self, hero, "Info_Mod_Baltram_Dokumente_16_04"); //Posiadanie ich nie jest jednak zabronione!
	AI_Output(hero, self, "Info_Mod_Baltram_Dokumente_15_05"); //Zajme sie tym.

	B_LogEntry	(TOPIC_MOD_KHORATA_DOKUMENTE, "Baltram stracil równiez boki Miki z rak Strazy Miejskiej.");

	Mod_REL_Dokumente = 3;
};

INSTANCE Info_Mod_Baltram_Blutkelch (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Blutkelch_Condition;
	information	= Info_Mod_Baltram_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam kielicha krwi.";
};

FUNC INT Info_Mod_Baltram_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Baltram_Blutkelch_15_00"); //Szukam kielicha krwi.
	AI_Output(self, hero, "Info_Mod_Baltram_Blutkelch_16_01"); //Hmm..... Powinienes spróbowac sprzedawcy rzadkosci. Niektórzy sa na Khorinis.
	AI_Output(self, hero, "Info_Mod_Baltram_Blutkelch_16_02"); //Oh, tak. Ktos przyjechal tu pewnego dnia. Nazywal sie Morfheusem. Prawdopodobnie przyszedl z innego zakatka wyspy.
	AI_Output(hero, self, "Info_Mod_Baltram_Blutkelch_15_03"); //Dobry pomysl. Spróbuje szczescia z nimi.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Zuris uwaza, ze powinienem spróbowac kielicha u sprzedawców rarytasów. Jeden z nich nazywa sie Morpheus i prawdopodobnie pochodzi z dala od siebie. W przeciwnym razie byloby Lutero i Erol....");

	B_StartOtherRoutine	(Mod_521_NONE_Erol_NW, "TOT");
};

INSTANCE Info_Mod_Baltram_Anschlagtafel (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Anschlagtafel_Condition;
	information	= Info_Mod_Baltram_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Baltram_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Baltram == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItFo_Milk) >= Mod_Anschlagtafel_Khorinis_Baltram_Milch)
	&& (Npc_HasItems(hero, ItFo_Cheese) >= Mod_Anschlagtafel_Khorinis_Baltram_Kaese)
	&& (Npc_HasItems(hero, ItFo_Bread) >= Mod_Anschlagtafel_Khorinis_Baltram_Brot)
	&& (Npc_HasItems(hero, ItFo_Water) >= Mod_Anschlagtafel_Khorinis_Baltram_Wasser)
	&& (Npc_HasItems(hero, ItFo_Beer) >= Mod_Anschlagtafel_Khorinis_Baltram_Bier)
	&& (Npc_HasItems(hero, ItFo_Booze) >= Mod_Anschlagtafel_Khorinis_Baltram_Wacholder)
	&& (Npc_HasItems(hero, ItFo_Wine) >= Mod_Anschlagtafel_Khorinis_Baltram_Wein)
	&& (Npc_HasItems(hero, ItFo_Sausage) >= Mod_Anschlagtafel_Khorinis_Baltram_Wurst)
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= Mod_Anschlagtafel_Khorinis_Baltram_Grog)
	&& (Npc_HasItems(hero, ItFo_Addon_Rum) >= Mod_Anschlagtafel_Khorinis_Baltram_Rum)
	&& (Npc_HasItems(hero, ItFo_Kuerbis) >= Mod_Anschlagtafel_Khorinis_Baltram_Kuerbis)
	&& (Npc_HasItems(hero, ItPl_Melone) >= Mod_Anschlagtafel_Khorinis_Baltram_Melone)
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= Mod_Anschlagtafel_Khorinis_Baltram_Fleisch)
	{
		Npc_RemoveInvItems	(hero, ItFo_Milk, Mod_Anschlagtafel_Khorinis_Baltram_Milch);
		Npc_RemoveInvItems	(hero, ItFo_Cheese, Mod_Anschlagtafel_Khorinis_Baltram_Kaese);
		Npc_RemoveInvItems	(hero, ItFo_Bread, Mod_Anschlagtafel_Khorinis_Baltram_Brot);
		Npc_RemoveInvItems	(hero, ItFo_Water, Mod_Anschlagtafel_Khorinis_Baltram_Wasser);
		Npc_RemoveInvItems	(hero, ItFo_Beer, Mod_Anschlagtafel_Khorinis_Baltram_Bier);
		Npc_RemoveInvItems	(hero, ItFo_Booze, Mod_Anschlagtafel_Khorinis_Baltram_Wacholder);
		Npc_RemoveInvItems	(hero, ItFo_Wine, Mod_Anschlagtafel_Khorinis_Baltram_Wein);
		Npc_RemoveInvItems	(hero, ItFo_Sausage, Mod_Anschlagtafel_Khorinis_Baltram_Wurst);
		Npc_RemoveInvItems	(hero, ItFo_Addon_Grog, Mod_Anschlagtafel_Khorinis_Baltram_Grog);
		Npc_RemoveInvItems	(hero, ItFo_Addon_Rum, Mod_Anschlagtafel_Khorinis_Baltram_Rum);
		Npc_RemoveInvItems	(hero, ItFo_Kuerbis, Mod_Anschlagtafel_Khorinis_Baltram_Kuerbis);
		Npc_RemoveInvItems	(hero, ItPl_Melone, Mod_Anschlagtafel_Khorinis_Baltram_Melone);
		Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, Mod_Anschlagtafel_Khorinis_Baltram_Fleisch);

		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Baltram_Gold);

		AI_Output(self, hero, "Info_Mod_Baltram_Anschlagtafel_16_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Baltram_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Baltram = 0;
		Mod_Anschlagtafel_Khorinis_Baltram_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Baltram, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Baltram_Trade (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Trade_Condition;
	information	= Info_Mod_Baltram_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Baltram_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Wld_IsTime(05,05,20,05))
	&& (hero.guild != GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Baltram_TradeFake (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_TradeFake_Condition;
	information	= Info_Mod_Baltram_TradeFake_Info;
	permanent	= 0;
	important	= 0;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Baltram_TradeFake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Hi))
	&& (Wld_IsTime(05,05,20,05))
	&& (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Baltram_TradeFake_Info()
{
	B_Say (hero, self, "$TRADE_1");

	AI_Output(self, hero, "Info_Mod_Baltram_TradeFake_16_01"); //Handel? Z Toba! Wróc do Beliar!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Baltram_Pickpocket (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_Pickpocket_Condition;
	information	= Info_Mod_Baltram_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Baltram_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

	Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_BACK, Info_Mod_Baltram_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Baltram_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Baltram_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Baltram_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Baltram_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Baltram_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Baltram_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Baltram_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Baltram_EXIT (C_INFO)
{
	npc		= Mod_561_NONE_Baltram_NW;
	nr		= 1;
	condition	= Info_Mod_Baltram_EXIT_Condition;
	information	= Info_Mod_Baltram_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Baltram_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Baltram_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
