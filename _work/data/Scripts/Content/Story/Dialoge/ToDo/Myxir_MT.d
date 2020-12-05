INSTANCE Info_Mod_Myxir_Irdorath (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath_Condition;
	information	= Info_Mod_Myxir_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce udac sie ze statkiem do enklawy Xeres do....";
};

FUNC INT Info_Mod_Myxir_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_00"); //Chce udac sie ze statkiem do enklawy Xeres do....
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_01"); //Co, co w krainie glebokiej ciemnosci, obrzydliwe bluznierstwo......
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath_15_02"); //Cóz, chodzi o zapisanie....
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath_28_03"); //(przerwanie bez sluchania) i artefakty ciemnej magii? Cudowny.
};

INSTANCE Info_Mod_Myxir_Irdorath2 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath2_Condition;
	information	= Info_Mod_Myxir_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oh, zdarza mi sie, ze mam miejsce na pokladzie....";
};

FUNC INT Info_Mod_Myxir_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath2_15_00"); //(zdziwiony) Oh, zdarza mi sie miec miejsce na pokladzie.....
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath2_28_01"); //Wspaniale, pojade wtedy do portu.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "No cóz, nie potrzebowalem zbyt wiele perswazji z Myxirem.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_Irdorath3 (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Irdorath3_Condition;
	information	= Info_Mod_Myxir_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Byc moze móglbym miec jeszcze miejsce na pokladzie.";
};

FUNC INT Info_Mod_Myxir_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_MyxirDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Irdorath3_15_00"); //Byc moze móglbym miec jeszcze miejsce na pokladzie. Koszty tego przedsiewziecia sa jednak znaczne....
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_01"); //Oh, zloto nie moze przewazyc nad mozliwosciami, jakie oferuje.
	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_02"); //Mysle, ze powinno to byc sprawiedliwe w odniesieniu do wydatków.

	B_ShowGivenThings	("300 zlota, rolka zaklecia, 2 butelki krwi i 4 zakonserwowane miazsz zombie.");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItSc_Armyofdarkness, 1);
	CreateInvItems	(hero, ItPo_Blood, 2);
	CreateInvItems	(hero, ItFoMuttonZombie, 4);

	AI_Output(self, hero, "Info_Mod_Myxir_Irdorath3_28_03"); //Nastepnie udam sie do portu.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "No cóz, nie potrzebowalem zbyt wiele perswazji z Myxirem.");

	B_GivePlayerXP	(100);

	Mod_MyxirDabei = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Myxir_GotoIgnaz (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_GotoIgnaz_Condition;
	information	= Info_Mod_Myxir_GotoIgnaz_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Myxir_GotoIgnaz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_HabAxt))
	&& ((Mod_Gilde == 13)
	|| (Mod_Gilde == 15))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_GotoIgnaz_Info()
{
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_00"); //Ach, jestes dla mnie wygodny. Mam dla ciebie cos do zrobienia!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_01"); //Czym jest tym razem?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_02"); //Szukam cennej bizuterii; starozytny amulet wypelniony sila Inno.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_03"); //Mozemy byc w stanie szantazowac klasztor i dowiedziec sie cennych informacji o jego magii!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_04"); //Gdzie chcesz, abym zaczal szukac?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_05"); //Mówi sie, ze jakis czas temu amulet zostal kupiony przez starego zdezorientowanego alchemika. Glupiec nosi nazwe Ignaz. Mieszka w dzielnicy portowej miasta Khorini.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_06"); //Idz do niego i przynos mi artefakt!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_07"); //Co mam zrobic z Ignazem?
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_08"); //To jest w twoich rekach!
	AI_Output(hero, self, "Info_Mod_Myxir_GotoIgnaz_15_09"); //Dobre.
	AI_Output(self, hero, "Info_Mod_Myxir_GotoIgnaz_28_10"); //(wytrzymalosc) Idz teraz!

	Mod_584_NONE_Ignaz_NW.attribute[ATR_HITPOINTS] = 1;

	Log_CreateTopic	(TOPIC_MOD_BEL_SUCHE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Myxir chce, bym go otrzymal stary amulet Ignacego.");
};

INSTANCE Info_Mod_Myxir_Amulett (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Amulett_Condition;
	information	= Info_Mod_Myxir_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam amulet.";
};

