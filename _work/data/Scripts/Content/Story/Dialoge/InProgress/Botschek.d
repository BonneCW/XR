INSTANCE Info_Mod_Botschek_Hi (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Hi_Condition;
	information	= Info_Mod_Botschek_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Botschek_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_00"); //Ahh, nowe oblicze. Powitania. Inny smialy poszukiwacz przygód w poszukiwaniu slawy i bogactwa.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_01"); //Slawe i bogactwo? Jest w tym miejscu wiecej niz bloto i ruiny?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_02"); //Cóz za pytanie! Nigdzie indziej nie ma wiecej ukrytych skarbów i artefaktów niz tutaj.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_03"); //Und die Kneipe "Zloty gnój plynny" ist das Tor zu diesen.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_04"); //Znajdziesz tu wszystko, co jest potrzebne do odzyskania legendarnych skarbów torfowiska.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_05"); //Legendarny? ....
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_06"); //Oh, ignorant. Wiele wieków temu byla to siedziba tajemniczej wspólnoty.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_07"); //Troszczyla sie o wiele skarbów i boskich artefaktów oraz zbudowala wspaniale budowle, których nie mozna sobie wyobrazic w najsmielszych marzeniach.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_08"); //To byl swiety kawalek ziemi.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_09"); //No cóz, wyglada bardziej jak puszenie sie blota.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_10"); //Cóz, to piekace uderzenia.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_11"); //Bo pewnego dnia wrogowie zaatakowali teren w poszukiwaniu skarbów i boskich darów.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_12"); //Spolecznosc przez dlugi czas ostro sie im przeciwstawiala, ale ostatecznie nie byla w stanie przetrwac przeciwko przytlaczajacej wiekszosci napastników.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_13"); //W nieszczesciu podjeli ekstremalna decyzje, aby uchronic artefakty przed nieprzyjacielem i wyslali straszne przeklenstwo nad okolice.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_14"); //Kazdy, kto znajdowal sie na jej szczycie zostal skazany na wieczna smierc.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_15"); //Jednak skarby tamte czasy ciagle sa tam ukryte.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_16"); //Tak, a wielu rycerzy szczescia juz tutaj przynioslo dobrobyt.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_17"); //Lub gnije bloto.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_18"); //No cóz, ryzyko zawodowe istnieje juz tutaj jako poszukiwacz przygód.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_19"); //Aber um die Gefahren zu mindern, habe ich diese Perle hier eingerichtet, die Schenke "Zloty gnój plynny".
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_20"); //Tak wiec pierwszy pionier od wieków.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_21"); //Nie, to nie jest dokladnie tak.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_22"); //Jeszcze dwadziescia lat temu istniala tu osada chroniona magiczna bariera.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_23"); //Mialo to zapobiec rozprzestrzenianiu sie bagna.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_24"); //Wiec torfowisko rosnie?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_25"); //Tak, tak. Mówi sie, ze kazda dusza, która padla ofiara torfowiska, ciagle zwieksza swoja moc.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_26"); //No cóz, czyz nie byloby wiec madrze unikac wrzosowiska?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_27"); //Uh.... no cóz.....
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_28"); //Wszystko w porzadku, ale co sie stalo z ta ugoda 20 lat temu?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_29"); //Tak, prawda, jej ruiny wciaz stoja na skraju bagna.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_30"); //Pewnego dnia, jak sie mówi, torfowisko przejelo w posiadanie gubernatora osady.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_31"); //Zrabowal magiczne skupienie, które nakarmilo bariere, wbiegl w torfowisko i juz nigdy wiecej nie byl widziany.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_32"); //I od tego czasu nie zrobiono nic, aby zatrzymac torfowisko?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_33"); //No cóz, zadna ludzka dusza z przeszukiwarek, która wkrótce potem zostala wyslana na wrzosowisko, nigdy wiecej nie spotkala sie znowu z ludzka dusza.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_34"); //I inne kamienie ostrosci, których uzywali nie mogly przywrócic bariery.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_35"); //Wyglada na to, ze od tego czasu torfowisko stalo sie jeszcze bardziej potezne i wplywowe.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_36"); //Sposób, w jaki raportujesz, brzmi jak wrzosowisko ma swój wlasny umysl.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_37"); //Tak, prawie tak sie wydaje.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_38"); //Niektórzy twierdza, ze widzieli w torfowisku demoniczne stworzenia, zlowieszcze stworzenia podazajace za wola torfowiska.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_39"); //Wszystko zdaje sie zmieniac, aby przezwyciezyc granice miedzy sferami tego swiata a demonicznymi swiatami.
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_40"); //Nieozywiony budzi swiadomosc i zwyczajowe prawa natury przestaja obowiazywac.
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_41"); //Czy móglbys opowiedziec mi wiecej o torfowisku, jego niebezpieczenstwach i skarbach?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_42"); //Tak, moge to zrobic. Oczywiscie przed obraczka zlota, oczywiscie.....
	AI_Output(hero, self, "Info_Mod_Botschek_Hi_15_43"); //Najpierw wzbudzic ciekawosc, a nastepnie zebrac i zrozumiec. Ile wynosi pytanie?
	AI_Output(self, hero, "Info_Mod_Botschek_Hi_16_44"); //To zalezy od pytania. Dobre informacje na temat monet.

	B_StartOtherRoutine	(Mod_7655_OUT_Abenteurer_REL,	"ABENTEURER");
	B_StartOtherRoutine	(Mod_1623_OUT_Chani_REL,	"ABENTEURER");
};

