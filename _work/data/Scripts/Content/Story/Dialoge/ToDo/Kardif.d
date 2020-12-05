INSTANCE Info_Mod_Kardif_Hi (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Hi_Condition;
	information	= Info_Mod_Kardif_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_00"); //Witamy nieznajomego, co moge dla Ciebie zrobic?
	AI_Output(self, hero, "Info_Mod_Kardif_Hi_14_01"); //Jesli szukasz napoju, trafiles we wlasciwe miejsce.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Kardif sprzedaje cos do picia.");
};

INSTANCE Info_Mod_Kardif_Daemonisch (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Daemonisch_Condition;
	information	= Info_Mod_Kardif_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to sie dzieje w twoim pubie?";
};

FUNC INT Info_Mod_Kardif_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_00"); //Jak to sie dzieje w twoim pubie?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_01"); //Och, leniwy. Duza czesc moich klientów wisi tylko w pubie Coragon.
	AI_Output(hero, self, "Info_Mod_Kardif_Daemonisch_15_02"); //Dlaczego tak jest? Czy piwo smakuje lepiej?
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_03"); //Daje wam piwo. Slysze, ze jada tam, zeby sie ubrac z miesem.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_04"); //Moja swill jest tysiac razy lepsza niz ten chwalebny Coragon.
	AI_Output(self, hero, "Info_Mod_Kardif_Daemonisch_14_05"); //Ale nikt juz tego nie docenia.....

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Kardif jest zdenerwowany faktem, ze duza czesc jego klienteli siedzi w pubie Coragon' a i nadziewa sie miesem.");
};

INSTANCE Info_Mod_Kardif_WacholderDieb (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WacholderDieb_Condition;
	information	= Info_Mod_Kardif_WacholderDieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam zlodzieja, który dopuscil sie kradziezy w Coragon.";
};

FUNC INT Info_Mod_Kardif_WacholderDieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Meldor_WacholderDieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WacholderDieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_00"); //Szukam zlodzieja, który dopuscil sie kradziezy w Coragon. Jestes dla niego rywalem. Czy wiesz cos o tym?
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_01"); //Nie! Nienawidze Coragona, ale tego nie robie. Licze na sprawiedliwe srodki, aby zarobic.
	AI_Output(self, hero, "Info_Mod_Kardif_WacholderDieb_14_02"); //Jesli mnie zapytasz, powinienes porozmawiac z karczmarzem stoiska piwnego. Wydaje mi sie on podejrzliwy.
	AI_Output(hero, self, "Info_Mod_Kardif_WacholderDieb_15_03"); //Bede wiec jechal.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif powiedzial, ze moze tylko zarobic w uczciwy sposób. Powinienem udac sie do karczmarza stoiska piwnego.");
};

INSTANCE Info_Mod_Kardif_KnowsRukhar (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_KnowsRukhar_Condition;
	information	= Info_Mod_Kardif_KnowsRukhar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cardif, zdradziles sie!";
};

FUNC INT Info_Mod_Kardif_KnowsRukhar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_WacholderDieb))
	&& (Npc_KnowsInfo(hero, Info_Mod_Rukhar_WacholderDieb))
	&& (Mod_KnowsRukharWacholder == 1)
	&& (Npc_HasItems(hero, ItWr_Rukhar_Wacholder) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_00"); //Cardif, zdradziles sie!
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_01"); //Co?
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_15_02"); //Wysylajac mnie do gospodarza, bylem w stanie sledzic Rukhar i znalazlem notatke mówiaca, ze kazales kradziez.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_14_03"); //Czy nie mozemy o tym ponownie mówic?

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);

	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Z cala prawda, nie powiem o Tobie.", Info_Mod_Kardif_KnowsRukhar_D);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Jesli dasz mi zloto, pozwole ci pójsc.", Info_Mod_Kardif_KnowsRukhar_B);
	Info_AddChoice	(Info_Mod_Kardif_KnowsRukhar, "Zglosie cie do Pana Andre' a.", Info_Mod_Kardif_KnowsRukhar_A);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_D()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_D_15_00"); //Z cala prawda, nie powiem o Tobie.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_D_14_01"); //Dziekuje bardzo. Przyjmijcie to zloto jako podziekowanie za mnie.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_Göttergefallen(1, 1);

	Mod_KnowsRukharWacholder = 2;

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Jezdzilem Cardif. Powinienem teraz udac sie do Coragon i wymówic.");

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_00"); //Jesli dasz mi zloto, pozwole ci pójsc.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_B_14_01"); //Dobrze, daje ci 400 zlotych monet.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_B_15_02"); //Dzieki.

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Kardif zaplacil mi za wypuszczenie go na wolnosc. Teraz powinienem wrócic do Coragon.");

	B_Göttergefallen(3, 1);

	Mod_KnowsRukharWacholder = 4;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

