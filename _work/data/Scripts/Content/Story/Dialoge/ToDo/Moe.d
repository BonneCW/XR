INSTANCE Info_Mod_Moe_Hi (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Hi_Condition;
	information	= Info_Mod_Moe_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Moe_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_00"); //Obcy zwiedzajacy dzielnice portowa?
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_01"); //Wtedy nie powinienes tylko isc tutaj.
	AI_Output(hero, self, "Info_Mod_Moe_Hi_15_02"); //Jaki budynek jest za toba?
	AI_Output(self, hero, "Info_Mod_Moe_Hi_29_03"); //Jest to pub Kardifa, centrum dzielnicy portowej. Obok czerwonej latarni. (smiech) Jesli chcesz cos pic lub wiedziec, przyjdz tutaj.
};

INSTANCE Info_Mod_Moe_Geruechte (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte_Condition;
	information	= Info_Mod_Moe_Geruechte_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy sa jakies ciekawe pogloski?";
};

FUNC INT Info_Mod_Moe_Geruechte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	&& (Moe_KnowsPort == FALSE)
	&& (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_15_00"); //Czy sa jakies ciekawe pogloski?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_29_01"); //Dosc kilka, calkiem sporo. Musisz tylko wiedziec, jak oddzielic przedze zeglarza od faktów, a wtedy informacja moze nawet cos zmienic?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_29_02"); //Czy slyszeli Panstwo na przyklad o losie nieszczesnego malarza Johannesa Port?

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "Nie, to tez mnie nie obchodzi.", Info_Mod_Moe_Geruechte_B);
	Info_AddChoice	(Info_Mod_Moe_Geruechte, "Nie, powiedz mi wiecej.", Info_Mod_Moe_Geruechte_A);
};

FUNC VOID Info_Mod_Moe_Geruechte_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_B_15_00"); //Nie, to tez mnie nie obchodzi.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_B_29_01"); //Zbyt zle, moze pózniej.

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);
};

FUNC VOID Info_Mod_Moe_Geruechte_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_A_15_00"); //Nie, powiedz mi wiecej.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_01"); //Johannes Port.... ah, to byl malarz. Swiat slynie z jego malarstwa krajobrazowego. Nie ma wielu artystów, którzy osiagneli tak wielka slawe jak on w zyciu.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_02"); //W rzeczywistosci mieszkal w Myrtanie, ale poszukiwanie motywów zapedzalo go po calym swiecie. Cóz, a pod spodem byl ten, który mial byc jego ostatnim.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_03"); //Wydawalo mu sie, ze jest bardzo zainteresowany przybrzezna strefa Khorinis, ale niedawno opuscil tu kuter okretowy.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_04"); //Zaloga chciala wysunac siatki w porcie i Port chcial namalowac swoje zdjecia, ale to nie poszlo dobrze na dlugo. Statek wywrócil sie i zatonal niedaleko duzej wyspy przed portem.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_05"); //Nikt nie móglby pózniej powiedziec dlaczego, chyba ze wierzysz w historie msciwego boga morza.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_06"); //Czesc zalogi mozna bylo uratowac, ale nie bylo wsród nich portu. Jeden z marynarzy, który byl z nim, mówil mi o tym, ze Port' nen mial duza czesc swojego sprzetu i kilka gotowych obrazów z nim.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_A_29_07"); //Cóz, te skarby moga nadal znajdowac sie w wraku statku, poniewaz jak dotad nie wyslano tam do inspekcji zadnych zolnierzy, a krag ludzi, którzy wiedza o tej sprawie, jest bardzo ograniczony.

	Log_CreateTopic	(TOPIC_MOD_MOE_PORT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MOE_PORT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Kilka dni temu, z niewytlumaczalnych powodów, przed portem w Khorinis zatonal kuter. Jesli mozna uwierzyc Moe' owi, na pokladzie byl slynny malarz Johannes Port z czescia swojego sprzetu. Nikt nie wie, dokad Port zniknal, ale jego 'skarb' moze byc jeszcze na pokladzie wraku.");

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "Oznacza to, ze jest cos do zdobycia.....", Info_Mod_Moe_Geruechte_D);
	Info_AddChoice	(Info_Mod_Moe_Geruechte, "Co wiec stalo sie z Portem?", Info_Mod_Moe_Geruechte_C);
};

