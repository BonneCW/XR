INSTANCE Info_Mod_Erol_Haendler (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Haendler_Condition;
	information	= Info_Mod_Erol_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "To miejsce jest pelne szalenstwa.";
};

FUNC INT Info_Mod_Erol_Haendler_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Haendler_15_00"); //To miejsce jest pelne szalenstwa.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_01"); //Tak, dzieje sie duzo w ciagu zycia.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_02"); //Kilka prawdziwych antyków.
	AI_Output(self, hero, "Info_Mod_Erol_Haendler_04_03"); //Chcesz to kupic?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OHNELAGER, "Dealer Erol sprzedaje antyki.");
};

INSTANCE Info_Mod_Erol_DunklerPilger (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_DunklerPilger_Condition;
	information	= Info_Mod_Erol_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Widziales ostatnio mrocznego pielgrzyma, przez jakakolwiek szanse?";
};

FUNC INT Info_Mod_Erol_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_DunklerPilger))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_DunklerPilger_15_00"); //Czy ostatnio widziales mrocznego pielgrzyma?
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_01"); //(zdziwiony) Tak, rzeczywiscie. Ze pytasz o to teraz.... dopiero niedawno.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_02"); //Kiedy nagle ciemne wizje, przerazajace obrazy nawiedzaly mój umysl, wyrwalem mnie ze snu, po prostu zasnalem w pólspieniu.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_03"); //Nie moglem dokladnie powiedziec, co to bylo, ale kiedy wyszedlem na zewnatrz, zobaczylem te ciemna figure przechodzaca obok chaty, nagle zmieniajac kierunek i znikajac w las, gdzie znajduje sie stary cmentarz.
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_04"); //Wyjatkowo pelzanie..... nawet na taki stary konik jak ja. Ciagle mnie okruszy, kiedy mysle o tym.....
	AI_Output(self, hero, "Info_Mod_Erol_DunklerPilger_04_05"); //Dlaczego nie wrócisz, gdy znajdziesz faceta? Moze mozecie mi zrobic laske.

	B_GivePlayerXP	(100);

	Mod_Erol_Unterwegs_Day = Wld_GetDay();

	B_StartOtherRoutine	(Mod_7036_NONE_Pilger_NW, "GRAVEYARD");
	AI_Teleport	(Mod_7036_NONE_Pilger_NW, "NW_FARM4_WOOD_MONSTER_MORE_03");

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Mam racje na pietach pielgrzyma. Erol, bardzo zaniepokojony postacia, dopiero niedawno zobaczyla, ze znika w lesie w kierunku cmentarza, zaledwie kilka metrów dalej.");
};

INSTANCE Info_Mod_Erol_Blutkelch (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch_Condition;
	information	= Info_Mod_Erol_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, Ty.";
};

FUNC INT Info_Mod_Erol_Blutkelch_Condition()
{
	if (Mod_ASS_ErolWiederDa == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_00"); //Hej, Ty.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_01"); //Tak, co jest?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_02"); //Jestes moja ostatecznoscia. Pilnie szukam tak zwanego kubka krwi.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_03"); //Mila praca. Bogato zdobiony i przepiekny. Rzadko sie o tym przekonywali.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_04"); //Wtedy masz ten puchar?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_05"); //Mój drogi, mialem.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_06"); //Wtedy sprzedales go? Do kogo?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_07"); //Nie, nie, nie sprzedane. Pewnej nocy zostalem podstepnie przewrócony i okradany.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_08"); //Kiedy sie obudzilem, zdalem sobie sprawe, ze miedzy innymi ten puchar zniknal.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_09"); //Czy wiesz, kim to bylo?
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_10"); //Nie, ale mam przeczucie. Ostatnio w nocy, w nocy, okradaja sie tu zakapturzone figury.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_11"); //Pewnego razu moglem zobaczyc jedna z nich. Nikogo nie rozpoznalem. Ciemne pancerz i szczeliny w kapturach.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_12"); //Hmm.....
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_13"); //Potem zobaczylem zielone swiatlo w jaskini gobblin.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_14"); //Aha!
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_15"); //Nie uwierzysz mi?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_16"); //Tak, tak, tak, tak, tak. Zajme sie nim. Naprawde potrzebny mi ten puchar.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch_04_17"); //I chcialbym przynajmniej zwrócic mój zloty miecz.
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch_15_18"); //Postaram sie robic, co moge. Do zobaczenia pózniej.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Oczywiscie, jeden z moich braci juz troszczyl sie o kielich krwi, ale nie zabil wlasciciela. Hmm..... jest cos zlego? Musze zapytac Azhar.");
};

