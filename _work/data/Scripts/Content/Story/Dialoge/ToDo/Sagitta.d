INSTANCE Info_Mod_Sagitta_Hi (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Hi_Condition;
	information	= Info_Mod_Sagitta_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sagitta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Sagitta_Hi_26_00"); //Hej, co tu robisz? Chcesz korzystac z moich uslug jako zielarz lub chcesz kupic jedna z moich eliksirów?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OHNELAGER, LOG_NOTE);
	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_HAENDLER_OHNELAGER, TOPIC_MOD_LEHRER_KHORINIS, "Sagitta sprzedaje eliksiry.", "Sagitta moze mnie uczyc alchemii.");
};

INSTANCE Info_Mod_Sagitta_AkilsHof (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_AkilsHof_Condition;
	information	= Info_Mod_Sagitta_AkilsHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mistrzyni ziolowych leków, potrzebuje twojego wsparcia.";
};

FUNC INT Info_Mod_Sagitta_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllDead))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (Mod_AkilsHofAusgestorben == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_AkilsHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_00"); //Mistrzyni ziolowych leków, potrzebuje twojego wsparcia.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_01"); //Oczywiscie, albo nie byloby cie tutaj. Co o tym chodzi?
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_02"); //Od czasu wizyty zlowieszczej figury, niektórzy ludzie w gospodarstwie Akila zapadli na chorobe i cierpia na gwaltowne zepsucie fizyczne.
	AI_Output(hero, self, "Info_Mod_Sagitta_AkilsHof_15_03"); //Obydwaj bracia szli dziko przeciwko sobie, a Ehnim byl ciezko ranny.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_04"); //Hmm, okolicznosci sklaniaja mnie do podejrzen, ze nie mamy do czynienia z codzienna choroba.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_05"); //Wydaje sie to byc rodzajem przeklenstwa, gdzie moja sztuka uzdrawiania nie ma z tym nic wspólnego.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_06"); //Najprawdopodobniej znajdziesz pomoc w klasztorze, gdzie powinienes jak najszybciej udac sie do klasztoru.
	AI_Output(self, hero, "Info_Mod_Sagitta_AkilsHof_26_07"); //To kolejna eliksir leczniczy dla Ehnim. Jego kontuzja miala byc leczona.

	B_GiveInvItems	(self, hero, ItPo_Health_06, 1);
	
	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Sagitta_Kraeuter (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter_Condition;
	information	= Info_Mod_Sagitta_Kraeuter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie nauczyc alchemii?";
};

FUNC INT Info_Mod_Sagitta_Kraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_00"); //Czy mozesz mnie nauczyc alchemii?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_01"); //Chcesz dowiedziec sie od mnie o alchemii? Co sprawia, ze myslisz o tym?

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_02"); //Wiem juz o tym i chcialbym poszerzyc swoja wiedze.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_03"); //Lubie to? To dobra przeslanka.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_04"); //Wtedy powinienes byc w stanie wykonac male zadanie, które ci wykonam bez wiekszych trudnosci.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_05"); //Cóz, moze to byc bardzo przydatne, jak sadze.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_06"); //Czy sadzisz, ze....? Brzmi to niemal jak staly pomysl.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_07"); //Nie, jesli chcesz, abym poswiecil mój czas, musisz najpierw zrobic dla mnie mala rzecz.
		AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_08"); //To pokaze, czy twoje zainteresowanie jest naprawde szczere.
	};

	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter_15_09"); //Slucham.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_10"); //Pozwól mi na muche agaric, uzdrawiajacy bud i dwie niebieskie piosenki.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter_26_11"); //Kiedy juz mnie przyniesliscie, pozwole wam przeprowadzic errand. Ale wiecej o tym pózniej.

	Log_CreateTopic	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Aby nauczyc mnie Sagitty, musze przyniesc jej pierwsze 1 muchowa agaryke, 1 leczniczy paczek i 2 niebieskie piosenki.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter2_Condition;
	information	= Info_Mod_Sagitta_Kraeuter2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem rzeczy.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter))
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= 1)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_00"); //Dostalem rzeczy.

	Npc_RemoveInvItems	(hero, ItPl_Heilknospe, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, 1);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 2);

	B_ShowGivenThings	("Leczenie paczka, muchy agar i dwóch niebieskich piosenek");

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_01"); //Dobre. Daj mi ja. Musze skonczyc rosliny przy stole alchemicznym.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_02"); //Ogladaj i ucz sie.

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_03"); //Tam, tutaj. Ten lek jest dla Sekoba. Jak zawsze, dwa lyzki stolowe rano i wieczorem.

	B_GiveInvItems	(self, hero, ItPo_SekobMedizin, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_04"); //Daje Ci troche zlota i cos dla siebie.
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter2_15_05"); //Medycyna? Czy tylko agaryczny?
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_06"); //Wydaje sie pan niewiarygodny. To nie przemawia za Toba.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_07"); //Kazdy doswiadczony alchemik powinien wiedziec, ze trucizny w malych stezeniach moga miec dzialanie lecznicze.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_08"); //Na przyklad Sekob cierpi na problemy serca, co nie jest niczym niezwyklym w przypadku cieszacej sie zla slawa osoby tolerancyjnej.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_09"); //Niewielka dawka trucizny grzybowej lagodzi jego objawy..... i wybuchy wscieklosci.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter2_26_10"); //Teraz odejdz. Wiesz, co musisz zrobic.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Teraz mam przyniesc Sekobowi medycyne agaryczna na muchy.");
};