INSTANCE Info_Mod_Botschek_Gaertner (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Gaertner_Condition;
	information	= Info_Mod_Botschek_Gaertner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem jablka.";
};

FUNC INT Info_Mod_Botschek_Gaertner_Condition()
{
	if (Npc_HasItems(hero, ItFo_Apple) >= 20)
	&& (Mod_Botschek_Gaertner == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Gaertner_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_00"); //Dostalem jablka.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_01"); //Bardzo ladne.
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_02"); //Ale jablonie byly jednak bardzo defensywne.
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_03"); //Przy zbieraniu jablek musialem byc bardziej fizyczny niz zwykle.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_04"); //Co teraz, jabloni?
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_05"); //Nie mozna jednak uprawiac wiecej warzyw i owoców bez uprzedniego lub pózniejszego opadniecia na wszystkich w okolicy.
	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_06"); //W przyszlosci bede musial kupic owoce w miescie. (golen)
	AI_Output(hero, self, "Info_Mod_Botschek_Gaertner_15_07"); //Jablka?

	B_GiveInvItems	(hero, self, ItFo_Apple, 20);

	AI_Output(self, hero, "Info_Mod_Botschek_Gaertner_16_08"); //Oh, tak, dziekuje. Tutaj kilka monet na twój klopot.... i dobry lyk ostatniej butelki cydru. Glowa!

	CreateInvItems	(hero, ItFo_Apfelmost, 1);
	CreateInvItems	(hero, ItMi_Gold, 200);

	B_ShowGivenThings	("200 Zloto i uzyskany cydr");

	B_GivePlayerXP	(300);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Botschek_Wasserleichen (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Wasserleichen_Condition;
	information	= Info_Mod_Botschek_Wasserleichen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Wasserleichen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Gaertner))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Wasserleichen_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_00"); //Powitania. Z jablkami wykonales dobra robote.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_01"); //Moge wiec miec jeszcze jedna rzecz, która móglbys dla mnie zrobic.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_02"); //Przynosilem Ci 300 monet.
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen_15_03"); //Jestem uszy.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_04"); //Teraz, na drugim koncu jeziora, w nocy z metra ponownie wznosily sie trupy.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_05"); //Wysylalem tam kilka miesiecy temu mezczyzn, którzy ich zabijali, ale wkrótce potem z blota wyrosly nowe.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_06"); //Po prostu nie wiem, skad wciaz przychodza, ale nie jest dobrze, jesli zbieraja sie tam zbyt wielu.....
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen_15_07"); //Zanim pewnego dnia wejda do tawerny.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_08"); //Tak. Poza tym juz od jakiegos czasu mam mniej klientów.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_09"); //Nie wiem, czy ma z tym nic wspólnego, ale nadal nie chce znac chodzacych trupów w mojej okolicy.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_10"); //Dwa tygodnie temu wyslalem tam kolejnego poszukiwacza przygód, ale musi miec zimne stopy i po prostu zniknal.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_11"); //Tak wiec, jesli mozna pozbyc sie utoniec, dostaniesz 300 monet zgodnie z ustaleniami.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_12"); //A gdy juz jestes na to, rozejrzyj sie dookola.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen_16_13"); //Jesli znajdziesz jakies slady co do pochodzenia zla, skoczylabym na zloto.

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, "Na brzegu jeziora, naprzeciwko tawerny 'Zur goldenenen Gülle', w nocy z podziemia wychodza ludzie nieumarli. Botschek poprosil mnie o jej przyjecie. Powinien miec z tym cos wspólnego. Poniewaz jednak pochodzenie utopionych trupów lezy w ciemnosci, powinienem miec oczy otwarte. Jesli cos sie dowiedzialem, Botschek obiecal mi premie.");
};

INSTANCE Info_Mod_Botschek_Wasserleichen2 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Wasserleichen2_Condition;
	information	= Info_Mod_Botschek_Wasserleichen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zatopione zbiorniki wodne to historia.";
};

FUNC INT Info_Mod_Botschek_Wasserleichen2_Condition()
{
	if (Mod_Botschek_Wasserleichen >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Wasserleichen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen2_15_00"); //Zatopione zbiorniki wodne to historia.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_01"); //Doskonale, tutaj uzgodniono 300 zlotych monet.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_02"); //Cóz, czy zauwazyles cos niezwyklego? Jakies nowe wskazówki?
	AI_Output(hero, self, "Info_Mod_Botschek_Wasserleichen2_15_03"); //Tak, zabójczy Alkor, który próbowal mnie zabic surowym ostrzem.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_04"); //Co? Ale.... czego chcial? Nie byl pijany, kiedy ostatnio opuscil lokal.
	AI_Output(self, hero, "Info_Mod_Botschek_Wasserleichen2_16_05"); //Czy w koncu stracil w koncu umysl?

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_WASSERLEICHEN, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(350);
};

INSTANCE Info_Mod_Botschek_Ritualdolch (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch_Condition;
	information	= Info_Mod_Botschek_Ritualdolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dla szalenca mial jednak duzo zlota (....). )";
};

