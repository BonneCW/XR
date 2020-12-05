var int Bennet_Saebel_Repariert;

INSTANCE Info_Mod_Bennet_Hi (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Hi_Condition;
	information	= Info_Mod_Bennet_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj, kowal. Jak dziala?";
};

FUNC INT Info_Mod_Bennet_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Hi_15_00"); //Witaj, kowal. Jak dziala?
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_01"); //Moje imie Bennet. I jak to sie dzieje, mozna sie domyslac, kiedy rozejrzysz sie dookola.
	AI_Output(self, hero, "Info_Mod_Bennet_Hi_30_02"); //Malo kto nosi tu bron lub zbroje, która nie pochodzi ode mnie.
};

INSTANCE Info_Mod_Bennet_Haendler (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Haendler_Condition;
	information	= Info_Mod_Bennet_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sprzedajesz akcesoria do kucia?";
};

FUNC INT Info_Mod_Bennet_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Haendler_15_00"); //Sprzedajesz akcesoria do kucia?
	AI_Output(self, hero, "Info_Mod_Bennet_Haendler_30_01"); //Tylko co moge oszczedzac. Jesli zawsze czegos brakuje, jest to zaopatrzenie.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Bennet jest kowalem na farmie i jestem pewien, ze moze mi cos sprzedac.");
};

INSTANCE Info_Mod_Bennet_DerHof (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_DerHof_Condition;
	information	= Info_Mod_Bennet_DerHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak ci sie podoba podwórko?";
};

FUNC INT Info_Mod_Bennet_DerHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_DerHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_DerHof_15_00"); //Jak ci sie podoba podwórko?
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_01"); //Jestem bardzo zadowolony z mojego miejsca tutaj. Ale powiedz mi, Onar jest prawdziwym tylkiem.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_02"); //Chcialbym go pokonac plaska strona mojego ostrza.
	AI_Output(self, hero, "Info_Mod_Bennet_DerHof_30_03"); //Juz zasugerowalem to Laresowi. Ale on uwaza, ze lepiej bym tego nie zrobil.
};

INSTANCE Info_Mod_Bennet_Irdorath (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath_Condition;
	information	= Info_Mod_Bennet_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mistrz kow....";
};

FUNC INT Info_Mod_Bennet_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_00"); //Mistrz kow....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_01"); //Kowal mistrzowie? Nie mów tak puffy.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_02"); //Czego chcesz? Kup pistolety? Jesli nie, wyjdz z tego miejsca.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_03"); //Mam wiele pracy do wykonania i prawie nie mam materialu uzytecznego.
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath_15_04"); //Wlasciwie chcialem zabrac statek Paladina na wyspe i mialem nadzieje, ze na pokladzie bede mial wykwalifikowanego kowala.... Wiecej
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_05"); //Podróz oceanem? Nah, Onar chcialby mnie ociagnac, gdyby wiedzial cos o zegludze morskiej.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_06"); //Wciaz mam jeszcze kilka sztuk broni do podkuwania, ale nie mam wystarczajaco duzo surowców.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_07"); //Gdybym tylko mial 15 rudy i co najmniej 20 zardzewialy miecze. Móglbym cos z tego zrobic.....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath_30_08"); //Czlowiek, kiedy mysle o tym, ile drogich surowców pochowany jest w grobach za kaplica......

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "No cóz, Bennet wciaz musi robic miecze. Zarzuca, ze ma zbyt malo surowca, potrzebuje co najmniej 15 rudy i 20 zardzewialych mieczy, podczas gdy tak wiele lezy w grobach za podwórkiem.");
};

INSTANCE Info_Mod_Bennet_Irdorath2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath2_Condition;
	information	= Info_Mod_Bennet_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam rude i zardzewiale miecze....";
};

FUNC INT Info_Mod_Bennet_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath2_15_00"); //Mam rude i zardzewiale miecze....
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_01"); //Co tak naprawde? Czego oczekujesz?
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_02"); //Ach, tak, powiedziales cos o podrózy morskiej.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath2_30_03"); //Jesli dasz mi ubrania i dajesz mi dzien na wlozenie mieczy, przyjde na poklad. Co mówisz?
};