INSTANCE Info_Mod_Sagitta_Kraeuter3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Kraeuter3_Condition;
	information	= Info_Mod_Sagitta_Kraeuter3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto Twój pakiet.";
};

FUNC INT Info_Mod_Sagitta_Kraeuter3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter2))
	&& (Npc_HasItems(hero, ItMi_SekobSagitta) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Kraeuter3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Kraeuter3_15_00"); //Oto Twój pakiet.

	B_GiveInvItems	(hero, self, ItMi_SekobSagitta, 1);

	Npc_RemoveInvItems	(self, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_26_01"); //Dobre. Spelniles swoje zadanie..... nawet jesli nie bylo to najbardziej wymagajace.
	AI_Output(self, hero, "Info_Mod_Sagitta_Kraeuter3_26_02"); //Jesli nadal jestes zainteresowany alchemia, naucze Cie teraz.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_SAGITTA_KRAEUTER, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sagitta_Irdorath (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath_Condition;
	information	= Info_Mod_Sagitta_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Musze opuscic te wyspe statkiem i potrzebowac kogos z Twoimi umiejetnosciami w mojej zalodze.";
};

FUNC INT Info_Mod_Sagitta_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_00"); //Musze opuscic te wyspe statkiem i potrzebowac kogos z Twoimi umiejetnosciami w mojej zalodze.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_01"); //Chodzi o dobre samopoczucie khorynów....
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_02"); //Co? Kto poswiecilem cale swoje zycie ziolowosci na wsi, na statku? Cóz, wymyslales pomysly....
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_03"); //Ale najpierw powiedz nam, o co chodzi w tej wycieczce.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_04"); //Zly magik próbuje podporzadkowac te wyspe i juz doznal pewnych zniszczen w dolinie Kopalni, w miescie i na farmach.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_05"); //Musimy odwiedzic pobliska wyspe, aby predzej czy pózniej zakonczyc jego machinacje.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_06"); //Co powiedziales?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_07"); //Tak, ostatnio liczba zachorowan na nietypowe choroby rosnie. Bylem odwiedzany bardziej niz kiedykolwiek wczesniej.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_08"); //Niewiele wiecej niz jeden dzien, poniewaz ludzie nie przychodza do mnie z narzekaniem i prosza o ulge w cierpieniu.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_09"); //To za duzo dla mnie....
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_10"); //Wszyscy w porzadku, jesli tylko podróz moze zakonczyc to zle dzialanie, bede wam towarzyszyl......
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_11"); //Co tak naprawde?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_12"); //Tak..... ale najpierw trzeba mnie dostac jakies rosliny..... powinny one byc w stanie znacznie zmniejszyc morzem.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_13"); //No cóz, gdzie musze chodzic?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_14"); //Nigdzie indziej.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_15"); //Jak? Co zatem?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_16"); //Wspinaczka i plywanie. Grzyb Harpienkralle rosnie tylko na golych szczytach górskich, jak sama nazwa wskazuje, w poblizu harf.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_17"); //Bedziesz musial znalezc jedno z ich gniazd, a na pewno znajdziesz poszukiwany skladnik pomiedzy ich brudem.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_18"); //W przeszlosci mówi sie, ze pochodzili oni z rodu Minentalów, ale wraz z upadkiem zapory, w górach mozna znalezc równiez harfy w poblizu Onars Hof.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_19"); //Co jeszcze jest sluszne?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_20"); //A potem trzeba dostac slona wode, która rosnie w poblizu plytkiego jeczmienia.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_21"); //Powodem jest to, ze....
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_22"); //Tak, tak, tak, ze roslina rosnie w jego smieci....
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_23"); //Co, ani, ani, ani w ogóle, dlaczego bys to pomyslal?
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_24"); //Plytkie kruszyny wodne sa ulubionym pozywieniem jego pieciometrowego kuzyna, Gierschlundleviathana, i rosna w jego wydalinach.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath_26_25"); //To, czego szukasz, mozna znalezc w plytkiej czesci portu i na malej wyspie u wybrzezy.
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath_15_26"); //Uh.... Bede wiec w drodze.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Cóz, Sagitta deklaruje swoja gotowosc do podrózy..... Musze tylko dostac jej jeszcze dwie rzeczy: zapiecie harfowe, które rosnie na szczytach górskich w portach - w dolinie kopalni i w górach wokól farmy Onar - oraz slona wode, która moglaby kielkowac gdzies w plytkich miejscach portu i na malej wyspie.");

	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_01");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_02");
	Wld_InsertItem	(ItPl_SalzwasserSprießling, "FP_ITEM_SALZWASSERSPRIESSLING_03");

	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertItem	(ItPl_Harpienkralle, "FP_ITEM_HARPIENKRALLE_02");

	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_01");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
	Wld_InsertNpc	(Harpie, "FP_ITEM_HARPIENKRALLE_02");
};

