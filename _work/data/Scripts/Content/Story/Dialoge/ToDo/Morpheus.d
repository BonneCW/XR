INSTANCE Info_Mod_Morpheus_Hi (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Hi_Condition;
	information	= Info_Mod_Morpheus_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wszystko jest w porzadku?";
};

FUNC INT Info_Mod_Morpheus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morpheus_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_00"); //Wszystko jest w porzadku?
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_01"); //Kapelusze! Ten swiat nie jest prawdziwy!
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_02"); //Ach, tak samo....
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_03"); //(smiech) To powiedzenie jest zawsze dobre dla klientów, którzy czerpia z tego zbyt wiele przyjemnosci.
	AI_Output(hero, self, "Info_Mod_Morpheus_Hi_15_04"); //A to pobudzi Twój biznes?
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_05"); //Aura mistyczna nie moze zranic. Glównie sprzedaje talizmanów jak amulety i pierscienie.
	AI_Output(self, hero, "Info_Mod_Morpheus_Hi_37_06"); //Wystarczy sie rozejrzec.
};

INSTANCE Info_Mod_Morpheus_Kissen (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kissen_Condition;
	information	= Info_Mod_Morpheus_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam czegos miekkiego dla glowy. Do spania....";
};

FUNC INT Info_Mod_Morpheus_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_00"); //Szukam czegos miekkiego dla glowy. Do spania....
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_01"); //Uh-huh. Poduszka na glowe. Poduszka.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_02"); //Mozna to powiedziec. Masz go?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_03"); //To rzadkosc, ale ja jej nie mam. Moge jednak panstwu powiedziec, jak to zrobic.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_04"); //Slucham.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_05"); //Idziesz do rzeznika i dostajesz torbe z piórami Vengera. Ciasno ulozona warstwa tworzy wspaniala poduszke.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_06"); //Czym jest pasazer?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_07"); //Nie wiesz? Sa to malutkie padliny bez czerwonych oczu i calkowicie nieszkodliwe.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_08"); //Hodowca przechowuje je dzieki jajom i miekkiemu miazszowi. Trzeba to spróbowac. Roztopi sie w ustach.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_09"); //Lubisz ser?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen_37_10"); //Mozna to powiedziec. Mozecie mi panstwo przyniesc jedna z nich. Na rade.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen_15_11"); //Na poczatek dziekuje.

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Morpheus uwaza, ze powinienem wypelnic worek z piórami Vengera. Powinien miec je rzeznik.");
};

INSTANCE Info_Mod_Morpheus_Kissen02 (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kissen02_Condition;
	information	= Info_Mod_Morpheus_Kissen02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witam, jestem z powrotem. Dostalem poduszke.";
};

FUNC INT Info_Mod_Morpheus_Kissen02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Metzger_Kissen))
	&& (Npc_HasItems(hero, ItMi_Federbeutel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kissen02_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_00"); //Witam, jestem z powrotem. Dostalem poduszke.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_01"); //Cóz, czy jestes zadowolony?
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_02"); //No cóz, dobrze. Jest miekki, ale torba jest troche drapakowa i stechla.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_03"); //Hm.... Nastepnie idziesz do separatora i masz poduszke z lnu.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_04"); //Potem potrzebujesz garstki siana i wlozysz je do srodka. Pachnie bardzo przyjemnie.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kissen02_15_05"); //Gdzie....?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_06"); //W tylnej czesci jeziora, przy rurze wodnej, niedawno skoszono trawe. Mysle, ze znajdziesz to.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kissen02_37_07"); //Masz pomysly! Brzmi to jak dobry pomysl. Dzieki. Do zobaczenia nastepnym razem.

	Wld_InsertItem	(ItMi_Heu, "FP_ITEM_HEU_01");

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Morpheus mówi, ze powinienem miec lniana poduszke wykonana przez Versage. Obok piór powinienem wypelnic je sianem dla zapachu. To wlasnie znajduje nad jeziorem przy wodociagu.");
};

INSTANCE Info_Mod_Morpheus_Kimon (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Kimon_Condition;
	information	= Info_Mod_Morpheus_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz radosne dozowniki?";
};

FUNC INT Info_Mod_Morpheus_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_00"); //Masz radosne dozowniki?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_01"); //Oczywiscie nie. Nie mozna tego robic publicznie. Zakaz gubernatora.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_02"); //I nieoficjalnie?
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_03"); //Nawet nie. Tam ta posladka moze Ci pomóc.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_04"); //On nie moze. Juz go zapytalem.
	AI_Output(self, hero, "Info_Mod_Morpheus_Kimon_37_05"); //Potem klamie. Jestem pewien, ze cos wie.
	AI_Output(hero, self, "Info_Mod_Morpheus_Kimon_15_06"); //Potem spróbuje jeszcze raz.
};

INSTANCE Info_Mod_Morpheus_Blutkelch (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Blutkelch_Condition;
	information	= Info_Mod_Morpheus_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj! A co? Juz sprzedane poduszki?";
};

FUNC INT Info_Mod_Morpheus_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_00"); //Witaj! A co? Juz sprzedane poduszki?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_01"); //Ale tak, tak, tak. Tamy odrywaja te rzeczy z mojego wyswietlacza.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_02"); //Nicosc na spotkanie. Potem znów pomóz mi pomóc.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_03"); //Szukam kielicha krwi. Powinien wygladac niecodziennie.
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_04"); //To powinna byc rzadkosc. Ale nie, nigdy nie widzialem takiej rzeczy.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_05"); //Zbyt zle. Masz pomysl, kto....?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_06"); //Moze magowie w miescie.....
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_07"); //Które istnieja?
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_08"); //Grupa magów ognia. Arogancka kisc. Mieszkanie w najpiekniejszym domu miasta.
	AI_Output(self, hero, "Info_Mod_Morpheus_Blutkelch_37_09"); //I magik wody. Dziwny wspólpracownik. Wiszacy w starej dzielnicy.
	AI_Output(hero, self, "Info_Mod_Morpheus_Blutkelch_15_10"); //Na poczatek dziekuje.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Morfheus skierowal mnie do miejscowych magów.");
};

INSTANCE Info_Mod_Morpheus_Trade (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Trade_Condition;
	information	= Info_Mod_Morpheus_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Morpheus_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Morpheus_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Morpheus_Pickpocket (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_Pickpocket_Condition;
	information	= Info_Mod_Morpheus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Morpheus_Pickpocket_Condition()
{
	C_Beklauen	(107, ItMi_Gold, 35);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

	Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_BACK, Info_Mod_Morpheus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Morpheus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Morpheus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Morpheus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Morpheus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Morpheus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Morpheus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Morpheus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Morpheus_EXIT (C_INFO)
{
	npc		= Mod_7581_OUT_Morpheus_REL;
	nr		= 1;
	condition	= Info_Mod_Morpheus_EXIT_Condition;
	information	= Info_Mod_Morpheus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Morpheus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Morpheus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