INSTANCE Info_Mod_Bennet_Irdorath3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath3_Condition;
	information	= Info_Mod_Bennet_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oczywiscie, oto czego potrzebujesz.... i witamy na pokladzie.";
};

FUNC INT Info_Mod_Bennet_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath2))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 20)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath3_15_00"); //Oczywiscie, oto czego potrzebujesz.... i witamy na pokladzie.

	B_ShowGivenThings	("15 rudy rudy i 20 zardzewialych mieczy");

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, 20);

	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath3_30_01"); //No na pewno, bardzo dziekuje. Do zobaczenia jutro w porcie.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Z Bennetem mielibysmy kowal na pokladzie.");

	B_GivePlayerXP	(300);

	Mod_BennetSchiffTag = Wld_GetDay();
	Mod_BennetDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bennet_Irdorath4 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Irdorath4_Condition;
	information	= Info_Mod_Bennet_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Przykro mi, ale wydaje mi sie, ze jest nas zbyt wiele.";
};

FUNC INT Info_Mod_Bennet_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Irdorath3))
	&& (Mod_Irdorath == 0)
	&& (Mod_BennetDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Irdorath4_15_00"); //Przykro mi, ale wydaje mi sie, ze jest nas zbyt wiele. Nie moge cie zabrac ze soba.
	AI_Output(self, hero, "Info_Mod_Bennet_Irdorath4_30_01"); //Zbyt zle. Wróce wtedy.

	Mod_BennetDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Bennet_Gildenwaffe (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Gildenwaffe_Condition;
	information	= Info_Mod_Bennet_Gildenwaffe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie pistolet?";
};

FUNC INT Info_Mod_Bennet_Gildenwaffe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Gildenwaffe_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Gildenwaffe_15_00"); //Masz dla mnie pistolet?
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_01"); //Widze, ze jestes najemnikiem równiez teraz.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_02"); //Wtedy masz prawo do tego samego pakietu, co inni nowicjusze.
	AI_Output(self, hero, "Info_Mod_Bennet_Gildenwaffe_30_03"); //Oto jedna reka, dwie rece i kokardka.

	B_ShowGivenThings	("Szorstki krótki miecz, gruba siekiera i luk zachowany");

	CreateInvItems	(hero, ItMw_GrobesKurzschwert, 1);
	CreateInvItems	(hero, ItMw_2h_Sld_Axe, 1);
	CreateInvItems	(hero, ItRw_Sld_Bow, 1);
};

INSTANCE Info_Mod_Bennet_Piraten (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Piraten_Condition;
	information	= Info_Mod_Bennet_Piraten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam szable tu do pracy.";
};