FUNC VOID Info_Mod_Moe_Geruechte_D()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_00"); //Oznacza to, ze jest cos do zdobycia.....
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_01"); //To moze byc....
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_02"); //Ale dlaczego o tym mówisz?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_03"); //Nie wygladasz jak jeden z tych bandytów, który przy nastepnym ogrodzeniu zamienilby zdjecia w zloto.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_04"); //Wolalbym przekazac ja ekspertowi artystycznemu. Zakladam, ze on zaplacilby duzo pieniedzy.
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_05"); //An welchen "artysci" hast du dabei gedacht?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_06"); //Brahim, sprzedawca biletów. Znajdziesz go tuz za rogiem w kierunku magazynu.
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_D_15_07"); //Dlaczego nie otrzymujesz skarbu samemu?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_D_29_08"); //Moje pelne przygód lata sie skonczyly, chlopiec. Mam wystarczajaco duzo pieniedzy, aby kupic to, czego potrzebuje. Co mam zrobic z dodatkowym podnieceniem?
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	B_LogEntry	(TOPIC_MOD_MOE_PORT, "Brahim, sprzedawca biletów w dzielnicy portowej, jest moim pierwszym punktem kontaktowym, kiedy powinienem byl znalezc skarb.");

	Moe_KnowsPort = 1;
};

FUNC VOID Info_Mod_Moe_Geruechte_C()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte_C_15_00"); //Co wiec stalo sie z Portem?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte_C_29_01"); //Nikt nie wie. Albo jego cialo znajduje sie w wraku, albo na dnie morskim, albo jest w stanie uratowac sie na ladzie stalym. Ale to malo prawdopodobne i slyszalbys o nim do tej pory.

	Info_ClearChoices	(Info_Mod_Moe_Geruechte);

	Info_AddChoice	(Info_Mod_Moe_Geruechte, "Oznacza to, ze jest cos do zdobycia.....", Info_Mod_Moe_Geruechte_D);
};

INSTANCE Info_Mod_Moe_Geruechte2 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte2_Condition;
	information	= Info_Mod_Moe_Geruechte2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_Geruechte2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Canthar_Port))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte2_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte2_29_00"); //Hej! Mam wiadomosci, które moga Cie zainteresowac.
};

INSTANCE Info_Mod_Moe_Geruechte3 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte3_Condition;
	information	= Info_Mod_Moe_Geruechte3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co wiesz o czyms nowym?";
};

FUNC INT Info_Mod_Moe_Geruechte3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte2))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte3_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_15_00"); //Co wiesz o czyms nowym?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_29_01"); //Kanthar jest z powrotem w miescie. Porwal Valentino, zamoznego as-kissera.

	Log_CreateTopic	(TOPIC_MOD_MOE_VALENTINO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MOE_VALENTINO, LOG_RUNNING);
	B_LogEntry_More	( TOPIC_MOD_CANTHAR_GESCHAEFTE, TOPIC_MOD_MOE_VALENTINO, "Canthar powrócil do mnie, jak zapowiedziano, by zemscic sie na mnie.", "Valentino zostalo porwane przez Canthara, który chce go dla mnie sprzedac. Lord Andre nie ma odwagi zrobic nic, wiec to od mnie zalezy zakonczenie sprawy.");

	B_StartOtherRoutine	(Mod_754_NONE_Valentino_NW, "TOT");
	Mod_Valentino_Kidnapped = 1;

	if (Mod_Fernando_Mitternachtsspuk == 1)
	{
		B_StartOtherRoutine	(Mod_1066_VLK_Buergerin_NW, "START");
	};

	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Valentino? Moze to utrzymac!", Info_Mod_Moe_Geruechte3_B);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Skad wiesz, ze Canthar jest porywaczem?", Info_Mod_Moe_Geruechte3_A);
};

FUNC VOID Info_Mod_Moe_Geruechte3_D()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_D_15_00"); //To nalezalo sie spodziewac.......
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_01"); //Valentino jest popularnym mezczyzna, zwlaszcza wsród kobiet i wlascicieli.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_02"); //Jesli zapotrzebowanie Canthara pojawi sie, wiekszosc ludzi prosi o wymiane - on za Ciebie.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_03"); //Pan Andre nie moze nic z tym zrobic: Cokolwiek robi, w gre wchodzi zycie.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_04"); //Nie bedzie uzywal swoich skorumpowanych strazników przed Canthar, poniewaz zna swoja sile.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_05"); //To zalezy od Ciebie. Musisz spróbowac uwolnic Valentino, aby Canthar nie mial juz w rekach dzwigni.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_D_29_06"); //Pamietajmy jednak, ze zatrzyma go to tylko na krótki czas. Pudales mu partyture, a on chce zemsty.
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Niech przyjdzie Kanthar, dla Valentino oddaje swoje zycie (....). )", Info_Mod_Moe_Geruechte3_F);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Gdzie odbywa sie impreza Valentino?", Info_Mod_Moe_Geruechte3_E);
};

