INSTANCE Info_Mod_Anglar_Hi (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Hi_Condition;
	information	= Info_Mod_Anglar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anglar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_00"); //Pozdrowienia, obcy. Jesli szukasz swiezych i delikatnych ryb, trafiles we wlasciwe miejsce.
	AI_Output(hero, self, "Info_Mod_Anglar_Hi_15_01"); //Co jeszcze dostales?
	AI_Output(self, hero, "Info_Mod_Anglar_Hi_06_02"); //Tylko najlepsze ryby. Czego jeszcze potrzebujesz? Nie ma dnia bez ryb, mówil dziadek, a wiec mial ponad 100 lat....
};

INSTANCE Info_Mod_Anglar_Feuersbrunst (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ale Twoja oferta nie jest tak duza....";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_00"); //Ale Twoja oferta nie jest tak duza....
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_01"); //Tak, obawiam sie, ze w tej chwili to prawda. Minelo takze kilka tygodni od czasu, kiedy polawilem ryby nad duzym jeziorem.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_02"); //To wlasnie nazywaja swieza.

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_03"); //Ale po kilku ostatnich incydentach nie odwazylem sie zblizyc do siebie....
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_04"); //Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_05"); //Kilka dni temu, kiedy po prostu przecialem dziure w lodie i wyrzucilem wedke, wszystko poczatkowo wydawalo mi sie calkiem normalne. Bylo tylko dosc pochmurne i ciemne.... niz nagle.....
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_06"); //Tak?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_07"); //Kiedy nagle na poludniowym wschodzie zapalila sie spirala ognia. Jakby zgrzytany, patrzylem dalej w kierunku, w którym odbywal sie spektakl. Ale nic wiecej sie nie stalo.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_08"); //Wzielam wiec odwage, zlapalam wedke i poszlam w kierunku Rappena Schustera.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_09"); //Po kilkuset metrach spaceru, odkrylem horde lodowych lunet w oddali..... i znikad plomienie nagle padly na nich i natychmiast je spalily.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_10"); //Widok wystarczylo, abym nogi wziela w reke i szybko uciekl do wioski.
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst_15_11"); //A co wedlug Ciebie wydawalo sie?
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_12"); //Nie wiem dokladnie...... Ale gdzies tam jest pewnie jakis pozarowy demon.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst_06_13"); //A poniewaz jestem rozsadny i nie chce byc grillem, pozostaje na razie za bezpiecznymi palisadami wioski.

	Log_CreateTopic	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_FEUERSBRUNST, "Sprzedawca ryb Anglar opowiedzial mi historie, która miala miejsce w poludniowo-wschodniej czesci jeziora za zamarznietym jeziorem. Pewna nieznana moc - byc moze demon - zdaje sie sprawiac, ze teren jest niestabilny plomieniem i palic wszystko, co go zywi.");

	Wld_InsertNpc	(Mod_7793_KDF_Hyglas_EIS, "EINSIEDLER_1");
};

INSTANCE Info_Mod_Anglar_Feuersbrunst2 (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Feuersbrunst2_Condition;
	information	= Info_Mod_Anglar_Feuersbrunst2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Twój demon nie zniszczy terenu.";
};

FUNC INT Info_Mod_Anglar_Feuersbrunst2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_EIS_Feuersbrunst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Feuersbrunst2_Info()
{
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_00"); //Twój demon nie zniszczy terenu.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_01"); //Co? Czy jestes pewien tego?
	AI_Output(hero, self, "Info_Mod_Anglar_Feuersbrunst2_15_02"); //Tak, przeniósl sie do innego regionu swiata.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_03"); //Z ulga to uslyszalem. Wtedy od razu znowu przejde na lowisko.
	AI_Output(self, hero, "Info_Mod_Anglar_Feuersbrunst2_06_04"); //Cóz, tutaj dziekuje za informacje o pozostalej rybie, która opuscilem.

	B_GiveInvItems	(self, hero, ItFo_Fish, 17);

	B_SetTopicStatus	(TOPIC_MOD_FM_FEUERSBRUNST, LOG_SUCCESS);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Anglar_Trade (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Trade_Condition;
	information	= Info_Mod_Anglar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anglar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anglar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anglar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anglar_Pickpocket (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_Pickpocket_Condition;
	information	= Info_Mod_Anglar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anglar_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 22);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_BACK, Info_Mod_Anglar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anglar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anglar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anglar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anglar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anglar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anglar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anglar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anglar_EXIT (C_INFO)
{
	npc		= Mod_7792_OUT_Anglar_EIS;
	nr		= 1;
	condition	= Info_Mod_Anglar_EXIT_Condition;
	information	= Info_Mod_Anglar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anglar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anglar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
