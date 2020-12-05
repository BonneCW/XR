INSTANCE Info_Mod_Lester_Hi (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Hi_Condition;
	information	= Info_Mod_Lester_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_00"); //Przez sypialnie! To niespodzianka!
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_01"); //Wczoraj! Jak sie tu dostales?
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_02"); //Mialem po prostu zapytac pana o to samo. Minuty mysle, ze wciaz jestes uwieziony w swiatyni podkladowców - kolejna jestes juz przed mna.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_03"); //Co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_04"); //Wlasciwie to wszystko jest w porzadku. Musze znów przyzwyczaic sie do swiezego powietrza.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_05"); //Wtedy z pewnoscia Xardas ma swój palec w piersiach. Czyz nie jest wlascicielem wiezy? Jego mroczny styl jest oczywisty.
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_06"); //To równiez calkiem sluszne. Ale co tu robicie?
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_07"); //Zdaje sobie sprawe, ze wciaz jeszcze nie stales sie wielkim gawedziarzem.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_08"); //Jesli o mnie chodzi, to z powodu ciemnej wiezy wyladowalem na misji Baala Namiba.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_09"); //Wydaje sie, ze istnieje zwiazek pomiedzy wzrostem rdestnicy bagiennej a obecnoscia czarnej magii, która staram sie zglebic.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_10"); //Ale jest jeszcze zbyt wczesnie, aby spekulowac wiecej na ten temat. Obserwuje. I palic od czasu do czasu.
};

INSTANCE Info_Mod_Lester_Goetterwaffen (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Goetterwaffen_Condition;
	information	= Info_Mod_Lester_Goetterwaffen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Goetterwaffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Goetterwaffen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_00"); //Dobrze Cie widziec, dostalem cos dla Ciebie.
	AI_Output(hero, self, "Info_Mod_Lester_Goetterwaffen_15_01"); //Tak, Milten wyslal mnie.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_02"); //No cóz, wtedy wiesz, ze zmienilem kilka ról zaklec dla Ciebie.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_03"); //Oto piec egzemplarzy.

	B_GiveInvItems	(self, hero, ItSc_SumRabbit, 5);

	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_04"); //Mozna z nim przywolac kilka króliczków. To niezbyt dobrze, ale to dobry sposób na wykrycie pulapek.
};

INSTANCE Info_Mod_Lester_Irdorath (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath_Condition;
	information	= Info_Mod_Lester_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sprawa z Xeres prowadzi mnie tym razem na wyspe i szukam doswiadczonych ludzi dla mojej zalogi.";
};

FUNC INT Info_Mod_Lester_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath_15_00"); //Sprawa z Xeres prowadzi mnie tym razem na wyspe i szukam doswiadczonych ludzi dla mojej zalogi. Czy znasz kogos?
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_01"); //Zaloga i wyspa? Teraz nawet nad morzem....
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_02"); //Cóz, jestem pewien, ze Cor Angar zachwyci sie tym.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_03"); //W czasie, gdy szlaban miales juz z nim znaczacy udzial w dalszych losach obozu.

	if (Templer_Dabei == 1)
	|| (Guru_Dabei == 1)
	{
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_04"); //No cóz, a potem byc moze Baal Namib. Wsród Baalsów jest to nadal ten, który ma najwieksza potrzebe czegos nowego i nieznanego.
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_05"); //Nie za nic stoi przy wejsciu do obozu.

		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar i Baal Namib mogli sie rozgrzac do podrózy, jak powiedzial mi Lester.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar mógl sie rozgrzac do podrózy, jak powiedzial mi Lester.");
	};

	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_06"); //A potem, cóz, uwazalbym sie za szczesliwy, gdybym byl czescia tej przygody.
};

INSTANCE Info_Mod_Lester_Irdorath2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath2_Condition;
	information	= Info_Mod_Lester_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wtedy witam Was na pokladzie naszego statku.";
};