FUNC VOID Info_Mod_Moe_Geruechte3_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_B_15_00"); //Valentino? Moze to utrzymac!
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_B_29_01"); //Nie chodzi o Valentino.... On chce cie!

	Info_Mod_Moe_Geruechte3_D();
};

FUNC VOID Info_Mod_Moe_Geruechte3_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_A_15_00"); //Skad wiesz, ze Canthar jest porywaczem?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_A_29_01"); //Nie prosil o wykup....
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_A_15_02"); //Co jeszcze jest z tym do czego?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_A_29_03"); //No cóz, wy.

	Info_Mod_Moe_Geruechte3_D();
};

FUNC VOID Info_Mod_Moe_Geruechte3_F()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_F_15_00"); //Nie chce, aby Canthar przyjechal, ale nie ryzykuje zycia dla Valentino.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_F_29_01"); //W takim przypadku po prostu unikasz tego, co nieuniknione. Jesli zmieniles zdanie, udaj sie do Górnej Dzielnicy i poszukaj Valentine, siostry Valentino.
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Mam udac sie do siostry Walentynki Valentino w górnej dzielnicy; moze wiedziec, gdzie brat jest przetrzymywany.");
};

FUNC VOID Info_Mod_Moe_Geruechte3_E()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_E_15_00"); //Gdzie odbywa sie impreza Valentino?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_E_29_01"); //Nie moge ci to powiedziec, ale o tym wie jego siostra Walentynka. Znajdziesz je w górnej dzielnicy.

	B_LogEntry	(TOPIC_MOD_MOE_VALENTINO, "Mam udac sie do siostry Walentynki Valentino w górnej dzielnicy; moze wiedziec, gdzie brat jest przetrzymywany.");
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);

	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Skad wiesz to wszystko o Canthar? )", Info_Mod_Moe_Geruechte3_H);
	Info_AddChoice	(Info_Mod_Moe_Geruechte3, "Dziekujemy za informacje. Jestes prawdziwa pomoca.", Info_Mod_Moe_Geruechte3_G);
};

FUNC VOID Info_Mod_Moe_Geruechte3_G()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_G_15_00"); //Dziekujemy za informacje. Jestes prawdziwa pomoca.
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_G_29_01"); //Ten gówno nalezy wreszcie zatrzymac. Kto idzie do pubu, gdy wszystkie jego myszy zostaly skradzione?
	
	Info_ClearChoices	(Info_Mod_Moe_Geruechte3);
};

FUNC VOID Info_Mod_Moe_Geruechte3_H()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte3_H_15_00"); //Skad wiesz o Cantharze i jego zwiazku ze mna?
	AI_Output(self, hero, "Info_Mod_Moe_Geruechte3_H_29_01"); //Brahim nie powstrzyma mnie. Przynajmniej nie po kilku szmatach. (smiech) Slysze reszte od podróznych.
	
	Info_Mod_Moe_Geruechte3_G();
};

INSTANCE Info_Mod_Moe_Geruechte4 (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Geruechte4_Condition;
	information	= Info_Mod_Moe_Geruechte4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pózniej moze....";
};

FUNC INT Info_Mod_Moe_Geruechte4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Moe_Geruechte3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Geruechte4_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Geruechte4_15_00"); //Pózniej moze....
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_AllievoTot (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_AllievoTot_Condition;
	information	= Info_Mod_Moe_AllievoTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Udalo mi sie uwolnic Valentino i zatrudnic ucznia z Canthara.";
};

