INSTANCE Info_Mod_Thorben_Hi (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Hi_Condition;
	information	= Info_Mod_Thorben_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Thorben_Hi_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_Hi_11_01"); //Thorben. Wykonuje wszelkiego rodzaju artykuly gospodarstwa domowego.
};

INSTANCE Info_Mod_Thorben_HiKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HiKneipe_Condition;
	information	= Info_Mod_Thorben_HiKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Thorben_HiKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HiKneipe_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_HiKneipe_11_01"); //Jestem stolarzem, mistrzem stoogerem. Ale teraz nie pracuje.
};

INSTANCE Info_Mod_Thorben_Handel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Handel_Condition;
	information	= Info_Mod_Thorben_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy równiez sprzedajesz?";
};

FUNC INT Info_Mod_Thorben_Handel_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Handel_15_00"); //Czy równiez sprzedajesz?
	AI_Output(self, hero, "Info_Mod_Thorben_Handel_11_01"); //Troche malych rzeczy.
};

INSTANCE Info_Mod_Thorben_HandelKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HandelKneipe_Condition;
	information	= Info_Mod_Thorben_HandelKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy sprzedaja Panstwo wyroby rzemieslnicze?";
};

FUNC INT Info_Mod_Thorben_HandelKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Handel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HandelKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_HandelKneipe_15_00"); //Czy sprzedaja Panstwo wyroby rzemieslnicze?
	AI_Output(self, hero, "Info_Mod_Thorben_HandelKneipe_11_01"); //Nie wiem. Chodz jutro za moim miejscem, czy pan? Nie pracuje juz teraz.
};

INSTANCE Info_Mod_Thorben_Job (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Job_Condition;
	information	= Info_Mod_Thorben_Job_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge zaczac jako praktykant?";
};

FUNC INT Info_Mod_Thorben_Job_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (!Mod_IstLehrling)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Job_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Czy moge zaczac jako praktykant?
	AI_Output(self, hero, "Info_Mod_Thorben_Job_11_01"); //Nie jestes nawet obywatelem miasta. Zadam, aby moi praktykanci.... eigentia Samodzielna inicjatywa.
};

INSTANCE Info_Mod_Thorben_JobKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_JobKneipe_Condition;
	information	= Info_Mod_Thorben_JobKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge zaczac jako praktykant?";
};

FUNC INT Info_Mod_Thorben_JobKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Job))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	&& (!Mod_IstLehrling)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_JobKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Czy moge zaczac jako praktykant?
	AI_Output(self, hero, "Info_Mod_Thorben_JobKneipe_11_01"); //Czy pracuje czy nie pracuje? Próbuje sie tutaj zrelaksowac.
};

INSTANCE Info_Mod_Thorben_Irdorath (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Irdorath_Condition;
	information	= Info_Mod_Thorben_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Musze udac sie w morska podróz i potrzebowac kogos (....) )";
};

FUNC INT Info_Mod_Thorben_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_00"); //Musze wyruszyc w podróz morska i potrzebuje kogos z umiejetnosciami manualnymi......
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_01"); //Przez Innosa, co mam zrobic na statku na morzu?
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_02"); //Ale....
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_03"); //Nie, naprawde..... nie jest to dla mnie...... i tu czeka na mnie wiecej niz wystarczajaca ilosc szafek i maja one absolutne pierwszenstwo przed wszystkimi innymi rzeczami.
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_04"); //Jeszcze przed upadkiem wyspy....
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_11_05"); //Co mówisz?
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_06"); //Och, nic waznego.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Nie, nie wydaje mi sie, ze Thorben mozna przekonac do wycieczki po morzu.");
};

INSTANCE Info_Mod_Thorben_Lehrling (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Lehrling_Condition;
	information	= Info_Mod_Thorben_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce byc obywatelem miasta. (... )";
};