INSTANCE Info_Mod_Erol_Blutkelch2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Blutkelch2_Condition;
	information	= Info_Mod_Erol_Blutkelch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem cos dla Ciebie.";
};

FUNC INT Info_Mod_Erol_Blutkelch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Blutkelch))
	&& (Npc_HasItems(hero, ItMw_2H_Eminem_Goldschwert_01_Erol) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Blutkelch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_00"); //Dostalem cos dla Ciebie.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_01"); //Mój miecz lub co?
	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_02"); //Tak, tutaj.

	B_GiveInvItems	(hero, self, ItMw_2H_Eminem_Goldschwert_01_Erol, 1);

	AI_EquipBestMeleeWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_03"); //Dziekuje bardzo, nieznajomym. Jest to dla mnie warte tysiaca zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

	AI_Output(hero, self, "Info_Mod_Erol_Blutkelch2_15_04"); //Wtedy obaj jestesmy zadowoleni. Teraz nalezy zachowac ostroznosc.
	AI_Output(self, hero, "Info_Mod_Erol_Blutkelch2_04_05"); //Ty równiez ty.

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Erol_Fahrender (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender_Condition;
	information	= Info_Mod_Erol_Fahrender_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_DunklerPilger))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_00"); //Dobrze jest sie z Toba spotkac.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_01"); //Jesli tak powiesz. Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_02"); //Cóz, postanowilem ponownie podrózowac.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_03"); //Zaopatrzenie gospodarstw rolnych, tawern i rolników, przyjmowanie zamówien itp.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_04"); //Czy jest to warte?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_05"); //Pewne. Zrobilem to juz wczesniej.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_06"); //Ale wtedy wyczynowcy zaatakowali mnie pod mostem i okradzili.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_07"); //I wtedy postanowilem zostac w kabinie.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_08"); //Gdzie nie zaslugujesz na nic....
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_09"); //Dokladnie. I nie mozna zyc na niczym. Malo kto przychodzi do mnie i czegos chce. Znowu sie ruszam.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender_15_10"); //Dobre szczescie: I uwazajcie. Obszar ten nie stal sie bezpieczniejszy od upadku bariery.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender_04_11"); //Zauwazylem to równiez.

	B_StartOtherRoutine	(self, "FAHRENDER");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender2_Condition;
	information	= Info_Mod_Erol_Fahrender2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to sie dzieje?";
};

FUNC INT Info_Mod_Erol_Fahrender2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_00"); //Jak to sie dzieje?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_01"); //Nie moze narzekac. Zloto w torebce i wiekszy porzadek.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_02"); //Tak?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_03"); //Spotkalem jednego z magów ognia w miescie.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_04"); //Ci z ich przywódców sa zainteresowani czescia, która mozna znalezc w Minental.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_05"); //Teraz nic o tym nie wiem.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_06"); //Kiedy dotarlem na wyspe, byla bariera. Moze mozesz mi pomóc?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_07"); //Mysle, ze tak, tak. Na nabrzezu znajduje sie sklep sprzedajacy bilety. Powinien miec cos dla siebie.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender2_04_08"); //Dziekujemy za koncówke. Mysle, ze jestesmy równi.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender2_15_09"); //Tak musi byc. Powodzenia.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender3 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender3_Condition;
	information	= Info_Mod_Erol_Fahrender3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak wygladal Minental?";
};

FUNC INT Info_Mod_Erol_Fahrender3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender2))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender3_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender3_15_00"); //Jak wygladal Minental?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_01"); //Skad powinienem wiedziec?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_02"); //Ten Brahim sprzedal mi bilet, ale wtedy zatrzymuje mnie straznik Paladyn. Nie pozwoliliby mi przepuscic zlota i dobrych slów.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender3_04_03"); //Wiec wrócilem i teraz jestem tutaj.....
};

INSTANCE Info_Mod_Erol_Fahrender4 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender4_Condition;
	information	= Info_Mod_Erol_Fahrender4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przepustka powinna byc ponownie otwarta.";
};

FUNC INT Info_Mod_Erol_Fahrender4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Asylanten2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender4_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_00"); //Przepustka powinna byc ponownie otwarta. Sprawdzilem sytuacje w Minentalu dla Lord Hagen i bylem w stanie go uspokoic.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_01"); //Potem próbowal znów pociagnac straznika. To powinno sie stalo do tej pory. Dlaczego nie spróbujesz tego ponownie?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_02"); //Ale nie potrafie równiez poradzic sobie z ta mapa. Nigdy wczesniej tam nie bylo.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_03"); //Nastepnie zwróc zamówienie.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_04"); //Tak jest. Ale moze jednak Ty nie?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_15_05"); //To wlasnie pomyslalem. Co musze wiedziec?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_04_06"); //Tam ma byc Stary Obóz, a tam jest kaplica Strazaków. Moge sie o tym dowiedziec wiecej. Ty, a nie ja......

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "Nie mam na to czasu. Jestem sam w waznej sprawie.", Info_Mod_Erol_Fahrender4_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender4, "Wszystkie sluszne, wszystkie sluszne. Zobacze. Ale nie robie tego za nic.", Info_Mod_Erol_Fahrender4_A);
};