FUNC INT Info_Mod_Botschek_Ritualdolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Wasserleichen2))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Frost) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_00"); //Dla szalenca mial przy sobie sporo zlota..... a potem sztylet ten.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_01"); //Co? Pozwole sobie to zobaczyc.

	B_GiveInvItems	(hero, self, ItMw_Ritualdolch_Frost, 1);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_02"); //.... Jest to sztylet poszukiwacza przygód, który wyslalem na ostatnia godzine.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_03"); //Ale.... nigdy nie rozstalby sie z nia dobrowolnie.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_04"); //Wyglada na to, ze znalezlismy wyjasnienie. Musial miec ochlodzic sie bardziej niz tylko nogi....
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_05"); //(uzywany) a takze innych, którzy przeszli przez droge Alkora.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_06"); //Stad jego duzo zlota.... i tym samym wszystkie organy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_07"); //Ten syn suki! Wszystko to z powodu tego mordercy i ghulu.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_08"); //(ja osobiscie nieco cichszy) I wszystkie dochody, których stracilem.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_09"); //(znowu bohaterowi) Mam nadzieje, ze otrzymal on swoja sprawiedliwa kare......
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch_15_10"); //Mozesz postawic na zimne dno rzeki.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_11"); //Dobrze! Niewiarygodne.... taka kanalia!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_12"); //(znów) No cóz, wszelkimi sposobami zrobiles to, co zrobiles lepiej niz dobrze i rzeczywiscie uwolniles mnie od wielkiego zla.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch_16_13"); //Tu wez kolejne 300 monet.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Botschek_Ritualdolch2 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch2_Condition;
	information	= Info_Mod_Botschek_Ritualdolch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "A sztylet?";
};

FUNC INT Info_Mod_Botschek_Ritualdolch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch2_15_00"); //A sztylet?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_01"); //Co? Och, przepraszam, wróciles.

	B_GiveInvItems	(self, hero, ItMw_Ritualdolch_Frost, 1);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_02"); //Tak. Bardzo ciekawy utwór.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_03"); //Uwielbialabym ja kupowac od nieszczesliwego czlowieka, który ja posiadal wczesniej...... Ale on tego nie chcial.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_04"); //A ja móglbym zaprzysiezyc, ze ilustracja na magicznej tablicy przypominala sztylet.....
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch2_15_05"); //Czarna tablica!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_06"); //(znowu bohatera) Co? Ach, tak, to jest deska. Najbardziej niezwykly artefakt, jaki kiedykolwiek udalo sie odzyskac po torfowisku.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_07"); //Pokazuje ona hieroglify, których nikt nie jest w stanie rozszyfrowac.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_08"); //Zdumiewajace jest jednak to, ze wciaz sie zmieniaja, jak równiez obrazy, które czasami mozna na nich zobaczyc, nawet jesli bardzo rzadko.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch2_16_09"); //I raz - wiec moglem przysiegac - obraz tego sztyletu byl widoczny.
};

INSTANCE Info_Mod_Botschek_Ritualdolch3 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch3_Condition;
	information	= Info_Mod_Botschek_Ritualdolch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge spojrzec na tablice?";
};

FUNC INT Info_Mod_Botschek_Ritualdolch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_00"); //Czy moge spojrzec na tablice?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_01"); //Mój unikalny artefakt? Hmm, poniewaz pomógles mi w jakis sposób, chce, zebys sie tym cieszyl.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_02"); //Ale i tak nie rozpoznacie wiele.... zaczekac. Liczy tablice) Tutaj...... ale nie dotykaj jej.

	B_ShowGivenThings	("Tabletka z kamienia przechowywana");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_03"); //Te znaki..... przypomina mi o pismach budowniczych...... tak.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_04"); //Co? Mozna rozszyfrowac hieroglify?
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_05"); //Ja ... einzelne Passagen. Da steht ... "którzy osmielaja sie wskoczyc do serca torfowiska."Ja ... einzelne Passagen. Da steht ... "dem Übermütigen, der es wagt, ins Herz des Moores vorzustoßen.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_06"); //Die Klingen, die das Blut vergossen, um ewige Verdammnis über ..."
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_07"); //Dann kann ich nichts mehr entziffern ... aber doch, hier: "Musi jednak pokonac sluge tortur i smierci."
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_08"); //Amazing. Wszystko to jednak brzmi bardzo tajemniczo i mylaco.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_09"); //Wyglada na to, ze zawiera ona wskazówki dotyczace przeszlych wydarzen.... o artefaktach i miejscu pobytu.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_10"); //Nastepnym razem, gdy pójdziesz na torfowisko, powinienes miec te przejscia w glowie. Moze znajdziesz cos, co do tej pory nie zostalo odkryte.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch3_15_11"); //Od czasu do czasu zdarza sie......

	B_ShowGivenThings	("Tabletka kamienna podana");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch3_16_12"); //Ale pozwól mi wiedziec, czy znajdziesz cos, moze mój kamienny tabletka bedzie mial kilka nowych zagadek do rozwiazania......

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Botschek wierzy, ze rozpoznal sztylet w swojej magicznej tablicy. Jest to napisane czcionka bardzo podobna do czcionki wykonawców. Wyswietlane na niej teksty ciagle sie zmieniaja w magiczny sposób. Udalo mi sie przetlumaczyc czesc obecnego tekstu i umiescic go tutaj. Brzmienie bylo nastepujace:'....'. którzy osmielaja sie wskoczyc do serca torfowiska. Ostrza, które przelaly krew w celu utrwalenia potepienia nad.... Musi jednak pokonac sluge tortur i smierci. Botschek powiedzial, ze moze to zawierac ukryte wskazówki na temat torfowiska. Jesli zrobie tam objazd, powinienem dobrze sie rozejrzec i dac Botschekowi znac, kiedy cos znajde.");

	Wld_InsertNpc	(Mod_7656_OUT_Suchender_REL,	"REL_MOOR_037");
};

