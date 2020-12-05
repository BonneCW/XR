INSTANCE Info_Mod_Wulfgar_Hey (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hey_Condition;
	information	= Info_Mod_Wulfgar_Hey_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestem tu nowy.";
};

FUNC INT Info_Mod_Wulfgar_Hey_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_Hey_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hey_15_00"); //Jestem tu nowy.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_01"); //Widze to. Kiedy Cyrco dopusci cie do rangi Rangera, bede sie z Toba handlowal.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_02"); //Mam tu kilka slów i eliksirów, które sa dla pana z pewnoscia interesujace.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hey_04_03"); //Poza tym, moge pomóc wam zwiekszyc moc magii.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_WALDIS, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_WALDIS, TOPIC_MOD_LEHRER_WALDIS, "Wulfgar moze sprzedawac mi eliksiry i beczki.", "Wulfgar moze mi pomóc w rozwoju MANA.");
};

INSTANCE Info_Mod_Wulfgar_Hi (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Hi_Condition;
	information	= Info_Mod_Wulfgar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj mam dla Ciebie wiadomosc.";
};

FUNC INT Info_Mod_Wulfgar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_NovizePass))
	&& (Npc_HasItems(hero, ItWr_NovizeJGPass) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_00"); //Tutaj mam dla Ciebie wiadomosc.

	B_GiveInvItems	(hero, self, ItWr_NovizeJGPass, 1);
	Npc_RemoveInvItems	(self, ItWr_NovizeJGPass, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Hi_15_01"); //Czy mozna zrobic cos z ta nazwa?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_02"); //Pozwole sobie przyjrzec sie temu.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_03"); //Tak, ta nazwa brzmi znajomo. Zobacze, co moge o nim znalezc.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Hi_04_04"); //Wróccie potem po zakonczeniu badan.

	B_LogEntry	(TOPIC_MOD_JG_BANDITENSCHULD, "Na koniec przerwa.");
	B_SetTopicStatus	(TOPIC_MOD_JG_BANDITENSCHULD, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Wulfgar_Turm (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm_Condition;
	information	= Info_Mod_Wulfgar_Turm_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chciales mnie....";
};

FUNC INT Info_Mod_Wulfgar_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_00"); //Chciales mnie....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_01"); //Och, na pewno dosc. Sluchaj: Wiele dowiedzialem sie o tym Khorgorze.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_02"); //Slucham.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_03"); //Czarodziej ten byl kiedys wysokiej rangi czlonkiem Magicystów Wody.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_04"); //Wyraznie widac, ze ci ludzie ucielesniaja droge równowagi.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_05"); //Zaskakuje mnie to, ze mówi sie, iz ma slabosc dla morza i wody w ogóle.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_06"); //Co to oznacza? Czy widzisz jakas wskazówke?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_07"); //Oczywiscie. W dolinie rzeki Minental znajduje sie ruina. Jego dolne wejscie prowadzi bezposrednio do morza.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_08"); //Mozna bylo go tam znalezc, mam na mysli.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_09"); //Badz jednak ostrozny. Staje sie bardzo potezny, wydaje mi sie.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_10"); //Prawdopodobnie czarna magia, wierzy Cyrco.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_11"); //To moze byc dobre.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_12"); //A gdzie dokladnie.....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_13"); //Na poludnie od kolonii, w kierunku morza. Tak naprawde nie mozna tego przegapic.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_14"); //Och, masz na mysli Wieze Mgielni. Bylem tam juz wczesniej. Xardas wyslal mnie tam.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_15"); //Xardes? Czarny mag?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm_15_16"); //Tak wlasnie jest. Szukal poteznej broni.....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm_04_17"); //Wtedy nie pozwólcie, ze zatrzymam sie.

	Log_CreateTopic	(TOPIC_MOD_JG_TURM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TURM, "Uh-huh. Ukryty magikiem wody moze byc ten Khorgor. Mam sprawdzic zamglona wieze.");
};

INSTANCE Info_Mod_Wulfgar_Turm2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Turm2_Condition;
	information	= Info_Mod_Wulfgar_Turm2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przepraszam za to. Mam cos nowego.";
};

FUNC INT Info_Mod_Wulfgar_Turm2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Turm2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Turm2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_00"); //Przepraszam za to. Mam cos nowego.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_01"); //Tak? Powiedz mi o tym.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Turm2_15_02"); //W wiezy znów spotkalem osobe poszukujaca. Ale on znowu uciekl ode mnie.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Turm2_04_03"); //Z Adanosem! Nigdzie sie nie znajdujemy.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_TURM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Wulfgar_Key (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key_Condition;
	information	= Info_Mod_Wulfgar_Key_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ale znalazlem tam klucz.";
};

