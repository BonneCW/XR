INSTANCE Info_Mod_Mahamad_Hi (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Hi_Condition;
	information	= Info_Mod_Mahamad_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Beliar! Jestem tu zapytany.";
};

FUNC INT Info_Mod_Mahamad_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malek_Manaextrakt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_00"); //Beliar! Jestem tu zapytany.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_01"); //Wydaje mi sie to calkiem slusznie. Wyglada to lepiej niz inni oszustowie.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_02"); //Czuje sie juz jak oszust. Potrzebujesz mnie?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_03"); //Wlasciwie nie. Potrzebujesz jednak mnie i mojego glosu.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_04"); //To wystarczy. Co musze zrobic?
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_05"); //Oczekuje sie, ze magik bedzie mial pewna dojrzalosc umyslowa i inteligencje.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_06"); //Moja praca polega na sprawdzeniu, czy sa dostepne przynajmniej pewne podejscia, aby spelnic te wymagania.
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_07"); //Chyba nie upadlem na glowe.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_08"); //Zobaczymy to. Bedziesz musial rozwiazac kilka zagadek i odpowiedziec na pytania. Czy potrafisz przeczytac?
	AI_Output(hero, self, "Info_Mod_Mahamad_Hi_15_09"); //Tak wlasnie rozumiem. Dobrze jest pojechac.
	AI_Output(self, hero, "Info_Mod_Mahamad_Hi_01_10"); //Bardzo dobrze. Oto cztery karteczki papieru. Znalezc odpowiedzi i przyjsc do mnie.

	CreateInvItems	(hero, ItWr_MahamadRaetsel1, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel2, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel3, 1);
	CreateInvItems	(hero, ItWr_MahamadRaetsel4, 1);

	B_ShowGivenThings	("4 karty odebrane");

	Log_CreateTopic	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_SCHLAUFUCHS, "Mahamad chce sprawdzic moja inteligencje. Dal mi cztery kartki papieru z zagadka.");
};

INSTANCE Info_Mod_Mahamad_Schlaufuchs (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Schlaufuchs_Condition;
	information	= Info_Mod_Mahamad_Schlaufuchs_Info;
	permanent	= 1;
	important	= 0;
	description	= "Mozecie mnie panstwo przetestowac.";
};

FUNC INT Info_Mod_Mahamad_Schlaufuchs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mahamad_Hi))
	&& (Mod_ASS_MahamadRaetsel == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_00"); //Mozecie mnie panstwo przetestowac.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_01"); //Masz juz wszystko zorientowane?
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_15_02"); //Tak.
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_01_03"); //Wtedy chcialbym wiedziec, ile kosztuje wino najwyzszej jakosci.

	Mod_ASS_MahamadRaetsel_Niete = 0;

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Liczylem 200 zlota.", Info_Mod_Mahamad_Schlaufuchs_C);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Liczylem 175 zlota.", Info_Mod_Mahamad_Schlaufuchs_B);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Liczylem 150 zlota.", Info_Mod_Mahamad_Schlaufuchs_A);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_D()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_D_01_00"); //I ile trójkatów policzyles?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Mysle, ze to 35 trójkatów.", Info_Mod_Mahamad_Schlaufuchs_G);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Mysle, ze to 25 trójkatów.", Info_Mod_Mahamad_Schlaufuchs_F);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Mysle, ze jest 20 trójkatów.", Info_Mod_Mahamad_Schlaufuchs_E);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_C()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_C_15_00"); //Liczylem 200 zlota.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_B()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_B_15_00"); //Liczylem 175 zlota.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_A()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_A_15_00"); //Liczylem 150 zlota.

	Info_Mod_Mahamad_Schlaufuchs_D();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_H()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_H_01_00"); //Uh-huh. A co z seria liczb?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "To bylo troche trudne. Dostalem 7-4 pietra i 14-16 na dole.", Info_Mod_Mahamad_Schlaufuchs_K);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "To bylo troche trudne. Dostalem szesc trzydziesci szesc trzydziestu szesc pieter na górze i pietnascie siedemnascie na dole.", Info_Mod_Mahamad_Schlaufuchs_J);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "To bylo troche trudne. Dostalem 5 2 pietra i 17 19 na dole.", Info_Mod_Mahamad_Schlaufuchs_I);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_M()
{
	AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_M_01_00"); //I ostatnie zadanie. Jak dlugo leki trwaja?

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);

	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 godzina.", Info_Mod_Mahamad_Schlaufuchs_P);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "Dwie godziny.", Info_Mod_Mahamad_Schlaufuchs_O);
	Info_AddChoice	(Info_Mod_Mahamad_Schlaufuchs, "1 1 1/2 godziny.", Info_Mod_Mahamad_Schlaufuchs_N);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_G()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_G_15_00"); //Mysle, ze to 35 trójkatów.

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_F()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_F_15_00"); //Mysle, ze to 25 trójkatów.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_E()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_E_15_00"); //Mysle, ze jest 20 trójkatów.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_H();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_L()
{
	if (Mod_ASS_MahamadRaetsel_Niete >= 2)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_00"); //Panskie odpowiedzi nie byly zle, ale mysle, ze to nie wystarczy. Naucz sie, przeczytaj ksiazki, przygotuj sie. Wiekszosc nowicjuszy ma tutaj ten sam problem.
	}
	else if (Mod_ASS_MahamadRaetsel_Niete >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_01"); //Naprawde mnie zaskoczylas. Nie sadzilem, zebys mial taki rezultat. Musze powiedziec, ze jestes na dobrej drodze. Chce dac panstwu kolejna szanse.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_02"); //Doskonaly! To wszystko jest w porzadku. To jest z Toba bardzo przyjemna zabawa. Jestescie pewni mojego glosu.
		AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_L_15_03"); //Co wiec dzieje sie pózniej?
		AI_Output(self, hero, "Info_Mod_Mahamad_Schlaufuchs_L_01_04"); //Mysle, ze Mirza ma dla Ciebie cos innego.

		B_GivePlayerXP	(250);

		Mod_ASS_MahamadRaetsel = 1;

		B_SetTopicStatus	(TOPIC_MOD_ASS_SCHLAUFUCHS, LOG_SUCCESS);
	
		B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
	};

	Info_ClearChoices	(Info_Mod_Mahamad_Schlaufuchs);
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_K()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_K_15_00"); //To bylo troche trudne. Dostalem 7-4 pietra i 14-16 na dole.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_J()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_J_15_00"); //To bylo troche trudne. Dostalem szesc trzydziesci szesc trzydziestu szesc pieter na górze i pietnascie siedemnascie na dole.

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_I()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_I_15_00"); //To bylo troche trudne. Dostalem 5 2 pietra i 17 19 na dole.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_M();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_P()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_P_15_00"); //1 godzina.

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_O()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_O_15_00"); //Dwie godziny.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

