INSTANCE Info_Mod_Parlan_Hi (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Hi_Condition;
	information	= Info_Mod_Parlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Parlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Parlan_Hi_05_01"); //Pozdrowienia, obcy. Co sprowadzi Cie do naszego klasztoru?
};

INSTANCE Info_Mod_Parlan_Aufgabe (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jest cos, co moge dla Ciebie zrobic?";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_00"); //Czy jest cos, co moge dla Ciebie zrobic?
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_01"); //Nie potrzebuje teraz zadnej pomocy.
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_02"); //Chce zostac nowicjuszem i musze pomagac kazdemu magowi ognia.

	Log_CreateTopic	(TOPIC_MOD_PARLAN_MANA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_RUNNING);
	
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_03"); //Tak wlasnie jest. Wystarczy dla mnie, jesli zwiekszysz swoja magiczna moc o 30.

	B_LogEntry	(TOPIC_MOD_PARLAN_MANA, "Dla Parlana mam zwiekszyc moja mane o 30.");
};

INSTANCE Info_Mod_Parlan_Aufgabe_Fertig (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Fertig_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wychowalem MANA.";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Aufgabe))
	&& (Mod_RealMana >= 40) // 30 learned mana + 10 base mana
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_Fertig_15_00"); //Wychowalem MANA.
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_Fertig_05_01"); //Cóz, to jest dla mnie wystarczajaco dobre.

	B_GivePlayerXP	(100);

	B_LogEntry_More	(TOPIC_MOD_FEUERMAGIER, TOPIC_MOD_PARLAN_MANA, "Przekonalem sie, ze parlamentarzysta.", "Parlaman jest z mnie zadowolony. Zrobilem dla niego wystarczajaco duzo.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Lehrer (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lehrer_Condition;
	information	= Info_Mod_Parlan_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kto moze mnie nauczyc jak zwiekszyc swoja magiczna moc?";
};

FUNC INT Info_Mod_Parlan_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lehrer_15_00"); //Kto moze mnie nauczyc jak zwiekszyc swoja magiczna moc?
	AI_Output(self, hero, "Info_Mod_Parlan_Lehrer_05_01"); //Moge cie nauczyc, jak zwiekszyc swoja magiczna moc.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KLOSTER, "W parlamencie moge nauczyc mnie, jak podnosic moja MANA.");
};

INSTANCE Info_Mod_Parlan_Ring (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Condition;
	information	= Info_Mod_Parlan_Ring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlan_Ring_Condition()
{
	if (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_VLK)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_00"); //Musicie mi pomóc.
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_15_01"); //Co sie stalo z pieklem?
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_02"); //Nowicjusz Pedro ukradl mi pierscien ognia i uciekl z klasztoru.
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_03"); //Naprawde potrzebuje pana, aby przywrócic pierscien. Lepiej zapytac niektórych ludzi, czy go widzieli.

	Wld_InsertNpc	(Mod_7037_NOV_Pedro_NW, "NW_FARM4_WOOD_RANGERBANDITS_03");

	Log_CreateTopic	(TOPIC_MOD_PARLAN_FEUERRING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Nowicjusz Pedro wykradl pierscien ognia z magicznego parlamentu i mam go odzyskac. Chce zapytac ludzi, gdzie on uciekl.");
};

INSTANCE Info_Mod_Parlan_Ring_Zurueck (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Zurueck_Condition;
	information	= Info_Mod_Parlan_Ring_Zurueck_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zdjalem pierscionek.";
};

FUNC INT Info_Mod_Parlan_Ring_Zurueck_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pedro_Niederlage))
	&& (Npc_HasItems(hero, ItRi_Feuerring_Parlan) == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Zurueck_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_Zurueck_15_00"); //Zdjalem pierscionek.

	B_GiveInvItems	(hero, self, ItRi_Feuerring_Parlan, 1);

	AI_Output(self, hero, "Info_Mod_Parlan_Ring_Zurueck_05_01"); //Dziekuje bardzo. Oto Twoja nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Dalem mu pierscionek.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Patherion (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Patherion_Condition;
	information	= Info_Mod_Parlan_Patherion_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pyrokar powiedzial mi, zebym skontaktowal sie z Toba na kolejna misje.";
};