FUNC INT Info_Mod_Myxir_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_UntoterNovize_01_Hi))
	&& (Npc_HasItems(hero, ItAm_GardeInnos) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_00"); //Mam amulet.

	B_GiveInvItems	(hero, self, ItAm_GardeInnos, 1);

	Npc_RemoveInvItems	(self, ItAm_GardeInnos, 1);

	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_01"); //Dlaczego jest otwarta?
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_02"); //Kilku nieumarlych nowicjuszy wzielo go od Ignacego i zamordowalo. Poszedlem za nimi do kamiennego kola w duzym lesie, gdzie odbyli rytual.
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_03"); //Jeden z nieumarlych blota, który wrócil do dawnej strazy i chcial zniszczyc Beliara.
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_04"); //Co? To jest katastrofa. Idz do Xardas i zglos sie do niego!
	AI_Output(hero, self, "Info_Mod_Myxir_Amulett_15_05"); //Dlaczego?
	AI_Output(self, hero, "Info_Mod_Myxir_Amulett_28_06"); //Teraz!

	B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "GARDEINNOS");

	Log_CreateTopic	(TOPIC_MOD_BEL_GARDEINNOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_GARDEINNOS, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_BEL_SUCHE, TOPIC_MOD_BEL_GARDEINNOS, "Przynioslem amulet do Myxiru.", "Myxir wyslal mnie na Xardas. Sytuacja zwiazana z gwardia Innos wydaje sie powazna.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_SUCHE, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Wein (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Wein_Condition;
	information	= Info_Mod_Myxir_Wein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dostarczyc to wino z klasztoru.";
};

FUNC INT Info_Mod_Myxir_Wein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Andokai))
	&& (Npc_HasItems(hero, ItFo_KWine) >= 10)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Orlan_Gorax))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Wein_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_00"); //Mam dostarczyc to wino z klasztoru.

	B_GiveInvItems	(hero, self, ItFo_KWine, 10);
	Npc_RemoveInvItems	(self, ItFo_KWine, 10);

	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_01"); //Tak, dostawy. To kolejny wesoly wojownik laczacy sie dzis wieczorem. Zracy.
	AI_Output(hero, self, "Info_Mod_Myxir_Wein_15_02"); //Czy zrobilem cos zlego?
	AI_Output(self, hero, "Info_Mod_Myxir_Wein_28_03"); //Czy to powiedzialem? Mozesz sie teraz zdjac.

	B_LogEntry	(TOPIC_MOD_ANDOKAI_WEIN, "Dostarczylem przesylke wina do Myxiru. Nie byl bardzo szczesliwy, ale to nie jest mój problem.");
	B_SetTopicStatus	(TOPIC_MOD_ANDOKAI_WEIN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Myxir_HabDieKraeuter (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_HabDieKraeuter_Condition;
	information	= Info_Mod_Myxir_HabDieKraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Z Bodo szczerze!";
};

FUNC INT Info_Mod_Myxir_HabDieKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bodo_Krautlieferung))
	&& (Npc_HasItems(hero, MyxirsGiftpflanze) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_HabDieKraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_00"); //Z Bodo szczerze!

	var int kraeuter;
	kraeuter = Npc_HasItems(hero, MyxirsGiftpflanze);
	
	B_GiveInvItems	(hero, self, MyxirsGiftpflanze, Npc_HasItems(hero, MyxirsGiftpflanze));

	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_01"); //On moze je oszczedzic! Najwazniejsze jest to, ze znalazl wszystko, czego potrzebuje.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_02"); //(krótka pauza, zlosc) Pomyslalam! Ten bochenek znowu ulatwil!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_03"); //Wyraznie wspomnialem o dziesieciu leczniczych pakach, a on wysyla mi ziola!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_04"); //Móglbym to sobie sam zgromadzic. Poza tym zapomnial o pieciu blizniaczych kolcach!
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_05"); //W jaki sposób moge osiagnac postep w badaniach?
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_06"); //Przykro mi to slyszec. Ale czy handlujesz ze mna teraz?
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_07"); //Dopiero ja dostaje skrecone rosliny!
	AI_Output(hero, self, "Info_Mod_Myxir_HabDieKraeuter_15_08"); //To jednak nie byla nasza umowa.
	AI_Output(self, hero, "Info_Mod_Myxir_HabDieKraeuter_28_09"); //Co mi zalezy na kazdej aranzacji, huh?

	B_GivePlayerXP	(5 * kraeuter);

	Npc_RemoveInvItems	(self, MyxirsGiftpflanze, Npc_HasItems(hero, MyxirsGiftpflanze));

	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Przy dostawie roslin Bodo zrobil wiele zabiegów opadania. Myxir brakuje 10 leczniczych buds i 5 blizniaczych kregoslupów, wiec, miejmy nadzieje, bedzie mial przyjemniejszy nastrój.");

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_RestPflanzen (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_RestPflanzen_Condition;
	information	= Info_Mod_Myxir_RestPflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Do tego czasu przesylka powinna byc kompletna.";
};