FUNC INT Info_Mod_Lester_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath2_15_00"); //Wtedy witam Was na pokladzie naszego statku. Miejscem spotkan jest port w Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath2_13_01"); //Wspanialy. Do tego czasu.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Bardzo dobrze, mój towarzysz Lester jest na pokladzie.");

	B_GivePlayerXP	(150);

	Mod_CrewCount += 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		Mod_LesterDabei = 2;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "SCHIFF");
	}
	else
	{
		Mod_LesterDabei = 1;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TOT");
	};
};

INSTANCE Info_Mod_Lester_Irdorath3 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath3_Condition;
	information	= Info_Mod_Lester_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Przykro mi, ale wydaje mi sie, ze to zbyt wiele.";
};

FUNC INT Info_Mod_Lester_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_LesterDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath3_15_00"); //Przykro mi, ale wydaje mi sie, ze to zbyt wiele. Nie moge cie zabrac ze soba.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath3_13_01"); //Zbyt zle. Wróce do Minentala.

	Mod_LesterDabei = 3;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Lester_Fanatiker (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Fanatiker_Condition;
	information	= Info_Mod_Lester_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, Lester!";
};

FUNC INT Info_Mod_Lester_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_00"); //Hej, Lester!
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_01"); //Witaj, mój przyjaciel. Co cie do mnie sprowadza?
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_02"); //Czy wiesz, co sie stalo z reszta braterstwa?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_03"); //Po upadku bariery? Przeniesli sie do Khorinis. Wiekszosc z nich nadal trzyma sie na sypialni.
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_04"); //Czy masz jakies wyobrazenie, jak moge sie o niej dowiedziec?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_05"); //Hmm..... o ile mi wiadomo, dawny Templar Cor Gar w Khorinis. Idz na polowanie w lesie i mieszkac go hotel. Jestem pewna, ze wieczorem spotkacie go na hookach.
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_06"); //Najlepszym wyjsciem jest przyniesienie mu jakiejs chwasty, a on chetnie ci pomoze. Tak, nazywa sie Józefem od upadku sypialni.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Lester powiedzial, ze przyczepy sypialne przenosza sie dohorynu. Dawny templariusz o imieniu Cor Gar, który teraz nazywa sie Josefem, bedzie mógl mi o tym opowiedziec - pod warunkiem, ze mam dla niego bagnista barszcz.");
};

INSTANCE Info_Mod_Lester_Sekte (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Sekte_Condition;
	information	= Info_Mod_Lester_Sekte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bractwo nadal istnieje?";
};

FUNC INT Info_Mod_Lester_Sekte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Sekte_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Sekte_15_00"); //Bractwo nadal istnieje? Myslalem, ze zdesperowales sie opuscic kolonie?
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_01"); //Pierwotnie chcielismy, to prawda. Ale po upadku bariery i tym, co dzieje sie na ladzie, postanowilismy pozostac w Minental.
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_02"); //Mamy równiez kilka kupujacych nasze ziola. Jest to bardzo popularne w Khorinis.
};

INSTANCE Info_Mod_Lester_Aufnehmen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Aufnehmen_Condition;
	information	= Info_Mod_Lester_Aufnehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge dolaczyc do Ciebie?";
};

FUNC INT Info_Mod_Lester_Aufnehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Aufnehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Aufnehmen_15_00"); //Czy moge dolaczyc do Ciebie?
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_01"); //Oczywiscie, ale trzeba najpierw udac sie do Minentala. Powinniscie równiez wiedziec, ze nie jestesmy jedna z wielkich spolecznosci, jak milicja czy najemnicy.
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_02"); //Mozesz równiez dolaczyc do nas, jesli jestes juz w innej spolecznosci. Porozmawiaj z Baalem Namibem, jak tylko dotrzesz do obozu bagiennego.

	Log_CreateTopic	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Moge dolaczyc do Bractwa w Minental. Rozmawiam o tym z Baalem Namibem.");
};