INSTANCE Info_Mod_Botschek_Ritualdolch4 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch4_Condition;
	information	= Info_Mod_Botschek_Ritualdolch4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Spotkalem demoniczna postac na bagnie (....). )";
};

FUNC INT Info_Mod_Botschek_Ritualdolch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch3))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Seuche) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch4_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch4_15_00"); //W torfowisku spotkalem postac demoniczna niosaca kolejnego sztylet.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_01"); //Niewiarygodny! Pozwole sobie to zobaczyc.

	B_ShowGivenThings	("Rytualny sztylet slabosci pod warunkiem, ze");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_02"); //Wyglada on bardzo podobnie jak pierwszy. I znalazles go w miejscu, gdzie tablica podawala informacje?

	B_ShowGivenThings	("Sztylet rytualny zachowanego oslabienia");

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch4_15_03"); //Wydaje sie, ze tak wlasnie jest.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_04"); //Fantastyczne! Nastepnie magiczna tabliczka faktycznie odslania wazne wskazówki na temat torfowiska.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_05"); //Nie moge sie doczekac, az zobacze jej przyporzadkowanie do nowej wiedzy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch4_16_06"); //Kiedy nadejdzie odpowiedni moment, poinformuje Cie natychmiast.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Botschek byl obok siebie z entuzjazmem. Obiecal mi, ze jak najszybciej poinformuje mnie, czy rada przedstawi nowe informacje.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Botschek_Ritualdolch5 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch5_Condition;
	information	= Info_Mod_Botschek_Ritualdolch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch4))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_00"); //Ach, swietnie, ze jestes tu wlasnie teraz.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_01"); //Czarodziejska tablica ponownie zmienila ostatnio swoje teksty. Spójrz!

	B_ShowGivenThings	("Tabletka z kamienia przechowywana");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch5_15_02"); //Hmm ... "Ekspert sztuki tajnej przesiaka swoja bronia w trucizne, która otrzymuje z zdradzieckiego bulionu. Wazne jest, aby temu przeciwstawic sie."

	B_ShowGivenThings	("Tabletka kamienna podana");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_03"); //trujacy napar? Jak gdyby wrzosowisko nie bylo wystarczajaco trujace.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch5_16_04"); //No cóz, wiesz na co uwazac. Dbaj o siebie.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... Ekspert sztuki tajnej przesiaka swoja bronia w trucizne, która otrzymuje z zdradzieckiego bulionu. Wazne jest, aby temu przeciwstawic sie. Brzmi jak browarnik o zlym smaku.");

	Wld_InsertNpc	(Mod_7657_OUT_Suchender_REL,	"REL_MOOR_186");
};

INSTANCE Info_Mod_Botschek_Ritualdolch6 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch6_Condition;
	information	= Info_Mod_Botschek_Ritualdolch6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Piwowarmistrz trucizny byl kiedys.";
};

FUNC INT Info_Mod_Botschek_Ritualdolch6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch5))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Gift) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch6_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch6_15_00"); //Piwowarmistrz trucizny byl kiedys.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_01"); //I jak sadze, jestes sztyletem bogatszym? Doskonaly.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_02"); //Wiele z nich nie bedzie juz mozna znalezc.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch6_16_03"); //Mam nadzieje, ze tablica wkrótce odkryje nowe tajemnice.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Teraz nadszedl czas, aby poczekac na nowe objawienie.");

	B_GivePlayerXP	(400);
};

INSTANCE Info_Mod_Botschek_Ritualdolch7 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch7_Condition;
	information	= Info_Mod_Botschek_Ritualdolch7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch6))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch7_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_00"); //Ha, to znów czas. Magiczna tablica zmienila sie po raz kolejny.

	B_ShowGivenThings	("Tabletka z kamienia przechowywana");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch7_15_01"); //Also "... metal, ale to co wyrasta z blota prowadzi do celu. Niech stanie sie ona czescia Ciebie."

	B_ShowGivenThings	("Tabletka kamienna podana");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_02"); //Och, to jest bardzo tajemnicze. Co to ma oznaczac?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_03"); //Cóz, tym razem nie bedziecie mogli uniknac uwaznego sledzenia wszystkich instrukcji dotyczacych srodowiska i myslenia o narozach.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch7_16_04"); //Ciekawe, jak szybko rozwiazujesz te zagadke.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... metal, ale to co wyrasta z blota prowadzi do celu. Pozwólcie, aby to bylo czescia was. Dzwieki bardzo dziwne. Botschek powiedzial, ze powinienem podazac za wszystkimi wskazówkami wyznaczajacymi trendy w regionie i myslec po zakretach. Mysle, ze tym razem nie bedzie tak latwo.");
};