FUNC VOID Info_Mod_Erol_Fahrender4_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_B_15_00"); //Nie mam na to czasu. Jestem sam w waznej sprawie.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_B_04_01"); //Zbyt zle. Wtedy lepiej bym ja oddala.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);
};

FUNC VOID Info_Mod_Erol_Fahrender4_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender4_A_15_00"); //Wszystkie sluszne, wszystkie sluszne. Zobacze. Ale nie robie tego za nic.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender4_A_04_01"); //To nie bedzie twoje obrazenia. Obiecuje.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender4);

	Mod_Erol_Fahrender = 1;

	Log_CreateTopic	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_FEUERMAGIER, "Dla Erola w Minentalu musze znalezc 'czesc', która zainteresowani sa strazacy. W kaplicy magików strazy pozarnej na Starym Obozie jest wiecej informacji.");
};

INSTANCE Info_Mod_Erol_Fahrender5 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender5_Condition;
	information	= Info_Mod_Erol_Fahrender5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender4))
	&& (Npc_HasItems(hero, ItAr_GewandDerMacht) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender5_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_00"); //Czy znalazles to, co znalazles?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_01"); //Oczywiscie, ale dla mnie tajemnica jest to, jak magicy mogli dac ci te misje.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_02"); //Nigdy by tego nie znalazles, nawet gdybys byl w Minentalu.

	B_GiveInvItems	(hero, self, ItAr_GewandDerMacht, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_03"); //Czy bylo to trudne?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_04"); //Mozna to powiedziec jeszcze raz. I prawie nie placic.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_05"); //W Innosie! Co otrzymasz?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender5_15_06"); //Poczekajmy i zobaczmy, co mówi rada. Nie wolno oddawac mniej niz 2000 zlota.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender5_04_07"); //Wiem o tym. Do zobaczenia pózniej.

	B_SetTopicStatus	(TOPIC_MOD_EROL_FEUERMAGIER, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	CurrentNQ += 1;

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender6 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender6_Condition;
	information	= Info_Mod_Erol_Fahrender6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Spotykamy sie wiec ponownie.";
};

FUNC INT Info_Mod_Erol_Fahrender6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender5))
	&& (Wld_GetDay() > Mod_Erol_Unterwegs_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender6_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_00"); //Spotykamy sie wiec ponownie. Czy magowie byli zadowoleni z szaty?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_01"); //Lepiej w to wierzysz! Chce Cie ostrzec. Ale tez tajemniczo.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_02"); //W kazdym razie obficie mnie nagradzali.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_03"); //Co to znaczy?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender6_04_04"); //2500 zlota dostal Pyrokar. Oto rok 2000. Tam wlasnie wykonales swoja prace.

	B_GiveInvItems	(self, hero, ItMi_Gold, 2000);

	AI_Output(hero, self, "Info_Mod_Erol_Fahrender6_15_05"); //To wystarczy. Do zobaczenia za jakis czas.

	Mod_Erol_Unterwegs_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Erol_Fahrender7 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender7_Condition;
	information	= Info_Mod_Erol_Fahrender7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Erol_Fahrender7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender6))
	&& (Wld_GetDay()-3 > Mod_Erol_Unterwegs_Day)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender7_Info()
{
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_00"); //Maly swiat.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_01"); //Wyspa raz na zawsze. Kazdy ma racje?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_02"); //Nie tak zle....
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_03"); //Gdzie tym razem jest balagan?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_04"); //Czarownik wodny w miescie poprosil mnie, abym wyslal do niego Cavalorn, jednego z ludzi znajdujacych sie w miejscu wykopalisk.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_05"); //I jaki jest problem?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_06"); //Na placu budowy jest facet, który nie wpusci mnie do swiatyni.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_15_07"); //Uzyskaj pozwolenie lub cos od Vatrasa.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_04_08"); //Pomyslalem o tym. Ale nie ma o czym pisac.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "Pójde z toba i porozmawiam z ta lanca.", Info_Mod_Erol_Fahrender7_B);
	Info_AddChoice	(Info_Mod_Erol_Fahrender7, "Nastepnie powiedz mu, ze nie mozesz tego zrobic. Tak wlasnie jest.", Info_Mod_Erol_Fahrender7_A);
};