INSTANCE Info_Mod_Lester_Namib (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Namib_Condition;
	information	= Info_Mod_Lester_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib mnie wyslal.";
};

FUNC INT Info_Mod_Lester_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Aufnehmen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_00"); //Baal Namib mnie wyslal. Mam odebrac paczke w twoim miejscu i zabrac ja do Constantino.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_01"); //Bardzo dobrze, wiec moge nadal myslec.... przeznaczenie na badania naukowe.

	B_GiveInvItems	(self, hero, ItMi_LesterPaket, 1);

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_02"); //Odbiore równiez raport z postepów.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_03"); //Raport statusowy? Cóz, w takim przypadku..... Do tego potrzebuje butelki magicznej wody do..... dla...... dla chwastów!
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_04"); //Skad pochodzi magiczna woda?
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_05"); //Browaruje ja Constantino. Otrzymasz go od niego. Powiedz mu, aby umiescil to na rachunku.
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_06"); //Wszystkie sluszne, wszystkie sluszne.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Dostalem pakiet, ale Lester potrzebuje butelki magicznej wody do sprawozdania z sytuacji. Powiedzial, ze Constantino produkuje i sprzedaje magiczna wode.");
};

INSTANCE Info_Mod_Lester_Zauberwasser (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_Condition;
	information	= Info_Mod_Lester_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj magiczna woda.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_00"); //Tutaj magiczna woda.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_01"); //Dobrze, wreszcie mam moja magiczna wode.

	if (Mod_ConstantinoZauberwasser == 1)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_02"); //Musialem splacic twój dlug!
	}
	else if (Mod_ConstantinoZauberwasser == 2)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_03"); //Musialem ukrasc Constantino butelke magicznej wody z jego klatki piersiowej.
	}
	else if (Mod_ConstantinoZauberwasser == 3)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_04"); //Musialem splacic twój dlug konstantynowi.
	};

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_05"); //Dziekuje! Bede o tym pamietac.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_06"); //Do czego potrzebujesz tej magicznej wody?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_07"); //Cóz, nie ma nic innego jak zakonczenie ciezkiej pracy z lodyga bagna i butelka magicznej wody.

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);
	B_UseItem	(self, ItMi_Zauberwasser);

	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_08"); //Odczekac minute..... Co oznacza, ze magiczna woda jest napojem?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_09"); //(smiech) Co sadziles/as? Ze to jak cudowny nawóz?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_10"); //Ty....... A co z raportem o postepach?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_11"); //Ah tak. Powiedz Baalowi Namibowi, ze lojotok rosnie bardzo dobrze w zaleznosci od okolicznosci.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_12"); //Mimo ze powietrze nie jest wystarczajaco wilgotne i nie ma naslonecznienia, swietnie rosnie.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Dalem Lester magiczna wode i okazalo sie, ze jest to zwykly napój. Tak czy owak, dostalem raport z sytuacji i powinienem powrócic do Baal Namib.");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lester_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Lester_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam tu mnóstwo magicznej wody.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_MIS_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_00"); //Mam tu mnóstwo magicznej wody.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_01"); //Gdzie dostales?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_02"); //Constantino chcialem, abym wreczyl je róznym dealerom, aby umorzyc twój dlug.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_03"); //Uh.... i przyprowadz mnie, gdy juz z tym zrobisz.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_04"); //Na pewno nie chcesz zadnego z nich?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_05"); //Tak, kto wie, co Constantino uczyni dla nas, jesli my pójdziemy zle z jego dostawy.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester nie chcial magicznej wody z przesylek, które mialem dostarczyc do Constantino. Wiec naprawde musze je zabrac i zarobic butelke magicznej wody z Constantino.");
};

INSTANCE Info_Mod_Lester_Treffen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Treffen_Condition;
	information	= Info_Mod_Lester_Treffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorn wyslal mnie.";
};

