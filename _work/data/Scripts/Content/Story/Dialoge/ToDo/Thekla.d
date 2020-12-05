INSTANCE Info_Mod_Thekla_Hi (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Hi_Condition;
	information	= Info_Mod_Thekla_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Hi_17_00"); //Witaj nieznajomego. Jesli szukasz miejsca, gdzie mozna cos zjesc, trafiles we wlasciwe miejsce.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Thekla moze mi sprzedac cos do jedzenia.");
};

INSTANCE Info_Mod_Thekla_Daemonisch (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch_Condition;
	information	= Info_Mod_Thekla_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))	
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_00"); //Co to jest sprawa, czy chcesz cos zjesc?
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch_15_01"); //Nie, chcialem tylko powitac.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_02"); //Och, usprawiedliwic mój ton glosu.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_03"); //Lares wysyla niektórych swoich najemników do lasu, aby polowali na wilki i teraz mysla, ze musza jesc cale jedzenie.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch_17_04"); //Gdyby bylo tylko cos, co mogloby zaspokoic jej nieposkromiony apetyt.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Thekla zaklina, ze niektórzy najemnicy, którzy wyslali Lares na wilki w lesie, jedza ja od pustej kuchni.");
};

INSTANCE Info_Mod_Thekla_Daemonisch2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch2_Condition;
	information	= Info_Mod_Thekla_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chciales, aby najemnicy tak bardzo przestali jesc.";
};

FUNC INT Info_Mod_Thekla_Daemonisch2_Condition()
{
	if (Mod_HQ_Daemonisch == 1)
	&& ((Npc_HasItems(hero, ItFo_KWine) >= 1)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_15_00"); //Chciales, aby najemnicy tak bardzo przestali jesc. Dostalem cos dla Ciebie.....
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_17_01"); //Tak, na czym polega nazwa Inno?

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Uzdrowienie obsesji", Info_Mod_Thekla_Daemonisch2_B);
	};
	if (Npc_HasItems(hero, ItFo_KWine) >= 1)
	{
		Info_AddChoice	(Info_Mod_Thekla_Daemonisch2, "Klosterwein", Info_Mod_Thekla_Daemonisch2_A);
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_C()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Daemonisch2_C_15_00"); //Tutaj ta mala soda powinna przywrócic apetyt. Wystarczy tylko umiescic go w jedzenie.
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch2_C_17_01"); //Tak, nie chce nawet wiedziec, co to jest.

	Info_ClearChoices	(Info_Mod_Thekla_Daemonisch2);
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_B()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

FUNC VOID Info_Mod_Thekla_Daemonisch2_A()
{
	B_GiveInvItems	(hero, self, ItFo_KWine, 1);

	Info_Mod_Thekla_Daemonisch2_C();
};

INSTANCE Info_Mod_Thekla_Daemonisch3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Daemonisch3_Condition;
	information	= Info_Mod_Thekla_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_SoeldnerBeiThekla_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Daemonisch3_17_00"); //To sie sprawdzilo. Oto kilka slów podziekowania.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Wiec farma w Onar jest skonczona.");

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Thekla_Dung (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung_Condition;
	information	= Info_Mod_Thekla_Dung_Info;
	permanent	= 1;
	important	= 0;
	description	= "(Próbujac wyciagnac Scla)";
};

FUNC INT Info_Mod_Thekla_Dung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_HasItems(hero, ItMi_Scavengerdung) == 1)
	&& (Mod_Suppenwuerze_Thekla == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	Info_AddChoice	(Info_Mod_Thekla_Dung, "Chce tylko troche zartowac z najemnikami.", Info_Mod_Thekla_Dung_04);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Czyz nie widzialem kogos po prostu w spizarni?", Info_Mod_Thekla_Dung_03);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Jeden z pracowników po prostu ukradl talerz.", Info_Mod_Thekla_Dung_02);
	Info_AddChoice	(Info_Mod_Thekla_Dung, "Onar chce od ciebie czegos.", Info_Mod_Thekla_Dung_01);
};

FUNC VOID Info_Mod_Thekla_Dung_01()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_01_15_00"); //Onar chce od ciebie czegos. On oczekuje cie przy dworze.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_01_17_01"); //Powiedz tlustemu facetowi, aby przyjechal tutaj, jesli chce czegos. On staje sie równie leniwy jak zdegenerowani najemnicy.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_02()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_02_15_00"); //Jeden z pracowników po prostu ukradl talerz. On wlasnie wyszedl.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_02_17_01"); //Jakie plytki? W ogóle nie wydawalem talerzy. Czy kochasz mnie?

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Thekla_Dung_03()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_03_15_00"); //Czyz nie widzialem kogos po prostu w spizarni?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_03_17_01"); //Co? Hoodlumy! Cóz, poczekaj....

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "VORRATSKAMMER");

	Mod_Suppenwuerze_Thekla = 1;
};

FUNC VOID Info_Mod_Thekla_Dung_04()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Dung_04_15_00"); //Chce tylko troche zartowac z najemnikami. Prosze spojrzec na chwile, prosze.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung_04_17_01"); //Wole nie, kocham. Chlopcy nie bawia sie z tego.

	Info_ClearChoices	(Info_Mod_Thekla_Dung);

	AI_StopProcessInfos	(self);

	Mod_Suppenwuerze_Thekla = 2;
};