FUNC INT Info_Mod_Bennet_Piraten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Aufgabe))
	&& (Npc_HasItems(hero, ItMw_Piratensaebel_Greg) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Piraten_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_00"); //Mam szable tu do pracy.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_01"); //Pokaz mnie, chlopaka.

	B_GiveInvItems	(hero, self, ItMw_Piratensaebel_Greg, 1);

	AI_UnequipWeapons	(self);

	EquipWeapon	(self, ItMw_Piratensaebel_Greg);

	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_02"); //Tak. Lagodna praca! To wlasnie lubie robic.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_03"); //A co to kosztuje?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_04"); //Najlepiej nic.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_05"); //Nic w ogóle nie ma?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_06"); //Bo to wlasnie chcialbym zachowac.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_07"); //Brak mozliwosci. Mój szef sciga mnie nad deska.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_08"); //Hm....

	AI_UnequipWeapons	(self);
	EquipItem	(self, ItMw_Piratensaebel_Greg);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_09"); //Zrobie ci umowe.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_10"); //I co to jest?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_11"); //Twój szef dostaje bron, która jest dwa razy bardziej stabilna i trzy razy ostra niz wszystko, co kiedykolwiek sie kreci.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_12"); //Idz i zapytaj go.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_13"); //Nie uwierzy w to. Tak tez i ja, nawiasem mówiac. Jak to robisz?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_14"); //Wyjasnie to Tobie. Ale nie mów nikomu.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_15"); //Cóz, to byl raczej przypadek. Zawsze mam wanny z tluszczem trzonowym. Bede smarowal pistolety, gdy beda gotowe.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_16"); //Teraz pewnego dnia kubelek tu sie wyróznialem i zamoczylem czesc w tluszczu zamiast wiadra na wode, zeby go omylkowo schlodzic.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_17"); //a sposób, w jaki wyciagam miecz jest czarny jak noc.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_18"); //A co wiec?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_19"); //Wtedy zdalem sobie sprawe, ze znacznie trudniej jest mi uderzyc w mlot.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_20"); //Wzielam ciezszy mlot i poszlam dalej. Na koniec sam ja przecinam.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_21"); //Ostre jak brzytwa, powiadam wam! Nigdy nie widzialem niczego takiego jak ja sam.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_22"); //Nie. Gdzie to jest?
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_23"); //Zawsze mam to przy sobie.
	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_24"); //Wiesz cos wiesz? Dam tylko miecz.

	B_GiveInvItems	(self, hero, ItMw_BennetGreg, 1);

	AI_Output(self, hero, "Info_Mod_Bennet_Piraten_30_25"); //Niech twój szef zobaczy dla siebie.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_26"); //Musisz duzo dbac o stary ostrze.
	AI_Output(hero, self, "Info_Mod_Bennet_Piraten_15_27"); //Cóz, mysle, ze to jest to, co mozesz zrobic.

	B_LogEntry	(TOPIC_MOD_GREG_ROST, "Bennet dal mi wyjatkowy miecz w zamian za szable Greg. Wydaje sie byc bardzo stabilny i ostry. Mam nadzieje, ze Greg jest zadowolony.");
};

INSTANCE Info_Mod_Bennet_Blutkelch (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch_Condition;
	information	= Info_Mod_Bennet_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mówia, ze robicie tez specjalne narzedzia.";
};