FUNC INT Info_Mod_Lester_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_AtCastlemine))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Treffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Treffen_15_00"); //Gorn wyslal mnie. Powinienem powiedziec Wam, zebyscie spotkali sie w tawernie Dead Harpie.
	AI_Output(self, hero, "Info_Mod_Lester_Treffen_13_01"); //Dziekuje, dziekuje. Bede w drodze od razu. W koncu jestes jednym z nas.

	B_LogEntry	(TOPIC_MOD_TREFFEN, "");

	AI_StopProcessInfos	(self);

	if (CurrentLevel == RELENDEL_ZEN) {
		B_StartOtherRoutine	(self, "TOT");
		Mod_LesterRELToMeeting = 1;
	} else {
		B_StartOtherRoutine	(self, "TREFFEN");
	};
};

INSTANCE Info_Mod_Lester_Karras (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Karras_Condition;
	information	= Info_Mod_Lester_Karras_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcesz, abym dal ci znac, ze mozesz udac sie do Minental.";
};

FUNC INT Info_Mod_Lester_Karras_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Karras_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Karras_15_00"); //Chcesz, abym dal ci znac, ze mozesz udac sie do Minental.
	AI_Output(self, hero, "Info_Mod_Lester_Karras_13_01"); //Nadszedl czas, to zycie w jaskini nie robi mi nic dobrego.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester powróci teraz do Minentala.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Lester_Crawlersekret (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Crawlersekret_Condition;
	information	= Info_Mod_Lester_Crawlersekret_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy wiesz, gdzie jest sekretarz Minecrawler?";
};

FUNC INT Info_Mod_Lester_Crawlersekret_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Crawlersekret_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_00"); //Czy wiesz, gdzie jest sekretarz Minecrawler?
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_01"); //Sekretariat Minekrawerów? Cor Kalom wydobywal ja z szczypiec miniwalników.
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_02"); //Potrzebuje silniejszego wydzielania niz kleszcze.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_03"); //W ten sposób z kul królowej przywiózles nas z powrotem?
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_04"); //To tylko to.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_05"); //Nastepnie powinienes dostac jajka i wypelnic tajemnice. Jesli masz szczescie, w obozie jest tez wydzielina wypchana.
};

INSTANCE Info_Mod_Lester_ZeichenDerBruderschaft (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_ZeichenDerBruderschaft_Condition;
	information	= Info_Mod_Lester_ZeichenDerBruderschaft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_ZeichenDerBruderschaft_Condition()
{
	if (Npc_HasItems(hero, ItMi_ZeichenDerBruderschaft) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_ZeichenDerBruderschaft_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_ZeichenDerBruderschaft_13_00"); //Na co patrze? Przynosisz znak starego braterstwa z wami? Mysle, ze lepiej bym to sobie wzial.

	B_GiveInvItems	(hero, self, ItMi_ZeichenDerBruderschaft, 1);

	AI_Output(self, hero, "Info_Mod_Lester_ZeichenDerBruderschaft_13_01"); //Pod Bractwem jest jeszcze kilku fanatyków, którzy moga postrzegac to jako prowokacje, jesli nosicie ten znak razem z wami.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lester_WillstMitMir (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_WillstMitMir_Condition;
	information	= Info_Mod_Lester_WillstMitMir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nie chcesz przyjechac do mnie?";
};

FUNC INT Info_Mod_Lester_WillstMitMir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_WillstMitMir_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_WillstMitMir_15_00"); //Nie chcesz przyjechac do mnie?
	AI_Output(self, hero, "Info_Mod_Lester_WillstMitMir_13_01"); //Zadanie jest niezwykle wazne dla obozu bagiennego, nie moge sie go pozbyc bez dalszych ado. Jesli jest cos pilnego, oczywiscie bede przy Tobie stal.
};

INSTANCE Info_Mod_Lester_GornDiegoMilten (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_GornDiegoMilten_Condition;
	information	= Info_Mod_Lester_GornDiegoMilten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co sie stalo z Gorn, Diego i Milten?";
};

FUNC INT Info_Mod_Lester_GornDiegoMilten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_GornDiegoMilten_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_GornDiegoMilten_15_00"); //Co sie stalo z Gorn, Diego i Milten?
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_01"); //Po upadku bariery rozmawialismy o tym, co nalezy zrobic. Milten zasugerowal, ze mozemy zalozyc wlasne ugrupowanie, które postrzega siebie jako posrednika miedzy skazanymi z Doliny Kopalni a cechami w Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_02"); //No cóz, czasem jest on przeciez troche naiwny. Diego natychmiast wymówil go z tego, a my zdecydowalismy, ze kazdy powinien na razie szukac wlasnego szczescia.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_03"); //I tak sie stalo: Milten chcial dolaczyc do magików strazy pozarnej, Gorn dolaczyl do kilku swoich przyjaciól, by sluzyc jako najemnik, a Diego towarzyszyl mi w Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_GornDiegoMilten_13_04"); //Ostatnio sprawdzilem, on tam zostal.
};

