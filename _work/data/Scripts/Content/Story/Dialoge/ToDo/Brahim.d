INSTANCE Info_Mod_Brahim_Hi (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Hi_Condition;
	information	= Info_Mod_Brahim_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_00"); //Hej, obcy, potrzebujesz karty? Mam dla ciebie.
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_01"); //Recznie rysowana na pergaminie dziewicy. Nigdzie indziej nie znajdziesz nic podobnego.
	AI_Output(hero, self, "Info_Mod_Brahim_Hi_15_02"); //Tak wiec masz do czynienia równiez z bylymi skazanymi?
	AI_Output(self, hero, "Info_Mod_Brahim_Hi_07_03"); //Oczywiscie tak sie dzieje. Nie chcesz wiedziec, do kogo juz sprzedalem bilety.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Brahim sprzedaje bilety.");
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Thorben i ja potrzebujemy waszej pomocy.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_00"); //Thorben i ja potrzebujemy waszej pomocy.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_01"); //Gdzie jest zacisk buta?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_02"); //Potrzebujemy rysowania stolu partyjnego. Thorben mówi, ze jest mu on winien.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling_07_03"); //Niestety, tak. Wlasciwie, zajme sie tym pózniej. Jutro mozna ja odebrac.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling_15_04"); //Do zobaczenia jutro, wiec.

	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Brahim zgodzil sie. Pewnego dnia potrzebuje jednak na rysunek.");

	Mod_Thorben_Brahim = Wld_GetDay();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling2 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling2_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jestes gotowy?";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling))
	&& (Mod_Thorben_Brahim < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_00"); //Czy jestes gotowy?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling2_07_01"); //Mozna na tym polegac. Wez to pod uwage.

	B_GiveInvItems	(self, hero, ItWr_Zeichnung_Tisch, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling2_15_02"); //Dziekuje bardzo.
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling3 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling3_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lubie kolejny rysunek.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_00"); //Lubie kolejny rysunek.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_01"); //Och, nie! Tym razem nie bedzie za darmo.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_02"); //Ile?
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_03"); //50 sztuk zlota.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_04"); //Zrób mi szkic.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_07_05"); //I co powinienem szkicowac?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_15_06"); //Troche.... uh.....

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Cos dekoracyjnego. Pomysl o czyms.", Info_Mod_Brahim_ThorbenLehrling3_C);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Dzbanek z piwem.", Info_Mod_Brahim_ThorbenLehrling3_B);
	Info_AddChoice	(Info_Mod_Brahim_ThorbenLehrling3, "Udekorowane pudelko na bizuterie.", Info_Mod_Brahim_ThorbenLehrling3_A);
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_D()
{
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_00"); //Wszystko w porzadku.... Rozejrzyjcie sie miedzy kobietami i co?
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_01"); //Thorben jest w spiaczce. Chce go nieco rozweselic, gdy sie obudzi.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling3_D_07_02"); //Czlowiek, gównocz! Torben? Zamierzam podjac szczególny wysilek.
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_D_15_03"); //Dzieki. Do zobaczenia dookola.

	Info_ClearChoices	(Info_Mod_Brahim_ThorbenLehrling3);

	Mod_Thorben_Present_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_C_15_00"); //Cos dekoracyjnego. Pomysl o czyms.

	Mod_Thorben_Present = 3;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_B_15_00"); //Dzbanek z piwem.

	Mod_Thorben_Present = 2;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling3_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling3_A_15_00"); //Udekorowane pudelko na bizuterie.

	Mod_Thorben_Present = 1;

	Info_Mod_Brahim_ThorbenLehrling3_D();
};

INSTANCE Info_Mod_Brahim_ThorbenLehrling4 (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_ThorbenLehrling4_Condition;
	information	= Info_Mod_Brahim_ThorbenLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcialbym podniesc rysunek.";
};