FUNC INT Info_Mod_Moe_AllievoTot_Condition()
{
	if (Mod_Allievo_Zusatzpower == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_AllievoTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_00"); //Udalo mi sie uwolnic Valentino i zatrudnic ucznia z Canthara.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_01"); //Slyszalem juz o Valentino, ale jaki to uczen?
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_02"); //Nazywal sie Allievo.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_03"); //Alievo? Damn to, jesli nie przyniesie Ci to zadnych klopotów....
	AI_Output(hero, self, "Info_Mod_Moe_AllievoTot_15_04"); //Dlaczego mialaby to zrobic?
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_05"); //Mówia, ze Allievo byl synem Kanthara. Prawdopodobnie znalazles sie teraz na jego liscie przebojów, jesli nadal jest to mozliwe.
	AI_Output(self, hero, "Info_Mod_Moe_AllievoTot_29_06"); //Wiec, obserwuj tylek. Daje Wam znac, kiedy dostaje cos nowego.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_CANTHAR_GESCHAEFTE, "Oh..... Gdyby Allievo byl naprawde synem Kanthara, byloby jeszcze wiecej klopotów..... Od teraz powinienem byc naprawde ostrozny.");
	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_AufgebrachteFrau (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_AufgebrachteFrau_Condition;
	information	= Info_Mod_Moe_AufgebrachteFrau_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy zdarza Ci sie wiedziec, dlaczego nagle nazywa sie mnie rzeznikiem na otwartej drodze?";
};

FUNC INT Info_Mod_Moe_AufgebrachteFrau_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_AufgebrachteBuergerin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_AufgebrachteFrau_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_00"); //Czy zdarza Ci sie wiedziec, dlaczego nagle nazywa sie mnie rzeznikiem na otwartej drodze?
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_01"); //Tak, moge to przynajmniej odgadnac. Oglosilem juz, ze Canthar's not gonna pozwolil ci odejsc, przyjaciel.
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_02"); //Nie wiem, co on tym razem wymyslil, ale wyglada to jak pomówienie. Powinienes uratowac sobie brudny biznes z Allievo.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_03"); //Co mam teraz zrobic?
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_04"); //Nie plakaj teraz i pozwól mi sie zaskoczyc. Jesli nie mozesz zapobiec gontowi zanim sie do ciebie wlamie, musisz przejsc przez niego.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_05"); //Dzieki za madre rzeczy.
	AI_Output(self, hero, "Info_Mod_Moe_AufgebrachteFrau_29_06"); //Bedziesz mial racje.
	AI_Output(hero, self, "Info_Mod_Moe_AufgebrachteFrau_15_07"); //Zobaczymy to.

	B_LogEntry_More	(TOPIC_MOD_CANTHAR_GESCHAEFTE, TOPIC_MOD_MOE_TALK, "Canthar nadal chce zemsty i znów podwaza moje umiejetnosci.", "Gniewna kobieta sugeruje, ze Canthar próbuje go znieslawic. Moe uwaza, ze najlepiej jest, gdy nie walcze z nieszczesciem, dopóki nie mam konkretnych wskazówek.");

	Mod_MoeTalkedAboutNoTalk = Wld_GetDay();
};