INSTANCE Info_Mod_Thekla_Dung2 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung2_Condition;
	information	= Info_Mod_Thekla_Dung2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung2_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 1)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung2_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_00"); //Oklamales mi! Nie rób tego nigdy wiecej.
	AI_Output(self, hero, "Info_Mod_Thekla_Dung2_17_01"); //Jesli chodzi o moje zapasy, nie moge wziac zartów.
};

INSTANCE Info_Mod_Thekla_Dung3 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Dung3_Condition;
	information	= Info_Mod_Thekla_Dung3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Dung3_Condition()
{
	if (Npc_KnowsInfo(hero, PC_Herd_Scavengerdung))
	&& (Mod_Suppenwuerze_Thekla == 2)
	&& (Mod_Scavengerdung_Tag > Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Dung3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_00"); //Masz cos wspólnego z brzuchami najemników?
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_01"); //Co sprawia, ze myslisz o tym?
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_02"); //Mówiles o zartie, które chciales zagrac zanim zaczely narzekac.
	AI_Output(hero, self, "Info_Mod_Thekla_Dung3_15_03"); //Um....
	AI_Output(self, hero, "Info_Mod_Thekla_Dung3_17_04"); //Nie obchodze sie co z najemnikami, ale trzymajcie wasze rece z pieca, pamietajcie o tym!
};

INSTANCE Info_Mod_Thekla_Wasili_01 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_01_Condition;
	information	= Info_Mod_Thekla_Wasili_01_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thekla_Wasili_01_Condition()
{
	if (Mod_WM_WasiliQuest == 3)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_01_Info()
{
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_00"); //Biedny Wasili. Onar zostal wygnany z dworu, poniewaz dawal pieniadze nieznajomemu na polecenie Marii.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_01"); //Teraz caly dzien siedzi w jaskini pije. I Maria nie podniesie palca, by pomóc Wasili wydostac sie z niego.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_17_02"); //Duzo jestes na drodze. Czy nie mozesz przyniesc mu cos do jedzenia?

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);

	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "Nie, nie mam na to czasu.", Info_Mod_Thekla_Wasili_01_B);
	Info_AddChoice	(Info_Mod_Thekla_Wasili_01, "Z pewnoscia chetnie pomoze.", Info_Mod_Thekla_Wasili_01_A);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_B()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_B_15_00"); //Nie, nie mam na to czasu.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_B_17_01"); //Zbyt zle. Pózniej bede musial sie sam udac.

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

FUNC VOID Info_Mod_Thekla_Wasili_01_A()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_01_A_15_00"); //Z pewnoscia chetnie pomoze.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_01_A_17_01"); //Dzieki temu dostaniesz troche mojego gulaszu, który przygotuje pózniej.

	B_GiveInvItems	(self, hero, ItMi_EsspaketWasili, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Thekla poprosila mnie, abym przyniósl Wasili cos do jedzenia.");

	Info_ClearChoices	(Info_Mod_Thekla_Wasili_01);
};

INSTANCE Info_Mod_Thekla_Wasili_02 (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Wasili_02_Condition;
	information	= Info_Mod_Thekla_Wasili_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przynioslem jego jedzenie.";
};

FUNC INT Info_Mod_Thekla_Wasili_02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_Verbannt_02))	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Wasili_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Wasili_02_15_00"); //Przynioslem jego jedzenie.
	AI_Output(self, hero, "Info_Mod_Thekla_Wasili_02_17_01"); //Dziekuje bardzo. Oto obiecany gulasz, z którym wlasnie skonczylem. Ciesz sie posilkiem.

	B_GiveInvItems	(self, hero, ItFo_XPStew, 1);

	B_LogEntry	(TOPIC_MOD_ADANOS_WASILI, "Przywiozlem Wasili jego jedzenie i dostalem gulasz.");
};

INSTANCE Info_Mod_Thekla_Zauberwasser (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Zauberwasser_Condition;
	information	= Info_Mod_Thekla_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dostawe magicznej wody.";
};

FUNC INT Info_Mod_Thekla_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Thekla_Zauberwasser_15_00"); //Mam dostawe magicznej wody.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Thekla_Zauberwasser_17_01"); //Najwyzszy czas.
};

INSTANCE Info_Mod_Thekla_Trade (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Trade_Condition;
	information	= Info_Mod_Thekla_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thekla_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thekla_Trade_Info()
{
	B_GiveTradeInv	(self);
	B_Say	(hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thekla_Pickpocket (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_Pickpocket_Condition;
	information	= Info_Mod_Thekla_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120_Female;
};

FUNC INT Info_Mod_Thekla_Pickpocket_Condition()
{
	C_Beklauen	(112, ItFo_XPStew, 1);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_BACK, Info_Mod_Thekla_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thekla_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thekla_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thekla_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thekla_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thekla_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thekla_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thekla_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thekla_EXIT (C_INFO)
{
	npc		= Mod_799_BAU_Thekla_NW;
	nr		= 1;
	condition	= Info_Mod_Thekla_EXIT_Condition;
	information	= Info_Mod_Thekla_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thekla_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thekla_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