FUNC INT Info_Mod_Brahim_ThorbenLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling3))
	&& (Mod_Thorben_Present_Day < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_ThorbenLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_00"); //Chcialbym podniesc rysunek.
	AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_01"); //Nie ma tu problemu.

	if (Mod_Thorben_Present == 1)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Schmuckkasten, 1);
	}
	else if (Mod_Thorben_Present == 2)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Bierkrug, 1);
	}
	else if (Mod_Thorben_Present == 3)
	{
		B_GiveInvItems	(self, hero, ItWr_Zeichnung_Karte, 1);
	};

	if (Mod_Thorben_Present == 1)
	|| (Mod_Thorben_Present == 2)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_02"); //Dzieki temu dobrze wyglada. Jestem gonna dostac sie do pracy.
	}
	else if (Mod_Thorben_Present == 3)
	{
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_03"); //Rysowales mape?
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_04"); //Co wiec? To wlasnie robie najlepiej, to jest to, do czego jestem szkolony.
		AI_Output(self, hero, "Info_Mod_Brahim_ThorbenLehrling4_07_05"); //Mozna je zawiesic w mieszkaniu.
		AI_Output(hero, self, "Info_Mod_Brahim_ThorbenLehrling4_15_06"); //Wszystkie sluszne, wszystkie sluszne. Do zobaczenia dookola.
	};
};

INSTANCE Info_Mod_Brahim_Bilder (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Bilder_Condition;
	information	= Info_Mod_Brahim_Bilder_Info;
	permanent	= 0;
	important	= 0;
	description	= "Slysze, ze interesuja Cie obrazy.";
};

FUNC INT Info_Mod_Brahim_Bilder_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Moe_KnowsPort == 1)
	&& (Npc_HasItems(hero, ItMi_PortsKoffer) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Bilder_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_15_00"); //Slysze, ze interesuja Cie obrazy.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_07_01"); //Zalezy od tego, kto tworzyl prace.

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	Info_AddChoice	(Info_Mod_Brahim_Bilder, "Nie wiem, kto ich narysowal.", Info_Mod_Brahim_Bilder_B);
	Info_AddChoice	(Info_Mod_Brahim_Bilder, "Zdjecia zrobil Johannes Port.", Info_Mod_Brahim_Bilder_A);
};

FUNC VOID Info_Mod_Brahim_Bilder_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_00"); //Byl na statku, który ostatnio zatonal. Jego sprzet znajdowal sie jeszcze w wraku.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_01"); //Oznacza Pan, ze Johannes Port nie zyje?
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_02"); //Brakuje go.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_03"); //Aha.... Cóz, zdjecia nie sa duzym ujeciem. Nie chce jej.

	B_GiveInvItems	(self, hero, ItMi_PortsKoffer, 1);

	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_C_15_04"); //Jak? A co mam z tym zrobic?
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_05"); //Mam pomysl: Szukasz, czy Port jeszcze zyje. Nie byloby niesprawiedliwe, gdybys sprzedal swoje rzeczy, kiedy jeszcze jest z nami.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_C_07_06"); //Zabierz go tutaj, prawdopodobnie bedzie potrzebowal prysznica i kawalka miesa. Pózniej rozliczylismy reszte, ale nie zaszkodziloby byc w dludze takiej osoby....

	Info_ClearChoices	(Info_Mod_Brahim_Bilder);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Niestety Brahim nie wie nic o malarstwie, ale uwaza, ze warto szukac portu. Jesli wiec statek zatonal w tym samym miejscu, gdzie jest teraz: Gdzie mozna bylo sie uratowac?");

	Wld_InsertNpc	(Mod_4027_NONE_Port_NW,	"BIGFARM");

	Moe_KnowsPort = 2;
};

FUNC VOID Info_Mod_Brahim_Bilder_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_B_15_00"); //Nie wiem, kto ich narysowal.
	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_01"); //Przyjrzyjmy sie wiec.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //Port? Jak dostales jego obrazy?

	Info_Mod_Brahim_Bilder_C();
};