FUNC VOID Info_Mod_Kardif_KnowsRukhar_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_KnowsRukhar_A_15_00"); //Zglosie cie do Pana Andre' a.
	AI_Output(self, hero, "Info_Mod_Kardif_KnowsRukhar_A_14_01"); //(sighs) Jestem zrujnowany.

	B_Göttergefallen(2, 1);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Bede ratowac karte do lorda Andre' a.");

	Mod_KnowsRukharWacholder = 5;

	Info_ClearChoices	(Info_Mod_Kardif_KnowsRukhar);
};

INSTANCE Info_Mod_Kardif_Rum (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Rum_Condition;
	information	= Info_Mod_Kardif_Rum_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem dla Ciebie pakiet rumu.";
};

FUNC INT Info_Mod_Kardif_Rum_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_RumPaket) == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Rum_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Rum_15_00"); //Dostalem dla Ciebie pakiet rumu.
	
	B_GiveInvItems	(hero, self, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_01"); //Wreszcie, moi klienci czekali na rumu przez caly czas.
	AI_Output(self, hero, "Info_Mod_Kardif_Rum_14_02"); //Oto Twoje zloto.

	Npc_RemoveInvItems	(self, Mod_RumPaket, 1);

	CreateInvItems	(self, ItFo_Addon_Rum, 20);

	CreateInvItems	(self, ItMi_Gold, 500);
	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Kardif_Melasse (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Melasse_Condition;
	information	= Info_Mod_Kardif_Melasse_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz melase?";
};

FUNC INT Info_Mod_Kardif_Melasse_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Samuel_HabZeug))
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Melasse_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_00"); //Masz melase?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_01"); //Nie wiecej. Wczoraj wszedl gosc, wszystko kupil.
	AI_Output(hero, self, "Info_Mod_Kardif_Melasse_15_02"); //Kto to byl?
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_03"); //Nazywa sie Alvro. Powrót do lasu poza miastem.
	AI_Output(self, hero, "Info_Mod_Kardif_Melasse_14_04"); //Mówi sie, ze gdzies tam jest w jaskini.

	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "Pewien Alvro kupil od Kardifa kompletna dostawe melasy. Mówi sie, ze znajduje sie w jaskini w lesie przed miastem Khorinis.");
};

INSTANCE Info_Mod_Kardif_Zauberwasser (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Zauberwasser_Condition;
	information	= Info_Mod_Kardif_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dostawe magicznej wody.";
};

FUNC INT Info_Mod_Kardif_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Zauberwasser_15_00"); //Mam dostawe magicznej wody.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Kardif_Zauberwasser_14_01"); //Najwyzszy czas.
};

INSTANCE Info_Mod_Kardif_WoMoe (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_WoMoe_Condition;
	information	= Info_Mod_Kardif_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy wiesz, gdzie jest Moe?";
};

FUNC INT Info_Mod_Kardif_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last == 1)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_00"); //Czy wiesz, gdzie jest Moe?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_01"); //Nie, dzieciak zaginal juz od trzech dni. Jednak ostatnio równiez nie czul sie bardzo dobrze.... byc chory.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_02"); //Nie czul sie dobrze?
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_03"); //Sah bedrückt aus, der Junge. Passte gar nicht zu ihm. Ein Mal hat er "czasteczki" gesagt, völlig zusammenhangslos.
	AI_Output(hero, self, "Info_Mod_Kardif_WoMoe_15_04"); //Wtedy odnajde go.
	AI_Output(self, hero, "Info_Mod_Kardif_WoMoe_14_05"); //Zrób to. Moze mozesz go rozluznic na tyle, aby poczul sie jak powrócic do pracy.
};