INSTANCE Info_Mod_Botschek_Ritualdolch8 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch8_Condition;
	information	= Info_Mod_Botschek_Ritualdolch8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch7))
	&& (Npc_HasItems(hero, ItMw_Ritualdolch_Versengen) == 1)
	&& (Mod_Botschek_Wasserleichen == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch8_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_00"); //Masz juz ostrze!
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_01"); //Szacunek! Musialo to byc ciezka i trudna praca.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_02"); //No cóz, rzeczywiscie byla to inna liga niz dzikie owoce....
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_03"); //W miedzyczasie, dzieki waszym tlumaczeniom i znalezionym sztyletom, bylem w stanie uzupelnic stare teksty, które teraz maja sens.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_04"); //Oczywiscie bylo piec sztyletów rytualnych, kazdy z inna przemoca.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_05"); //Najwyzsi dostojnicy kultu uzyli go do poswiecenia swojej krwi, aby przyniesc niszczycielski chaos nad ta ziemia.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_06"); //Jak latwo mozna dzis zauwazyc, odniesli oni sukces.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_07"); //Bylo to równiez odczuwalne przez ówczesnych oblakaczy, z których wszyscy stracili zycie nieumarlym.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_08"); //W przypadku chaosu absolutnego autorzy wciaz jednak przyjmuja raczej zaplanowane podejscie.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_09"); //Tak, to prawda. Ich ostatnia wola, by wywolac chaos i zniszczyc kraj wydaje sie byc tym, co pozostalo z ich pierwotnego istnienia.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_10"); //W koncu jednak nie sa juz niewolnikami zakletego bagna.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch8_15_11"); //Przynajmniej byly.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_12"); //Tak, to prawda. Poniewaz do znalezienia pozostal tylko jeden sztylet rytualny, wiele z nich nie zostanie.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_13"); //Co dziwne, torfowisko zdaje sie nie tracic prawie zadnej z jego mocy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_14"); //Musi byc jeszcze cos innego.....
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_15"); //(znów bohaterowi) No cóz, wszelkimi sposobami potrzebujemy tylko tekstu.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch8_16_16"); //Jak tylko jest gotowy.... wiesz, co mam na mysli.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Teraz zostal tylko jeden sztylet. Gdy tylko tablica Botscheka daje nowe wskazówki, nadszedl czas.");

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Botschek_Ritualdolch9 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch9_Condition;
	information	= Info_Mod_Botschek_Ritualdolch9_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch8))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch9_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_00"); //Szczesliwy! Wreszcie!
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_01"); //Ostatni fragment?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_02"); //Miejmy nadzieje. Tutaj spogladaj na nia.

	B_ShowGivenThings	("Tabletka z kamienia przechowywana");

	B_HeroFakeScroll();

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_03"); //Da steht "... sluga broni moczy sie we krwi. Czy przeciwstawisz sie jego stali?".

	B_ShowGivenThings	("Tabletka kamienna podana");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_04"); //Cóz, to jest bardziej oczywiste.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_05"); //Po ostatniej lamiglówce, miejmy nadzieje, ze powinienes miec mniej problemów tutaj...... i wkrótce trzymaj ostatnie ostrza w rekach.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch9_15_06"); //A co wiec?
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_07"); //Wtedy bedziecie mogli dotrzec do tej czesci torfowiska, która dotychczas nie byla dostepna..... moze nawet przeniknac jego serce.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_08"); //W sposób nieprzewidywalny mozna by zmienic losy calego obszaru.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch9_16_09"); //Wystarczy tylko znalezc wejscie. Zycze powodzenia w tym..... i wrócic przy zyciu.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "'... sluga broni moczy sie we krwi. Czy przeciwstawisz sie jego stali? Brzmi jak proste zadanie. Jak tylko i ja bede mial ten sztylet, powinienem miec mozliwosc otwarcia wejscia, które prowadzi mnie do serca torfowiska.");

	Wld_InsertNpc	(Mod_7658_OUT_Suchender_REL,	"REL_MOOR_187");
};

INSTANCE Info_Mod_Botschek_Ritualdolch10 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch10_Condition;
	information	= Info_Mod_Botschek_Ritualdolch10_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Ritualdolch9))
	&& (Npc_HasItems(hero, ItMi_Focus_Moor) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch10_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_00"); //Co sie stalo z Beliarem? Torfowisko wydaje sie szalec.....
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_01"); //Uzyskalem dostep do wczesniej niedostepnej sali na torfowisku.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_02"); //Tam z wielkim trudem odebralem te uwage z tetniacego zyciem podium.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_03"); //Pozwole sobie to zobaczyc.

	B_ShowGivenThings	("Koncentrowany");

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_04"); //(amazowane)..... musi byc miejscem, które niegdys chronilo osade, zasilajac jej magiczna bariere w energie.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_05"); //A ty mówisz, ze moczar uzyl go dla siebie?

	B_ShowGivenThings	("Nadal skupiac sie na");

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_06"); //Wygladalo to tak.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_07"); //Oh, tak, tak.... No cóz, to wytlumaczyloby, dlaczego po upadku osady moczar zdobyl tak duza wladze i dlaczego po smierci swoich slug nie stracil prawie zadnej wladzy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_08"); //Potwór hordes to teraz wysyla do nas jest prawdopodobnie ostatni buntownik po tym, jak zlapal jego najsilniejszy artefakt od niego.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch10_15_09"); //Co powinnismy teraz zrobic? Jesli tak naprawde jest w centrum uwagi osady.....
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_10"); //... w prawo, wtedy bariera ochronna tego czasu moglaby ponownie powstac przez jej wprowadzenie do starej platformy.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_11"); //Nie bedzie trudno znalezc go w ruinach starej osady. Jest to okragly budynek posrodku.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch10_16_12"); //Mam nadzieje, ze cokól nadal dziala. Ale spieszyc sie. Nie mozemy na zawsze trzymac sie na torfowiskach.

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Jesli ustawie ostrosc na cokole w zawalonej osadzie, moze na nowo powstac bariera ochronna.");
};