FUNC VOID Info_Mod_Brahim_Bilder_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Bilder_A_15_00"); //Zdjecia zrobil Johannes Port.

	B_GiveInvItems	(hero, self, ItMi_PortsKoffer, 1);

	AI_Output(self, hero, "Info_Mod_Brahim_Bilder_B_07_02"); //Port? Jak dostales jego obrazy?

	Info_Mod_Brahim_Bilder_C();
};

INSTANCE Info_Mod_Brahim_PortSuchenWo (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortSuchenWo_Condition;
	information	= Info_Mod_Brahim_PortSuchenWo_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gdzie powinienem patrzec?";
};

FUNC INT Info_Mod_Brahim_PortSuchenWo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Bilder))
	&& (Moe_KnowsPort == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortSuchenWo_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortSuchenWo_15_00"); //Gdzie powinienem patrzec?
	AI_Output(self, hero, "Info_Mod_Brahim_PortSuchenWo_07_01"); //Cóz, zaczynam zaczynac w poblizu wraku statku.
};

INSTANCE Info_Mod_Brahim_PortDabei (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortDabei_Condition;
	information	= Info_Mod_Brahim_PortDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Znalazlem Johannes Port.";
};

FUNC INT Info_Mod_Brahim_PortDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_GetDistToWp(Mod_4027_NONE_Port_NW, "NW_CITY_HABOUR_HUT_01_FRONT") < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_00"); //Znalazlem Johannes Port.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_01"); //Bardzo ladny, bardzo ladny.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_02"); //Co dzieje sie pózniej?
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_03"); //Pozwól mu odpoczac na chwile obecna. Zostawie go do rana.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_04"); //Kiedy jest dobrze wypoczety i zadowolony, mozemy porozmawiac.
	AI_Output(hero, self, "Info_Mod_Brahim_PortDabei_15_05"); //Wtedy wróce jutro.
	AI_Output(self, hero, "Info_Mod_Brahim_PortDabei_07_06"); //Tak. Milego dnia.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Odpoczynek portu z Brahimem. Chca, abym wrócil nastepnego dnia.");

	B_StartOtherRoutine	(Mod_4027_NONE_Port_NW,	"ATBRAHIM");
	B_StartOtherRoutine	(self, "PORTDA");

	PortAtBrahim = Wld_GetDay();

	Moe_KnowsPort = 4;
};

INSTANCE Info_Mod_Brahim_PortTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortTot_Condition;
	information	= Info_Mod_Brahim_PortTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_PortTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_PortDabei))
	&& (Moe_KnowsPort == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_00"); //(agitowane) To nie moze byc!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_01"); //Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_02"); //Zostal zamordowany! W moim domu! Nie moge w to uwierzyc!
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_03"); //Port? Martwy port? Co robimy teraz?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_04"); //Nie wiem! Musze zglosic to natychmiast do Straznika Miasta, ale ty.... jestes w niebezpieczenstwie. Ktos zabil Port i to nie dla zabawy.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_05"); //Nie, on musial cos chciec. A ty uratowales skarb Port. Moze ma z tym cos wspólnego.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_06"); //Chce go jak najszybciej pozbyc sie, gdybym byl panem.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_07"); //Jak mam go pozbyc sie?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_08"); //Sprzedaj go. Nie do mnie, oczywiscie nie chce go.
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_09"); //Ale znam dziwnego kolege, który chcialby zabrac Twoja walizke. Kocha samotnosc i egzotyczne rzeczy. Kuno jest jego imieniem.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_10"); //Gdzie moge znalezc tego samotnego kupca?
	AI_Output(self, hero, "Info_Mod_Brahim_PortTot_07_11"); //Swoja chate zbudowal na stawie obok Minentalowej przeleczy. Dbaj o siebie, kiedy do niego idziesz.
	AI_Output(hero, self, "Info_Mod_Brahim_PortTot_15_12"); //Zawsze to robie.

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Port zostal zamordowany tej nocy. Damn to! Calosc przybiera groteskowe cechy.....");
	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Brahim uwaza, ze jestem w niebezpieczenstwie i powinienem jak najszybciej sprzedac walizke. Handlowiec w chacie na jeziorze w poblizu Minental Pass powinien byc w stanie pomóc mi tam.");

	B_StartOtherRoutine	(self, "START");

	Moe_KnowsPort = 6;

	B_KillNpc	(Mod_4026_NONE_Kuno_NW);
};