FUNC VOID Info_Mod_Mahamad_Schlaufuchs_N()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Schlaufuchs_N_15_00"); //1 1 1/2 godziny.

	Mod_ASS_MahamadRaetsel_Niete += 1;

	Info_Mod_Mahamad_Schlaufuchs_L();
};

INSTANCE Info_Mod_Mahamad_Blutkelch (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Blutkelch_Condition;
	information	= Info_Mod_Mahamad_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj! Kais mówi mi, ze masz czesc wiadomosci. Czy moge go miec?";
};

FUNC INT Info_Mod_Mahamad_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kais_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mahamad_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_00"); //Witaj! Kais mówi mi, ze masz czesc wiadomosci. Czy moge go miec?
	AI_Output(self, hero, "Info_Mod_Mahamad_Blutkelch_01_01"); //Tutaj nie moge sobie z tym poradzic. Ale badz ostrozny! To stary pergamin.

	B_GiveInvItems	(self, hero, ItWr_BlutkelchZettel2, 1);

	AI_Output(hero, self, "Info_Mod_Mahamad_Blutkelch_15_02"); //Bede uwazny.

	if (Npc_HasItems(hero, ItWr_BlutkelchZettel1) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel2) == 1)
	&& (Npc_HasItems(hero, ItWr_BlutkelchZettel3) == 1)
	{
		Log_CreateTopic	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ASS_LASTBLUTKELCH, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Otrzymal kawalek starozytnego pergaminu z Kais, Mahamad i Norek do rozszyfrowania wiadomosci. Amir zabral ich do obozu. Zobaczmy jak.....");
	};
};

INSTANCE Info_Mod_Mahamad_Pickpocket (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_Pickpocket_Condition;
	information	= Info_Mod_Mahamad_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mahamad_Pickpocket_Condition()
{
	C_Beklauen	(88, ItMi_Gold, 29);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_BACK, Info_Mod_Mahamad_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mahamad_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mahamad_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mahamad_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mahamad_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mahamad_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mahamad_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mahamad_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mahamad_EXIT (C_INFO)
{
	npc		= Mod_7150_ASS_Mahamad_NW;
	nr		= 1;
	condition	= Info_Mod_Mahamad_EXIT_Condition;
	information	= Info_Mod_Mahamad_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mahamad_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mahamad_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