FUNC INT Info_Mod_Myxir_RestPflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 10)
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_RestPflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_RestPflanzen_15_00"); //Do tego czasu przesylka powinna byc kompletna.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 10);
	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 5);

	B_ShowGivenThings	("10 leczniczych paków i 5 grzbietów blizniaczych podanych");

	AI_Output(self, hero, "Info_Mod_Myxir_RestPflanzen_28_01"); //W koncu! Moje wlosy nie sa nawet calkowicie szare!

	B_GivePlayerXP	(200);

	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Myxir_Skinner (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Skinner_Condition;
	information	= Info_Mod_Myxir_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam tu cos, czego bedziesz z niecierpliwoscia oczekiwal.";
};

FUNC INT Info_Mod_Myxir_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 20)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= 14)
	&& (Npc_HasItems(hero, ItAt_SkeletonHead) >= 4)
	&& (Npc_HasItems(hero, ItMi_Addon_Bloodwyn_Kopf) >= 2)
	&& (Npc_HasItems(hero, ItPo_Blood) >= 17)
	&& (Npc_HasItems(hero, ItFoMuttonZombie) >= 12)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_00"); //Pan demonicznych sil. Mam tu cos, czego bedziesz z niecierpliwoscia oczekiwal.

	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 20);
	Npc_RemoveInvItems	(hero, ItAt_GoblinBone, 14);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonHead, 4);
	Npc_RemoveInvItems	(hero, ItMi_Addon_Bloodwyn_Kopf, 2);
	Npc_RemoveInvItems	(hero, ItPo_Blood, 17);
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, 12);
	Npc_RemoveInvItems	(hero, ItAt_DemonHeart, 1);

	B_ShowGivenThings	("Demoniczne rzeczy podane");

	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_01"); //Cudowny. W Beliar's bede mógl wykorzystac go do mojej ohydnej pracy.
	AI_Output(hero, self, "Info_Mod_Myxir_Skinner_15_02"); //Jak to wyglada? ?
	AI_Output(self, hero, "Info_Mod_Myxir_Skinner_28_03"); //Co? Dlaczego mi to przeszkadza? Och, Twoja nagroda. Znaleziciel tych relikwii smierci i ciemnych mocy jest naprawde godny tych wladców.

	CreateInvItems	(hero, ItSc_SumWolf, 1);
	CreateInvItems	(hero, ItSc_SumDemon, 1);
	CreateInvItems	(hero, ItSc_SumGol, 1);

	B_ShowGivenThings	("Zachowanie ról powiedzen");

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Odwiedzilem Myxir i dostalem zaklecia.");
};

INSTANCE Info_Mod_Myxir_Befoerderung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Befoerderung_Condition;
	information	= Info_Mod_Myxir_Befoerderung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce byc czarujacy demonem.";
};

FUNC INT Info_Mod_Myxir_Befoerderung_Condition()
{
	if (Mod_Gilde == 13)
	&& ((Kapitel > 4)
	|| (Npc_KnowsInfo(hero, Info_Mod_Xardas_AW_Bshydal)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Befoerderung_15_00"); //Chce byc czarujacy demonem.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_01"); //Dla mnie. Juz dobrze sluzyles Beliar. Uzyskales jego laske.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_02"); //Podniose pana do rangi przywolujacego demona.
	AI_Output(self, hero, "Info_Mod_Myxir_Befoerderung_28_03"); //Oto Twoja szata.

	CreateInvItems	(self, ITAR_Xardas, 1);
	B_GiveInvItems	(self, hero, ITAR_Xardas, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Xardas);

	B_GivePlayerXP	(400);

	B_Göttergefallen(3, 5);

	Mod_Gilde = 14;

	Snd_Play ("LEVELUP");
};

INSTANCE Info_Mod_Myxir_WieGehts (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_WieGehts_Condition;
	information	= Info_Mod_Myxir_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, jak to robisz?";
};

FUNC INT Info_Mod_Myxir_WieGehts_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_WieGehts_15_00"); //Hej, jak to robisz?
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_01"); //Nie wygladaj mi tak przyjaznie, jak znamy sie na zawsze!
	AI_Output(self, hero, "Info_Mod_Myxir_WieGehts_28_02"); //To moze dzialac dla innych, ale nie dziala dla mnie.
};

INSTANCE Info_Mod_Myxir_Haendler (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Haendler_Condition;
	information	= Info_Mod_Myxir_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Moje uczucie jelit mówi mi, ze jestes urodzonym kupcem.";
};