INSTANCE Info_Mod_Brahim_Flora (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Flora_Condition;
	information	= Info_Mod_Brahim_Flora_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Flora_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Flora_Port))
	&& (Moe_KnowsPort == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Flora_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_07_00"); //Uh-huh, kto przyjdzie?

	B_StartOtherRoutine	(Mod_548_NONE_Canthar_NW, "WAITFORPLAYER");

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Co miales do czynienia z zabójstwami?", Info_Mod_Brahim_Flora_B);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Game's over, Brahim.", Info_Mod_Brahim_Flora_A);
};

FUNC VOID Info_Mod_Brahim_Flora_E()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_00"); //To prawda! Jesli pozwolisz mi odejsc, to powiem wam wszystko.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_01"); //Ale zapewniam panstwa, nie mam nic wspólnego z morderstwami. I oszustwa. Jestem slabym pomocnikiem, którego uzywa sie do woli.
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_02"); //Idz do przodu, strzelaj.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_03"); //Jest jeden w gildii zlodziei, którzy oprócz zwyklych sklepów maja brud na rekach. Kantar jest.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_04"); //Poprzez uzaleznienie od pieniedzy uczestniczyl w wielu dochodowych dzialaniach. Chetnie przejmuje trupy dla zysku.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_05"); //Nie wydaje sie, aby tak bylo, ale on jest jednym z najpotezniejszych ludzi w Khorinis. Nie mam pojecia, kto do niego nalezy.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_06"); //Po upadlym biznesie bylem zadluzony i zwrócil sie do niego...... Wkrótce zdalem sobie sprawe, ze to blad.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_07"); //Wielokrotnie mialem robic dla niego brudna robote, a jesli nie chcialem tego robic, to zagrazal mu bandytami.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_08"); //Nie wiem, dlaczego Port musial umrzec, ale dla Canthara bylo to bardzo pilne. Nie tylko z powodu znalezionej walizki; Mialem wrazenie, ze boi sie Port.....
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_E_15_09"); //Wyglada to tak jak ja jestem gonna, wiec musze spojrzec na Canthar.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_E_07_10"); //To rzecz zagrazajaca zyciu, ale to jedyna droga! Musi on miec po swojej stronie kilku strazników, wiec nie mozna im ufac.... pojedynczy wojownik bedzie mial wieksze szanse!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Kantar wydaje sie byc mastermina morderstw. Musze jednak zabrac go sam na klatke piersiowa, poniewaz najprawdopodobniej przekupil wielu strazników. Pozwalam Brahimowi odejsc; zapewnil mnie, ze nie ma nic wspólnego z zabijaniem i dzialal wbrew jego woli.");

	Moe_KnowsPort = 9;
};

FUNC VOID Info_Mod_Brahim_Flora_B()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_B_15_00"); //Co miales do czynienia z zabójstwami?
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_01"); //Ja? Nic, naprawde nic!

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Byc moze bijace bicie wspomoze Twoja pamiec (.... )", Info_Mod_Brahim_Flora_D);
	Info_AddChoice	(Info_Mod_Brahim_Flora, "Czy musze zaczac grozic?", Info_Mod_Brahim_Flora_C);
};

FUNC VOID Info_Mod_Brahim_Flora_A()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_A_15_00"); //Game's over, Brahim.
	AI_Output(self, hero, "Info_Mod_Brahim_Flora_B_07_02"); //Jaka gra? Nigdy nie gram.

	Info_ClearChoices	(Info_Mod_Brahim_Flora);

	Info_AddChoice	(Info_Mod_Brahim_Flora, "Co miales do czynienia z zabójstwami?", Info_Mod_Brahim_Flora_B);
};