FUNC INT Info_Mod_Bennet_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_00"); //Mówia, ze robicie tez specjalne narzedzia.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_01"); //Bylo dobrze. Obecnie pracuje na przyklad nad stala.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_02"); //Stal?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_03"); //Dokladnie. Material trzykrotnie twardszy od zwyklego zelaza.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_04"); //To dobrze. Mam tu piksekse, która jest zbyt miekka.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_05"); //Dla mnie to zaden problem. Zbuduje wam stalowy motyk.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_06"); //A kiedy moge je miec?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_07"); //Cóz, produkcja jest zmudna i tania. Do tej pory musi byc 500 zlota.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_15_08"); //Co? 500 zlota dla motyka?
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_30_09"); //Oczko stalowe! Poza tym jestem jedyna osoba, która moze ci to zrobic.

	Mod_ASS_Bennet = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);

	Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Niemniej jednak. Nie moge wydac tak wiele.", Info_Mod_Bennet_Blutkelch_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 500)
	{
		Info_AddChoice	(Info_Mod_Bennet_Blutkelch, "Oto zloto. Kiedy to sie skonczy?", Info_Mod_Bennet_Blutkelch_A);
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch_B()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_00"); //Niemniej jednak. Nie moge wydac tak wiele.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_01"); //Potem przedstawie Ci sugestie: wkrótce potrzebuje wiecej tluszczu trzonowego.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_02"); //Jesli dostaniesz do mnie 50 takich porcji, odetne ciecie 200 zlota.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_03"); //Gdzie jestem gonna dostac taka kisc? Nie moge tego zrobic razem z dealerami.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_04"); //To równiez mój problem. Powinienes zrobic to samemu.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_05"); //Jak mam to zrobic? Nie jestem rzeznikiem.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_06"); //Dokladnie. Powinienes go zapytac.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_07"); //A gdzie znalezc....
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_08"); //Slysze, ze jest jeden w Khoracie. Mieszkancy miasta placa ogromne sumy pieniedzy za wyleczona jagniecine.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_B_15_09"); //A zatem wszystko w porzadku. Mam nadzieje, ze po powrocie bede gotowy.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_B_30_10"); //Oczywiscie.

	Mod_ASS_Blutkelch3 = 4;

	Log_CreateTopic	(TOPIC_MOD_ASS_FETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_FETT, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_ASS_STAHLHACKE, TOPIC_MOD_ASS_FETT, "Znalazlem to u kowala Benneta. Jego gonna uczynila mnie stalowa motyka. Musze go jednak dostac 50 molowych tluszczów. Rzeznik w Khoracie moze pomóc.", "Potrzebuje 50 porcji tluszczu molowego na bennet. Rzeznik w Khoracie moze pomóc.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

FUNC VOID Info_Mod_Bennet_Blutkelch_A()
{
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch_A_15_00"); //Oto zloto. Kiedy to sie skonczy?

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch_A_30_01"); //Jak zwykle z nami. Wróc jutro.

	Mod_ASS_Blutkelch3 = 3;

	B_LogEntry	(TOPIC_MOD_ASS_STAHLHACKE, "Znalazlem to u kowala Benneta. Jego gonna uczynila mnie stalowa motyka. To powinno wystarczyc dla werdigrisów.");

	Info_ClearChoices	(Info_Mod_Bennet_Blutkelch);
};

INSTANCE Info_Mod_Bennet_Blutkelch2 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch2_Condition;
	information	= Info_Mod_Bennet_Blutkelch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch2_Condition()
{
	if (Mod_ASS_Blutkelch3 == 3)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch2_30_00"); //A wiec tu przychodzisz. Twój motyk jest gotowy.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch2_15_01"); //Oto Twoje zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_Blutkelch3 (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Blutkelch3_Condition;
	information	= Info_Mod_Bennet_Blutkelch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bennet_Blutkelch3_Condition()
{
	if (Mod_ASS_Blutkelch3 == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	&& (Npc_HasItems(hero, ItMi_Moleratlubric_MIS) >= 50)
	&& (Wld_GetDay() > Mod_ASS_Bennet)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Blutkelch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_00"); //A wiec tu przychodzisz. Twój motyk jest gotowy.
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_01"); //Pozwole sobie to zobaczyc.
	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_02"); //Gdzie jest moja grubosc?
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_03"); //Tutaj. Po co ci to wszystko jest potrzebne?

	B_GiveInvItems	(hero, self, ItMi_Moleratlubric_MIS, 50);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_04"); //Tajemnica handlowa....
	AI_Output(hero, self, "Info_Mod_Bennet_Blutkelch3_15_05"); //Dobrze równiez. Oto reszta zlota.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Bennet_Blutkelch3_30_06"); //Zawsze do dyspozycji.

	B_GiveInvItems	(self, hero, ItMw_Stahlhacke, 1);

	B_SetTopicStatus	(TOPIC_MOD_ASS_STAHLHACKE, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	Mod_ASS_Blutkelch3 = 5;
};

INSTANCE Info_Mod_Bennet_HaradLehrling (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_HaradLehrling_Condition;
	information	= Info_Mod_Bennet_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to sie dzieje?";
};

FUNC INT Info_Mod_Bennet_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling4))
	&& (Mod_HaradLehrling_Kampf == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Bennet_HaradLehrling_15_00"); //Jak to sie dzieje?
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_01"); //Nie tak dobrze teraz. Niech pan Beliar mnie wezmie, od wczoraj do dzis Torlof wycofal moje zamówienie.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_02"); //Teraz moge tylko kucie zbroi. Wszystko to zloto trafia teraz do Haradu.
	AI_Output(self, hero, "Info_Mod_Bennet_HaradLehrling_30_03"); //Nie chce nawet wiedziec, jaki brudny biznes zrobil, aby odebrac moja prace.
};