FUNC INT Info_Mod_Thorben_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_00"); //Chce byc obywatelem miasta. Czy udzieli mi Pan/Pani zgody?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_01"); //Jestes z kolonii, czy nie? Potrzebuje Cie, abys zrobil mi laske, abysmy mogli rozpoczac dzialalnosc.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_02"); //Jaka bylaby to laska?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_03"); //Glupia rzecz: zepsulem swój cenny posag Innos.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_04"); //Mam jednak pomysl, gdzie ona moze byc.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_05"); //Powiedz mi wiec o tym.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_06"); //Minelo kilka dni, odkad wlasnie skonczylam klatke piersiowa dla Lehmara.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_07"); //Zostawilem je otwarte, aby drewno i klej mogly oddychac.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_08"); //W nocy ziemia drzy, nie spektakularnie, ale robila to ostatnio.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_09"); //I wtedy posag musial spasc z pólki na pien.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_10"); //Nastepnego ranka wlasnie ja zamknalem i dostarczylem.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_11"); //Moja zona zauwazyla, ze pomnik brakowalo jej podczas sprzatania.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_12"); //Prawdopodobnie odnalazl go i przechowal syn suki Lehmara.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_13"); //Dlaczego nie pytacie go tylko o to?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_14"); //Ten asshole twierdzi, ze nic nie wie.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_11_15"); //Jesli dowiesz sie, czy ma posag i przywiezie go do mnie, kupie ci jeden.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_16"); //Zobaczmy, co mozemy z tym zrobic.

	Log_CreateTopic	(TOPIC_MOD_THORBENSSTATUE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_THORBENSSTATUE, "Thorben sprzedal klatke piersiowa Lehmarowi, który prawdopodobnie nadal zawieral jego pomnik Innosa. Mam go odebrac.");
};

INSTANCE Info_Mod_Thorben_Stimme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Stimme_Condition;
	information	= Info_Mod_Thorben_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam Panski pomnik.";
};

FUNC INT Info_Mod_Thorben_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Lehrling))
	&& (Npc_HasItems(hero, ItMi_LostInnosStatue_Daron) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_00"); //Mam Panski pomnik.

	B_GiveInvItems	(hero, self, ItMi_LostInnosStatue_Daron, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_01"); //Tak, to ona! Jak zepsules jej ten groszowy lis?
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_02"); //Z wystarczajaca iloscia pieniedzy.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_03"); //Oczywiscie, wszystko co Lehmar mówi o pieniadzach. Nie mozesz jednak oddac jej z powrotem.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_04"); //Ale powiedzialem ci, ze bedziemy razem pic napój. Oto jest!

	CreateInvItems	(self, ItFo_Beer, 1);
	CreateInvItems	(hero, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_11_05"); //A Ty równiez jestes pewien mojej aprobaty.

	B_GivePlayerXP	(200);

	Npc_RemoveInvItems	(self, ItMi_LostInnosStatue_Daron, 1);

	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_SUCCESS);
	
	Mod_LehrlingsStimmen += 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Thorben_Aufnahme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Aufnahme_Condition;
	information	= Info_Mod_Thorben_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy bierzesz mnie jako praktykanta?";
};