INSTANCE Info_Mod_Botschek_Ritualdolch11 (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Ritualdolch11_Condition;
	information	= Info_Mod_Botschek_Ritualdolch11_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Botschek_Ritualdolch11_Condition()
{
	if (Mod_Botschek_Wasserleichen == 14)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Ritualdolch11_Info()
{
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_00"); //Unglaublich! Du hast es geschafft. Der Fluch des Moores ist gebrochen, die Schutzbarriere steht, die Umgebung nun fast ohne Gefahren.
	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch11_15_01"); //Ja, ein Besuch des Moores wird zwar sicher immer noch kein Spaziergang sein, aber zumindest hinter der Barriere kann man nun dem Gras beim Wachsen zusehen.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_02"); //Das wird gewiss mehr Menschen herlocken ... vielleicht wird irgendwann die Siedlung wieder errichtet.
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_03"); //Auf jeden Fall bedeutet es mehr Kundschaft. Hier, nimm also dieses Gold zum Dank.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_04"); //Und die magische Tafel hat für mich auch keinen Nutzen mehr. Vielleicht kannst du noch etwas mit ihr anfangen.

	B_GiveInvItems	(self, hero, ItWr_BotschekTafel, 1);

	AI_Output(hero, self, "Info_Mod_Botschek_Ritualdolch11_15_05"); //Mal schauen, danke. 
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_06"); //Du bist auf jeden Fall jederzeit willkommen in der Schenke "Zloty gnój plynny".
	AI_Output(self, hero, "Info_Mod_Botschek_Ritualdolch11_16_07"); //Bestimmt sehen wir uns mal wieder. Und bis dahin ... pass auf dich auf.

	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	CurrentNQ += 1;

	B_StartOtherRoutine	(Mod_504_PAL_Parcival_REL,	"VORKNEIPE");
};

INSTANCE Info_Mod_Botschek_Kneipe (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Kneipe_Condition;
	information	= Info_Mod_Botschek_Kneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Twój bar jest dziwnym miejscem....";
};

FUNC INT Info_Mod_Botschek_Kneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Kneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Kneipe_15_00"); //Twój bar jest dziwnym miejscem.... oddzielne pokoje na pietrze, to znaczy.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_01"); //Och, to ma sens.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_02"); //Najpózniej wtedy, gdy wiatr wieje zle, a trujace chmury dymu z bagna pokrywaja wszystko pod torfowiskiem, ciesza sie Panstwo z tego.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_03"); //Istnieje równiez stól alchemiczny..... gdzie Viran moze spróbowac swoich eliksirów i produkowac ziola dla chlopców w tawernie.
	AI_Output(self, hero, "Info_Mod_Botschek_Kneipe_16_04"); //Oh tak, i oczywiscie poszukiwacze przygód moga cieszyc sie swoja przyjaciólka Chani.
};

INSTANCE Info_Mod_Botschek_Informationen (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Informationen_Condition;
	information	= Info_Mod_Botschek_Informationen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Potrzebuje troche informacji.";
};

FUNC INT Info_Mod_Botschek_Informationen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_Infos()
{
	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, DIALOG_BACK, Info_Mod_Botschek_Informationen_BACK);

	if (Mod_Botschek_Info_F == FALSE)
	&& (Mod_Botschek_Info_E == TRUE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Gdzie przebywal ostatni?", Info_Mod_Botschek_Informationen_F);
	};
	if (Mod_Botschek_Info_E == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sancho_Dam2))
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Czy slowo 'zapora' oznacza cos dla Ciebie?", Info_Mod_Botschek_Informationen_E);
	};
	if (Mod_Botschek_Info_D == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Cokolwiek zrobic?", Info_Mod_Botschek_Informationen_D);
	};
	if (Mod_Botschek_Info_C == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Co mozesz mi powiedziec o ludziach tutaj?", Info_Mod_Botschek_Informationen_C);
	};
	if (Mod_Botschek_Info_B == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Gdzie moge go dostac?", Info_Mod_Botschek_Informationen_B);
	};
	if (Mod_Botschek_Info_A == FALSE)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Na jakie niebezpieczenstwa musze zwracac uwage w torfowisku?", Info_Mod_Botschek_Informationen_A);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_Info()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_15_00"); //Potrzebuje troche informacji.

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_2()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_2_15_00"); //Innym razem.
};

FUNC VOID Info_Mod_Botschek_Informationen_1()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_1_15_00"); //Tutaj.
};