instance Info_Mod_Bennet_Lehrer (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Lehrer_Condition;
	information	= Info_Mod_Bennet_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy mozesz nauczyc mnie jak zakopac miecz?";
};

func int Info_Mod_Bennet_Lehrer_Condition ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Hi))
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_Lehrer_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_15_00"); //Czy mozesz nauczyc mnie jak zakopac miecz?
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_01"); //Pewne.
	AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_30_02"); //To kosztuje troche. Powiedzmy, ze 30 sztuk zlota.
	
	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "Moze pózniej.", Info_Mod_Bennet_Lehrer_Later);
	Info_AddChoice	(Info_Mod_Bennet_Lehrer, "No cóz, tutaj jest 30.", Info_Mod_Bennet_Lehrer_Pay);
};

func void Info_Mod_Bennet_Lehrer_Pay()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Pay_15_00"); //No cóz, tutaj jest 30.
	
	if (B_GiveInvItems (hero, self, ItMi_Gold, 30))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_01"); //I to bylo tanie! Zaczynamy od zaraz po przygotowaniu.
		
		Bennet_TeachCommon = 1;
		Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Bennet moze mnie nauczyc kucia.");
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_Lehrer_Pay_30_02"); //Nie rób mnie bykiem. Trzydziesci i nie mniej monet.
	};

	Info_ClearChoices (Info_Mod_Bennet_Lehrer);
};

func void Info_Mod_Bennet_Lehrer_Later()
{
	AI_Output (hero, self, "Info_Mod_Bennet_Lehrer_Later_15_00"); //Moze pózniej.

	Info_ClearChoices	(Info_Mod_Bennet_Lehrer);
};

instance Info_Mod_Bennet_KlingeSchaerfen (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_KlingeSchaerfen_Condition;
	information	= Info_Mod_Bennet_KlingeSchaerfen_Info;
	permanent	= 1;
	important	= 0;
	description	= "erc: Ostre ostrze (5 LP)";
};

func int Info_Mod_Bennet_KlingeSchaerfen_Condition ()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "erc: Ostre ostrze (500 zl)";
	}
	else
	{
		Info_Mod_Bennet_KlingeSchaerfen.description = "erc: Ostre ostrze (5 LP)";
	};

	if (Schaerfen_Perk == FALSE)
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_KlingeSchaerfen_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_KlingeSchaerfen_15_00"); //Chce nauczyc sie ostrzenia ostrzy.

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_01"); //W tym celu nalezy umiescic ostrze na szlifierce. Dziala to jednak tylko z ostra bronia.

		Schaerfen_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_KlingeSchaerfen_30_02"); //Wróc do domu, gdy bedziesz gotowy.
	};
};

instance Info_Mod_Bennet_TeachCOMMON (C_INFO)
{
	npc			= Mod_562_NONE_Bennet_NW;
	nr          = 1;
	condition	= Info_Mod_Bennet_TeachCOMMON_Condition;
	information	= Info_Mod_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Nauka kuzniania sie", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int Info_Mod_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	{
		return TRUE;
	};
};

func void Info_Mod_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "Info_Mod_Bennet_TeachCOMMON_15_00"); //Naucz mnie jak zakopac miecz!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_01"); //To proste: Zalóz sobie kawalek surowej stali, trzymaj go w ogniu, az sie rozpali.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_02"); //Nastepnie na kowadelko uderzysz w ostrze po prawej stronie.
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_03"); //Upewnic sie, ze ostrze nie jest zbyt zimne. Masz tylko kilka minut na prace nad swoja bronia....
		AI_Output (self, other, "Info_Mod_Bennet_TeachCOMMON_30_04"); //Dowiesz sie reszte - po prostu cwiczysz.
	};
};

instance Info_Mod_Bennet_WannaSmithORE (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_WannaSmithORE_Condition;
	information	= Info_Mod_Bennet_WannaSmithORE_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie jak falszowac magiczna bron rudna!";
};

func int Info_Mod_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& (hero.guild == GIL_MIL)	
	{
		return 1;
	};
};

