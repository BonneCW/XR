INSTANCE Info_Mod_Thofeistos_Hi (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Hi_Condition;
	information	= Info_Mod_Thofeistos_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj. Czy kowal?";
};

FUNC INT Info_Mod_Thofeistos_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_00"); //Witaj. Czy kowal?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_01"); //Nie, po prostu wlasciwie podgrzewam dene. Co jeszcze mialem zrobic w kuzni?
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_02"); //Przepraszam, tylko pytanie.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_03"); //Tak, dosc glupi. No cóz, o to wlasnie chodzi. Bez twardych uczuc. Jest dla mnie tu wiele do zrobienia, wiecej niz pierwotnie sie spodziewalem, gdy wstapilem do obozu.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_04"); //Skad jestes i dlaczego po upadku zapory wstapiles do Nowego Obozu?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_05"); //Pierwotnie pochodzilem z pólnocy ladu. Slyszalem o duzych zlozach rudy na Khorinis, wiec udalem sie na te wyspe.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_06"); //Po upadku zapory nie wahalem sie na sekunde i zszedlem do doliny, do wlasciwego zródla rudy.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Hi_29_07"); //Tak wiele magicznej rudy, ze moge ksztaltowac wedlug mojej woli, nowe stopy, tworza kompozycje metalu, które nigdy wczesniej nie istnialy.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Hi_15_08"); //Tak, slysze, ze to kowal z dusza.
};

INSTANCE Info_Mod_Thofeistos_Orksoeldner (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Orksoeldner_Condition;
	information	= Info_Mod_Thofeistos_Orksoeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie pistolet?";
};

FUNC INT Info_Mod_Thofeistos_Orksoeldner_Condition()
{
	if (Mod_Gilde == 19)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Orksoeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Masz dla mnie pistolet?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_01"); //No cóz, bo jestes jednym z mysliwych luczników Orku....
	AI_Output(hero, self, "Info_Mod_Thofeistos_Orksoeldner_15_02"); //Ale co?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Orksoeldner_29_03"); //Wlasnie znów skonczyla mi sie ruda. Jesli chcesz miecz, udaj sie do naszej kopalni i zalóz mi skrzynke rudy.

	Log_CreateTopic	(TOPIC_MOD_NL_ERZKISTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_ERZKISTE, "Teraz wolno mi pobierac rude z kopalni dla Thofeistos.");
};

INSTANCE Info_Mod_Thofeistos_Erzkiste (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Erzkiste_Condition;
	information	= Info_Mod_Thofeistos_Erzkiste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto pudelko.";
};

