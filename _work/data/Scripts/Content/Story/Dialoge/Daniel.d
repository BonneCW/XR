INSTANCE Info_Mod_Daniel_Hi (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Hi_Condition;
	information	= Info_Mod_Daniel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes dealerem?";
};

FUNC INT Info_Mod_Daniel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daniel_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_15_00"); //Jestes dealerem?
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_08_01"); //To prawda. Moja oferta obejmuje wszystkie przedmioty, które moga Ci sie przydac jako magikowi.
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_08_02"); //Chcesz uslyszec moja specjalna oferte?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Daniel sprzedaje rózne przedmioty dla magów.");

	Info_ClearChoices	(Info_Mod_Daniel_Hi);

	Info_AddChoice	(Info_Mod_Daniel_Hi, "Nie, chce tylko spojrzec na wasze towary.", Info_Mod_Daniel_Hi_B);
	Info_AddChoice	(Info_Mod_Daniel_Hi, "Tak, prosze.", Info_Mod_Daniel_Hi_A);
};

FUNC VOID Info_Mod_Daniel_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_B_15_00"); //Nie, chce tylko spojrzec na wasze towary.

	Info_ClearChoices	(Info_Mod_Daniel_Hi);
};

FUNC VOID Info_Mod_Daniel_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Hi_A_15_00"); //Tak, prosze.
	AI_Output(self, hero, "Info_Mod_Daniel_Hi_A_08_01"); //Dostalem zbyt duza ilosc rolek lodowych. Lanca lodowa, strzalka lodowa, blok lodowy i fala lodowa mozna kupic za pól ceny. Interesuje?

	Info_ClearChoices	(Info_Mod_Daniel_Hi);
};

INSTANCE Info_Mod_Daniel_Nagelnachschub (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Nagelnachschub_Condition;
	information	= Info_Mod_Daniel_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Masz jakies paznokcie, przez przypadek?";
};                       

FUNC INT Info_Mod_Daniel_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Nagelnachschub_15_00"); //Masz jakies paznokcie, przez przypadek?
	AI_Output(self, hero, "Info_Mod_Daniel_Nagelnachschub_08_01"); //Przykro mi, nie moge w tym pomóc.
	AI_Output(self, hero, "Info_Mod_Daniel_Nagelnachschub_08_02"); //Ale jestem pewien, ze moje male.... Zgrubni koledzy moga Ci pomóc. (pobudza nos)
};

INSTANCE Info_Mod_Daniel_BrokenRune (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune_Condition;
	information	= Info_Mod_Daniel_BrokenRune_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Naprawde, mam pytanie.";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_HasItems(hero, ItMi_BrokenRune01) == 1)
	&& (Npc_HasItems(hero, ItMi_BrokenRune02) == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_00"); //Naprawde, mam pytanie.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_01"); //Chcesz cos kupic? Pokaze Ci moje towary.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_02"); //Nie, nie, nie, nie, nie. Wlasciwie poszukuje maga. Dostales go w miescie.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_03"); //No cóz, jest Fuego, magik ognia. Znajdziesz go w Magicznym Domu Pozarnym.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_04"); //Dzieki, czlowiek. Zobacze.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_05"); //Powoli. Potem jest magik wody. Dziwny wspólpracownik.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune_08_06"); //Mieszka gdzies w slumsach. Gdzie dokladnie nie wiem.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune_15_07"); //Jo Jo. Jeszcze raz panstwu dziekuje.

	Log_CreateTopic	(TOPIC_MOD_JG_RUNENZAUBER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_RUNENZAUBER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "W Khoracie sa tu dwaj wazni magowie: magik ognia w domu czarodziejów i magik wodny w slumsach.");
};

INSTANCE Info_Mod_Daniel_BrokenRune2 (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune2_Condition;
	information	= Info_Mod_Daniel_BrokenRune2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Dobry dzien. Widze, ze masz do zaoferowania wszystkie rodzaje magii.";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Idrico_BrokenRune))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune2_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_00"); //Dobry dzien. Widze, ze masz do zaoferowania wszystkie rodzaje magii.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_01"); //Bylo dobrze. Co moge Ci dostac? Czyz eliksir? Czesc? A moze ziolo?
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_02"); //Nic tam nie ma. Szukam postaci Adanos, która sprzedal ci magik wody.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_03"); //Tak, rzecz rzadko piekna. Niestety, juz tego nie mam.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_04"); //A do kogo ja sprzedales?
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_05"); //Prosze pozwolic mi pomyslec o tym...... Tak, kolega, który zajmuje sie rzadkoscia.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune2_08_06"); //I nie sadze, aby wszystko, co sprzedaje, bylo realne....
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune2_15_07"); //Dziekujemy za koncówke.

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Daniel sprzedal sylwetke Adanos dealerowi rzadkosci.");
};

INSTANCE Info_Mod_Daniel_BrokenRune3 (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_BrokenRune3_Condition;
	information	= Info_Mod_Daniel_BrokenRune3_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Hm. Czy móglbys wynegocjowac te rzecz dla mnie?";
};                       