FUNC INT Info_Mod_Thorben_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_15_00"); //Czy bierzesz mnie jako praktykanta?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_11_01"); //Hmm, wlasciwie nie moze zranic. Nie potrzebuje tu jednak bumu.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_11_02"); //Jesli nie masz pracy, dostaniesz ja.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);

	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "Wole nie.", Info_Mod_Thorben_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "Tak powinno byc.", Info_Mod_Thorben_Aufnahme_A);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_B_15_00"); //Wole nie.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_B_11_01"); //Nie mam pecha.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_00"); //Tak powinno byc.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_01"); //No cóz, to brzmi dobrze.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_02"); //Bedziesz obywatelem Khorinis i tego wszystkiego. Wiec powinienes chodzic jak jeden.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("przyjac odziez cywilna");

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_03"); //Teraz wyjasnie nasze najprostsze procesy pracy. Ale najpierw potrzebuje troche lykniecia.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_04"); //Zanim zaczniesz prace, potrzebujesz dokladnego planu tego, co chcesz zrobic.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_05"); //Czy potrafisz dobrze narysowac?
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_06"); //Nie wiem o tym.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_07"); //W razie potrzeby nauczysz sie. Na rysunku zaznaczasz kazdy kawalek, którego potrzebujesz pózniej.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_08"); //Poniewaz zazwyczaj zlecamy prace na zamówienie, czasami istnieja juz rysunki lub bardzo konkretne pomysly na produkt koncowy.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_09"); //Nie powinienes ich zawiesc. To nie idzie dobrze.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_10"); //Kiedy to robisz, to praca miesniowa.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_11"); //Pilarka w moim miejscu pracy umozliwia ciecie kawalków drewna tak, jak trzeba.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_12"); //Mozesz polaczyc elementy wedlug rozmiaru lub wedlug gwozdzi. Na pewno potrzebny bedzie mloteczek.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_13"); //Dowiesz sie, co jest bardziej odpowiednie w jakiej sytuacji.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_14"); //(nieco pijany) To wlasciwie. Zatrzymaj sie, poczekaj!
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_15"); //Jesli potrzebujesz metalowych ornamentów lub czegokolwiek, przyjdz do mnie, zajmiemy sie tym.
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_16"); //Masz jeszcze prace dla mnie?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_17"); //(piwo) Took....? (uznany) Tak, tak, tak.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_18"); //Coragon zamówil ode mnie krzeslo i dostarczyl je wraz z wymiarami, tak aby zmiescilo sie ono w jego kabinie.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_19"); //Wiec wszystko, co musisz zrobic, to zrobic pokoje.

	CreateInvItems	(hero, ItMi_Brett, 5);
	CreateInvItems	(hero, ItWr_Zeichnung_Stuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_11_20"); //I zawsze milo - kleszcze - pamietaj: Najpierw pila, potem gwozdzie. Kleszcze.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 2;

	Wld_AssignRoomToGuild ("gritta",	GIL_NONE);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Thorben, stolarz, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Mam stworzyc krzeslo dla Coragon. Mam juz specyfikacje, teraz musze je tylko wdrozyc.", "Poniewaz Thorben przyjal mnie jako swojego ucznia, moge teraz wejsc do wyzszej kwatery.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, "Thorben, stolarz, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Mam stworzyc krzeslo dla Coragon. Mam juz specyfikacje, teraz musze je tylko wdrozyc.");
	};

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

INSTANCE Info_Mod_Thorben_GildenZeug (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_GildenZeug_Condition;
	information	= Info_Mod_Thorben_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_00"); //Teraz wkladasz duzo wysilku w bojówki? Wlóz troche porzadku do chlewa.
	}
	else if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_01"); //Nie sadze, aby glosni magicy mieli dla Ciebie racje.
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_02"); //Dokonales dobrego wyboru z najemnikami. Wszyscy inni sa mieczakami, czyz nie?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_11_03"); //Nie daj mi, ze Beliar gnije, czy ty?
	};
};

INSTANCE Info_Mod_Thorben_LehrlingQuest (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam tutaj przewodniczacego dla Coragon.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (Npc_HasItems(hero, ItMi_CoragonStuhl) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_00"); //Mam tutaj przewodniczacego dla Coragon.

	B_GiveInvItems	(hero, self, ItMi_CoragonStuhl, 1);

	Npc_RemoveInvItems	(self, ItMi_CoragonStuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_01"); //Pozwólcie, ze zobacze. Kleszcze. Tak, calkiem szanowany. Mysle, ze Coragon bedzie zadowolony. Kleszcze.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_02"); //Powinienes wiedziec, kiedy mam dla ciebie cos do zrobienia. Bedziesz wolny tak dlugo. Wszystko w porzadku?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_03"); //Dostales to. Do zobaczenia dookola. I nie pijcie zbyt wiele.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_11_04"); //Prosze pozwolic mi sie tym martwic.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest2_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie cos do zrobienia?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_00"); //Masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_01"); //Mam tak wiele do zrobienia, nie wiem nawet, od czego zaczac. Pieklo piekielne. (kaszel)
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_02"); //Czy jestes chory/a?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_03"); //Nie, to prawda. Ale prawie nigdy nie przychodze do pracy z tym kaszlem.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_04"); //Co dalej?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_05"); //Dwa najwazniejsze stoliki na wesele Matteo to dwa najpilniejsze. (kaszel)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_06"); //Sa latwe do wykonania, ale nie ma jeszcze rysunku.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_07"); //Czy jest ktos, kogo mozemy zatrudnic do podpisania tego dokumentu?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_08"); //Brahim zawdziecza mi kolejna laske. Pomógl mu wtedy z powrotem z kabina.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_11_09"); //Powinienes go zapytac. Wróccie wiec.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Thorben zarzadzil dwa stoly na uroczystosc. W tym celu nalezy jednak najpierw sporzadzic rysunek. Mam poprosic o pomoc sprzedawce biletów - Brahima.");
};