INSTANCE Info_Mod_Moe_DontTalk (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_DontTalk_Condition;
	information	= Info_Mod_Moe_DontTalk_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_DontTalk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_AufgebrachteFrau))
	&& (Mod_MoeDontTalk == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_DontTalk_Info()
{
	AI_Output(self, hero, "Info_Mod_Moe_DontTalk_29_00"); //Czy to prawda? Czy to prawda, co mówia ataki?
	AI_Output(hero, self, "Info_Mod_Moe_DontTalk_15_01"); //Co mówia ataki?
	AI_Output(self, hero, "Info_Mod_Moe_DontTalk_29_02"); //Tutaj. Naprawde powinienes to zobaczyc.

	B_GiveInvItems	(self, hero, ItWr_Anschlag, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Moe_ErsterAnschlag (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_ErsterAnschlag_Condition;
	information	= Info_Mod_Moe_ErsterAnschlag_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Moe_ErsterAnschlag_Condition()
{
	if (Mod_MoeDontTalk == 3)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_Info()
{
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "Bastard zasluguje na to, aby tak sie skonczylo!", Info_Mod_Moe_ErsterAnschlag_C);
	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "Zabilem Allievo w bitwie, ale nie rozstrzelalem go.", Info_Mod_Moe_ErsterAnschlag_B);
	Info_AddChoice	(Info_Mod_Moe_ErsterAnschlag, "Czy nie widzisz, ze jest to fantazja Canthara?", Info_Mod_Moe_ErsterAnschlag_A);
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_D()
{
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_00"); //Szanowni panstwo, czlowiek, mialem nadzieje, ze cos takiego powiecie.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_01"); //Plakaty te dotycza teraz Khorinisa. Nikt nie chce miec z Toba nic wspólnego.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_02"); //Wiem jednak, jak wiele jest plakatów: jeden w klasztorze, po jednym na dziedzincu Bengaru, Onar i Lobart oraz trzy w miescie, w bardzo dostepnych miejscach, pozwole sobie powiedziec.
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_03"); //Czy to oznacza, ze musze zdjac wszystkie plakaty?
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_04"); //Nie chcialbym widziec tych zdjec.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_05"); //Czy nie sadzisz, ze nos jest zle wystrzelony? Wyglada to jak rzepa, ale na linii wyglada jak gruszka.
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_06"); //Rzadko wygladalem wczesniej w lustrze.
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_D_29_07"); //To wszystko jest w porzadku, przyjaciel. Tak wiec, jesli usunales tamtejsze plakaty, to nie powinno byc dlugo przed ludzmi, którzy rozmawiaja z Toba tak jak zawsze. Wiesz, jak one wygladaja. (smiertelnicy)
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_D_15_08"); //Bede na dobrej drodze.

	B_LogEntry	(TOPIC_MOD_MOE_TALK, "Przyczyny nieustajacej ciszy dotycza Khorinisa: to plakaty z lekcewazeniem mojej osoby. Te ataki w miejscach zycia publicznego, trzy spektakle w Khorinis i po jednym w klasztorze i na dziedzincach Bengaru, Onar i Lobart, powinienem jak najszybciej usunac, aby miejscowa ludnosc mogla znowu rozmawiac ze mna.");

	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_01");
	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_02");
	Wld_InsertItem	(ItWr_Anschlag_City, "FP_ITEM_ANSCHLAG_CITY_03");
	Wld_InsertItem	(ItWr_Anschlag_Lobart, "FP_ITEM_ANSCHLAG_LOBART");
	Wld_InsertItem	(ItWr_Anschlag_Bengar, "FP_ITEM_ANSCHLAG_BENGAR");
	Wld_InsertItem	(ItWr_Anschlag_Onar, "FP_ITEM_ANSCHLAG_ONAR");
	Wld_InsertItem	(ItWr_Anschlag_Kloster, "FP_ITEM_ANSCHLAG_KLOSTER");
	
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_B()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_B_15_00"); //Zabilem Allievo w bitwie, ale nie rozstrzelalem go.

	Info_Mod_Moe_ErsterAnschlag_D();
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_A()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_A_15_00"); //Czy nie widzisz, ze jest to fantazja Canthara?

	Info_Mod_Moe_ErsterAnschlag_D();
};

FUNC VOID Info_Mod_Moe_ErsterAnschlag_C()
{
	AI_Output(hero, self, "Info_Mod_Moe_ErsterAnschlag_C_15_00"); //Bastard zasluguje na to, aby tak sie skonczylo!
	AI_Output(self, hero, "Info_Mod_Moe_ErsterAnschlag_C_29_01"); //Przykro mi, pomyslalem, ze bylismy z jednej strony. Teraz musze zobaczyc, ze nie jestes lepszy niz Canthar. Wyjdz z oczu.
	
	Info_ClearChoices	(Info_Mod_Moe_ErsterAnschlag);

	B_SetTopicStatus	(TOPIC_MOD_MOE_TALK, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_CANTHAR_GESCHAEFTE, LOG_FAILED);

	CurrentNQ += 1;

	Mod_MoeDontTalk = 4;
};

INSTANCE Info_Mod_Moe_Anschlaege (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Anschlaege_Condition;
	information	= Info_Mod_Moe_Anschlaege_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj masz ataki, mozesz je zrzucic.";
};

FUNC INT Info_Mod_Moe_Anschlaege_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_ErsterAnschlag))
	&& (Mod_MoeDontTalk == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Anschlaege_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_00"); //Tutaj masz ataki, mozesz je zrzucic.

	B_GiveInvItems	(hero, self, ItWr_Anschlag, Npc_HasItems(hero, ItWr_Anschlag));

	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_01"); //Czy to wszyscy?
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_02"); //Tak.
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_03"); //...
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_04"); //Co jest z Toba?
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_05"); //Dzis utknelam z notatka.
	AI_Output(hero, self, "Info_Mod_Moe_Anschlaege_15_06"); //A co?
	AI_Output(self, hero, "Info_Mod_Moe_Anschlaege_29_07"); //Tutaj.

	B_GiveInvItems	(self, hero, ItWr_MoesZettel, 1);

	B_GivePlayerXP	(300);

	B_LogEntry	(TOPIC_MOD_MOE_TALK, "Dostarczylem ataki.");
	B_SetTopicStatus	(TOPIC_MOD_MOE_TALK, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Moe_Zettel (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Zettel_Condition;
	information	= Info_Mod_Moe_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Widze.";
};

FUNC INT Info_Mod_Moe_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Anschlaege))
	&& (Mod_MoeDontTalk == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_00"); //Widze.
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_01"); //Zajmij sie ta sprawa samemu, czy bedziesz zona?
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_02"); //Próbujesz sie zabic?
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_03"); //Nie.... Nie. Tak, wszystko jest w porzadku. Bede Cie nadal pomagal. (pauza) Ale nie przychodze, zeby mnie widziec zbyt czesto.
	AI_Output(hero, self, "Info_Mod_Moe_Zettel_15_04"); //Dostales to. Obserwuj plecy.
	AI_Output(self, hero, "Info_Mod_Moe_Zettel_29_05"); //Nawet nie wiem, gdzie on juz jest....

	B_LogEntry	(TOPIC_MOD_CANTHAR_GESCHAEFTE, "Moe dostal kryptograficzne zagrozenie, ale wciaz chce mi pomóc.");
};