FUNC VOID Info_Mod_Botschek_Informationen_BACK()
{
	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_F()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_F_15_00"); //Gdzie przebywal ostatni?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_F_16_01"); //Wydaje sie pan bardzo zainteresowany.... Wykonuje 60 monet.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Innym razem.", Info_Mod_Botschek_Informationen_F_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 60)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Tutaj", Info_Mod_Botschek_Informationen_F_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_F_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_F_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 60);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_F_1_16_00"); //Zniknal w kierunku ruin wsi. To wszystko, co wiem.

	Mod_Botschek_Info_F = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_E()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_E_15_00"); //Czy slowo "zapora" oznacza cos dla Ciebie? Moze w zwiazku z amuletem?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_16_01"); //Dam i amulet? Hmm, ktos tam byl.... kosztuje 40 monet.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Innym razem.", Info_Mod_Botschek_Informationen_E_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 40)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Tutaj", Info_Mod_Botschek_Informationen_E_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_E_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_E_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 40);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_00"); //Kiedys byl tam lowca skarbów..... jak powiedziano mi pózniej.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_01"); //Na poczatku nie przyciagal uwagi, poszukiwal artefaktów i skarbów, pijal sie jak wiekszosc ludzi.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_E_1_16_02"); //Wtedy jednak stal sie coraz bardziej wyjatkowy, rozmawial z soba, wycofywal sie z innych, a takze pogarszal sie fizycznie i widocznie? dopóki nie wrócil po ostatniej podrózy kilka miesiecy temu.

	Mod_Botschek_Info_E = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_D()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_00"); //Cokolwiek zrobic?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_01"); //Tak, naprawde mam cos, co trzeba zrobic. Oczywiscie te informacje nie kosztuja nic....
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_02"); //Przede wszystkim byc moze zniwa i pielenie....
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_03"); //Co? Chcesz odebrac rzepe juz teraz!
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_04"); //Bez rzepy, jablek. Potrzebuje troche cydru.
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_05"); //I chwasty!
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_06"); //Cóz, chwasty staly sie dosc natarczywe..... i nie sa calkowicie nieszkodliwe.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_07"); //Powód, dla którego mamy nowego kucharza. Stary czlowiek nie wrócil z gromadzenia skladników.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_08"); //A poniewaz nienawidzilabym do stracenia Balama, wolalabym wyslac kogos, kto poradzi sobie z bronia, a nie tylko nozem kuchennym.
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_D_15_09"); //(pólbrzacy) grac w ogrodnika.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_D_16_10"); //Potrzebuje okolo 20 jablek. Ogród jest tuz nad jeziorem. Powodzenia.

	Log_CreateTopic	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOTSCHEK_GAERTNER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOTSCHEK_GAERTNER, "Botschek chce, abym poszla do malego ogrodu nad jezioro, usunela agresywne chwasty i zebrala 20 jablek.");

	Mod_Botschek_Info_D = TRUE;

	Wld_InsertNpc	(Alraune_Botschek_03,	"FP_ROAM_MOOR_BOTSCHEK_ALRAUNE_03");
	Wld_InsertNpc	(Apfelbaum_Botschek_03,	"FP_ROAM_MOOR_BOTSCHEK_APFELBAUM_03");

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_C()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_C_15_00"); //Co mozesz mi powiedziec o ludziach tutaj?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_16_01"); //Kilka ciekawych i przydatnych informacji. Dla Ciebie tylko 30 sztuk zlota.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Innym razem.", Info_Mod_Botschek_Informationen_C_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 30)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Tutaj", Info_Mod_Botschek_Informationen_C_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_C_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_C_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 30);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_00"); //Wiele osób w moim pubie to dawni wiezniowie kolonii, którzy próbuja tu szczescia, gdzie w przeciwnym razie usiadzie tylko kilka osób.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_01"); //Na przyklad mój nowy szef kuchni, na przyklad Balam, gotowal na barony rudy, czy mozna sobie to wyobrazic? (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_02"); //Tak, a Chani niegdys zachowal guru szczesliwego w bagnie, a teraz przezywajacy przygody tutaj.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_03"); //Ona moze prowadzic tutaj swoja dzialalnosc bez zaklócen i dostaje moja czesc......
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_04"); //Viran i Harlok równiez pochodza z obozu bagiennego.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_05"); //Chca zalozyc wlasna dzialalnosc gospodarcza poprzez kultywowanie tu bagnistej ziemi.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_06"); //Co jakis czas Viran próbuje wypróbowywac nowe pomysly na bagniste ziola na stole alchemicznym na górze.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_07"); //Co jakis czas z tego wychodzi cos dobrego....
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_08"); //Werz pochodzi z Nowego Obozu Kolonii i postrzegal siebie jako bandyta na sztukach kradziezowych.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_09"); //To wlasnie uczynilo go najinteligentniejszym poszukiwaczem skarbów.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_10"); //Nikt nie rozumie, jak postepowac z taka finezja i nie pozostaje nieodkryty.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_11"); //Z kolei awanturnik Alkor jest jednym z najtrudniejszych.... i czasami sie szorstki, kiedy ma zbyt wiele do picia.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_12"); //Cóz, jestem zdecydowanie zdziwiony, ze gorzki nos nie wszedl do wiecznych lowieckich terenów wrzosowisk.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_13"); //Ze wszystkimi cennymi rzeczami, które przywiózl, musial juz wczesniej odbyc jedna lub dwie niebezpieczne wyprawy w bagnie.... Wiecej
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_14"); //Tak, prawie zapomnialem o naszych gosciach honorowych...... w sluzbie Króla. (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_15"); //Zazwyczaj stoja na zewnatrz przed tawerna w malym obozie.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_16"); //Wiele osób tak bardzo sobie tego zyczylo, ze moga sledzic te sytuacje.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_C_1_16_17"); //Ale oni nie sa z tego zadowoleni, nie mysle, huh?

	Mod_Botschek_Info_C = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_B()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_B_15_00"); //Gdzie moge go dostac?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_16_01"); //Masz na mysli lsniace zloto.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_16_02"); //Informacja ta kosztuje tylko 50 monet.... do tego, co mozna znalezc.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Innym razem.", Info_Mod_Botschek_Informationen_B_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Tutaj", Info_Mod_Botschek_Informationen_B_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_B_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_B_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_00"); //Cóz, wiekszosc tego, co lezalo wokól otwartych dróg w przedniej czesci torfowiska zostala juz ocalona przez odwaznych ludzi...... ale nie wszyscy to zrobili.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_01"); //Bagno w rozszczepie poszukiwacza przygód zwykle obiecuje równiez wymowne monety.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_02"); //W przeciwnym razie trzeba bedzie spojrzec poza glówne drogi, w bloto, ukryte skrzynie lub gnijace budynki.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_03"); //Oczywiscie mozna równiez glebiej zaglebic sie w torfowisko, niz wiekszosc ludzi zrobila do tej pory....
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_04"); //Co jakis czas, gdy spotykasz stare groby, pomocny moze byc piknik.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_05"); //Ach, po prawej stronie wrzosowiska znajduje sie duza hala. Niestety, wejscie jest zablokowane.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_B_1_16_06"); //Ci, którym udaje sie zdobyc dostep, z pewnoscia oczekuja wielkiego bogactwa?

	Mod_Botschek_Info_B = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