FUNC INT Info_Mod_Daniel_BrokenRune3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_BrokenRune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 150)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_BrokenRune3_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_00"); //Hm. Czy móglbys wynegocjowac te rzecz dla mnie?
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_01"); //Dlaczego. Czy uwazasz, ze bedzie tanszy? Ja równiez jestem handlarzem.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_02"); //Nie, nie, nie, nie, nie. Prawdopodobnie troche wczesniej go zirytowalam.....
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_03"); //Moge spróbowac. Dla mnie to 25 procent.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_04"); //To dobrze, to w porzadku.

	AI_GotoWP	(self, "REL_CITY_102");
	AI_GotoWP	(self, "REL_CITY_347");

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_05"); //Tam. Oto rysunek. Koszt 100. Dla mnie oznacza to 150 zlota.

	B_GiveInvItems	(self, hero, ItMi_AdanosStatue, 1);

	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_06"); //Ale to 50%.
	AI_Output(self, hero, "Info_Mod_Daniel_BrokenRune3_08_07"); //Tak, i? Czy nie jest to wystarczajaco tanie? Poza tym mam zone i siedem - mam zone.
	AI_Output(hero, self, "Info_Mod_Daniel_BrokenRune3_15_08"); //... siedmioro dzieci. Wiem. Oto Twoje zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 150);

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Pakiet handlowca! Ze zawsze musza sie targowac. Siedem dzieci! Nie widzialem jeszcze tu ani jednego szczura. Przynajmniej teraz mam postac Adanos. Gota wraca do maga.");
};

INSTANCE Info_Mod_Daniel_Kissen (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Kissen_Condition;
	information	= Info_Mod_Daniel_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Szukam srodka zmiekczajacego zapach.";
};                       

FUNC INT Info_Mod_Daniel_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_00"); //Szukam srodka zmiekczajacego zapach.
	AI_Output(self, hero, "Info_Mod_Daniel_Kissen_08_01"); //Nigdy o tym nie slyszalem. Co to ma byc?
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_02"); //Tak naprawde nie wiem. Moze to byc nalewka lub cos.
	AI_Output(self, hero, "Info_Mod_Daniel_Kissen_08_03"); //Potem spróbowalbym alchemika. Albo na Morpheus, sprzedajac rarytasy.
	AI_Output(hero, self, "Info_Mod_Daniel_Kissen_15_04"); //Dzieki.
};

INSTANCE Info_Mod_Daniel_Kimon (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Kimon_Condition;
	information	= Info_Mod_Daniel_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Masz wszystkie rodzaje eliksirów i roslin.";
};                       

FUNC INT Info_Mod_Daniel_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_00"); //Masz wszystkie rodzaje eliksirów i roslin. Jestem pewien, ze jest tez dawca radosci.
	AI_Output(self, hero, "Info_Mod_Daniel_Kimon_08_01"); //Myslisz zle. Prowadze tylko to, co czyni uczciwa alchemie. Nie ten potworny miotacz. Bedziesz musial udac sie do komorników sadowych.
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_02"); //Nie moge sie tam dostac.
	AI_Output(self, hero, "Info_Mod_Daniel_Kimon_08_03"); //To równiez dobrze. Tak czy owak nie moge wam pomóc.
	AI_Output(hero, self, "Info_Mod_Daniel_Kimon_15_04"); //Moglo tak byc. Do zobaczenia nastepnym razem.
};

INSTANCE Info_Mod_Daniel_Freudenspender (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Freudenspender_Condition;
	information	= Info_Mod_Daniel_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Potrzebujesz dozowników radosci?";
};                       

FUNC INT Info_Mod_Daniel_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Daniel_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Daniel_Freudenspender_15_00"); //Potrzebujesz dozowników radosci?
	AI_Output(self, hero, "Info_Mod_Daniel_Freudenspender_08_01"); //Przykro mi, ale nie wolno mi pozwolic, aby mój umysl sie zamglal.
	AI_Output(self, hero, "Info_Mod_Daniel_Freudenspender_08_02"); //Bedziesz musial zwrócic sie do innych.
};

INSTANCE Info_Mod_Daniel_Trade (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Trade_Condition;
	information	= Info_Mod_Daniel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Daniel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Daniel_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Daniel_Pickpocket (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_Pickpocket_Condition;
	information	= Info_Mod_Daniel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Daniel_Pickpocket_Condition()
{
	C_Beklauen	(94, ItMi_Gold, 39);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

	Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_BACK, Info_Mod_Daniel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Daniel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Daniel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Daniel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Daniel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Daniel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Daniel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Daniel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Daniel_EXIT (C_INFO)
{
	npc		= Mod_7378_OUT_Daniel_REL;
	nr		= 1;
	condition	= Info_Mod_Daniel_EXIT_Condition;
	information	= Info_Mod_Daniel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Daniel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Daniel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