INSTANCE Info_Mod_Moe_Shakir (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Shakir_Condition;
	information	= Info_Mod_Moe_Shakir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj, Moe. Potrzebuje kobiety.";
};

FUNC INT Info_Mod_Moe_Shakir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bromor_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Shakir_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_00"); //Witaj, Moe. Potrzebuje kobiety.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_01"); //Chcesz sie ozenic?
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_02"); //Nie. Tak wlasnie jest.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_03"); //Uh-huh. Dlaczego nie idziesz do Bromora? Ma on wybór.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_04"); //Nie da mi jednego.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_05"); //Godzina Pasterza w domu? W swietle swiec i to wszystko?
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_06"); //Dokladnie.
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_07"); //No cóz, zapytaj Edde. Zna wszystkie kobiety w okolicy.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_08"); //Czy?
	AI_Output(self, hero, "Info_Mod_Moe_Shakir_29_09"); //Jest w kuchni zupy. Za domem sprzedawcy ryb.
	AI_Output(hero, self, "Info_Mod_Moe_Shakir_15_10"); //Na poczatek dziekuje.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Moe wyslal mnie do zupy edda. Zna wszystkie kobiety w okolicy.");
};

INSTANCE Info_Mod_Moe_Sumpfkraut (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Sumpfkraut_Condition;
	information	= Info_Mod_Moe_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przypuscmy, ze chcialem kupic ambrozje bagnista....";
};

FUNC INT Info_Mod_Moe_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Moe_Sumpfkraut_15_00"); //Przypuscmy, ze chcialem kupic ambrozje bagnista....
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_01"); //Hej, czlowiek, jestesmy na nabrzezu. Tutaj znajdziesz wszystko, co jest przyjemne.... (smiling) i to, co nie podoba sie swietnym panom z rozkazu.
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_02"); //Dziewczyna radosci, hazardu, walki o pieniadze..... a takze oczywiscie kilka pedów zywicznych.
	AI_Output(self, hero, "Info_Mod_Moe_Sumpfkraut_29_03"); //Jedyne, co trzeba zrobic, to zadac ludziom w nadbrzezu kilka pytan.
};

INSTANCE Info_Mod_Moe_Flugblaetter (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Flugblaetter_Condition;
	information	= Info_Mod_Moe_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dla Ciebie ulotke.";
};

FUNC INT Info_Mod_Moe_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Moe_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Moe_Flugblaetter_29_01"); //Dziekuje, dziekuje. Zobaczmy jak.....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Moe_Flugblaetter_29_02"); //Ah tak. Moze zatrzymam sie przy Matteo' s.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Moe_Pickpocket (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_Pickpocket_Condition;
	information	= Info_Mod_Moe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Moe_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 18);
};

FUNC VOID Info_Mod_Moe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

	Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_BACK, Info_Mod_Moe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Moe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Moe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
};

FUNC VOID Info_Mod_Moe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Moe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Moe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Moe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Moe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Moe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Moe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Moe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Moe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Moe_EXIT (C_INFO)
{
	npc		= Mod_599_NONE_Moe_NW;
	nr		= 1;
	condition	= Info_Mod_Moe_EXIT_Condition;
	information	= Info_Mod_Moe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Moe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Moe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