FUNC INT Info_Mod_Parlan_Patherion_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Befoerderung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Patherion_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_00"); //Pyrokar powiedzial mi, zebym skontaktowal sie z Toba na kolejna misje.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_01"); //Wspomnial cos o miejscu swietym....
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_02"); //Tak, bracie. Teraz, gdy jestes jednym z nas, nadszedl czas, aby opowiedziec Ci stara historie.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_03"); //Jestem uszy.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_04"); //Znasz legende o lzach Inno?
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_05"); //Lzy Innos? Nie, posluchajmy.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_06"); //Zaczelo sie, gdy Innos stanal przed dwoma bracmi i zdal sobie sprawe, ze musi walczyc z Beliarem. Kiedy Innos uswiadomil sobie to, jego serce wypelnilo sie smutkiem i zaczal plakac.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_07"); //Przez 13 lat plakal i jego lzy padly na swiat. Mimo tego dlugiego czasu Innos rzucil tylko 6 lez.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_08"); //A co sie z nimi stalo?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_09"); //Cóz, mezczyzna, którego imie brzmialo Ragon, znalazl jedna z lez. Spróbowal jej, a on byl przepelniony nadprzyrodzona moca i madroscia.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_10"); //Rozpoznal madrosc stworzenia Inno. Zaczal wiec sluzyc Innosowi. Jako pokuta za dotychczasowe zycie, postanowil pójsc droga pokuty.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_11"); //Jechal prosto, ani jeziora, ani góry nie mogly go powstrzymac. W pewnym momencie w srodku gór znalazl doline. Prawie niedostepne. Tam zaczal budowac swiatynie.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_12"); //Po zakonczeniu budowy modlil sie do Innosa przez 13 dni. Nie przestal sie modlic, dopóki cztery glosy go nie przerwaly.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_13"); //Bylo czterech mezczyzn. Pochodzili z wszystkich czesci ziemi, napedzani poszukiwaniem przebaczenia swoich grzechów i czuli sie wezwani do miejsca, gdzie tak wyraznie odczuwana byla moc Inno.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_14"); //Pieciu mezczyzn mówilo innym jezykiem, a mimo to bez trudu rozumieli sie nawzajem. Zdecydowali sie na wspólna budowe wielkiego klasztoru. Zbudowali sie dlugo, ale czas stracil dla nich znaczenie, z powodu lez Inno juz nie starzeja sie.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_15"); //Wtedy lzy sa czyms w rodzaju eliksiru?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_16"); //W pewnym sensie tylko o wiele mocniejsze!
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_17"); //A co sie stalo po zbudowaniu klasztoru?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_18"); //No cóz, poszli glosic oredzie Innos i szukali nowicjuszy dla swojego klasztoru. Przynajmniej wiekszosc z nich. Jeden jednak czul sie powolany do drugiego. To byl Ragon.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_19"); //Wiedzial, a raczej czul, ze jeszcze jest lza Inno. Chcial je odnalezc i przywiezc do klasztoru.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_20"); //I czy ja znalazl?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_21"); //Nikt nie wie. Cztery pozostale cztery osoby spotkaly sie ponownie w klasztorze, gdzie do dzis tworza glowe Innoskirche, ale nigdy wiecej nie slyszano o Ragonie.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_22"); //A dlaczego opowiadasz mi te historie?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_23"); //Tylko po to, aby podac niezbedne informacje ogólne potrzebne do wykonywania nastepnej pracy.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_24"); //Moje nastepne zlecenie?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_25"); //Tak. Patherion byl jakis czas temu oblegany przez czarnych magów i czarnych wojowników. Poczatkowo nie rozumielismy ich dzialan, oblezenie bylo praktycznie bezcelowe, bo mozemy teleportowac jak chcemy, ale lekcewazymy czarne magów. Wykradli ostrosc i zbudowali bariere.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_26"); //Co? Masz na mysli, jak w kolonii górniczej?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_27"); //Tak i nie. Zbudowali podobna bariere, ale mozna wejsc lub wyjsc.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_28"); //Jaki jest problem?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_29"); //Tja, man kann eben nur rein "isc". Die Barriere verhindert, dass wir uns dorthin teleportieren können! Die Nahrungs- und Trankvorräte von Patherion gehen zur Neige, deshalb sollst du ihnen dieses Paket voller Tränke und dieses Paket voll Nahrung bringen.

	CreateInvItems	(hero, ItMi_Pat_Nahrung, 1);
	CreateInvItems	(hero, ItMi_Pat_Trank, 1);

	AI_PrintScreen	("2 Otrzymane paczki", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_30"); //Co? Nie sadze, zebys mógl tam teleportowac i jak sam powiedziales, jest to prawie nieosiagalne.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_31"); //To nie do konca prawda, po prostu nie mozna teleportowac do klasztoru. Pamietasz kaplice, która zbudowal sobie Ragon? Ona lezy poza bariera i mozna latwo podrózowac do niej magia.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_32"); //Stamtad jednak trzeba bedzie znalezc wlasna droge przez szeregi czarnych magów.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_33"); //Dzwieki niebezpieczne!
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_34"); //To równiez jest. Z tego powodu jest ona równiez dana wam, a nie zadnemu z nowicjuszy.
	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_35"); //Dobrze, bede na dobrej drodze.
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_36"); //Wez te rune. Wraz z nia przyjdziesz do kaplicy Patheriona.

	B_GiveInvItems	(self, hero, ItRu_Teleport_Pat, 1);

	AI_Output(hero, self, "Info_Mod_Parlan_Patherion_15_37"); //A jak powrócic?
	AI_Output(self, hero, "Info_Mod_Parlan_Patherion_05_38"); //Z ta runa. Mozna go jednak uzywac tylko w kaplicy.

	B_GiveInvItems	(self, hero, ItRu_TeleportPatBack, 1);

	B_LogEntry	(TOPIC_MOD_PATHERION, "Parlamentarz opowiedzial mi o Patherionie, wspanialej swiatyni magów ognia. Ten ostatni jest obecnie oblegany przez czarnych magów i wojowników i dlatego potrzebuje jedzenia i wody. Mam je teraz zabrac do swiatyni.");
};

INSTANCE Info_Mod_Parlan_Lernen (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lernen_Condition;
	information	= Info_Mod_Parlan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie czegos.";
};

FUNC INT Info_Mod_Parlan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Lehrer))
	&& (Mod_RealMana < 100)
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lernen_15_00"); //Naucz mnie czegos.

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_BACK()
{
	if (Mod_RealMana	>=	100)
	{
		AI_Output(self, hero, "Info_Mod_Parlan_Lernen_BACK_05_01"); //Twoje magiczne umiejetnosci sa teraz tak dobre, ze nie moge cie niczego nauczyc.
	};
	Info_ClearChoices	(Info_Mod_Parlan_Lernen);
};

FUNC VOID Info_Mod_Parlan_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

INSTANCE Info_Mod_Parlan_Pickpocket (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Pickpocket_Condition;
	information	= Info_Mod_Parlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Parlan_Pickpocket_Condition()
{
	C_Beklauen	(96, ItMi_Gold, 45);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_BACK, Info_Mod_Parlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Parlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Parlan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Parlan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Parlan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Parlan_EXIT (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_EXIT_Condition;
	information	= Info_Mod_Parlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Parlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