FUNC INT Info_Mod_Myxir_Haendler_Condition()
{
	if (hero.guild == GIL_KDF)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_00"); //Moje uczucie jelit mówi mi, ze jestes urodzonym kupcem.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_01"); //W rzeczywistosci, oferujemy jeden lub dwa towary na sprzedaz.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_15_02"); //Czy handlujesz ze mna?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_28_03"); //Sprzedaje sie kazdemu, kto kiedykolwiek zrobil mi laske....

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Info_AddChoice	(Info_Mod_Myxir_Haendler, "To znów ta sama stara historia. Nie ze mna!", Info_Mod_Myxir_Haendler_B);
	Info_AddChoice	(Info_Mod_Myxir_Haendler, "I jak moze wygladac taka laska?", Info_Mod_Myxir_Haendler_A);
};

FUNC VOID Info_Mod_Myxir_Haendler_B()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_B_15_00"); //To znów ta sama stara historia. Nie ze mna!

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);
};

FUNC VOID Info_Mod_Myxir_Haendler_A()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_00"); //I jak moze wygladac taka laska?
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_01"); //Wyslalem Bodo, zeby zebral ziola.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_02"); //Na prosbe Xardasa przebywal on jednak obecnie w Khorinis, aby dowiedziec sie o obecnej sytuacji. I czekam na moje rosliny.
	AI_Output(hero, self, "Info_Mod_Myxir_Haendler_A_15_03"); //Pamietam to, kiedy go zobacze.
	AI_Output(self, hero, "Info_Mod_Myxir_Haendler_A_28_04"); //Powinienes byc. Dostawa do klasztoru i tak juz dziala bardzo zle, wiec nie potrzebuje wiecej opóznien.

	Info_ClearChoices	(Info_Mod_Myxir_Haendler);

	Log_CreateTopic	(TOPIC_MOD_GIFTPFLANZEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_GIFTPFLANZEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_GIFTPFLANZEN, "Jesli chce handlowac z Myxirem, musze zrobic mu najpierw laske: Bodo w miescie ma dostawe roslin, na które czeka Myxir.");

	Mod_MyxirsKraeuter = 0;
	Mod_KenntBodo = 1;

	Mod_MyxirsAuftragOK = 1;
};

INSTANCE Info_Mod_Myxir_Schattenlaeuferhorn (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Schattenlaeuferhorn_Condition;
	information	= Info_Mod_Myxir_Schattenlaeuferhorn_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wspomnial pan wczesniej, ze opieka nad klasztorem (....). )";
};

FUNC INT Info_Mod_Myxir_Schattenlaeuferhorn_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Schattenlaeuferhorn_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Schattenlaeuferhorn_15_00"); //Wspomnial pan wczesniej, ze zaopatrzenie klasztoru ulega stagnacji.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_01"); //Tak, to glównie z powodu naszego niewiarygodnego poslannika.
	AI_Output(self, hero, "Info_Mod_Myxir_Schattenlaeuferhorn_28_02"); //Scar moze Ci powiedziec cos lub dwie rzeczy o tym.
};

INSTANCE Info_Mod_Myxir_Scar (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Scar_Condition;
	information	= Info_Mod_Myxir_Scar_Info;
	permanent	= 0;
	important	= 0;
	description	= "A co z Scar?";
};

FUNC INT Info_Mod_Myxir_Scar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Schattenlaeuferhorn))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Scar_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Scar_15_00"); //A co z Scar?
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_01"); //Zajmuje sie nie tylko mieczami, ale takze trofeami.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_02"); //Ale Bartok, którego poslal, nie jest juz w poblizu.
	AI_Output(self, hero, "Info_Mod_Myxir_Scar_28_03"); //Moze sie odszedl, kto wie?
};

INSTANCE Info_Mod_Myxir_Ruestung (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Ruestung_Condition;
	information	= Info_Mod_Myxir_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy moge uzyskac od Ciebie lepsza zbroje?";
};