FUNC INT Info_Mod_Wulfgar_Key_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_HasItems(hero, ItKe_SuchenderJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_00"); //Ale znalazlem tam klucz.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_01"); //Pozwole sobie to zobaczyc.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_02"); //Tutaj.

	B_GiveInvItems	(hero, self, ItKe_SuchenderJG, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_03"); //To dziwna broda. I zboczyly na górze.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_04"); //Hm.... specjalny klucz hm.....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_05"); //Trudno znalezc na to tulów.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_06"); //Xardas opowiedzial mi o magicznych miejscach. Jeden z nich mówi sie, ze jest Wiekiem Kamienia.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_07"); //Sa tez skrzynie, których nie mozna otworzyc za pomoca chwytaka.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_08"); //Skad wiesz?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key_15_09"); //Bylem wewnatrz. Inna sprawa.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key_04_10"); //To mogloby byc prawda. Sprawdz, co znajduje sie w bagazniku. Musimy to wiedziec.

	B_GiveInvItems	(self, hero, ItKe_SuchenderJG, 1);

	B_GivePlayerXP	(150);

	Log_CreateTopic	(TOPIC_MOD_JG_KEY, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_KEY, "Spróbuje wypróbowac klucza na skrzyniach w kamiennej obudowie. Byc moze mam szczescie.");
};

INSTANCE Info_Mod_Wulfgar_Key2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Key2_Condition;
	information	= Info_Mod_Wulfgar_Key2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wracam. Zamontowany klucz.";
};

FUNC INT Info_Mod_Wulfgar_Key2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Key))
	&& (Npc_HasItems(hero, ItWr_TruhenScrollJG) == 1)
	&& (Npc_HasItems(hero, ItWr_TruhenNotizJG) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Key2_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_00"); //Wracam. Zamontowany klucz.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_01"); //A co znalazles?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_02"); //Tak naprawde nie wiem. Rolka zaklecia, której nie mozna uzyc, notatka, której nie mozna odczytac i troche o oszczedzaniu....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_03"); //Pozwole sobie to zobaczyc.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_04"); //Tutaj. Rola i przekaz.

	Npc_RemoveInvItems	(hero, ItWr_TruhenNotizJG, 1);
	Npc_RemoveInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Tajemnicza rola i przekaz nadany");

	B_UseFakeScroll();

	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_05"); //A co?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_06"); //Cierpliwosc! Hmm. Wydaje mi sie, ze jest to jeden z bardzo starych jezyków. Nie potrafia czytac samodzielnie.....
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_07"); //Wtedy klucz byl wolny?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_08"); //Jaki pokój! Moze moga pomóc magicy wody.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_09"); //Studiuja starozytna historie na terenie wykopalisk.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_10"); //Oczywiscie. Pojechalismy nawet w nowe miejsce. Gdzies na pólnocnym zachodzie wyspy.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Key2_04_11"); //Trzeba mi o tym opowiedziec wiecej.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Key2_15_12"); //Wlasciwie, bede. Najpierw skontaktuj sie z Saturami. Do zobaczenia pózniej.

	CreateInvItems	(hero, ItWr_TruhenNotizJG, 1);
	CreateInvItems	(hero, ItWr_TruhenScrollJG, 1);

	B_ShowGivenThings	("Otrzymywanie tajemniczych powiedzen i przekazów");

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_JG_KEY, LOG_SUCCESS);
	Log_CreateTopic	(TOPIC_MOD_JG_SCROLL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_SCROLL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_SCROLL, "Nowy jezyk. Satura lub Riordian powinni o tym wiedziec.");
};

INSTANCE Info_Mod_Wulfgar_Opferschale (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Opferschale_Condition;
	information	= Info_Mod_Wulfgar_Opferschale_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Opferschale_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Opferschale))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Opferschale_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_00"); //Co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_01"); //Szukam czaszy ofiarniczej.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_02"); //Jaka misa ofiarnicza?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_03"); //Na DIE. To wszystko, co wiem.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_04"); //Hm. Z Adanosem! Khorinis jest duzy. Nie masz pojecia?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_05"); //Cóz, stara rola starego powiedzenia obiecuje pomóc w ekstremalnych trudnosciach. Potrzebuje czaszy ofiarniczej.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Opferschale_04_06"); //Nie wiem o tym. Zobacze swoje ksiazki. Zajmie to kilka dni.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Opferschale_15_07"); //I szukam nowych ludzi.....

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_JG_OPFERSCHALE, "Cyrco i Wulfgar nie wiedza nic o pocisku. Wulfgar chce czytac w ksiazkach. Zajmie to kilka dni.");
};