FUNC VOID Info_Mod_Brahim_Flora_D()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_D_15_00"); //Byc moze bicie pomoze ci zapamietac pamiec.....

	Info_Mod_Brahim_Flora_E();
};

FUNC VOID Info_Mod_Brahim_Flora_C()
{
	AI_Output(hero, self, "Info_Mod_Brahim_Flora_C_15_00"); //Czy musze zaczac grozic?

	Info_Mod_Brahim_Flora_E();
};

INSTANCE Info_Mod_Brahim_Canthar (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Canthar_Condition;
	information	= Info_Mod_Brahim_Canthar_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Canthar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	&& (Moe_KnowsPort == 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Canthar_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_00"); //Jestes zywy! I tym razem ciesze sie z tego.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_01"); //Nie wygralem zwyciestwa. Po prostu rozejm.
	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_02"); //Gorzej zapobiegles. Czlowiek, balem sie zycia. W tym przypadku to powinna byc Twoja.

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItWr_Map_Newworld, 1);

	B_ShowGivenThings	("100 Zloto i karta otrzymana");

	AI_Output(self, hero, "Info_Mod_Brahim_Canthar_07_03"); //Badz jednak ostrozny. To jeszcze nie koniec.
	AI_Output(hero, self, "Info_Mod_Brahim_Canthar_15_04"); //Tak, to bedzie ja. Do zobaczenia dookola.
};

INSTANCE Info_Mod_Brahim_PortGekillt (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_PortGekillt_Condition;
	information	= Info_Mod_Brahim_PortGekillt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Znalazlem Johannes Port. On nie zyje.";
};

FUNC INT Info_Mod_Brahim_PortGekillt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Port_Hi))
	&& (Moe_KnowsPort == 3)
	&& (Npc_IsDead(Mod_4027_NONE_Port_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_00"); //Znalazlem Johannes Port. On nie zyje.
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_01"); //To godne pozalowania, ale zwieksza to równiez wartosc jego dziel. Jestem sklonny kupic od Ciebie jego walizke.
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_02"); //Ile dalibyscie mi Panstwo w tej sprawie?
	AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_07_04"); //Hmm, 200 sztuk zlota i kolejne 100 za wysilek szukania go. Uzgodniony?

	CreateInvItems	(self, ItMi_Gold, 400);

	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_SUCCESS);

	CurrentNQ += 1;

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Zaakceptowac.", Info_Mod_Brahim_PortGekillt_Ok_300);
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Zegluga.", Info_Mod_Brahim_PortGekillt_Feilschen_300);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_15_05"); //Tak.
	
		B_GiveInvItems	(self, hero, ItMi_Gold, 300);
	};
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Ok_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Ok_300_15_00"); //Daj mi zloto.
	
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
};

FUNC VOID Info_Mod_Brahim_PortGekillt_Feilschen_300()
{
	AI_Output(hero, self, "Info_Mod_Brahim_PortGekillt_Feilschen_300_15_00"); //To nie wystarczy.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Brahim_PortGekillt_Feilschen_300_13_01"); //Dobrze, oto 350 zlotych monet.

		B_GiveInvItems	(self, hero, ItMi_Gold, 350);

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Brahim_PortGekillt_Feilschen_300_13_02"); //Daje tylko 300 zlotych monet.

		Info_ClearChoices	(Info_Mod_Brahim_PortGekillt);
		
		Info_AddChoice	(Info_Mod_Brahim_PortGekillt, "Zaakceptowac.", Info_Mod_Brahim_PortGekillt_Ok_300);
	};
};

INSTANCE Info_Mod_Brahim_WoMoe (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_WoMoe_Condition;
	information	= Info_Mod_Brahim_WoMoe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Widziales ostatnio Moe?";
};