INSTANCE Info_Mod_Sagitta_Irdorath2 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath2_Condition;
	information	= Info_Mod_Sagitta_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam rosliny.";
};

FUNC INT Info_Mod_Sagitta_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath))
	&& (Mod_SagittaSS == 1)
	&& (Mod_SagittaHK == 1)
	&& (Npc_HasItems(hero, ItPl_SalzwasserSprießling) >= 1)
	&& (Npc_HasItems(hero, ItPl_Harpienkralle) >= 1)
	&& (Mod_Irdorath == 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath2_15_00"); //Mam rosliny.

	B_ShowGivenThings	("Pazur Harpie i slona woda przyplywowa");

	Npc_RemoveInvItems	(hero, ItPl_SalzwasserSprießling, 1);
	Npc_RemoveInvItems	(hero, ItPl_Harpienkralle, 1);

	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_01"); //Pozwólcie mi widziec..... faktycznie.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_02"); //Wykonal pan doskonala prace.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_03"); //Wyglada na to, ze wyprawa jest naprawde powazna.... i nie widze powodu, dla którego nie powinienem do niej dolaczyc.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath2_26_04"); //Do zobaczenia w porcie.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Sagitta byla bardzo zadowolona i czeka w porcie na poczatek podrózy.");

	B_GivePlayerXP	(300);

	Mod_SagittaDabei = 1;
	Mod_JackAL = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Sagitta_Irdorath3 (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Irdorath3_Condition;
	information	= Info_Mod_Sagitta_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Przykro mi, ale wydaje mi sie, ze jest nas zbyt wiele.";
};

