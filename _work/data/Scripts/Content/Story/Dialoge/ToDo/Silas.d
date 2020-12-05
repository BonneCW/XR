INSTANCE Info_Mod_Silas_Hi (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Hi_Condition;
	information	= Info_Mod_Silas_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestem pewien, ze z baru dostaniesz duzo.";
};

FUNC INT Info_Mod_Silas_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	|| (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_15_00"); //Jestem pewien, ze z baru dostaniesz duzo.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_01"); //Jesli chcialbys, abym opowiedzial Ci cos o obozie, musisz pozwolic skoczyc 100 zlotych monet lub.....

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Silas_Hi_06_02"); //cichszy ton) Czy masz trzy lodygi rabu bagiennego?

	Info_ClearChoices	(Info_Mod_Silas_Hi);

	Info_AddChoice	(Info_Mod_Silas_Hi, "Niestety nie.....", Info_Mod_Silas_Hi_D);

	if (Npc_HasItems(hero, ItMi_Joint) >= 3)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Oto trzy lodygi.", Info_Mod_Silas_Hi_B);
	};
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Silas_Hi, "Oto 100 zlotych monet.", Info_Mod_Silas_Hi_A);
	};
};

FUNC VOID Info_Mod_Silas_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_00"); //Co wiec z obozem?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_01"); //Cóz, od upadku zapory w obozie zmienilo sie wiele rzeczy, co nie powinno dziwic, bo to byl pierwotny cel, na którym opierala sie spójnosc obozu.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_02"); //A kiedy magicy wodni, którzy ucielesnili w obozie wiele autorytetów, równiez opuscili obóz, grozilo, ze sie rozpadnie.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_03"); //Lee, prawdopodobnie nadal obsesyjnie obsesyjnie nastawiony do checi zemsty na króla, chcial temu zapobiec wszelkimi sposobami.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_04"); //Nie chce tak latwo zrezygnowac z kontroli nad tak licznymi mezczyznami, ze moze uznac to za narzedzie zemsty na oslabionym królu.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_05"); //Przekonal najemników, ze nigdy nie beda w stanie doswiadczyc wolnosci, dopóki król nie umrze - no cóz, wiele rud, które nadal opuszczaja wolne kopalnie, musialo przekonac czesc z nich do pozostania.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_06"); //Teraz, gdy nie ma juz bariery do wysadzenia w powietrze, sluzy ona jako zaplata i zakup nowego sprzetu do budowania silnej sily.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_07"); //W tym celu wprowadzil równiez surowe zasady - takie jak ograniczenie ziól bagiennych - nowe hierarchie i twarda wiertarke dla bojowników.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_08"); //A co z tym facetem Sylvio?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_09"); //Lee dal mu drugie stanowisko. Sylvio jest ciezkim wojownikiem i wie, jak pozyskac najemników do jeszcze wiekszej dyscypliny z atmosfera strachu.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_10"); //Jednak sama Sylvio jest skorumpowana, brudna swinia i ma zdecydowanie najwieksza ilosc brudnego brudu.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_11"); //Tlumi rude i jedzenie, które byly przeznaczone na przyklad dla rolników i pozwala chlopcom zalatwic sprawy z dawnym obozem.
	AI_Output(hero, self, "Info_Mod_Silas_Hi_C_15_12"); //A dlaczego Lee pozwolil cos takiego sie wydarzyc?
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_13"); //Lee ma zemste w glowie. On zdaje sie zamykac oczy na inne rzeczy tak dlugo, jak one tylko funkcjonuja jakos.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_14"); //Poza tym, Sylvio równiez trudno jest cos udowodnic, poniewaz wysyla chlopców we wszystkich swoich czynach i nie zabrudza mu rak.
	AI_Output(self, hero, "Info_Mod_Silas_Hi_C_06_15"); //Cóz, to byly chyba najwazniejsze rzeczy, które powinienes wiedziec o obozie.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_D_15_00"); //Niestety nie.....
	AI_Output(self, hero, "Info_Mod_Silas_Hi_D_06_01"); //Wtedy nie mam dla Ciebie zadnych informacji.

	Info_ClearChoices	(Info_Mod_Silas_Hi);
};

FUNC VOID Info_Mod_Silas_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_B_15_00"); //Oto trzy lodygi.

	B_GiveInvItems	(hero, self, ItMi_Joint, 3);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_B_06_01"); //Ahhh, bajkowy.

	Info_Mod_Silas_Hi_C();
};

FUNC VOID Info_Mod_Silas_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Silas_Hi_A_15_00"); //Oto 100 zlotych monet.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Silas_Hi_A_06_01"); //Dobry, dobry.

	Info_Mod_Silas_Hi_C();
};

INSTANCE Info_Mod_Silas_Trade (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Trade_Condition;
	information	= Info_Mod_Silas_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Silas_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Silas_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Silas_Trade_Info()
{
	if (Mod_SilasTrader == 0)
	{
		Mod_SilasTrader = 1;

		Log_CreateTopic	(TOPIC_MOD_HAENDLER_SOELDNER, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_SOELDNER, "Od Silasa moge kupowac wszelkiego rodzaju artykuly spozywcze.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Silas_Pickpocket (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_Pickpocket_Condition;
	information	= Info_Mod_Silas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Silas_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_Silas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_BACK, Info_Mod_Silas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Silas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Silas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
};

FUNC VOID Info_Mod_Silas_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Silas_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Silas_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Silas_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Silas_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Silas_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Silas_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Silas_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Silas_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Silas_EXIT (C_INFO)
{
	npc		= Mod_1291_SLD_Silas_MT;
	nr		= 1;
	condition	= Info_Mod_Silas_EXIT_Condition;
	information	= Info_Mod_Silas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Silas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