FUNC INT Info_Mod_Thofeistos_Erzkiste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_FMCTorwache_Erzkiste))
	&& (Npc_HasItems(hero, ItMi_Erzkiste) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Erzkiste_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_00"); //Oto pudelko.

	B_GiveInvItems	(hero, self, ItMi_Erzkiste, 1);

	if (hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_01"); //Bardzo dobry. Tutaj zadzwoniles do miecza, na który zaslugujesz, Orcslaughterers.

		B_GiveInvItems	(self, hero, ItMw_Orkschlaechter, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_02"); //Bardzo dobry. Tutaj zadzwoniles miecz, na który zaslugujesz, Orcpiekser.

		B_GiveInvItems	(self, hero, ItMw_Orkpickser, 1);
	};

	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_03"); //To jest najlepsze, co mozesz od mnie uzyskac. Bedziesz musial sam wyprodukowac lepsza bron.
	AI_Output(hero, self, "Info_Mod_Thofeistos_Erzkiste_15_04"); //Masz juz pistolet? Ale dlaczego tak sie stalo?
	AI_Output(self, hero, "Info_Mod_Thofeistos_Erzkiste_29_05"); //Ach, po prostu nie mialem czasu i bylem zbyt wygodny, by dostac pudelko. Oto dwa kawalki rudy, którym dziekuje.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 2);

	B_SetTopicStatus	(TOPIC_MOD_NL_ERZKISTE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_Gormgniez (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Gormgniez_Condition;
	information	= Info_Mod_Thofeistos_Gormgniez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przyjezdzam z Lee, aby dostac jakas nagrode w postaci rudy.";
};

FUNC INT Info_Mod_Thofeistos_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Gormgniez_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Gormgniez_15_00"); //Przyjezdzam z Lee, aby dostac jakas nagrode w postaci rudy.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Gormgniez_29_01"); //Tak, tak, tak, tyle rudy. Miejmy nadzieje, ze nie utopiszcie wszystkiego, ale zrobicie z tego równiez ladne ostrza.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 15);

	B_SetTopicStatus	(TOPIC_MOD_NL_CRAWLER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thofeistos_SeeVorLager (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_SeeVorLager_Condition;
	information	= Info_Mod_Thofeistos_SeeVorLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_SeeVorLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_SeeVorLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_00"); //Jestes w drodze na zewnatrz. Czy zauwazyles cos niezwyklego w jeziorze przed obozem?
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_01"); //Nah, nie o czym wiem. Dlaczego pytasz?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_02"); //Ach, to nie jest tak wazne. Po prostu zauwazylem cos dziwnego w jeziorze..... ale....... Nie, zbyt daleko.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_03"); //Cóz, w ostatnich dniach na Khorinis dzieje sie wiele niezwyklych i dziwnych rzeczy. Na przyklad latawce....
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_04"); //(zaklócenia) Wiec to, co myslalem, ze widze i slysze noca w jeziorze.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_05"); //Tak, o czym pan mówi?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_06"); //Ostatniej nocy. Poszedlem na spacer przed obozem i nagle uslyszalem syczace i skrzypiace odglosy z jeziora, które - jak sadzilem - znalem tylko ze starych ksiazek.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_07"); //Slychac odglosy? Jakie ksiazki?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_08"); //Ksiazki o smokach i zwiazanych z nimi stworzeniach, w tym tych w domu w wodzie.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_09"); //Patrzac na jezioro pomyslalem, ze widze dlugie cialo krete przez wode.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_10"); //Ale wydawalo mi sie, ze jest malo prawdopodobne, aby znalezc takiego morskiego potwora tutaj w Minental.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_11"); //A jak powinnismy teraz postepowac? Co nalezy zrobic?
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_12"); //No cóz, nie sadze, aby to stworzenie bylo prawdziwym zagrozeniem dla obozu, poniewaz woli byc w wodzie, nawet jesli moze latac przez jakis czas.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_13"); //Hmm, ale gdybys mógl mi przyniesc jego luski, móglbym stworzyc nowa zbroje.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_14"); //Nalezy jednak pamietac, ze w nocy wznosi sie on jedynie z blota jeziora.
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_15"); //Spróbuj wabic go na brzeg i pokonac tam.
	AI_Output(hero, self, "Info_Mod_Thofeistos_SeeVorLager_15_16"); //Obalic potwora morskiego! Cóz, zobacze, co mozna zrobic....
	AI_Output(self, hero, "Info_Mod_Thofeistos_SeeVorLager_29_17"); //Zycze powodzenia.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Thofeistos uwaza, ze w jeziorze przed obozem natknal sie na potwora morskiego. Kiedy stwór wydostanie sie noca z jeziora, zwabie je na brzeg i zrobie to. Z wag potwora morskiego Thofeistos mógl uczynic mnie nowym pancerzem.");
};

INSTANCE Info_Mod_Thofeistos_Seeungeheuer (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Seeungeheuer_Condition;
	information	= Info_Mod_Thofeistos_Seeungeheuer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem szopy.";
};