FUNC VOID Info_Mod_Erol_Fahrender7_B()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_00"); //Pójde z toba i porozmawiam z ta lanca.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_B_04_01"); //Czy móglbys to zrobic?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_B_15_02"); //Jesli tak powiem. Idzmy dalej.

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);

	B_StartOtherRoutine	(self, "FOLLOWTOLANCE");

	Mod_Erol_Fahrender = 8;

	self.aivar[AIV_Partymember] = TRUE;

	Log_CreateTopic	(TOPIC_MOD_EROL_LANCE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_EROL_LANCE, "Jestem gonna zabrac Erola do swiatyni, poniewaz Lance nie wpusci go do swiatyni.");
};

FUNC VOID Info_Mod_Erol_Fahrender7_A()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_00"); //Nastepnie powiedz mu, ze nie mozesz tego zrobic. Tak wlasnie jest.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_01"); //Lub policz, ze nosance' a w twarzy.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender7_A_04_02"); //Nie lubie robic wrogów. To jest szkodliwe dla biznesu?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender7_A_15_03"); //Musisz wiedziec, co robisz....

	Info_ClearChoices	(Info_Mod_Erol_Fahrender7);
};

INSTANCE Info_Mod_Erol_Fahrender8 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender8_Condition;
	information	= Info_Mod_Erol_Fahrender8_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wszystko w porzadku, to wszystko. Wyjezdzam.";
};

FUNC INT Info_Mod_Erol_Fahrender8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lance_Erol))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender8_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender8_15_00"); //Wszystko w porzadku, to wszystko. Wyjezdzam teraz.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender8_04_01"); //Na poczatek dziekuje.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATWMS");

	Mod_Erol_Unterwegs_Day = Wld_GetDay();

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Erol_Fahrender9 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Fahrender9_Condition;
	information	= Info_Mod_Erol_Fahrender9_Info;
	permanent	= 0;
	important	= 0;
	description	= "No cóz, czy to zadzialalo?";
};

FUNC INT Info_Mod_Erol_Fahrender9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Fahrender8))
	&& (Mod_Erol_Fahrender == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Fahrender9_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_00"); //No cóz, czy to zadzialalo?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_01"); //Jo Jo. Ale co to jest z blyszczaca brama, nikt nie chcial mi powiedziec.
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_02"); //Wtedy nic wam nie powiem. A co?
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_03"); //Co i co?
	AI_Output(hero, self, "Info_Mod_Erol_Fahrender9_15_04"); //Jestescie mi to winni.
	AI_Output(self, hero, "Info_Mod_Erol_Fahrender9_04_05"); //Och, widze. Tutaj moge dac ci 300 zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_EROL_LANCE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Erol_Soeldner (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Soeldner_Condition;
	information	= Info_Mod_Erol_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jestes z najemnikami?";
};

FUNC INT Info_Mod_Erol_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Soeldner_15_00"); //Czy jestes z najemnikami?
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_04_01"); //Zapisz Adanos! Nie moglem juz konkurowac z tymi mlodymi chlopakami.
	AI_Output(self, hero, "Info_Mod_Erol_Soeldner_04_02"); //Ale lubie robic z nimi interesy i dlatego maja na mysli moja mala chatke i upewniac sie, ze nic sie nie dzieje.
};

INSTANCE Info_Mod_Erol_Muenzen (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen_Condition;
	information	= Info_Mod_Erol_Muenzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia?";
};

FUNC INT Info_Mod_Erol_Muenzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen_15_00"); //Masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_01"); //Calkiem dosyc. Zawsze interesuja mnie stare monety.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_02"); //Jesli przynosisz mi troche, dam ci troche zlota, z wieloma monetami, jest troche bonusu.
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen_04_03"); //Czyz nie byloby to cos takiego?
};

INSTANCE Info_Mod_Erol_Muenzen2 (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Muenzen2_Condition;
	information	= Info_Mod_Erol_Muenzen2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Dostalem dla Ciebie kilka starych monet.....";
};

FUNC INT Info_Mod_Erol_Muenzen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Muenzen))
	&& (Npc_HasItems(hero, ItMi_OldCoin) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erol_Muenzen2_15_00"); //Dostalem dla Ciebie kilka starych monet.....

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);

	if (Npc_HasItems(hero, ItMi_OldCoin) >= 100)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "sto monet.", Info_Mod_Erol_Muenzen2_C);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 10)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Dajcie dziesiec monet.", Info_Mod_Erol_Muenzen2_B);
	};
	if (Npc_HasItems(hero, ItMi_OldCoin) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Muenzen2, "Podaj monete.", Info_Mod_Erol_Muenzen2_A);
	};
};