INSTANCE Info_Mod_Wulfgar_Felle (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle_Condition;
	information	= Info_Mod_Wulfgar_Felle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jeszcze jedna rzecz. Torgan powiedzial mi, ze Twoja skóra pracuje inaczej niz zwykle.";
};

FUNC INT Info_Mod_Wulfgar_Felle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Turm2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torgan_WeicheFelle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_00"); //Jeszcze jedna rzecz. Torgan powiedzial mi, ze Twoja skóra pracuje inaczej niz zwykle.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_01"); //pride) No cóz, to prawda. Po pewnym czasie nie bedziesz juz tak sztywny.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_02"); //Oczywiscie nie nadaje sie juz do pancerza i tak dalej.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle_15_03"); //Ciekawe! A jak....?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle_04_04"); //Przyjedz ze mna. Prosze pozwolic mi pokazac.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GERBEN");
};

INSTANCE Info_Mod_Wulfgar_Felle2 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle2_Condition;
	information	= Info_Mod_Wulfgar_Felle2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle2_Info()
{
	if (Npc_HasItems (self,ItMi_Scoop) == 0)
	{
		CreateInvItem (self,ItMi_Scoop);				
	};

	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob (self, "CAULDRON", 1);
	};

	AI_UseMob	(self, "CAULDRON", -1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_00"); //Opy. Potrzebuje nowej wody.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_01"); //Uh-huh. A teraz mam....
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle2_04_02"); //Na pewno tak. Najlepiej w lesie w poblizu malego stawu. Tu zabierz kubelek z soba.

	B_GiveInvItems	(self, hero, ItMi_Eimer, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle2_15_03"); //Wszystkie sluszne, wszystkie sluszne.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar chce mi pokazac jak wlasciwie opalac skóre. Z Tümeplu mam tu w lesie dostac wode z Tümeplu.");
};

INSTANCE Info_Mod_Wulfgar_Felle3 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle3_Condition;
	information	= Info_Mod_Wulfgar_Felle3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle2))
	&& (Npc_GetDistToWP(self, "JL_15") < 300)
	&& (Npc_HasItems(hero, ItMi_EimerW) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle3_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_00"); //Ah. Och, tam jestescie. Daj mi wode.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_01"); //Prosze kapitan. A co teraz?

	B_GiveInvItems	(hero, self, ItMi_EimerW, 1);

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_02"); //Teraz najpierw musze ogrzac kociol. Do tej pory na górze, na pietrze sa chowani mysliwi.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_03"); //Aha! Czy cos szczególnego?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle3_04_04"); //Wolf czy wojna jest dobra.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle3_15_05"); //Bede sie spieszyc.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Skóry z obozu mysliwskiego mam dostac i przywiezc Wulfgar. Wolf lub Wargfell.");

	B_StartOtherRoutine	(self, "KOCHEN");
};

INSTANCE Info_Mod_Wulfgar_Felle4 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle4_Condition;
	information	= Info_Mod_Wulfgar_Felle4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Teraz jednak..... Co musisz zrobic?";
};