INSTANCE Info_Mod_Thorben_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest3_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Brahim narysowal.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest3_15_00"); //Brahim narysowal.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest3_11_01"); //Dobre. Do pracy, konczymy.

	B_GiveInvItems	(self, hero, ItMi_Brett, 12);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest4_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Stoly sa gotowe do dostawy.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest3))
	&& (Npc_HasItems(hero, ItMi_MatteoFesttisch) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_00"); //Stoly sa gotowe do dostawy.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_11_01"); //Jestes dobrym czlowiekiem. Nadal mozesz byc liczony.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_02"); //Czy sa inne pilne zamówienia?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_11_03"); //(kaszel) Wkrótce, bez watpienia. Wiec wróccie i zobaczcie mnie znowu, wszystko w porzadku?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_04"); //Wszystko jasne. Do zobaczenia dookola.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest5_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co to sa wiadomosci?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest4))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_00"); //Co to sa wiadomosci?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_01"); //(ciezki oddech) Jest powolny. Ludzie nie chca dac mi wiecej zadan. (kaszel) Czuje sie prawie martwy.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_02"); //Nie przesadzaj!
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_03"); //Czy móglbys zastapic mnie jutro rano od 9:00 do 12:00?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_04"); //Wystarczy stac obok pily lub czegos i przyjmowac zamówienia.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_05"); //Nie masz czasu?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_06"); //Musze dobrze spac, aby móc znów kaszlec troche sily.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_07"); //Wiec jutro wejdziesz do mnie.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_08"); //Bez problemu. Uzyskaj troche odpoczynku.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_09"); //Matteo moze chciec odebrac stoly partyjne.

	B_GiveInvItems	(self, hero, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_10"); //Sprzedaj mu go za 150 zlota.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_11_11"); //Przyjezdzam i uwolnie cie.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_THREE, "Thorben chce dobrze przespac sie w nocy i poprosil mnie, abym opiekowal sie miejscem pracy i przyjmowal rozkazy nastepnego dnia od 9 do 12.");

	B_StartOtherRoutine	(self, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_583_NONE_Hanna_NW, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_529_NONE_Matteo_NW, "TAGPAUSE");

	Mod_Thorben_Vertretung_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Thorben_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest6_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Mod_Thorben_Vertretung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_00"); //Jak to sie stalo? Czy ktos tam byl?

	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
	|| (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_01"); //Matteo odebral stoly i zaplacil za nie.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_02"); //Wszystko w porzadku, zachowajcie pieniadze. To byla wasza praca i chce, aby byla to wasza nagroda.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_03"); //Hanna byla tutaj i zamówila naprawe komody.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_04"); //Przynajmniej nowe zlecenie. (kaszel) Moge sie tym zajac samodzielnie.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_05"); //Dziekuje za pomoc w zamknieciu sklepu bez ciebie.
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_06"); //Dzis nic sie nie stalo.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_07"); //Pieklo pekajace! Na czym mam zyc? Nie moge Ci nawet zaoferowac platnosci.
	};

	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_08"); //Wkrótce to sprawdze.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_11_09"); //Zrób to.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_SUCCESS);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest7_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem cos dla Ciebie.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& ((Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	|| (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	|| (Npc_HasItems(hero, ItMi_Karte) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest7_15_00"); //Dostalem cos dla Ciebie.

	if (Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Schmuckkasten, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_01"); //No cóz, jesli nie z prawdziwego profesjonalisty. Chlopiec, jestes lepszy niz ja w moim pierwszym miejscu. (kaszel)
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_02"); //Jestem gonna powiedziec mojej siostrzenicy, zeby polozyla ja na pólce. Dziekuje, nie spodziewalem sie tego zbyt wiele.

		B_GivePlayerXP	(1000);
	}
	else if (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Bierkrug, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_03"); //Dziekuje, dziekuje. Zawsze bedzie mi przypominac przeszlosc, boje sie.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_04"); //Mówie zonie, zeby polozyla ja na pólce.

		B_GivePlayerXP	(800);
	}
	else if (Npc_HasItems(hero, ItMi_Karte) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Karte, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_05"); //Dziekuje, dziekuje. Pomysl musi pochodzic od Brahima, prawda?
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_06"); //Chlopiec nie ma fantazji, ale nie sadze, aby to wygladalo na ciebie tak dobrze.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_11_07"); //Cóz, liczy sie wola, a wdrozenie jest nieskazitelne.

		B_GivePlayerXP	(600);
	};

	Mod_Thorben_Geschenk_Tag = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, LOG_SUCCESS);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_48);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest8_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak sie czujesz?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest8_15_00"); //Jak sie czujesz?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_11_01"); //Jestem teraz calkiem sprytny. Ale to wszystko zniknie. Nie pozwole mi sie w pospiechu rozbic. (kaszel)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_11_02"); //Praca nie moze trwac dlugo, bo w przeciwnym razie wkrótce nie bedziemy mieli nic do jedzenia.
};

