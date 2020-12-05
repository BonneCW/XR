INSTANCE Info_Mod_Orlan_Hi (C_INFO)
{	
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Hi_Condition;
	information	= Info_Mod_Orlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Orlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Orlan_Hi_32_01"); //Witam w mojej tawernie, obcy.
	AI_Output(self, hero, "Info_Mod_Orlan_Hi_32_02"); //Co moge dla Ciebie zrobic? Potrzebujesz napoju? A moze szukasz lózka na noc?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OHNELAGER, "Orlan moze mi sprzedac napój i wynajac mi pokój.");
};

INSTANCE Info_Mod_Orlan_DunklerPilger (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_DunklerPilger_Condition;
	information	= Info_Mod_Orlan_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy ostatnio mialy miejsce jakies dziwne wydarzenia lub objawienia?";
};

FUNC INT Info_Mod_Orlan_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_00"); //Czy ostatnio mialy miejsce jakies dziwne wydarzenia lub objawienia?
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_01"); //Dziwne objawienia? Hmm, prosze pozwolic mi pomyslec. Tak, kilka godzin temu Rukhar widzial tu mroczny pasaz.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_02"); //(smiech) Musialem sie przestraszyc starego pijanego, tak podekscytowanego, jak nam mówil o nim.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_03"); //Ach, a potem - nie jestem do konca pewna - mam równiez wrazenie, ze od kilku godzin przed tawerna zawsze pojawia sie nieszczesliwa jek, który wydostaje sie z jaskini przed grobowcem.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_04"); //To troche przerazajace nawet dla mnie. Calkiem dziwne rzeczy dzialy sie ostatnio.....
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_05"); //Gdzie wyruszyl wedrowiec?
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_06"); //Rukhar powiedzial, ze wyszedl z farmy Akila i poprowadzil swoje kroki dalej w kierunku jeziora.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_07"); //Prawdopodobnie chcialem udac sie do wielkiej farmy lub placu Sekob, a takze do kupca, który mieszka w chacie nad jeziorem.... Wiecej
	AI_Output(hero, self, "Info_Mod_Orlan_DunklerPilger_15_08"); //Dziekujemy za informacje.
	AI_Output(self, hero, "Info_Mod_Orlan_DunklerPilger_32_09"); //Bez problemu. Jesli potrzebujesz dobrego pokoju na nocleg lub jesli czujesz sie jak fajne piwo, wiesz gdzie znalezc wszystko.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Jak dowiedzialem sie od Orlana, ciemna figura szla w kierunku jeziora.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orlan_Untier (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Untier_Condition;
	information	= Info_Mod_Orlan_Untier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Untier_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_00"); //Oh, ten Rukhar, który....
	AI_Output(hero, self, "Info_Mod_Orlan_Untier_15_01"); //Co sie z nim dzieje?
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_02"); //Dopiero wtedy wpada w panike z powodu tego pielgrzyma, który odszedl, twierdzac, ze jest zly w ludzkiej formie...... A teraz chce widziec tu metropolitalna bestie w jaskrawym dniu w kierunku Akila.
	AI_Output(self, hero, "Info_Mod_Orlan_Untier_32_03"); //Cóz, jego umysl zdaje sie schodzic w dól z góry.... Zaczynam sie martwic o niego.

	B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Rukhar widzial bestie biegnaca w kierunku dworu Akila.");
};