FUNC INT Info_Mod_Thofeistos_Seeungeheuer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_SeeVorLager))
	&& (Npc_HasItems(hero, ItAt_Seeungeheuerschuppen) == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Seeungeheuer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Seeungeheuer_15_00"); //Dostalem szopy.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_01"); //Pokaz mi....

	B_GiveInvItems	(hero, self, ItAt_Seeungeheuerschuppen, 11);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_02"); //... faktycznie.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_03"); //Jestes jeszcze wiekszym wojownikiem niz sie spodziewalem.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_04"); //Niewielu ludzi zdolaloby pokonac takiego potwora.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Seeungeheuer_29_05"); //Wróc jutro. Wtedy mam twój pancerz gotowy.

	Mod_NL_DJGArmor_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Thofeistos_DJGArmor (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_DJGArmor_Condition;
	information	= Info_Mod_Thofeistos_DJGArmor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thofeistos_DJGArmor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Seeungeheuer))
	&& (Wld_GetDay() > Mod_NL_DJGArmor_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_DJGArmor_Info()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_00"); //Ach, tam jestescie. Niedawno skonczylem twój pancerz.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_01"); //Mam nadzieje, ze bedzie Ci sluzyla przez dlugi czas.

	B_GiveInvItems	(self, hero, ItAr_DJG_L, 1);

	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_02"); //Hmm, a nastepnie ponownie.... Myslalem.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_03"); //Przez cale swoje zycie poswiecilem sztuce kowalstwa, formowalem bron, której nikt inny nie byl w stanie wykuc i stworzyc stopów, których tajemnice sa mi znane.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_04"); //Posiadam wiedze przekazywana z dawnych zródel i moge konkurowac z najlepszymi hutami i kowale w Nordmarze.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_05"); //Jestescie jednak pierwszym, który wydaje mi sie godny doswiadczyc glebszych konsekracji przetwarzania rudy.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_06"); //Tak, mimo ze jestem otwarty przez wiekszosc czasu, wciaz poznaje wiele rzeczy....
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_07"); //Cala moja wiedza na temat przeróbki rudy jest teraz dla Panstwa otwarta.
	AI_Output(self, hero, "Info_Mod_Thofeistos_DJGArmor_29_08"); //Dokonaj wyboru, ale pamietaj, ze doskonalenie sztuki w kazdej dyscyplinie wymaga duzego doswiadczenia.

	Mod_Gilde = 5;
};

INSTANCE Info_Mod_Thofeistos_Urs (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Urs_Condition;
	information	= Info_Mod_Thofeistos_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przynosze ognisty mlotek Ursa.";
};

FUNC INT Info_Mod_Thofeistos_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMw_FeurigerHammer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_Urs_15_00"); //Przynosze ognisty mlotek Ursa.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_01"); //Co to za magiczny mlotek! Musze spróbowac tego teraz.

	B_GiveInvItems	(hero, self, ItMw_FeurigerHammer, 1);
	Npc_RemoveInvItems(self, ItMw_FeurigerHammer, 1);

	AI_UseMob	(self, "ANVIL", 1);
	AI_UseMob	(self, "ANVIL", -1);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_02"); //Fantastyczne, stal nagrzewa sie prawie automatycznie pod ciosami.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_03"); //Wielki kawalek godny huty w Nordmarze.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Urs_29_04"); //Ustalono dwadziescia bryl? Tu wsiasc 30.... a nawet to nie oddaje prawdziwej wartosci tego dziela.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 30);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Thofeistos ma swój mlotek.... i dostalem 30 bryl rudy.");
};

INSTANCE Info_Mod_Thofeistos_Teacher (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Teacher_Condition;
	information	= Info_Mod_Thofeistos_Teacher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy mozesz mnie czegos nauczyc?";
};