FUNC INT Info_Mod_Brahim_WoMoe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_WoMoe_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_00"); //Widziales ostatnio Moe?
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_01"); //Mam? Mhhhh..... Nie, nie pamietam. Czyz nie jest tam, gdzie powinien byc?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_02"); //Wtedy bym nie zapytal.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_03"); //To prawda. Martwisz sie?
	AI_Output(hero, self, "Info_Mod_Brahim_WoMoe_15_04"); //Jeszcze nie wiem.
	AI_Output(self, hero, "Info_Mod_Brahim_WoMoe_07_05"); //Cóz, to brzmi jak zabawa.... Daj mi znac, kiedy go znajdziesz.
};

INSTANCE Info_Mod_Brahim_MoeTot (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_MoeTot_Condition;
	information	= Info_Mod_Brahim_MoeTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moe's zostal zamordowany.";
};

FUNC INT Info_Mod_Brahim_MoeTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_CantharQuest_Last >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_MoeTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_00"); //Moe's zostal zamordowany.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_01"); //WAS?! Szal, czlowiek! Zglosiles to jeszcze?
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_02"); //Uporzadkuje to na swój sposób.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_03"); //Wiec znowu krew i ubój....
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_04"); //W zaleznosci od tego, jak twarda jest walka Canthar.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_05"); //Czy kantar to zrobil? Mam nadzieje, ze w Innosie wydostaniecie sie z niego zywcem.
	AI_Output(hero, self, "Info_Mod_Brahim_MoeTot_15_06"); //W razie potrzeby musze naliczyc oplate. Reload. kusza.
	AI_Output(self, hero, "Info_Mod_Brahim_MoeTot_07_07"); //Hu? Och, nigdy nie przeszkadza. Zycze powodzenia w tym przedsiewzieciu i tak.
};

INSTANCE Info_Mod_Brahim_HartImNehmen (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_HartImNehmen_Condition;
	information	= Info_Mod_Brahim_HartImNehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes twardym facetem, huh?";
};

FUNC INT Info_Mod_Brahim_HartImNehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_HartImNehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_00"); //Jestes twardym facetem, huh?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_01"); //Bogate dni juz minely. Musisz zobaczyc, gdzie jestes.
	AI_Output(hero, self, "Info_Mod_Brahim_HartImNehmen_15_02"); //Nawet z monopolem na dziewicze rysunki pergaminowe?
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_03"); //Baw mnie.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_04"); //Od czasu pojawienia sie pierwszych papierni nie moge przyniesc mezczyznie mojego kosztownego pergaminu.
	AI_Output(self, hero, "Info_Mod_Brahim_HartImNehmen_07_05"); //Cóz, kazdemu, kto woli czytac na szmatach, a nie na skórze zwierzat, nie mozna juz pomóc.
};

INSTANCE Info_Mod_Brahim_Rasend (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Rasend_Condition;
	information	= Info_Mod_Brahim_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brahim_Rasend_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	&& (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_00"); //Czy z trzeszczacymi skarpetkami Beliara byl to demon?
	AI_Output(hero, self, "Info_Mod_Brahim_Rasend_15_01"); //Mozna to powiedziec.
	AI_Output(self, hero, "Info_Mod_Brahim_Rasend_07_02"); //Znowu mialem szczescie!
};

INSTANCE Info_Mod_Brahim_Trade (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Trade_Condition;
	information	= Info_Mod_Brahim_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brahim_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brahim_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output(hero, self, "Info_Mod_Brahim_Trade_15_00"); //Cóz, pozwole sobie zobaczyc....
};

INSTANCE Info_Mod_Brahim_Pickpocket (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_Pickpocket_Condition;
	information	= Info_Mod_Brahim_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Brahim_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_BACK, Info_Mod_Brahim_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brahim_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brahim_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brahim_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brahim_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brahim_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brahim_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brahim_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brahim_EXIT (C_INFO)
{
	npc		= Mod_565_NONE_Brahim_NW;
	nr		= 1;
	condition	= Info_Mod_Brahim_EXIT_Condition;
	information	= Info_Mod_Brahim_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brahim_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brahim_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