INSTANCE Info_Mod_Orlan_Daemonisch (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch_Condition;
	information	= Info_Mod_Orlan_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_00"); //Czy moge Ci cos zaoferowac? Na przyklad w ofercie jest wino klasztorne....
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_01"); //Moze pózniej. Chcielismy dowiedziec sie najpierw, czy ostatnio bylo cos niezwyklego?

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_02"); //Swietnie, teraz nie moge pozbyc sie klasztornego wina.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_03"); //(znowu bohatera) Cóz, niezwykly...... smierc. Rukhar trafil.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_04"); //Co sie stalo?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_05"); //No cóz, on chyba tylko wypil sie na smierc.... przynajmniej z blogoslawienstwem Inno.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_06"); //Co masz na mysli?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_07"); //Cóz, jedna butelka wina po drugiej wypil, w tym wiele klasztornych win.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_08"); //Póznym wieczorem towarzyszyl on ludziom z okolic, którzy chcieli pokazac innym jaskinie lub cos takiego....
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_09"); //Po okolo dziesieciu minutach wbiegl do tawerny i zacial odrobine czarnych cieni i krzyczal.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_10"); //Po krótkim czasie jednak inni wrócili zupelnie bez obrazen.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_11"); //Wyslalem go do snu, a czesc jego towarzyszy opiekowala sie nim.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_12"); //Nastepnego ranka zmarl.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_13"); //Co po prostu umarl?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_14"); //Cóz, nawet z dziwnym pielgrzymem Rukhar juz mial zludzenia leki.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_15"); //Niepostrzezenie poszedl z nim krok po kroku.
	AI_Output(hero, self, "Info_Mod_Orlan_Daemonisch_15_16"); //I jakich towarzyszyli mu ludzie?
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_17"); //Och, rolnicy i mieszkancy miasta, którego nigdy wczesniej nie znalem.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_18"); //Sadze, ze obecnych bylo równiez dwóch nowicjuszy klasztoru.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_19"); //Ostatnio w ciagu kilku dni stal sie dosc duzym ruchem pasazerskim.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_20"); //Ale nikt nie chce juz wiecej wina klasztornego..... po losie Rukhara.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_21"); //No cóz, przynajmniej teraz wielu ludzi jedza jak mlockarnie w moim miejscu, nawet nowicjusze. Tam wraca wiele rzeczy.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch_32_22"); //To niesamowite, dlaczego i tak wszyscy wydaja sie tak wycienczeni....

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Dowiedzialem sie od Orlana, ze Rukhar zmarl. Towarzyszyl on pewnym mieszkancom, chlopom i nowicjuszom, z których wielu niedawno przybylo do tawerny, wieczorem - w jaskini lub w czyms - i wczesniej wypil duzo klasztornego wina. Wrócil krzyczac samotnie i cofnal sie krzyczac i doniósl cos o czarnych cieniach i krzykach, jego towarzysze przyszli pózniej. Nastepnego ranka zmarl. Orlan powiedzial nam równiez, ze prawie nikt nie pije wiecej klasztornego wina, ale zdumiewajaca ilosc jedzenia jest spozywana. Niemniej jednak wielu odwiedzajacych wydaje sie byc bardzo wycienczonych.....");
};

INSTANCE Info_Mod_Orlan_Daemonisch2 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch2_Condition;
	information	= Info_Mod_Orlan_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch))
	&& (Mod_HQ_Daemonisch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch2_32_00"); //Ach, prawdopodobnie juz wkrótce wszyscy goscie wróca.
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch2_32_01"); //Powinienem zaczac powoli isc do beczki po piwo.....

	MOBNAME_XR_BIERFASS_ORLAN = "beczka z piwa";
};

INSTANCE Info_Mod_Orlan_Daemonisch3 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch3_Condition;
	information	= Info_Mod_Orlan_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch3_Condition()
{
	if (Mod_HQ_Daemonisch_Orlan == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch3_32_00"); //A co z Innosem....?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orlan_Daemonisch4 (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Daemonisch4_Condition;
	information	= Info_Mod_Orlan_Daemonisch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Daemonisch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_BauerBeiOrlan_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Daemonisch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Daemonisch4_32_00"); //Wspaniale, to jest to, dokad zmierza, moja klientela.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Tam idziesz, tawerna Orlana.");
};

INSTANCE Info_Mod_Orlan_Unheil (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Unheil_Condition;
	information	= Info_Mod_Orlan_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy zauwazyles cos niezwyklego w ciagu ostatnich kilku godzin?";
};

FUNC INT Info_Mod_Orlan_Unheil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Mod_WM_Boeden == 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Unheil_15_00"); //Czy zauwazyles cos niezwyklego w ciagu ostatnich kilku godzin?
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_01"); //Co? Czy powaznie podchodzisz do tego pytania? Nie sadze, zeby teraz byl dobry czas na zarty.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_02"); //Z ich grobów, tuz za moja tawerna, martwe wznosza sie z grobów, wsród nich straszne stworzenie, duze jak drzewo.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_03"); //Na plaskowyzu pastwiskowym znajduja sie nawet potwory, które potrafia konkurowac z górami, otoczonymi przez wiele strasznych stworzen.
	AI_Output(self, hero, "Info_Mod_Orlan_Unheil_32_04"); //Zapytajcie zapytanie o niepokojone ulaskawienie dworu Bengara - jedynego stamtad, który zdolal uciec przed katastrofa.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Wyjatkowe wymiary na plaskowyzu pastwiskowym. Powinno to zainteresowac Satura.");
	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hordowie nieumarlych wydaja sie byc prowadzeni przez swoich poprzedników.");

	Mod_WM_SawBigOne = TRUE;
	Mod_WM_SawGraveOne = TRUE;
};