FUNC INT Info_Mod_Sagitta_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_SagittaDabei == 1)
	&& (Mod_JackDabei == 0)
	&& (Mod_CedricDabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_Irdorath3_15_00"); //Przykro mi, ale wydaje mi sie, ze jest nas zbyt wiele. Nie moge cie zabrac ze soba.
	AI_Output(self, hero, "Info_Mod_Sagitta_Irdorath3_26_01"); //Zbyt zle. Wróce wtedy.

	Mod_SagittaDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Sagitta_OnarsSchnaps (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsSchnaps_Condition;
	information	= Info_Mod_Sagitta_OnarsSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Onar pil cos zlego, a teraz jest zle zdenerwowany zoladkiem.";
};

FUNC INT Info_Mod_Sagitta_OnarsSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Wasili_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsSchnaps_15_00"); //Onar pil cos zlego, a teraz jest zle zdenerwowany zoladkiem. Czy wiesz co robic?
	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsSchnaps_26_01"); //Mówisz, ze? Ten stary tani lyzwiarz? W tym przypadku leczenie kosztuje 100 zlotych monet.
};

INSTANCE Info_Mod_Sagitta_OnarsHeilmittel (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_OnarsHeilmittel_Condition;
	information	= Info_Mod_Sagitta_OnarsHeilmittel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto zloto.";
};

FUNC INT Info_Mod_Sagitta_OnarsHeilmittel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_OnarsSchnaps))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_OnarsHeilmittel_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_OnarsHeilmittel_15_00"); //Oto zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Sagitta_OnarsHeilmittel_26_01"); //Po prostu musi wypic te mieszanke ziolowa. Po krótkim czasie powinien czuc sie lepiej.

	B_GiveInvItems	(self, hero, ItPo_OnarsTrank, 1);
};

INSTANCE Info_Mod_Sagitta_MangelQuest (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_MangelQuest_Condition;
	information	= Info_Mod_Sagitta_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zakup srodka grzybobójczego (80 zl)";
};

FUNC INT Info_Mod_Sagitta_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Sagitta_Lehrer (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Lehrer_Condition;
	information	= Info_Mod_Sagitta_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie alchemii.";
};

FUNC INT Info_Mod_Sagitta_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter3))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Sagitta_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Sagitta_Lehrer_26_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
	Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,DIALOG_BACK,Info_Mod_Sagitta_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Napój lekkiego leczenia", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Sagitta_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Lekki eliksir leczniczy", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Sagitta_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Napoje szybko lecznicze", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Sagitta_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Istota uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Sagitta_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Ekstrakt z ekstraktu leczniczego", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Sagitta_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Eliksir uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Sagitta_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (Mod_LehrlingBei != 1)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Eliksir zycia", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), Info_Mod_Sagitta_Lehrer_Perm_Health);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Pic lekka mane", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Sagitta_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Eliksir lekki", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Sagitta_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Sagitta_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("ekstrakt z maneny", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Sagitta_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Sagitta_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Szybkosc", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Sagitta_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice	  (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Eliksir Ducha Swietego", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Sagitta_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 4)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Sagitta_Lehrer, B_BuildLearnString ("Skrobia Eliksir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Sagitta_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice (Info_Mod_Sagitta_Lehrer,B_BuildLearnString ("Eliksir umiejetnosci", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Sagitta_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Sagitta_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Sagitta_Lehrer);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Health()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Health);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};
FUNC VOID Info_Mod_Sagitta_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Sagitta_Trade (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Trade_Condition;
	information	= Info_Mod_Sagitta_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sagitta_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sagitta_Pickpocket (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_Pickpocket_Condition;
	information	= Info_Mod_Sagitta_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150_Female;
};

FUNC INT Info_Mod_Sagitta_Pickpocket_Condition()
{
	C_Beklauen	(130, ItPo_Gegengift, 4);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_BACK, Info_Mod_Sagitta_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sagitta_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sagitta_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sagitta_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sagitta_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sagitta_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sagitta_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sagitta_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sagitta_EXIT (C_INFO)
{
	npc		= Mod_773_NONE_Sagitta_NW;
	nr		= 1;
	condition	= Info_Mod_Sagitta_EXIT_Condition;
	information	= Info_Mod_Sagitta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sagitta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