FUNC INT Info_Mod_Thofeistos_Teacher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	if (Mod_Gilde != 5)
	&& (Mod_Gilde != 19)
	{
		AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_01"); //Przede wszystkim okazac sie godnym siebie. Nie poswiecam sie pracy nad magiczna ruda dla kazdej uciekajacej osoby.
	}
	else
	{
		if (Mod_Gilde == 5)
		|| (Mod_Gilde == 19)
		{

			if (Mod_NL_Thofeistos_Lehrer == 0)
			{
				Mod_NL_Thofeistos_Lehrer = 1;

				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_02"); //Udowodniles, ze masz zarówno umiejetnosci walki, jak i umysl i umiejetnosci.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_03"); //Wykwalifikowales sie do nauki o sztuce przetwarzania magicznej rudy.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_04"); //Oczywiscie nie pozwole Wam na wszystko.
				AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_29_05"); //Z jednej strony nie mam na to czasu, a z drugiej strony ta wiedza jest zarezerwowana tylko dla najwybitniejszych wojowników.
			};

			if (Mod_Gilde == 5)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Armor_Dragon == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Usprzet Lowca Smoka Srednim Smoka (1000 zloty)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Udoskonalenie sprzetu do polowan na srednie latawce (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon2);
					};
				};
				if (Armor_Dragon == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Lekki sprzet Smoczego Lowcy Smoka (1000 zloty) Udoskonalenie", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Udoskonalaj lekkie urzadzenia mysliwskie smoka (10 LP)", Info_Mod_Thofeistos_Teacher_Armor_Dragon);
					};
				};
				if (Pfeil_GoldErz == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter strzelal w bron. (2500 zloto)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Dragonfighter strzelal w bron. (25 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter);
					};
				};
				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Koncówki strzalek i sworzni wykonane z rudy zlota. (1000 Zloto)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Koncówki strzalek i sworzni wykonane z rudy zlota. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 1)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 2500)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron smocza mysliwca. (2500 zloto)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 25)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron smocza mysliwca. (25 LP)", Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron wykonana ze stopu rudy zelaza. (1000 Zloto)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron wykonana ze stopu rudy zelaza. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};

			if (Mod_Gilde == 19)
			{
				Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);

				Info_AddChoice	(Info_Mod_Thofeistos_Teacher, DIALOG_BACK, Info_Mod_Thofeistos_Teacher_BACK);

				if (Pfeil_GoldErz == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Koncówki strzalek i sworzni wykonane z rudy zlota. (1000 Zloto)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Koncówki strzalek i sworzni wykonane z rudy zlota. (10 LP)", Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz);
					};
				};
				if (Waffe_ErzEisen == 0)
				{
					if (Mod_Schwierigkeit == 4)
					&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron wykonana ze stopu rudy zelaza. (1000 Zloto)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					}
					else if (Mod_Schwierigkeit != 4)
					&& (hero.lp >= 10)
					{
						Info_AddChoice	(Info_Mod_Thofeistos_Teacher, "Bron wykonana ze stopu rudy zelaza. (10 LP)", Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen);
					};
				};
			};
		};
	};
};