INSTANCE Info_Mod_Orlan_Pedro (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Pedro_Condition;
	information	= Info_Mod_Orlan_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy przybyl tu nowicjusz?";
};

FUNC INT Info_Mod_Orlan_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Pedro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Pedro_15_00"); //
	AI_Output(self, hero, "Info_Mod_Orlan_Pedro_32_01"); //
	AI_Output(hero, self, "Info_Mod_Orlan_Pedro_15_02"); //
	AI_Output(self, hero, "Info_Mod_Orlan_Pedro_32_03"); //

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Orlan mówi, ze Pedro nie przyszedl do tawerny. Powazna rozmowa z Dragomirem.");
};

INSTANCE Info_Mod_Orlan_Kobold (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Kobold_Condition;
	information	= Info_Mod_Orlan_Kobold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orlan_Kobold_Condition()
{
	if (Mod_NL_Siegelbuch == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Kobold_Info()
{
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_00"); //Masz szczescie, ze znalezlismy cie przed cala horda demonicznych istot.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_01"); //Jak.....? co sie stalo?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_02"); //Nie wiem dokladnie. Wlasnie zobaczylem, ze lezales martwy na ziemi, bez zycia i troche demona grzebiacego w kieszeniach za zloto. Straszymy go i zabralismy Cie do domu.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_03"); //Wkrótce potem chaos juz szaleje na zewnatrz i musielismy ukryc sie w tawernie.... Wiecej
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_04"); //Co, ile czasu uplynelo od tego czasu?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_05"); //Dobry dzien.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_06"); //Wtedy powinienem zaczac znowu jechac. Czy jestes w tawernie?
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_07"); //Tak, sama w sobie. Niestety, zostawilem okno do magazynu na górze.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_08"); //Caly mój nalewka odeszla! Jeden z tych okaleczonych karlowatych demonów musi sie dostac i ukradl mi go. Brudne zlodzieje!
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_09"); //(ponownie spokój) Oh, oh, oh..... Tymczasem wydaje sie, ze rozproszyli oni w okolicy demony i olbrzymie jaszczurki.
	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_10"); //Zachowaj jednak ostroznosc, gdy wychodzisz na zewnatrz.
	AI_Output(hero, self, "Info_Mod_Orlan_Kobold_15_11"); //Widze. Tutaj masz zlote monety, które dziekuja mi za ocalenie mojego zycia..... Damn, demon naprawde nie zawiódl mnie zbytnio.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, Npc_HasItems(hero, ItMi_Gold));
	};

	Wld_InsertItem	(ItMi_KoboldGold, "FP_ITEM_KOBOLDGOLD");

	AI_Output(self, hero, "Info_Mod_Orlan_Kobold_32_12"); //Dzieki. I dbaj o siebie.

	B_LogEntry	(TOPIC_MOD_NL_DRACHEN, "Potem ten demon byl szybki.... i ukradl równiez moje zloto. Przez caly dzien lezalem nieprzytomny z Orlanem i potwory rozrosly sie na ten obszar. Orlan skarzyl sie na utrate rezerw booze....");

	// Münzenspur

	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_01");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_02");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_03");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_04");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_05");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_06");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_07");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_08");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_09");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_10");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_11");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_12");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_13");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_14");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_15");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_16");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_17");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_18");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_19");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_20");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_21");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_22");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_23");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_24");
	Wld_InsertItem	(ItMi_Gold, "FP_ITEM_GOLD_VON_KOBOLD_25");
};

INSTANCE Info_Mod_Orlan_Gorax (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Gorax_Condition;
	information	= Info_Mod_Orlan_Gorax_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorax wyslal mnie.";
};

FUNC INT Info_Mod_Orlan_Gorax_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Myxir_Wein))
	&& (Npc_HasItems(hero, ItFo_KWine) == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Gorax_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Gorax_15_00"); //Gorax wyslal mnie. Dal mi to wino dla ciebie.

	B_GiveInvItems	(hero, self, ItFo_KWine, 10);

	AI_Output(self, hero, "Info_Mod_Orlan_Gorax_32_01"); //Cudowny. Wino klasztorne jest najlepszym winem, które mozna dostac tutaj w okolicy.
	AI_Output(self, hero, "Info_Mod_Orlan_Gorax_32_02"); //Oto zloto dla Goraxa.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	Npc_RemoveInvItems	(self, ItFo_KWine, 10);

	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_FAILED);
};