FUNC VOID Info_Mod_Botschek_Informationen_A()
{
	AI_Output(hero, self, "Info_Mod_Botschek_Informationen_A_15_00"); //Na jakie niebezpieczenstwa musze zwracac uwage w torfowisku?
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_16_01"); //Dla niektórych. Na 70 zlotych monetach dowiesz sie, co czeka Cie tam.

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_AddChoice	(Info_Mod_Botschek_Informationen, "Innym razem.", Info_Mod_Botschek_Informationen_A_2);

	if (Npc_HasItems(hero, ItMi_Gold) >= 70)
	{
		Info_AddChoice	(Info_Mod_Botschek_Informationen, "Tutaj", Info_Mod_Botschek_Informationen_A_1);
	};
};

FUNC VOID Info_Mod_Botschek_Informationen_A_2()
{
	Info_Mod_Botschek_Informationen_2();

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);
};

FUNC VOID Info_Mod_Botschek_Informationen_A_1()
{
	Info_Mod_Botschek_Informationen_1();

	B_GiveInvItems	(hero, self, ItMi_Gold, 70);

	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_00"); //Dobre. Zacznijmy od bezzycia.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_01"); //Istnieja trujace chmury dymu, które pokrywaja wiekszosc wrzosowisk.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_02"); //Wychodza one z kraterów, które mozna znalezc na torfowisku.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_03"); //Jesli nie jestes twardym facetem, bez antidotum nie zajdziesz daleko.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_04"); //Jesli znów zauwazysz, ze cos migocze w moczarze, lepiej bedzie pochylic sie nad nim.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_05"); //W przeciwnym razie ognista eksplozja moze szybko przetransportowac Cie do imperium Beliara.... Wiecej
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_06"); //Stamtad z pozoru przychodza wszyscy nieumarli, którzy zamieszkuja torfowisko.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_07"); //Uwazaj, gdzie sie schodzisz, bo bagna beda wznosily sie od blotnistej ziemi.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_08"); //Nie sa one jednak najszybsze.... przynajmniej w porównaniu z duchami wojowników, którzy czynia moczar niebezpiecznym.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_09"); //Zaatakuja oni wszystko, co idzie i stoi.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_10"); //Rosliny rosnace na torfowisku nie sa o wiele bardziej przyjazne.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_11"); //Niektóre sa mocno zakorzenione w ziemi, inne na podeszwach szybkich.... z prostym nozem kuchennym.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_12"); //Wreszcie, niektórzy poszukiwacze przygód donosili, ze widzieli maskowane figury na bagnie.... Wiecej
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_13"); //Jest to jednak najmniej znane.
	AI_Output(self, hero, "Info_Mod_Botschek_Informationen_A_1_16_14"); //Tylko one sa jedynymi stworzeniami torfowiska, które zdaja sie miec na mysli wiecej niz niszczenie najezdzców.....

	Mod_Botschek_Info_A = TRUE;

	Info_ClearChoices	(Info_Mod_Botschek_Informationen);

	Info_Mod_Botschek_Informationen_Infos();
};

INSTANCE Info_Mod_Botschek_Trade (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Trade_Condition;
	information	= Info_Mod_Botschek_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Botschek_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Botschek_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Botschek_Pickpocket (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_Pickpocket_Condition;
	information	= Info_Mod_Botschek_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Botschek_Pickpocket_Condition()
{
	C_Beklauen	(133, ItMi_Gold, 63);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

	Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_BACK, Info_Mod_Botschek_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Botschek_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Botschek_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Botschek_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Botschek_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Botschek_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Botschek_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Botschek_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Botschek_EXIT (C_INFO)
{
	npc		= Mod_7650_OUT_Botschek_REL;
	nr		= 1;
	condition	= Info_Mod_Botschek_EXIT_Condition;
	information	= Info_Mod_Botschek_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Botschek_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Botschek_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