FUNC VOID Info_Mod_Erol_Muenzen2_C()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 100);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 100);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_04_00"); //Zrobiles mnie! Gdzie i dokad zmierzam? (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_C_04_01"); //Daj mi ja, zarobiles sobie nagrode.

	B_GiveInvItems	(self, hero, ItMi_Gold, 450);

	B_GivePlayerXP	(750);

	B_RaiseHandelsgeschick (3);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_B()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 10);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 10);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_B_04_00"); //To sluszna kwota. Jest za to wiecej zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 35);

	B_GivePlayerXP	(70);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

FUNC VOID Info_Mod_Erol_Muenzen2_A()
{
	B_GiveInvItems	(hero, self, ItMi_OldCoin, 1);

	Npc_RemoveInvItems	(self, ItMi_OldCoin, 1);

	AI_Output(self, hero, "Info_Mod_Erol_Muenzen2_A_04_00"); //Dzieki. Postaraj sie isc!

	B_GiveInvItems	(self, hero, ItMi_Gold, 3);

	B_GivePlayerXP	(5);

	Info_ClearChoices	(Info_Mod_Erol_Muenzen2);
};

INSTANCE Info_Mod_Erol_Heiltrank (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Heiltrank_Condition;
	information	= Info_Mod_Erol_Heiltrank_Info;
	permanent	= 1;
	important	= 0;
	description	= "(goraczka lecznicza)";
};

FUNC INT Info_Mod_Erol_Heiltrank_Condition()
{
	if (self.aivar[AIV_Partymember] == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	Info_AddChoice	(Info_Mod_Erol_Heiltrank, DIALOG_BACK, Info_Mod_Erol_Heiltrank_BACK);

	if (Npc_HasItems(hero, ItPo_Health_Addon_04) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Istota uzdrawiania", Info_Mod_Erol_Heiltrank_Health_04);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Eliksir uzdrawiania", Info_Mod_Erol_Heiltrank_Health_03);
	};
	if (Npc_HasItems(hero, ItPo_Health_02) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Ekstrakt z ekstraktu leczniczego", Info_Mod_Erol_Heiltrank_Health_02);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Istota uzdrawiania", Info_Mod_Erol_Heiltrank_Health_01);
	};
	if (Npc_HasItems(hero, ItPo_Health_07) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Napój lekkiego leczenia", Info_Mod_Erol_Heiltrank_Health_07);
	};
	if (Npc_HasItems(hero, ItPo_Health_06) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Lekki eliksir leczniczy", Info_Mod_Erol_Heiltrank_Health_06);
	};
	if (Npc_HasItems(hero, ItPo_Health_05) >= 1)
	{
		Info_AddChoice	(Info_Mod_Erol_Heiltrank, "Napoje szybko lecznicze", Info_Mod_Erol_Heiltrank_Health_05);
	};
};

FUNC VOID Info_Mod_Erol_Heiltrank_BACK ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_04 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_03 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_03, 1);

	B_UseItem	(self, ItPo_Health_03);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_02 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);

	B_UseItem	(self, ItPo_Health_02);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_01 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_07 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_07, 1);

	B_UseItem	(self, ItPo_Health_07);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_06 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_06, 1);

	B_UseItem	(self, ItPo_Health_06);
};

FUNC VOID Info_Mod_Erol_Heiltrank_Health_05 ()
{
	Info_ClearChoices	(Info_Mod_Erol_Heiltrank);

	B_GiveInvItems	(hero, self, ItPo_Health_05, 1);

	B_UseItem	(self, ItPo_Health_05);
};

INSTANCE Info_Mod_Erol_Trade (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Trade_Condition;
	information	= Info_Mod_Erol_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erol_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erol_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erol_Pickpocket (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_Pickpocket_Condition;
	information	= Info_Mod_Erol_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Erol_Pickpocket_Condition()
{
	C_Beklauen	(117, ItMi_OldCoin, 18);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_BACK, Info_Mod_Erol_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erol_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erol_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
};

FUNC VOID Info_Mod_Erol_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erol_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erol_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erol_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erol_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erol_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erol_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erol_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erol_EXIT (C_INFO)
{
	npc		= Mod_521_NONE_Erol_NW;
	nr		= 1;
	condition	= Info_Mod_Erol_EXIT_Condition;
	information	= Info_Mod_Erol_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erol_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erol_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