FUNC INT Info_Mod_Wulfgar_Felle4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Baldur_Felle))
	&& (Npc_HasItems(hero, ItAt_Wolffur) >= 5)
	&& (Npc_HasItems(hero, ItAt_WargFur) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle4_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_00"); //Teraz jednak..... Co musisz zrobic?

	Npc_RemoveInvItems	(hero, ItAt_Wolffur, 5);
	Npc_RemoveInvItems	(hero, ItAt_WargFur, 5);

	B_ShowGivenThings	("5 Skóry i skóry ostrzegawcze");

	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_01"); //Wlasciwie, wyjasnie to Tobie.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_02"); //Na wierzch postawic duzy czajnik slonej wody i dodac pól butelki alu i troche boru.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_03"); //Rozgrzac i dobrze wymieszac.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_04"); //Do czasu az solanka, która jest nazwa tego nieapetycznego bulionu, zostanie podgrzana, oskrobana ostrym miesem nozem, miesnie i skóra podskórna z siersci i dokladnie umyta.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_05"); //Powinien byles byc rzeznikiem.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_06"); //Cisza. Jesli jest calkowicie czysta wewnatrz, futro dostaje sie do czajnika.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_07"); //Wtedy czesto przechadzasz sie po nim energicznie. W miedzyczasie dodaje kore swierkowa lub debowa.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_08"); //Ten bulion zapobiega pózniejszemu utwardzaniu sie powloki.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_09"); //Po dziesieciu godzinach rozciagam futro na ramie, aby wyschnac.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_10"); //Zanim jest calkowicie suchy, wcieram go dokladnie tluszczem molowym, aby utrzymac go w jedrnosci.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_11"); //Widzisz, to duzo pracy.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_12"); //Z Adanosem! Kto za to placi?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_13"); //Hi, hi, hi, hi, hi. Kto moze sobie na to pozwolic. Ale dostajesz go za darmo. Jutro bedzie gotowy.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_14"); //Mistrz?
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle4_04_15"); //Zrobiles juz dla nas wiele.
	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle4_15_16"); //Dziekuje, do zobaczenia jutro.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Druid daje mi przytulne futro. Jutro bedzie gotowy.");

	Mod_JG_WulfgarFell_Day = Wld_GetDay();

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Wulfgar_Felle5 (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Felle5_Condition;
	information	= Info_Mod_Wulfgar_Felle5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Felle5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Felle4))
	&& (Wld_GetDay() > Mod_JG_WulfgarFell_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Felle5_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Felle5_04_00"); //Wracasz nareszcie. Kurtka jest gotowa. Tutaj ja masz.

	B_GiveInvItems	(self, hero, ItMi_Kuschelfell, 1);

	AI_Output(hero, self, "Info_Mod_Wulfgar_Felle5_15_01"); //Dzieki. Wyglada bardzo miekko.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar dal mi teraz gotowe, przytulne futro. Moge ja teraz zabrac do strazy wiezy.");

	B_GivePlayerXP	(100);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Wulfgar_Khorgor (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Khorgor_Condition;
	information	= Info_Mod_Wulfgar_Khorgor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wulfgar_Khorgor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Khorgor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Khorgor_Info()
{
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_00"); //Czy to wlasnie Khorgor?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_01"); //Oczywiscie. Nie bylo to latwe. Jednak z pomoca smoka bylem w stanie wyeliminowac to zlo.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_02"); //Mówisz, ze smok?
	AI_Output(hero, self, "Info_Mod_Wulfgar_Khorgor_15_03"); //Tak. Smok wodny. On jest milym facetem, po tym jak uratowalem go od pragnienia.
	AI_Output(self, hero, "Info_Mod_Wulfgar_Khorgor_04_04"); //Z Adanosem!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Wulfgar_Lernen_MANA (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Lernen_MANA_Condition;
	information	= Info_Mod_Wulfgar_Lernen_MANA_Info;
	permanent	= 1;
	important	= 0;
	description	= "Chce zwiekszyc swoja magiczna moc.";
};

FUNC INT Info_Mod_Wulfgar_Lernen_MANA_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	&& (hero.attribute[ATR_MANA_MAX]	<=	300)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_Info()
{
	AI_Output(hero, self, "Info_Mod_Wulfgar_Lernen_MANA_15_00"); //Chce zwiekszyc swoja magiczna moc.

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_BACK()
{
	if (hero.attribute[ATR_MANA_MAX] >= 300)
	{
		AI_Output(self, hero, "Info_Mod_Wulfgar_Lernen_MANA_BACK_04_01"); //Twoje magiczne umiejetnosci sa teraz tak dobre, ze nie moge cie niczego nauczyc.
	};

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

FUNC VOID Info_Mod_Wulfgar_Lernen_MANA_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Wulfgar_Lernen_MANA);

	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, DIALOG_BACK, Info_Mod_Wulfgar_Lernen_MANA_BACK);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Wulfgar_Lernen_MANA_5);
	Info_AddChoice		(Info_Mod_Wulfgar_Lernen_MANA, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Wulfgar_Lernen_MANA_1);
};

INSTANCE Info_Mod_Wulfgar_Trade (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Trade_Condition;
	information	= Info_Mod_Wulfgar_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Wulfgar_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hey))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wulfgar_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Wulfgar_Pickpocket (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_Pickpocket_Condition;
	information	= Info_Mod_Wulfgar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Wulfgar_Pickpocket_Condition()
{
	C_Beklauen	(147, ItPo_Mana_Addon_04, 1);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_BACK, Info_Mod_Wulfgar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wulfgar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Wulfgar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Wulfgar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Wulfgar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Wulfgar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Wulfgar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Wulfgar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Wulfgar_EXIT (C_INFO)
{
	npc		= Mod_7436_JG_Wulfgar_MT;
	nr		= 1;
	condition	= Info_Mod_Wulfgar_EXIT_Condition;
	information	= Info_Mod_Wulfgar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wulfgar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