func void Info_Mod_Bennet_WannaSmithORE_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_00"); //Naucz mnie jak falszowac magiczna bron rudna!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_01"); //Nie znasz nawet podstaw.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_02"); //Naucz sie najpierw ukuc odpowiedni miecz. Wtedy zobaczymy.
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_03"); //Cóz, juz teraz mozna wykuc odpowiedni miecz.
		AI_Output (hero, self, "Info_Mod_Bennet_WannaSmithORE_15_04"); //Cóz, idzcie naprzód,.....
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_05"); //Najwazniejsze jest wiec to, ze nie ma znaczenia, czy twoja bron jest wykonana z czystej rudy, czy tez zakrywasz zwykle stalowe ostrze warstwa rudy. Zalezy to tylko od powierzchni.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_06"); //A poniewaz to zwilzone rzeczy sa tak drogie, ze jestes gonna dostac stalowy pusty i kilka kawalków rudy.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_07"); //Oczywiscie nie wystarczy po prostu zakryc gotowego miecza ruda. Pistolet trzeba samemu podrobic.
		AI_Output (self, hero, "Info_Mod_Bennet_WannaSmithORE_30_08"); //Wszystko inne zalezy od broni, która chcesz wyprodukowac.

		Bennet_TeachSmith = 1;
	};
};

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

instance Info_Mod_Bennet_TeachSmith		(C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 30;
	condition	= Info_Mod_Bennet_TeachSmith_Condition;
	information	= Info_Mod_Bennet_TeachSmith_Info;
	permanent	= 1;
	important	= 0;
	description	= "Chce wiedziec wiecej o falszowaniu magicznej broni rudy.";
};

func int Info_Mod_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == 1)
	{
		return 1;
	};
};

func void Info_Mod_Bennet_TeachSmith_Info ()
{
	AI_Output (hero, self, "Info_Mod_Bennet_TeachSmith_15_00"); //Chce wiedziec wiecej o falszowaniu magicznej broni rudy.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		AI_Output(self, hero, "Info_Mod_Bennet_TeachSmith_30_07"); //Nie, jeszcze nie. Wróc do domu pózniej.
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_01"); //Moge nauczyc Cie kucia mieczy rudy lub nawet mieczy dwurecznych.
		Bennet_Kap2Smith = 1;
	}
	else if (Kapitel == 3)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, hero, "Info_Mod_Bennet_TeachSmith_30_02"); //Poprawilam swoja technike. Moge teraz nauczyc sie jak produkowac miecze bastardowe lub ciezkie miecze dwureczne z ruda.
		Bennet_Kap3Smith = 1;
	};
	
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
	Info_AddChoice (Info_Mod_Bennet_TeachSmith, DIALOG_BACK, Info_Mod_Bennet_TeachSmith_BACK);

	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,Info_Mod_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,Info_Mod_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,Info_Mod_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(Info_Mod_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(hero, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,Info_Mod_Bennet_TeachSmith_2hSpecial2);
	};
};

FUNC VOID Info_Mod_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (Info_Mod_Bennet_TeachSmith);
};
func VOID Info_Mod_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_01);	
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_01);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_1H_Special_02);
};
FUNC VOID Info_Mod_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, hero, WEAPON_2H_Special_02);
};

INSTANCE Info_Mod_Bennet_Trade (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Trade_Condition;
	information	= Info_Mod_Bennet_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bennet_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bennet_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bennet_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bennet_Pickpocket (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_Pickpocket_Condition;
	information	= Info_Mod_Bennet_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bennet_Pickpocket_Condition()
{
	C_Beklauen	(88, ItMiSwordraw, 6);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_BACK, Info_Mod_Bennet_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bennet_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bennet_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bennet_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bennet_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bennet_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bennet_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bennet_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bennet_EXIT (C_INFO)
{
	npc		= Mod_562_NONE_Bennet_NW;
	nr		= 1;
	condition	= Info_Mod_Bennet_EXIT_Condition;
	information	= Info_Mod_Bennet_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bennet_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bennet_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