INSTANCE Info_Mod_Kardif_MoeTot (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_MoeTot_Condition;
	information	= Info_Mod_Kardif_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mozesz zatrudnic nowego bouncera.";
};

FUNC INT Info_Mod_Kardif_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	&& (Mod_KnowsRukharWacholder != 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_00"); //Mozesz zatrudnic nowego bouncera.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_01"); //Moe jest....?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_02"); //Tak.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_03"); //Oh. Co sie stalo z pieklem?
	AI_Output(hero, self, "Info_Mod_Kardif_MoeTot_15_04"); //Kantar zabil go.
	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_05"); //Trzeba sie z nim zmierzyc. Poczekaj, wez to do reki.

	B_GiveInvItems	(self, hero, ItFo_Addon_Rum, 1);

	AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_06"); //Do Moe, najlepszy bouncer the caly the fucking khorinis kiedykolwiek widzial!

	CreateInvItems	(self, ItFo_Addon_Rum, 2);

	B_UseItem	(self, ItFo_Addon_Rum);
	B_UseItem	(hero, ItFo_Addon_Rum);

	if (!Npc_KnowsInfo(hero, Info_Mod_Canthar_AtLager2))
	{
		AI_Output(self, hero, "Info_Mod_Kardif_MoeTot_14_07"); //Teraz idz dalej i wykonaj prace zloczyncy!
	};
};

INSTANCE Info_Mod_Kardif_Paddel (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Paddel_Condition;
	information	= Info_Mod_Kardif_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy oferujecie pagaje wioslowe?";
};

FUNC INT Info_Mod_Kardif_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_Paddel_15_00"); //Czy oferujecie pagaje wioslowe?
	AI_Output(self, hero, "Info_Mod_Kardif_Paddel_14_01"); //Co sprawia, ze myslisz o tym? Nie zajmuje sie resztkami. Dlaczego nie pytasz rybaka?

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Kardif nie posiada lak. Wspomnial o rybakach.... Na zakonczenie powinienem zatrzymac sie przed Farimem.");
};

INSTANCE Info_Mod_Kardif_NagurFrei (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei_Condition;
	information	= Info_Mod_Kardif_NagurFrei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Kardif_NagurFrei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Nagur_KillAkahasch == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei_Info()
{
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_00"); //Hejdz, odczekaj minute. Mam tu dla Panstwa wiadomosc i klucz do sprawy....

	B_ShowGivenThings	("Odebrany komunikat i klucz od Akahasch");

	CreateInvItems	(hero, ItKe_Akahasch, 1);
	CreateInvItems	(hero, ItWr_Akahasch, 1);

	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei_15_01"); //Z kogo one pochodza?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei_14_02"); //Pewien nowicjusz mi ja dal.

	B_RemoveNpc	(Mod_4016_NOV_Akahasch_NW);
};

INSTANCE Info_Mod_Kardif_NagurFrei2 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei2_Condition;
	information	= Info_Mod_Kardif_NagurFrei2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tak wiec Twoja swinia pomogla mi ustawic pulapke!";
};