INSTANCE Info_Mod_Thorben_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest9_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jaki jest wynik?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest9_15_00"); //Jaki jest wynik?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest9_11_01"); //Przetrwalem udar dobrze. Nie moge juz koordynowac tylko kilku rzeczy. Na przyklad wiazanie sznurowadel. (kaszel) To moja zona mi pomagala.
};

INSTANCE Info_Mod_Thorben_Laute (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Laute_Condition;
	information	= Info_Mod_Thorben_Laute_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przychodze do Ciebie na zadanie.";
};

FUNC INT Info_Mod_Thorben_Laute_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Zeki_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Laute_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_00"); //Przychodze do Ciebie na zadanie.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_01"); //O co w tym wszystkim chodzi?
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_02"); //Czy móglbys zrobic mi lutnie?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_03"); //(przemyslane) Hmm..... tak, moglem.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_04"); //Aby jednak móc przyjac te prace, potrzebuje specjalnych materialów i 250 zlotych monet.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_05"); //Mam juz pieniadze, to jest.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_06"); //Bardzo dobry. Tak wiec do wykonania dzwieków potrzebuje dwunastu galezi, które mozna znalezc wszedzie w lesie.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_07"); //Potrzebuje tez jedwabiu, aby w ogóle móc grac na instrumencie.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_08"); //Skad mam wziac jedwab?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_09"); //Oczywiscie u dealerów. Jedwab jest drogi, wiec nie moge sobie na to pozwolic.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_11_10"); //Potrzebuje trzech rzedów jedwabiu. To powinno byc.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_11"); //No cóz, wtedy dostaniem takie rzeczy.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Bylem w Thorben' s, ale nie ma w nim materialów niezbednych do wykonania dzwieku. Przynosze mu dwanascie oddzialów z lasu i trzy jedwabne schody, które mozna kupic u kupców z Khorinis. Kiedy bede mial rzeczy, przekaze sie Thorbenowi.");
};

INSTANCE Info_Mod_Thorben_LauteMaterialien (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteMaterialien_Condition;
	information	= Info_Mod_Thorben_LauteMaterialien_Info;
	permanent	= 0;
	important	= 0;
	description	= "Posiadam wszystkie niezbedne materialy dzwiekowe (....). )";
};

FUNC INT Info_Mod_Thorben_LauteMaterialien_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Laute))
	&& (Npc_HasItems(hero, ItMi_Seide) >= 3)
	&& (Npc_HasItems(hero, ItMi_Ast) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteMaterialien_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_00"); //Udalo mi sie pozyskac wszystkie niezbedne dla brzmienia materialy.

	Npc_RemoveInvItems	(hero, ItMi_Ast, 12);
	Npc_RemoveInvItems	(hero, ItMi_Seide, 3);

	B_ShowGivenThings	("12 oddzialów i 3 jedwabników");

	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_11_01"); //Dobrze, wiec moge dostac sie do pracy.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_02"); //Kiedy moge odebrac dzwieki?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_11_03"); //Wróc jutro.

	Mod_ASS_ThorbenLaute = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Przywiózlem wszystkie materialy do Thorben i byl bardzo zadowolony. Jutro moge w koncu odebrac dzwieki dla Zeki i przyniesc je nowemu wlascicielowi.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Thorben_LauteFertig (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteFertig_Condition;
	information	= Info_Mod_Thorben_LauteFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy lutnia jest gotowa?";
};