INSTANCE Info_Mod_Lester_DefenseBreak (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak_Condition;
	information	= Info_Mod_Lester_DefenseBreak_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_DefenseBreak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (hero.attribute[ATR_DEXTERITY] >= 50)
	&& ((hero.hitChance[NPC_TALENT_1H] >= 30)
	|| (hero.hitChance[NPC_TALENT_2H] >= 30))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_00"); //Hej! Wczoraj wieczorem palilem zbyt duza ambrozje bagnista i tam mialem nocny system, jak przezwyciezyc blokowanie wrogów.
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak_15_01"); //Myslisz o rzeczach.....
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_02"); //Nie bylem wtedy zdenerwowany!
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_03"); //Marzylem o innych rzeczach, nie chcesz nic wiedziec o nich.
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_04"); //W kazdym razie, jesli chcesz, opowiem ci jak dziala ta technika.
};

INSTANCE Info_Mod_Lester_DefenseBreak2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak2_Condition;
	information	= Info_Mod_Lester_DefenseBreak2_Info;
	permanent	= 1;
	important	= 0;
};

FUNC INT Info_Mod_Lester_DefenseBreak2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Lester_DefenseBreak2.description = "Jak moge zlamac blok? (500 zloto)";
	}
	else
	{
		Info_Mod_Lester_DefenseBreak2.description = "Jak moge zlamac blok? (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lester_DefenseBreak))
	&& (DefenseBreak_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_00"); //Jak moge zlamac blok?

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_01"); //Musisz sprawic, aby nieprzyjaciel uwierzyl, ze zmierzasz do jego nóg.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_02"); //Twoje spojrzenie i pozycja ciala musza byc calkowicie skupione na nim.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_03"); //W ostatniej chwili pociagnac za miecz. Jesli zrobisz sztuczke, jego tulów nie bedzie chroniony.
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_04"); //Nie za kazdym razem bedzie to jednak dzialac.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_05"); //Jesli znasz lepszy przepis.....
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_06"); //Wszystkie sluszne, wszystkie sluszne. Dziekujemy za rade.

		DefenseBreak_Perk = TRUE;

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
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_07"); //Wróc do domu, gdy bedziesz gotowy.
	};
};

INSTANCE Info_Mod_Lester_Pickpocket (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Pickpocket_Condition;
	information	= Info_Mod_Lester_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Lester_Pickpocket_Condition()
{
	C_Beklauen	(185, ItMi_Traumruf, 3);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_BACK, Info_Mod_Lester_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lester_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lester_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
};

FUNC VOID Info_Mod_Lester_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lester_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lester_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lester_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lester_EXIT (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_EXIT_Condition;
	information	= Info_Mod_Lester_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lester_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	AI_Output(self, hero, "Info_Mod_Lester_EXIT_13_00"); //Do celu!
};