FUNC INT Info_Mod_Kardif_NagurFrei2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagur_Rache))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_00"); //Tak wiec Twoja swinia pomogla mi ustawic pulapke!
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_01"); //Hej, nie wiem, co masz na mysli....
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_02"); //List jaki mial mnie wabic do owej jaskini......
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_03"); //Czlowiek - czlowiek Oni po prostu dali mi te rzeczy i kazali ci je wam przekazac.......
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_04"); //Powiedziales, ze nowicjusz dal ci ja....
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_05"); //Tak, to równiez prawda. Tak mroczna nowicjuszka.
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_06"); //Wiedziales, ze to nie jest rusztowanie.... bo on nie zyje.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_07"); //Ale.... ale nie wiedzialem, co sie dzieje. Hej, czlowiek, nie rób nic glupiego, jestem pewien, ze mozemy cos z tym zrobic....
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_15_08"); //Co myslisz?
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_14_09"); //l-- Jako gospodarz dostaje wiele rzeczy. Na przyklad, móglbym powiedziec wam, w których skrzyniach i beczkach w porcie znajdziecie gorace towary......

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "Uzgodnione.", Info_Mod_Kardif_NagurFrei2_B);
	Info_AddChoice	(Info_Mod_Kardif_NagurFrei2, "Idziesz do wiezienia za to.", Info_Mod_Kardif_NagurFrei2_A);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_B()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_B_15_00"); //Uzgodnione.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_B_14_01"); //(uproszczony) Whew.... Wiedzialem, ze mozemy cos zrobic.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 5;

	B_Göttergefallen(3, 1);
};

FUNC VOID Info_Mod_Kardif_NagurFrei2_A()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei2_A_15_00"); //Idziesz do wiezienia za to.
	AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei2_A_14_01"); //Nie.... Nie. to juz koniec.

	Info_ClearChoices	(Info_Mod_Kardif_NagurFrei2);

	Nagur_KillAkahasch = 6;

	B_Göttergefallen(1, 1);
};

var int KardifInfos[14];

FUNC INT B_GetKardifInfoIndex()
{
	var int loop; loop = MEM_StackPos.position;

	var int rnd; rnd = r_max(13);

	if (MEM_ReadStatArr(KardifInfos, rnd) == 1)
	{
		MEM_StackPos.position = loop;
	};

	MEM_WriteStatArr(KardifInfos, rnd, 1);

	return rnd;
};

INSTANCE Info_Mod_Kardif_NagurFrei3 (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_NagurFrei3_Condition;
	information	= Info_Mod_Kardif_NagurFrei3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gdzie moge znalezc gorace produkty?";
};