FUNC INT Info_Mod_Thorben_LauteFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LauteMaterialien))
	&& (Wld_GetDay() > Mod_ASS_ThorbenLaute)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_00"); //Czy lutnia jest gotowa?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_01"); //Tak, to byla jakas praca, ale tutaj jest.

	B_GiveInvItems	(self, hero, ItMi_Lute_Zeki, 1);

	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_02"); //Dziekuje bardzo.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_03"); //Zadbaj o nia, jest bardzo cenna.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_04"); //Bede o tym pamietac. Do zobaczenia dookola.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_11_05"); //Do zobaczenia dookola.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Thorben byl w stanie dokonczyc dzwieki dla Zeki i dal mi je obiecac. Teraz musze tylko przywiezc ja do Zeki i wtedy bede mial glos z dziecmi.");

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozecie otworzyc mi te dwie skrzynie na skarbce?";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Mod_Banditenueberfall_Esteban >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_15_00"); //Czy mozecie otworzyc mi te dwie skrzynie na skarbce?
	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_11_01"); //Oczywiscie moge. Ale nie moge tego zrobic za nic. Przynajmniej daj mi 200 zlotych monet.
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten_Open (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Open_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Open_Info;
	permanent	= 0;
	important	= 0;
	description	= "Otwórz skrzynki.";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Open_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_BDTSchatzkisten))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Open_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_Open_15_00"); //Otwórz skrzynki.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_11_01"); //Cóz, poczekaj minute....

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_11_02"); //Oto Twoje pudelka z powrotem. Mozna go otworzyc samemu, zamki sa popekane.
};

INSTANCE Info_Mod_Thorben_Paddel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Paddel_Condition;
	information	= Info_Mod_Thorben_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam paddles.";
};

FUNC INT Info_Mod_Thorben_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_00"); //Szukam paddles.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_01"); //Mówisz wioslo? Hm.... Mysle, ze drewno cedrowe byloby wlasciwym rozwiazaniem. Elastyczne i niewrazliwe na wode.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_02"); //Ale na wyspie nie rosna cedry. W przeciwnym razie bym o tym wiedzial. Przepraszam za to.
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_03"); //Nie ma nic, co mozesz zrobic. Kogo jeszcze moge zapytac?
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_11_04"); //Dlaczego nie prosic Cardifa, czasami dostaje specjalne oferty.

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Thorben nie ma wioslki, ale dal mi wskazówke aby zapytac Kardifa.");
};

INSTANCE Info_Mod_Thorben_Dietriche (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche_Condition;
	information	= Info_Mod_Thorben_Dietriche_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy nadal masz dla mnie diety?";
};

FUNC INT Info_Mod_Thorben_Dietriche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(self, ItKe_Lockpick) == 0)
	&& (Mod_Thorben_Dietriche == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_15_00"); //Czy nadal masz dla mnie diety?
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_11_01"); //Hmm, nie, kupiles je wszystkie ode mnie. Musialabym najpierw zrobic kilka rzeczy, ale to zajmie troche czasu.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);

	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "Tak dlugo bede czekac.", Info_Mod_Thorben_Dietriche_B);
	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "Czy jest jakas mozliwosc skrócenia czasu?", Info_Mod_Thorben_Dietriche_A);
};

FUNC VOID Info_Mod_Thorben_Dietriche_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_B_15_00"); //Tak dlugo bede czekac.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

FUNC VOID Info_Mod_Thorben_Dietriche_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_00"); //Czy jest jakas mozliwosc skrócenia czasu?

	if (!Mod_Thorben_Robert) {
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_01"); //Mozesz mi uratowac duzo pracy na nogach. Moge tylko zlecic kowalowi Roberta w Khoracie, aby wykonywal nowe diety.
		AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_02"); //Ale sa tu równiez kowale.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_03"); //Znaczna ilosc surowej stali musi zostac przetopiona, aby wyprodukowac duze ilosci stolów matrycowych.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_04"); //Harad nie moze tego zrobic swoim malym ogniem.
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_05"); //Jesli zadbasz o powiedzenie Robertowi, moge wkrótce sprzedac Ci Dietriches.

		Mod_Thorben_Robert = TRUE;
	} else {
		AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_11_06"); //Wiesz, co robic...... idz do Roberta w Khoracie.
	};

	Mod_Thorben_Dietriche = 1;

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

INSTANCE Info_Mod_Thorben_Dietriche2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche2_Condition;
	information	= Info_Mod_Thorben_Dietriche2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zobacze Roberta.";
};