FUNC VOID Info_Mod_Thofeistos_Teacher_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Teacher);
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_00"); //Wez trzy bryly rudy i podgrzej je kawalkiem zlota.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_01"); //Dzieki temu magiczna ruda jest na tyle miekka, ze mozna ja odkuc strzalkami i szpilkami.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_GoldErz_29_02"); //Material jest wystarczajacy na okolo 100 strzalek lub srub.

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Pfeil_GoldErz = 1;

	Mod_PfeileSchnitzen = 1;

	Mod_PfeileSpitzen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Dla strzalek i srub ze stopem zlota rude musze wykuc trzy kawalki rudy i jeden kawalek zlota na kowadle. Od tego momentu otrzymuje 100 punktów, które moge zlozyc za pomoca drazków strzalek do strzalek lub srub.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_00"); //Wez odkuwke, podgrzej ja i - w zaleznosci od wielkosci broni - wykun 20 do 30 bryl magicznej rudy w zarzaca sie stal.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_ErzEisen_29_01"); //Tylko uzyskany w ten sposób stop ma wlasciwosci, które sprawiaja, ze jest ciagliwy i plastyczny.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_03);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_03);

	Waffe_ErzEisen = 1;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Aby produkowac bron ze stopu rudo-zelaznego, musze przerabiac 20 do 30 sztuk rudy w surowa stal na kowadle, w zaleznosci od wielkosci miecza.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_00"); //Legenda glosi, ze wiele stuleci temu, kiedy smoki byly jeszcze bardziej powszechne na powierzchni ziemi, smialy rycerz stanal przed walka z taka bestia.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_01"); //Walczyl z nia przez dlugi czas, ale z bronia rudna nie mógl z trudem wniknac do czolgu bestii i zadal jej tylko drobne rany.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_02"); //Na koniec, powiew plomienia uderzyl w ostrze nasaczone krwia smoka, które swiecilo na czerwono.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_03"); //Nastepny udar uderzenia uderzenia wojownika bez wysilku przeszyl bestie.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_04"); //Okazuje sie bowiem, ze jarzaca sie bron rudy wchodzaca w kontakt z krwia tych magicznych istot osiaga twardosc, która nie moze sie niczego oprzec.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_05"); //W zaleznosci od wielkosci broni, potrzeba od pieciu do siedmiu fiolek krwi smoka.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_06"); //Tworzenie broni z czystej rudy jest jednak duzo wieksza sztuka.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_07"); //Czesto okreslane jako bron rudowa, to zawsze stopy skazone innymi metalami.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_08"); //W celu wytworzenia ciepla, które eliminuje wszelkie inne zanieczyszczenia w rudie i sprawia, ze nawet czysta ruda jest plastyczna i kruszalna, konieczne jest usuniecie plynu z smoka, co daje mu przerazajaca bryze plomienia.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_09"); //Znajduje sie on w organach bialych fioletowych, które znajduja sie niedaleko mostka.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_10"); //Musisz umiescic nóz pomiedzy jego poparzenie i przeciac go do momentu, az organy beda widoczne.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_11"); //Plyn zbiera sie nastepnie w butelce.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_12"); //Proces produkcji czystej rudy slepej próby wykonywany jest w wielkim piecu.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_13"); //Ale badzcie ostrzegani. Pojawiajace sie wybuchowe cieplo przyciaga wszystkich z pasja.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_14"); //Jesli wlozyc 60-80 kawalków rudy do pieca, w zaleznosci od wielkosci broni, która chcesz, dodaj trzy butelki plynu.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_15"); //Ze stopu bierze sie udzial w roztopie tylko jako slepa próbe, która szybko staje sie cialem stalym.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Waffe_Dragonhunter_29_16"); //Aby wykuc z niego bron, udajesz sie do kuzni i podgrzewaj ja butelka plynu.

	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04_Dex);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_1H_Special_04);
	B_TeachPlayerTalentSmith	(self, hero, WEAPON_2H_Special_04);

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Moge teraz, jesli mam przy sobie brzytwe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonElixier] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... martwe smoki usuwaja swój eliksir plomieniowy.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... smoki zabily ich krew.");
	};

	Waffe_ErzEisen = 2;

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Aby uzyskac naprawde czysta bron rudna, najpierw potrzebuje plomiennego eliksiru smoków. Musze wytapiac 3 z nich w piecu topiacym z 60-80 kawalkami rudy, w zaleznosci od wielkosci pistoletu. Powstala w ten sposób czysta rude nalezy umiescic na kowadle z kolejna butelka Flammenelixier i 5 lub 5 plomieni. Siedem fiolek krwi smoka.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_00"); //Podczas wykonywania stopu rudy do strzalek lub srub, dodac butelke krwi smoka.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_01"); //Daje to strzalkom twardosc, która moze przebic kazda zbroje i tarcze.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_02"); //Powinienes równiez uklon lub kusze z smokiem.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_03"); //Naprezenie i przenikliwosc sciegna smoka jest wieksza niz cokolwiek innego.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_04"); //Zwlaszcza sciegna stawów ramion i nóg tych stworzen sa odpowiednie, na szyi mozna równiez znalezc uzyteczny material.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Geschoss_Dragonhunter_29_05"); //Nalezy ciac wzdluz, miedzy wagami, aby ostroznie podazac w kierunku sciegien.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Moge teraz, jesli mam przy sobie brzytwe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... usunac sciegna martwych smoków.");
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... smoki zabily ich krew.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonSehne] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

	Pfeil_GoldErz = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2500);
	}
	else
	{
		hero.lp -= 25;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Aby strzaly byly jeszcze mocniejsze, musze dodac fiolke z krwia smoka do koronki.");
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Poza tym dobry bylby równiez odpowiedni poklon lub kusza. Do tego potrzebuje galazki i dwóch sciegien smoków, które moge podlaczyc do pnia drzewa.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_29_00"); //No cóz, nie mam czasu na wyjasnienie. Zapamietaj uwaznie te instrukcje i dowiesz sie, jak postepowac.

	B_ShowGivenThings	("instrukcje");

	B_HeroFakeScroll ();

	AI_Output(hero, self, "Info_Mod_Thofeistos_Teacher_Armor_Dragon_15_01"); //Uh-huh, tak samo.... 9 Oddzielic bude...... dodawac...... 20 Ruda dla wzmocnienia..... Nastepnie podlacz i zamocuj..... powinien dzialac.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Moge teraz, jesli mam przy sobie brzytwe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... Odlaczyc luski latawcowe od ciala niezyjacego latawca.");
	};

	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;

	Armor_Dragon = 1;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Aby poprawic mój lekki sprzet lowiecki potrzebny mi jest 9 wag i 20 sztuk rudy. Oba sa dodawane do pancerza na kowadle.");
};