INSTANCE Info_Mod_Orlan_Zauberwasser (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Zauberwasser_Condition;
	information	= Info_Mod_Orlan_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dostawe magicznej wody.";
};

FUNC INT Info_Mod_Orlan_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Zauberwasser_15_00"); //Mam dostawe magicznej wody.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Orlan_Zauberwasser_32_01"); //Najwyzszy czas.
};

INSTANCE Info_Mod_Orlan_GnomSchnaps (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_GnomSchnaps_Condition;
	information	= Info_Mod_Orlan_GnomSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ocalilem czesc twojego trunku.";
};

FUNC INT Info_Mod_Orlan_GnomSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gnom_Joints))
	&& (Npc_HasItems(hero, ItMi_OrlansSchnaps) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_GnomSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_GnomSchnaps_15_00"); //Ocalilem czesc twojego trunku.

	B_GiveInvItems	(hero, self, ItMi_OrlansSchnaps, 1);

	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_01"); //Co, co nie jest mozliwe, oszukujesz mnie.... W rzeczywistosci....
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_02"); //Jak udalo Ci sie odepchnac mój dobry likier z tych potworów?
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_03"); //Co zrobiles z winowajcami?
	AI_Output(hero, self, "Info_Mod_Orlan_GnomSchnaps_15_04"); //Ach, zlodziejowi na razie podawano wlasciwie.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_05"); //Musisz byc najwiekszym wojownikiem wszechczasów.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_06"); //To zaszczyt miec Cie tutaj ze mna.
	AI_Output(self, hero, "Info_Mod_Orlan_GnomSchnaps_32_07"); //Z wami na Khorinis, jestem pewien, ze wkrótce bedziemy mistrzami tego problemu.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Orlan_Zimmer (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Zimmer_Condition;
	information	= Info_Mod_Orlan_Zimmer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ile kosztuje pokój?";
};

FUNC INT Info_Mod_Orlan_Zimmer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Zimmer_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_Zimmer_15_00"); //Ile kosztuje pokój?
	AI_Output(self, hero, "Info_Mod_Orlan_Zimmer_32_01"); //100 zlotych monet.
};

INSTANCE Info_Mod_Orlan_ZimmerMieten (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_ZimmerMieten_Condition;
	information	= Info_Mod_Orlan_ZimmerMieten_Info;
	permanent	= 1;
	important	= 0;
	description	= "Daj mi pokój (100 zlota)";
};

FUNC INT Info_Mod_Orlan_ZimmerMieten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Zimmer))
	&& (Npc_HasItems(hero, ITKE_ORLAN_HOTELZIMMER) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_ZimmerMieten_Info()
{
	AI_Output(hero, self, "Info_Mod_Orlan_ZimmerMieten_15_00"); //Daj mi pokój.

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);

		AI_Output(self, hero, "Info_Mod_Orlan_ZimmerMieten_32_01"); //Oto klucz. Mozesz wybrac swój pokój.

		B_GiveInvItems	(self, hero, ItKe_Orlan_Hotelzimmer, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Orlan_ZimmerMieten_32_02"); //Przyjedz z powrotem, gdy masz wystarczajaco duzo zlota.
	};
};

INSTANCE Info_Mod_Orlan_Trade (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Trade_Condition;
	information	= Info_Mod_Orlan_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Orlan_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orlan_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Orlan_Pickpocket (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_Pickpocket_Condition;
	information	= Info_Mod_Orlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Orlan_Pickpocket_Condition()
{
	C_Beklauen	(63, ItFo_Wine, 5);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_BACK, Info_Mod_Orlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Orlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Orlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Orlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Orlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Orlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Orlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Orlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Orlan_EXIT (C_INFO)
{
	npc		= Mod_776_NONE_Orlan_NW;
	nr		= 1;
	condition	= Info_Mod_Orlan_EXIT_Condition;
	information	= Info_Mod_Orlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Orlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orlan_EXIT_Info()
{
	if (Npc_HasItems(hero, ItKe_Orlan_Hotelzimmer) == 1)
	&& (Mod_Orlan_Bett == 0)
	{
		AI_Output(self, hero, "Info_Mod_Orlan_EXIT_32_00"); //Dobra noc.

		Mod_Orlan_Bett = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Orlan_EXIT_32_01"); //Naucz mnie wkrótce ponownie.
	};

	AI_StopProcessInfos	(self);
};