FUNC INT Info_Mod_Thorben_Dietriche2_Condition()
{
	if (Mod_Thorben_Dietriche == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche2_15_00"); //Zobacze Roberta.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche2_11_01"); //Wszystkie sluszne, wszystkie sluszne. Przynies mu piec sztabek surowej stali i place 100 zlotych monet, a on moze od razu zaczac.

	Mod_Thorben_Dietriche = 2;
};

INSTANCE Info_Mod_Thorben_Dietriche3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche3_Condition;
	information	= Info_Mod_Thorben_Dietriche3_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_Dietriche3_Condition()
{
	if (Mod_Thorben_Dietriche == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche3_11_00"); //Dopiero co dotarly Dietriches. Dziekujemy za pomoc.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Mod_Thorben_Dietriche = 0;

	CreateInvItems	(self, ItKe_Lockpick, 30);

	if (Mod_Thorben_Dietriche2 == FALSE)
	{
		B_GivePlayerXP	(100);

		Mod_Thorben_Dietriche2 = TRUE;
	};
};

INSTANCE Info_Mod_Thorben_Anschlagtafel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Anschlagtafel_Condition;
	information	= Info_Mod_Thorben_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Thorben_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Thorben == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Ast) >= Mod_Anschlagtafel_Khorinis_Thorben_Ast)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Axe) >= Mod_Anschlagtafel_Khorinis_Thorben_Beil)
	&& (Npc_HasItems(hero, ItMi_Hammer) >= Mod_Anschlagtafel_Khorinis_Thorben_Hammer)
	&& (Npc_HasItems(hero, ItMw_1h_Bau_Mace) >= Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Dagger) >= Mod_Anschlagtafel_Khorinis_Thorben_Dolch)
	&& (Npc_HasItems(hero, ItMi_Broom) >= Mod_Anschlagtafel_Khorinis_Thorben_Besen)
	&& (Npc_HasItems(hero, ItMi_Brush) >= Mod_Anschlagtafel_Khorinis_Thorben_Buerste)
	&& (Npc_HasItems(hero, ItMi_Saw) >= Mod_Anschlagtafel_Khorinis_Thorben_Saege)
	{
		Npc_RemoveInvItems	(hero, ItMi_Ast, Mod_Anschlagtafel_Khorinis_Thorben_Ast);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Axe, Mod_Anschlagtafel_Khorinis_Thorben_Beil);
		Npc_RemoveInvItems	(hero, ItMi_Hammer, Mod_Anschlagtafel_Khorinis_Thorben_Hammer);
		Npc_RemoveInvItems	(hero, ItMw_1h_Bau_Mace, Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Dagger, Mod_Anschlagtafel_Khorinis_Thorben_Dolch);
		Npc_RemoveInvItems	(hero, ItMi_Broom, Mod_Anschlagtafel_Khorinis_Thorben_Besen);
		Npc_RemoveInvItems	(hero, ItMi_Brush, Mod_Anschlagtafel_Khorinis_Thorben_Buerste);
		Npc_RemoveInvItems	(hero, ItMi_Saw, Mod_Anschlagtafel_Khorinis_Thorben_Saege);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Thorben_Gold);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_11_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Thorben = 0;
		Mod_Anschlagtafel_Khorinis_Thorben_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Thorben, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Thorben_Trade (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Trade_Condition;
	information	= Info_Mod_Thorben_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thorben_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Trade_Info()
{
	if (Mod_ThorbenTrader == FALSE)
	{
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Thorben sprzedaje Dietrichche.");

		Mod_ThorbenTrader = 1;
	};

	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thorben_Pickpocket (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Pickpocket_Condition;
	information	= Info_Mod_Thorben_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Thorben_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Ast, 12);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_BACK, Info_Mod_Thorben_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorben_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thorben_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thorben_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thorben_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thorben_EXIT (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_EXIT_Condition;
	information	= Info_Mod_Thorben_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorben_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorben_EXIT_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 0)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_11_00"); //Niniejszym zwalniam Pana/Pania jako praktykanta. Dobrze mi sluzyles i wyprzedziles swojego mistrza. Badz z siebie dumny. Mozesz byc czyms innym.
		AI_Output(hero, self, "Info_Mod_Thorben_EXIT_15_01"); //Dobrze sie wkrótce. Byc moze kiedys spotkamy sie jeszcze raz.
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_11_02"); //Moje przemówienie! Zadbaj o siebie!
	};

	AI_StopProcessInfos	(self);
};