FUNC INT Info_Mod_Myxir_Ruestung_Condition()
{
	if (Mod_Gilde == 13)
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_HabDieKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_15_00"); //Czy moge uzyskac od Ciebie lepsza zbroje?

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	&& (Mod_Gilde == 13)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_28_01"); //Slyszalem, ze w drodze do wodnego miejsca wykopaliska maga wodnego ma byc koszmar. Z jego futrem z pewnoscia móglbym troche poprawic swoja czarna magiczna szate.
	
		Mod_ZweiteVerbesserung = TRUE;

		Log_CreateTopic	(TOPIC_MOD_RUESTUNGSUPGADSE, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_RUESTUNGSUPGADSE, "W drodze do wodnego miejsca wykopalisk maga znajdzie sie koszmar, którego futrzarski myr moze uzyc do poprawy mojej czarnej magicznej szaty.");
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
	Info_AddChoice	(Info_Mod_Myxir_Ruestung, DIALOG_BACK, Info_Mod_Myxir_Ruestung_BACK);

	if (Mod_ZweiteVerbesserung == TRUE)
	&& (Mod_Gilde == 13)
	{
		Info_AddChoice	(Info_Mod_Myxir_Ruestung, "Poprawic czarny szablon Robe", Info_Mod_Myxir_Ruestung_KDS_S);
	};
};

FUNC VOID Info_Mod_Myxir_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

FUNC VOID Info_Mod_Myxir_Ruestung_KDS_S ()
{
	AI_Output(hero, self, "Info_Mod_Myxir_Ruestung_KDS_S_15_00"); //Wzmocnij moja czarna magiczna szate.

	if (Npc_HasItems(hero, ItAt_NightmareFur) == 1)
	&& (Npc_HasItems(hero, SChwarzmagierrobe) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_KDS_S_28_01"); //Wszystko jasne.

		Npc_RemoveInvItems	(hero, ItAt_NightmareFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, SChwarzmagierrobe, 1);

		CreateInvItems	(self, ItAr_KDS_S, 1);

		B_GiveInvItems	(self, hero, ItAr_KDS_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_KDS_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, Schwarzmagierrobe) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_02"); //Musisz miec czarna szate czarnej magicznej sukienki lub nie bede w stanie naprawic jej dla ciebie.
	}
	else if (Npc_HasItems(hero, ItAt_NightmareFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Myxir_Ruestung_SKR_S_28_03"); //Jesli nie masz koszmarnego plaszcza, nie moge poprawic szaty.
	};

	Info_ClearChoices	(Info_Mod_Myxir_Ruestung);
};

INSTANCE Info_Mod_Myxir_Lehrer (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Lehrer_Condition;
	information	= Info_Mod_Myxir_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie czegos nauczyc?";
};

FUNC INT Info_Mod_Myxir_Lehrer_Condition()
{
	if ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Myxir_Lehrer_28_01"); //Moge pokazac wam, jak pobierac krew od zabitych.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_BELIARFESTUNG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_BELIARFESTUNG, "Myxir moze mi pokazac, jak pobierac krew od zmarlych ludzi.");
};

INSTANCE Info_Mod_Myxir_Blut (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Blut_Condition;
	information	= Info_Mod_Myxir_Blut_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie, jak przyciagac ludzka krew! (1 LP)";
};

FUNC INT Info_Mod_Myxir_Blut_Condition()
{
	Info_Mod_Myxir_Blut.description = B_BuildLearnString("Naucz mnie, jak przyciagac ludzka krew!", B_GetLearnCostTalent(hero, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Blood));

	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Lehrer))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood] == FALSE)
	&& ((Mod_Gilde == 12)
	|| (Mod_Gilde == 13)
	|| (Mod_Gilde == 14)
	|| (Mod_Gilde == 15)
	|| (Mod_Gilde == 16))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Blut_Info()
{
	AI_Output (hero, self, "Info_Mod_Myxir_Blut_15_00"); //Naucz mnie, jak przyciagac ludzka krew!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Blood))
	{
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_01"); //Dobre. Posluchaj. To w zasadzie calkiem proste.
		AI_Output (self, other, "Info_Mod_Myxir_Blut_28_02"); //Wez ostre ostrze i przeciac swoja ofiare gdzies, najlepiej na aorty. Nastepnie trzymasz butelke pod spodem i pobierasz krew.
	};
};

INSTANCE Info_Mod_Myxir_Trade (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Trade_Condition;
	information	= Info_Mod_Myxir_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Myxir_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_RestPflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Myxir_Pickpocket (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_Pickpocket_Condition;
	information	= Info_Mod_Myxir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Myxir_Pickpocket_Condition()
{
	C_Beklauen	(100, ItPl_Speed_Herb_01, 3);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_BACK, Info_Mod_Myxir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Myxir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Myxir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Myxir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Myxir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Myxir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Myxir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Myxir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Myxir_EXIT (C_INFO)
{
	npc		= Mod_515_KDS_Myxir_MT;
	nr		= 1;
	condition	= Info_Mod_Myxir_EXIT_Condition;
	information	= Info_Mod_Myxir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