FUNC INT Info_Mod_Kardif_NagurFrei3_Condition()
{
	if (Nagur_KillAkahasch == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_NagurFrei3_Info()
{
	AI_Output(hero, self, "Info_Mod_Kardif_NagurFrei3_15_00"); //Gdzie moge znalezc gorace produkty?

	if (Mod_Kardif_Info < 2)
	&& (Mod_Kardif_InfoTruhe == 0)
	{
		var int nextIndex; nextIndex = B_GetKardifInfoIndex();

		var int ptr; ptr = MEM_SearchVobByName("KARDIFINFOTRUHE");

		var zCVob vob; vob = MEM_PtrToInst(ptr);

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_01"); //O ile moge powiedziec, powinienes byc w....

		if (nextIndex == 0)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_02"); //... Pudla naprzeciwko Lehmar....

			vob.trafoObjToWorld[3] = mkf(3534);
			vob.trafoObjToWorld[7] = mkf(-154);
			vob.trafoObjToWorld[11] = mkf(-1211);
		}
		else if (nextIndex == 1)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_03"); //... Barylki za tawerna.....

			vob.trafoObjToWorld[3] = mkf(2581);
			vob.trafoObjToWorld[7] = mkf(-187);
			vob.trafoObjToWorld[11] = mkf(-1163);
		}
		else if (nextIndex == 2)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_04"); //... Pudelka przy kartografie....

			vob.trafoObjToWorld[3] = mkf(1193);
			vob.trafoObjToWorld[7] = mkf(-86);
			vob.trafoObjToWorld[11] = mkf(572);
		}
		else if (nextIndex == 3)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_05"); //... Barylki przy stoczni....

			vob.trafoObjToWorld[3] = mkf(777);
			vob.trafoObjToWorld[7] = mkf(-190);
			vob.trafoObjToWorld[11] = mkf(883);
		}
		else if (nextIndex == 4)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_06"); //... Skrzynki w Alrik....

			vob.trafoObjToWorld[3] = mkf(3532);
			vob.trafoObjToWorld[7] = mkf(-188);
			vob.trafoObjToWorld[11] = mkf(3071);
		}
		else if (nextIndex == 5)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_07"); //... Barylki w magazynie.....

			vob.trafoObjToWorld[3] = mkf(2065);
			vob.trafoObjToWorld[7] = mkf(-189);
			vob.trafoObjToWorld[11] = mkf(2579);
		}
		else if (nextIndex == 6)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_08"); //... Skrzynki w magazynie....

			vob.trafoObjToWorld[3] = mkf(2790);
			vob.trafoObjToWorld[7] = mkf(109);
			vob.trafoObjToWorld[11] = mkf(2740);
		}
		else if (nextIndex == 7)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_09"); //... Skrzynie miedzy magazynem a dzwigiem ladunkowym.....

			vob.trafoObjToWorld[3] = mkf(-289);
			vob.trafoObjToWorld[7] = mkf(-181);
			vob.trafoObjToWorld[11] = mkf(3551);
		}
		else if (nextIndex == 8)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_10"); //... Boksy nad drzewem nad magazynem.....

			vob.trafoObjToWorld[3] = mkf(1138);
			vob.trafoObjToWorld[7] = mkf(299);
			vob.trafoObjToWorld[11] = mkf(3476);
		}
		else if (nextIndex == 9)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_11"); //... Barki obok czerwonej latarni nawigacyjnej....

			vob.trafoObjToWorld[3] = mkf(567);
			vob.trafoObjToWorld[7] = mkf(-192);
			vob.trafoObjToWorld[11] = mkf(-2433);
		}
		else if (nextIndex == 10)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_12"); //... Puszki obok czerwonej latarni....

			vob.trafoObjToWorld[3] = mkf(1103);
			vob.trafoObjToWorld[7] = mkf(-194);
			vob.trafoObjToWorld[11] = mkf(-3766);
		}
		else if (nextIndex == 11)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_13"); //... Pudla naprzeciwko stoczniowca....

			vob.trafoObjToWorld[3] = mkf(-142);
			vob.trafoObjToWorld[7] = mkf(-146);
			vob.trafoObjToWorld[11] = mkf(1253);
		}
		else if (nextIndex == 12)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_14"); //... Pudla obok doku dla kuriera....

			vob.trafoObjToWorld[3] = mkf(-1364);
			vob.trafoObjToWorld[7] = mkf(-82);
			vob.trafoObjToWorld[11] = mkf(-1676);
		}
		else if (nextIndex == 13)
		{
			AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_15"); //... Barylki w Diego' s....

			vob.trafoObjToWorld[3] = mkf(-304);
			vob.trafoObjToWorld[7] = mkf(-173);
			vob.trafoObjToWorld[11] = mkf(-1182);
		};

		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_16"); //... znalezc cos milego.

		Mob_CreateItems	("KARDIFINFOTRUHE", ItMi_Joint, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Booze, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Wine, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItFo_Beer, r_max(9));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Tiergift, r_max(3));
		Mob_CreateItems	("KARDIFINFOTRUHE", ItPo_Pflanzengift, r_max(3));

		VobPositionUpdated(ptr);

		Mod_Kardif_InfoTruhe = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Kardif_NagurFrei3_14_17"); //Obecnie nic wiecej nie wiem. Pytaj ponownie za kilka dni......
	};
};

INSTANCE Info_Mod_Kardif_Trade (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Trade_Condition;
	information	= Info_Mod_Kardif_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Kardif_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_Hi))
	&& (Mod_KnowsRukharWacholder < 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Kardif_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Kardif_Pickpocket (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_Pickpocket_Condition;
	information	= Info_Mod_Kardif_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Kardif_Pickpocket_Condition()
{
	C_Beklauen	(65, ItFo_Beer, 4);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_BACK, Info_Mod_Kardif_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Kardif_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Kardif_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Kardif_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Kardif_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Kardif_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Kardif_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Kardif_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Kardif_EXIT (C_INFO)
{
	npc		= Mod_590_NONE_Kardif_NW;
	nr		= 1;
	condition	= Info_Mod_Kardif_EXIT_Condition;
	information	= Info_Mod_Kardif_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Kardif_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Kardif_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