FUNC VOID Info_Mod_Thofeistos_Teacher_Armor_Dragon2()
{
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_00"); //Aby stworzyc idealna pancerz, musisz byc jeszcze bardziej zrecznie polaczony z pancerzem, laczac 16 rud i siedem skal.
	AI_Output(self, hero, "Info_Mod_Thofeistos_Teacher_Armor_Dragon2_29_01"); //Do utwardzenia zbroi potrzebne sa równiez cztery fiolki krwi smoka.

	Log_CreateTopic (TOPIC_TalentAnimalTrophy, LOG_NOTE);
	Log_AddEntry (TOPIC_TalentAnimalTrophy, "Moge teraz, jesli mam przy sobie brzytwe:");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_TAKEANIMALTROPHY, 1);
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;

		Log_AddEntry	(TOPIC_TalentAnimalTrophy, "... smoki zabily ich krew.");
	};

	Armor_Dragon = 2;

	if (Mod_Schwierigkeit == 4)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	}
	else
	{
		hero.lp -= 10;
	};

	Log_CreateTopic	(TOPIC_MOD_NL_DJGEQUIP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NL_DJGEQUIP, "Do poprawy mojej sredniej zbroi mysliwskiej potrzebuje 7 kolejnych skal latawic i 16 kun. Ale sa tez cztery fiolki z krwia smoka.");
};

INSTANCE Info_Mod_Thofeistos_GiveSLDWeapon (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_GiveSLDWeapon_Condition;
	information	= Info_Mod_Thofeistos_GiveSLDWeapon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie pistolet?";
};

FUNC INT Info_Mod_Thofeistos_GiveSLDWeapon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_Info()
{
	AI_Output(hero, self, "Info_Mod_Thofeistos_GiveSLDWeapon_15_00"); //Masz dla mnie pistolet?
	AI_Output(self, hero, "Info_Mod_Thofeistos_GiveSLDWeapon_29_01"); //Jako zwykly najemnik, mam dla ciebie miecz najemnika. Wybierz miecz jedno- lub dwureczny.

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);

	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "dwurecznosc", Info_Mod_Thofeistos_GiveSLDWeapon_B);
	Info_AddChoice	(Info_Mod_Thofeistos_GiveSLDWeapon, "jedna osoba", Info_Mod_Thofeistos_GiveSLDWeapon_A);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_B()
{
	B_ShowGivenThings	("Osoby nieprawie dwie rece otrzymuja");

	CreateInvItems	(hero, ItMw_2h_Sld_Sword, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

FUNC VOID Info_Mod_Thofeistos_GiveSLDWeapon_A()
{
	B_ShowGivenThings	("Pozyskiwanie gruboziarnistego krótkiego miecza");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);

	Info_ClearChoices	(Info_Mod_Thofeistos_GiveSLDWeapon);
};

INSTANCE Info_Mod_Thofeistos_Trade (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Trade_Condition;
	information	= Info_Mod_Thofeistos_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= "Czy zajmujecie sie takze kucaniem akcesoriów?";
};

FUNC INT Info_Mod_Thofeistos_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thofeistos_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thofeistos_Trade_Info()
{
	B_GiveTradeInv (self);

	AI_Output(hero, self, "Info_Mod_Thofeistos_Trade_15_00"); //Czy zajmujecie sie takze kucaniem akcesoriów?
};

INSTANCE Info_Mod_Thofeistos_Pickpocket (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_Pickpocket_Condition;
	information	= Info_Mod_Thofeistos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Thofeistos_Pickpocket_Condition()
{
	C_Beklauen	(115, ItMi_Nugget, 6);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_BACK, Info_Mod_Thofeistos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thofeistos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thofeistos_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thofeistos_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thofeistos_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thofeistos_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thofeistos_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thofeistos_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thofeistos_EXIT (C_INFO)
{
	npc		= Mod_7220_SLD_Thofeistos_MT;
	nr		= 1;
	condition	= Info_Mod_Thofeistos_EXIT_Condition;
	information	= Info_Mod_Thofeistos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thofeistos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thofeistos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
