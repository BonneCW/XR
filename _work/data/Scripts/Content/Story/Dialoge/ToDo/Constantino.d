INSTANCE Info_Mod_Constantino_Hi (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Hi_Condition;
	information	= Info_Mod_Constantino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Constantino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Constantino_Hi_10_00"); //Hu? Mniej sie nie obchodzilas, czy móglbys?
};

INSTANCE Info_Mod_Constantino_Irdorath (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Irdorath_Condition;
	information	= Info_Mod_Constantino_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce, aby firma zajmujaca sie zegluga morska miala nadrzedne znaczenie dla dobra Khorinis.";
};

FUNC INT Info_Mod_Constantino_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_00"); //Chce, aby firma zajmujaca sie zegluga morska miala nadrzedne znaczenie dla dobra Khorinis.
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_01"); //Do tego koniecznie potrzebuje alchemika w moim zespole, który rozumie eliksir i rosliny....
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_02"); //Jak, jak i z czym przychodzisz do mnie?
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_03"); //Nie, tak naprawde, trzeba znalezc kogos innego, jesli to nie gonna byc zlym zartem.
	AI_Output(self, hero, "Info_Mod_Constantino_Irdorath_10_04"); //Z pewnoscia nie zostawie tej bezpiecznej wyspy w rekach orków i pirackich piratów.... Wiecej
	AI_Output(hero, self, "Info_Mod_Constantino_Irdorath_15_05"); //(pólbrzacy) Jest tu tez wiele. Bezpieczna wyspa....

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Nie, mysle, ze nie moge przekonac Konstantynina, aby udal sie w morska podróz.");
};

INSTANCE Info_Mod_Constantino_Alchemist (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Alchemist_Condition;
	information	= Info_Mod_Constantino_Alchemist_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dzialajmy.";
};

FUNC INT Info_Mod_Constantino_Alchemist_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Alchemist_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Alchemist_15_00"); //Dzialajmy.
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_01"); //Czy nie widzisz, ze pracuje juz teraz?
	AI_Output(self, hero, "Info_Mod_Constantino_Alchemist_10_02"); //Gdybym mial porozmawiac z kazdym, kto przychodzi na mnie, bylbym pewny, ze.... piec minut lub wiecej!
};

INSTANCE Info_Mod_Constantino_Lehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrling_Condition;
	information	= Info_Mod_Constantino_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestes jednym z pieciu mistrzów.";
};

FUNC INT Info_Mod_Constantino_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_00"); //Jestes jednym z pieciu mistrzów.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_01"); //Wlasciwie jestem jedyna osoba, która zasluguje na miano mistrza. Pozostale to hackery.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_02"); //W kazdym razie chce byc praktykantem u jednego z mistrzów.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_03"); //Czy? (smiech) No cóz, to bedzie zabawa!
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_04"); //Czy dales mi problem?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_05"); //Nie. Nie mam czasu na takie falbanki.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_06"); //Jak wiec moge odebrac Twój glos?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_07"); //W ogóle nie.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_15_08"); //Hmm.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_10_09"); //Hmm.

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);

	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Mozesz zaoszczedzic mi duzo czasu!", Info_Mod_Constantino_Lehrling_C);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Na pewno bylibysmy dobrym zespolem!", Info_Mod_Constantino_Lehrling_B);
	Info_AddChoice	(Info_Mod_Constantino_Lehrling, "Przypuszczam, ze oznacza to, ze musze wezwac Pana Andre' a.", Info_Mod_Constantino_Lehrling_A);
};

FUNC VOID Info_Mod_Constantino_Lehrling_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_00"); //Mozesz zaoszczedzic mi duzo czasu!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_01"); //Uh-huh. Wiec jestes gotów wykonac jakakolwiek prace, o która Cie poprosze?
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_02"); //Prawie kazdy.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_03"); //(smiech sam w sobie) Mam maly przepis, na który ciagle potrzebuje jakichs skladników. Przynies je do mnie.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_04"); //Jakie sa skladniki?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_05"); //Jeden ciern blizniaczy, cztery rosliny chwastów bagiennych i.... Tak, krew leci kregoslupem i..... hmm..... Tak, dwie pelne probówki testowe wydzieliny z jajka miksera.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_06"); //Oto lista.

	B_GiveInvItems	(self, hero, Mod_ConstantinosZutatenliste, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_07"); //Gdzie moge znalezc skladniki?
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_08"); //Na zewnatrz. Klasztorne rozmycia maja kilka skladników. Sugeruj, abys tam zostal.
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_C_15_09"); //Wszystko w porzadku, to cie zalatwie.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_C_10_10"); //Do zobaczenia za kilka lat.

	Log_CreateTopic	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CONSTANTINOSZUTATEN, "Aby uzyskac glos Constantino, przyniose mu skladniki do nowego eliksiru. Rosliny nadal mozna znalezc, ale nie wiem, gdzie moge znalezc jajko Minecrawler i kregoslup krwi latac. Konstantyn dal mi rade na temat klasztoru, ale to nie znaczy nic. Moze powinienem po prostu zapytac.");

	Info_ClearChoices	(Info_Mod_Constantino_Lehrling);
};

FUNC VOID Info_Mod_Constantino_Lehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_B_15_00"); //Na pewno bylibysmy dobrym zespolem!
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_B_10_01"); //Co jest korzystne dla zespolu? Nie moge pomyslec o dwóch naraz.
};

FUNC VOID Info_Mod_Constantino_Lehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Lehrling_A_15_00"); //Przypuszczam, ze oznacza to, ze musze wezwac Pana Andre' a.
	AI_Output(self, hero, "Info_Mod_Constantino_Lehrling_A_10_01"); //(smiech) Andre ma inne obawy niz troska o ciebie.
};

INSTANCE Info_Mod_Constantino_Stimme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Stimme_Condition;
	information	= Info_Mod_Constantino_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tam masz to wszystko.";
};

FUNC INT Info_Mod_Constantino_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& ((Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	|| (Npc_HasItems(hero, ItAt_CrawlerQueen) >= 1))
	&& (Npc_HasItems(hero, ItPl_Zwillingsdorn) >= 1)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= 4)
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_00"); //Tam masz to wszystko.

	B_ShowGivenThings	("Podane skladniki");

	if (Npc_HasItems(hero, ItFo_Potion_Elixier_Egg) >= 2)
	{
		Npc_RemoveInvItems	(hero, ItFo_Potion_Elixier_Egg, 2);

		B_GivePlayerXP	(400);

		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_01"); //Wszystkie sluszne, wszystkie sluszne. Ale nie martw sie juz wiecej!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_02"); //Jajko minecrawlera? Mówilem, ze potrzebuje sekretarza!
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_03"); //Czy jestes zbyt leniwy, aby przejsc do stolu alchemicznego i wyodrebnic go prawidlowo lub co?
		AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_04"); //Wszystko musi byc zrobione przez siebie......

		Npc_RemoveInvItems	(hero, ItAt_CrawlerQueen, 1);

		B_GivePlayerXp	(300);
	};

	Npc_RemoveInvItems	(hero, ItPl_Zwillingsdorn, 1);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 4);
	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_Stimme_15_05"); //Czy Pani/Pana zgode otrzymuje juz teraz?
	AI_Output(self, hero, "Info_Mod_Constantino_Stimme_10_06"); //Tak, tak, tak, tak, tak, tak. Pozegnanie pozegnania.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	Mod_LehrlingsStimmen += 1;
	
	Npc_RemoveInvItems	(hero, Mod_ConstantinosZutatenliste, 1);

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry_More	(TOPIC_MOD_CONSTANTINOSZUTATEN, TOPIC_MOD_HAENDLER_STADT, "Konstantyn byl bardzo zadowolony ze mnie. Oddal mi glos.", "Constantino moze sprzedawac mi eliksiry i ziola.");
	B_SetTopicStatus	(TOPIC_MOD_CONSTANTINOSZUTATEN, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_Aufnahme (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Aufnahme_Condition;
	information	= Info_Mod_Constantino_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Chce byc twoim uczniem.";
};

FUNC INT Info_Mod_Constantino_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_00"); //Chce byc twoim uczniem.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_01"); //Aha.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_15_02"); //Uczysz mnie tajników alchemii?
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_10_03"); //Czy....? Czy jest to dla Ciebie naprawde wazne? Czy mozesz ciezko pracowac i pracowac cicho?

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);

	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "Nie.", Info_Mod_Constantino_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Constantino_Aufnahme, "Tak.", Info_Mod_Constantino_Aufnahme_A);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_B_15_00"); //Nie.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_B_10_01"); //Nie wiem! Udajcie sie ode mnie!

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

FUNC VOID Info_Mod_Constantino_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_00"); //Tak.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_01"); //Wtedy..... wszystkie sluszne i sluszne. Badzcie tylko moim uczniem.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_02"); //Ale zeby to bylo jasne, nie daje wam zadnych pieniedzy ani zywnosci. Tylko wiedza. Czysta wiedza. Czy to zrobiles?
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_03"); //Pewne.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_04"); //Poczekaj, musialabym miec gdzies wyglad miasta.... taka zwapniona tradycja po raz kolejny...... Tam go dostalem. Wez to pod uwage.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("przyjac odziez cywilna");

	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_05"); //Chcesz poznac tajniki alchemii, oho. Ale my jestesmy gonna zaczac maly.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_06"); //Poniewaz watpie, czy jestes w stanie nadazyc za moim intelektem.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_07"); //Elementy reprezentuja najnizszy stopien trudnosci. Z odrobina treningu tworzy nawet najbardziej nieudolne wielblady.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_08"); //Ale nawet tutaj mozna popelnic wystarczajaco duzo bledów. Uwazajcie wiec!
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_09"); //Podstawa tych dwóch eliksirów jest chwast polny. Mozna go zniszczyc w mozdzierzu dodajac kilka kropli wody.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_10"); //Dopiero wtedy dodasz dwie rosliny lecznicze lub pokrzywy.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_11"); //Jest to wazne, aby rosliny po rozdrobnieniu wchlanialy moc regeneracyjna chwastów polowych.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_12"); //W przeciwnym razie otrzymasz smaczna, ale nieskuteczna herbate.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_13"); //Nastepnie podgrzac rosól, az zagotuje sie nad plomieniem i napelnic go.
	AI_Output(hero, self, "Info_Mod_Constantino_Aufnahme_A_15_14"); //Mysle, ze ja dostalem.
	AI_Output(self, hero, "Info_Mod_Constantino_Aufnahme_A_10_15"); //Przyjrzyjmy sie temu. Wiec otrzymasz skladniki i warzysz po dwie lecznicze esencje i po dwie mana esencje. Porozmawiamy jeszcze raz.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 1;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Konstantyn, alchemik, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Konstantyn dal mi zadanie wykonania dwóch mana i dwóch esencji leczniczych. Najpierw musze zebrac niezbedne skladniki, a nastepnie umiescic je w odpowiedniej kolejnosci przy stole alchemicznym. Hmm, co to znów bylo?", "Poniewaz Konstantyn przyjal mnie jako swojego ucznia, teraz moge wejsc do wyzszej kwatery.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, "Konstantyn, alchemik, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Konstantyn dal mi zadanie wykonania dwóch mana i dwóch esencji leczniczych. Najpierw musze zebrac niezbedne skladniki, a nastepnie umiescic je w odpowiedniej kolejnosci przy stole alchemicznym. Hmm, co to znów bylo?");
	};

	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"OCENA ZNACZENIA KSZTALCENIA: 2 rosliny lecznicze i 1 rdestnica.");
	B_LogEntry_NS	(TOPIC_TalentAlchemy,"MANA ESSENZ?: 2 pokrzywy ogniowe i 1 wezel chwast.");

	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Constantino_Aufnahme);
};

INSTANCE Info_Mod_Constantino_GildenZeug (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_GildenZeug_Condition;
	information	= Info_Mod_Constantino_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_00"); //Czy czolgal sie pan równiez do milicji? Myslisz, ze mnie to przeraza? (smiertelne jeki)
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_01"); //Jestes nowicjuszem? Nie wierzcie w to, co Magicysci ogniowi mówia o alchemii! To wszystko to bzdura!
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_02"); //Czy Vatras zamglenie równiez twojego mózgu, huh?
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_03"); //Kiedy widze, co sie z toba dzieje, przykro mi, ze kiedykolwiek sie z toba zaangazowalem.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_GildenZeug_10_04"); //Powitanieeli! (smiertelne jeki)
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zaparzylem wszystkie Twoje eliksiry.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 1)
	&& (Npc_HasItems(hero, ItPo_Health_01) >= 2)
	&& (Npc_HasItems(hero, ItPo_Mana_01) >= 2)
	&& (Mod_Count_Health_01 >= 2)
	&& (Mod_Count_Mana_01 >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_00"); //Zaparzylem wszystkie Twoje eliksiry.

	B_ShowGivenThings	("2 esencje uzdrawiania i 2 esencje manifikacji wydane");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_01"); //Zapachy) Naprawde brakuje Ci poczucia umiejetnosci. Ale przynajmniej one pomoga wiecej niz tylko zaszkodzic.

	B_ShowGivenThings	("2 Substancje lecznicze i 2 Otrzymane esencje mana");

	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_02"); //Nie chcesz zachowac eliksirów?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_03"); //Lepiej warzylem w ciagu dwóch minut. Co mam z tym zrobic?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest_15_04"); //Czego uczycie mnie potem?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_05"); //Po pierwsze, teraz musze odpoczac. Tura pytan juz sie skonczyla.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest_10_06"); //Wróc do nas pózniej, jesli mam dla Ciebie czas.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest2_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcialbym sie wiecej nauczyc.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_00"); //Chcialbym sie wiecej nauczyc.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_01"); //Bylbym bardziej dociekliwy, gdybys byl nieco bardziej utalentowany.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_02"); //Watpie w to.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_03"); //Lubie to? Potem udowadniajcie, ze sie myle!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_04"); //To prowadzi nas do sedna sprawy.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_05"); //(zmielanie zebów) Wszystkie wlasciwe. Chce sie dowiedziec, czy za pierwszym razem mozecie zrobic potion predkosci.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_06"); //Jedyne czego potrzebujesz to kapusta glowiasta i chwast polny. Przygotowanie jest jednak skomplikowane:
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_07"); //Najpierw nalezy umiescic kapuste zbozowa w goracej wodzie.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_08"); //Po okolo dwóch minutach wyjmujesz ziele z wody i powiesiles je na zaprawach, w których teraz zmiazdzisz rdestnice.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_09"); //Tymczasem dusza ziól kapie na rdeste i miesza sie.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_10"); //Po odsaczeniu kapusty wypalic pozostala jej czesc w plonacym ogniu i wymieszac popiól z chwastowata lampa.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_11"); //Umiescic te mieszanine w misce z woda i podgrzac.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_12"); //Natychmiast po zagotowaniu wody przygotowujemy mieszanine. Teraz mozna napelnic plyn.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest2_15_13"); //Nie brzmi tak latwo.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest2_10_14"); //Prawdziwy alchemik moze równiez polegac na swoich uczuciach.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, "Konstantyn naprawde chce mi tym razem rzucic wyzwanie. Chce, abym uczynil go eliksirem szybkosci. Gdybym wiedzial tylko, co musialem wziac pod uwage.");

	PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"NAPOJE PREDKOSCI: 1 PLYTKA i 1 rdest i 1 rdestnica.");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest3_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestem gotowy.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest2))
	&& (Npc_HasItems(hero, ItPo_Speed) >= 1)
	&& (Mod_Darf_Speed == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_00"); //Jestem gotowy.

	B_GiveInvItems	(hero, self, ItPo_Speed, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_01"); //Pozwole sobie spojrzec. Hmm, nawet zle.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_02"); //Czy moge teraz powrócic do eliksiru?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_03"); //Hu? Nie, nie, on zostaje przy mnie.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_04"); //(jednak samemu) To chyba równoznaczne z komplementem.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest3_15_05"); //A kiedy moge wrócic?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest3_10_06"); //Wkrótce. Bede sie cieszyc, gdy nadejdzie odpowiedni czas.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest4_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest4_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_00"); //Myslales, ze zupelnie zapomniales o swoim treningu ze mna.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_01"); //Czy powinienem powrócic?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_02"); //Nie pozwól, aby twoje galki byly skrecone!
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_03"); //Dzis zlapales mnie w milosierny nastrój, wiec porozmawiajmy o stalych eliksirach. Najwyzsza dyscyplina alchemików.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_04"); //Jestem gotowy.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_05"); //Zacznijmy od opowiesci: pozytywny efekt trwaly z eliksirem wydawal sie niemozliwy przez dlugi czas.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_06"); //Jego potencjal jest porównywalny z potencjalem Kamienia Filozoficznego, przy okazji mojego obecnego projektu.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_07"); //Chcesz zrobic Kamien Filozofowski?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_08"); //Kazdy alchemik tego chce. Ale jestem jedynym, kto moze.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_09"); //Powrót do tematu: Jeszcze kilkadziesiat lat temu drugi alchemik - oczywiscie przypadkiem - dowiedzial sie, jak nalezy zaprojektowac eliksiry, aby ich efekty nie zniknely.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_10"); //Bardzo rzadka roslina jest Kronstöckl. Na pierwszy rzut oka wydaje sie on bezwartosciowy i dlatego nie jest od dawna wykorzystywany w badaniach.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_11"); //Tylko w polaczeniu z roslinami stalymi, takimi jak korzen smoka i jagoda goblina, daje to pelny efekt.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_12"); //Produkcja eliksiru stalego jest prosta, ale wymaga duzej precyzji.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_13"); //Nalezy delikatnie podgrzac Kronstöckl i pozostala rosline potrzebna do picia w laboratoryjnej butelce z woda, aby woda zaczela sie gotowac.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_14"); //Jak tylko pierwsze pecherzyki urosna, zamknac butelke. Nie chwile predzej czy pózniej, rozumiesz?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_15"); //Bez problemu.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_16"); //Myslisz tak! Zrób dobra pamiec o tym, kiedy zgniatasz laboratoryjna butelke z woda.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_17"); //Dokladnie trzy dni pózniej, do godziny, usunac czesci rosliny z butelki i miec trwaly eliksir.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_18"); //Jesli nie trzymasz sie tego, eliksir staje sie zbyt mocny lub zbyt slaby i traci swoje pelne dzialanie.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest4_10_19"); //Spróbuj teraz spróbowac eliksiru zycia. Skladnikami tego sa lecznicze korzenie i Kronstöckl.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest4_15_20"); //Próbuje to zrobic.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, "Do warzenia eliksiru zycia potrzebuje uzdrawiajacego korzenia i koronki. Musza one byc przechowywane w szczelnie zamknietej butelce laboratoryjnej na trzy dni przed gotowaniem napoju.");

	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;

	B_LogEntry_NS	(TOPIC_TalentAlchemy,"ELIXIACJA ZYCIA ZYCIA: 1 korzen leczniczy i 1 korona.");

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ALCHEMY, 1);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest5_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Eliksir jest gotowy.";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest4))
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Mod_Darf_PermHealth == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest5_15_00"); //Eliksir jest gotowy.

	B_GiveInvItems	(hero, self, ItPo_Perm_Health, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_01"); //Musze przyznac, ze nie wydaje ci sie pan calkowicie bezzasadny.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_02"); //Tylko nieliczni z naszych cechów wiedza, jak wlasciwie obchodzic sie z Kronstöckl.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_03"); //Nauczylem cie wszystkiego, co musisz wiedziec.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest5_10_04"); //Pomysle o zadaniu, z którym mozesz Cie przetestowac. Wkrótce wróc do domu.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_THREE, LOG_SUCCESS);

	if (Mod_PermTrank_Tries == 1)
	{
		B_GivePlayerXP	(200);
	}
	else
	{
		B_GivePlayerXP	(100);
	};

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Constantino_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest6_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest5))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_00"); //Przyjedzcie tutaj, tu przyjdzcie!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_15_01"); //Dlaczego warto dzis zapraszac?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_10_02"); //Jestem na skraju przelomu! Ostatni przelom ludzkosci!

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "Czy jestes w trakcie znoszenia biurokracji?", Info_Mod_Constantino_LehrlingQuest6_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest6, "Masz na mysli sledztwo w sprawie Kamienia Filozoficznego?", Info_Mod_Constantino_LehrlingQuest6_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_C()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_00"); //Teoretycznie skonczylem juz jego opracowywanie. Ciagle potrzebuje materialów.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_01"); //Z wyjatkiem konwencjonalnego kamienia i laboratoryjnych butelek na wode, prawie nic nie mam w domu.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_02"); //Ty! I tak i tak zamierzalem wam udzielic kolejnego zadania.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_C_15_03"); //To prawda.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_C_10_04"); //Wiec pracujesz nad lista. I szybko!

	B_GiveInvItems	(self, hero, ItWr_SteinDerWeisen, 1);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest6);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "Konstantyn twierdzi, ze jest na krawedzi kamienia filozoficznego. Otrzymalem liste skladników, których nadal potrzebuje.");
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_B_15_00"); //Czy jestes w trakcie znoszenia biurokracji?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_B_10_01"); //Ci, którzy nie wiedza jak sie przed tym chronic, sa winni! Nie, mam na mysli Kamien Filozofowski.

	Info_Mod_Constantino_LehrlingQuest6_C();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest6_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest6_A_15_00"); //Masz na mysli sledztwo w sprawie Kamienia Filozoficznego?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest6_A_10_01"); //Co jeszcze pieklo!

	Info_Mod_Constantino_LehrlingQuest6_C();
};

INSTANCE Info_Mod_Constantino_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest7_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest6))
	&& (Npc_HasItems(hero, ItMi_GoldNugget_Addon) >= 5)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= 3)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= 2)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 15)
	&& (Npc_HasItems(hero, ItMi_Coal) >= 5)
	&& (Npc_HasItems(hero, ItMi_OldCoin) >= 30)
	&& (Npc_HasItems(hero, ItMi_Addon_WhitePearl) >= 5)
	&& (Npc_HasItems(hero, ItPo_Perm_Str) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Dex) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Health) >= 1)
	&& (Npc_HasItems(hero, ItPo_Perm_Mana) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_Info()
{
	Npc_RemoveInvItems	(hero, ItMi_GoldNugget_Addon, 5);
	Npc_RemoveInvItems	(hero, ItMi_RockCrystal, 3);
	Npc_RemoveInvItems	(hero, ItMi_Sulfur, 2);
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 15);
	Npc_RemoveInvItems	(hero, ItMi_Coal, 5);
	Npc_RemoveInvItems	(hero, ItMi_OldCoin, 30);
	Npc_RemoveInvItems	(hero, ItMi_Addon_WhitePearl, 5);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Str, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Dex, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Health, 1);
	Npc_RemoveInvItems	(hero, ItPo_Perm_Mana, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_00"); //W koncu wszystko dostales?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_01"); //Tak.

	B_ShowGivenThings	("Skladniki dla kamienia przekazywane szalwia");

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_10_02"); //Potem zostaw mnie sam na sam, az do konca.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_15_03"); //Trzymac przez sekunde. Obecnie jest to zbyt szybkie.

	B_GivePlayerXP	(1000);

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Co robisz z Kamieniem Filozoficznym?", Info_Mod_Constantino_LehrlingQuest7_C);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Jak odkryles proces produkcji?", Info_Mod_Constantino_LehrlingQuest7_B);
	Info_AddChoice	(Info_Mod_Constantino_LehrlingQuest7, "Co robi Kamien Filozoficzny?", Info_Mod_Constantino_LehrlingQuest7_A);
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_D()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_00"); //Ale to wystarczy, wazne eksperymenty musza czekac. Bede gotowy spróbowac tego kamienia jutro.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_D_10_01"); //Jesli Ty.... uh, chcesz sie posmakowac swoich klopotów, powinienes przyjechac.

	Info_ClearChoices	(Info_Mod_Constantino_LehrlingQuest7);

	B_LogEntry	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, "Dam Konstantynowi dzien na przeprowadzenie niezbednych eksperymentów na kamieniu filozoficznym.");

	Mod_Constantino_SDW_Day = Wld_GetDay();
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_C()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_C_15_00"); //Co robisz z Kamieniem Filozoficznym?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_C_10_01"); //Postaram sie, aby król Myrtany zlozyl mu oferte, której nie bedzie mógl odrzucic. Po tym jak sam stalem sie niesmiertelny.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_B()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_00"); //Jak odkryles proces produkcji?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_01"); //Uzywajac mojego mózgu.

	if (Mod_Ignaz_Bruder == 1)
	{
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_02"); //Przejelas badania od brata, prawda?
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_03"); //Brat? Kto....?
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_04"); //Jakis czas temu Ignaz sam mi powiedzial.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_05"); //Nie wierzysz w to, co szalone!
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_06"); //Zostal oszalaly go kamienie filozoficzne.
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_07"); //Zrobil to zle, czlowiek! Musial sie balaganic! Zawsze na drugim miejscu.
		AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_B_15_08"); //Mam watpliwosci co do wersji....
		AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_B_10_09"); //Co mnie obchodzi?
	};

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest7_A()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest7_A_15_00"); //Co robi Kamien Filozoficzny?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_01"); //Jest ostatecznym bodzcem pobudzajacym organizm. Calkowite wyleczenie odnowy i odmlodzenia.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest7_A_10_02"); //Jesli moje wyliczenia sa poprawne, które, jak mocno wierze, sa prawdziwe, mozna uzyskac niesmiertelnosc przez kamien.

	Mod_Constantino_SDW += 1;

	if (Mod_Constantino_SDW == 3)
	{
		Info_Mod_Constantino_LehrlingQuest7_D();
	};
};

INSTANCE Info_Mod_Constantino_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest8_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest7))
	&& (Wld_GetDay() > Mod_Constantino_SDW_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest8_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_00"); //Czy jestes tak samo podekscytowany jak ja?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest8_15_01"); //Nie moge zaprzeczyc pewnym napieciom.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_02"); //Ogólnie rzecz biorac, czas z wami nie byl az tak zly. Móglby zdobyc kilku nieporzadnych praktykantów.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_03"); //Dlatego chce, abyscie poczuli smak wiecznosci.

	createInvItems	(self, ItMi_SteinDerWeisen, 2);

	B_GiveInvItems	(self, hero, ItMi_SteinDerWeisen, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest8_10_04"); //Ale teraz jestem swiadkiem mojego niesmiertelnosci!

	B_UseItem	(self, ItMi_SteinDerWeisen);

	AI_PlayAni	(self, "T_MAGRUN_2_HEASHOOT");

	AI_StopProcessInfos	(self);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_47);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest9_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to sie stanie?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_00"); //Jak to sie stanie?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_01"); //Zamknac? W szczególnosci czy konkretnie?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_02"); //Ogólnie rzecz biorac......
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_03"); //Skacze z Lolke do Lolke. Moja klatka nie jest czyszczona, ale swieci slonce.
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest9_15_04"); //Oh, nie......
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest9_10_05"); //Chodz dalej! Dlaczego nie skakasz ze mna? (smiertelni)

	AI_StopProcessInfos	(self);
	
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_CONSTANTINO_FOUR, LOG_SUCCESS);
};

INSTANCE Info_Mod_Constantino_LehrlingQuest10 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_LehrlingQuest10_Condition;
	information	= Info_Mod_Constantino_LehrlingQuest10_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy nadal jestes zwariowany?";
};

FUNC INT Info_Mod_Constantino_LehrlingQuest10_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_LehrlingQuest9))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_LehrlingQuest10_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_00"); //Czy nadal jestes zwariowany?
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_01"); //Nie zwariowalem!
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_02"); //Dziekuje Bogom. Ale twoje cialo nie stalo sie mlodsze.
	AI_Output(self, hero, "Info_Mod_Constantino_LehrlingQuest10_10_03"); //Zamknac? Oczywiscie jest mlodszy! Czy nie widzisz mnie, kiedy przeskakuje miedzy chmurami jak mloda bomba?
	AI_Output(hero, self, "Info_Mod_Constantino_LehrlingQuest10_15_04"); //Nie, szczerze mówiac nie.
};

INSTANCE Info_Mod_Constantino_PaketZauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_PaketZauberwasser_Condition;
	information	= Info_Mod_Constantino_PaketZauberwasser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Constantino_PaketZauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Namib))
	&& (Npc_HasItems(hero, ItMi_LesterPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Info()
{
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_00"); //Czego chcesz?
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_01"); //Mam przyniesc ci ten pakiet z braterstwa.

	B_GiveInvItems	(hero, self, ItMi_LesterPaket, 1);
	Npc_RemoveInvItems	(self, ItMi_LesterPaket, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_02"); //Ah, nadszedl czas. Tutaj.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_03"); //Przynies Baal Namib. Powiedz mu teraz, ze to najlepsza rzecz na rynku!

	CreateInvItems	(self, ItMi_DuengerPaket, 1);
	B_GiveInvItems	(self, hero, ItMi_DuengerPaket, 1);

	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_04"); //Mam tez wziac butelke magicznej wody.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_05"); //Magiczna woda? Ty masz szczescie, mam tylko jedna butelke. To 500 sztuk zlota.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_15_06"); //Umiesc ja na zakladce Lester.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_07"); //WAS? Pijak i tak stoi z mna juz 3000 kawalków zlota w kredzie.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_10_08"); //Nie ma drogi! Albo zaplacisz 500 sztuk zlota lacznie z dlugami Lesters, albo nie dostajesz nic!

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Nie masz dla mnie cos do zrobienia?", Info_Mod_Constantino_PaketZauberwasser_ToDo);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Zapomnij o tym!", Info_Mod_Constantino_PaketZauberwasser_Nein);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Nie mam przy sobie tak wiele.", Info_Mod_Constantino_PaketZauberwasser_NotEnough);

	if (Npc_HasItems(hero, ItMi_Gold) >= 3500)
	{
		Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Wszystkie sluszne, wszystkie sluszne. Oto zloto.", Info_Mod_Constantino_PaketZauberwasser_Zahlen);
	};
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_ToDo()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_00"); //Nie masz dla mnie cos do zrobienia?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_01"); //Teraz wspomnial pan o tym...... Jak powiedzialem, moje magiczne zaopatrzenie w wode jest zbyt niskie.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_02"); //Pobierz mi skladniki do nowej partii, zobaczymy jak prowadzimy dzialalnosc.
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_ToDo_15_03"); //Wszystkie sluszne, wszystkie sluszne. Czego potrzebujesz?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_ToDo_10_04"); //Potrzebuje 10 butelek wody, 2 butelki slonej wody, 5 pokrzywek przeciwpozarowych i 5 roslin leczniczych, 3 niebieskie piosenki i chwast polny. Oto Twoja lista.

	CreateInvItems	(self, ItWr_ConstantinosZauberwasserliste, 1);
	B_GiveInvItems	(self, hero, ItWr_ConstantinosZauberwasserliste, 1);

	Mod_ConstantinoZauberwasser = 1;

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Aby odpracowac dlug Lester' a, musze przyniesc Constantino skladniki magicznej wody. Dal mi ich liste.");

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);

	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Poprzedni", Info_Mod_Constantino_PaketZauberwasser_BACK);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Gdzie moge znalezc rdeste?", Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Gdzie moge znalezc niebieskie piosenki?", Info_Mod_Constantino_PaketZauberwasser_Blauflieder);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Gdzie moge znalezc rosliny lecznicze?", Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Gdzie znajde pokrzywy przeciwpozarowe?", Info_Mod_Constantino_PaketZauberwasser_Feuernesseln);
	Info_AddChoice	(Info_Mod_Constantino_PaketZauberwasser, "Skad czerpac slona wode?", Info_Mod_Constantino_PaketZauberwasser_Salzwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Nein()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Nein_15_00"); //Zapomnij o tym!
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Nein_10_01"); //Potem wyjdz z tego miejsca!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Odmawialem zaplaty za zloto. Musze znalezc inny sposób, aby dostac magiczna wode.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich_15_00"); //Gdzie moge znalezc rdeste?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feldknoeterich_10_01"); //Nie znajdziesz go w miescie. Wejdz na zewnatrz i rozejrzyj sie dookola.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Blauflieder()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_15_00"); //Gdzie moge znalezc niebieskie piosenki?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Blauflieder_10_01"); //Rosnie wszedzie, rozejrzyj sie po poboczu drogi.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_15_00"); //Gdzie moge znalezc rosliny lecznicze?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Heilpflanzen_10_01"); //Jestem pewien, ze znajdziesz cos na sciezkach i w lesie.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Feuernesseln()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_15_00"); //Gdzie znajde pokrzywy przeciwpozarowe?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Feuernesseln_10_01"); //Sa prawie wszedzie. W klasztorze magików strazy pozarnej jest sporo osób.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Salzwasser()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_15_00"); //Skad czerpac slona wode?
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Salzwasser_10_01"); //Gdzie wedlug Ciebie jest slona woda? W morzu idiotuj! Zapytaj rybaka, moze dostaniesz butelke.
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_NotEnough()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_15_00"); //Nie mam przy sobie tak wiele.
	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_NotEnough_10_01"); //Potem wyjdz z tego miejsca!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Odmawialem zaplaty za zloto. Musze znalezc inny sposób, aby dostac magiczna wode.");

	Mob_CreateItems("CONSTANTINOSTRUHE", ItMi_Zauberwasser, 1);

	Mod_ConstantinoZauberwasser = 2;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

FUNC VOID Info_Mod_Constantino_PaketZauberwasser_Zahlen()
{
	AI_Output(hero, self, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_15_00"); //Wszystkie sluszne, wszystkie sluszne. Oto zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 3500);

	AI_Output(self, hero, "Info_Mod_Constantino_PaketZauberwasser_Zahlen_10_01"); //Dobre. Oto magiczna woda.

	CreateInvItems	(self, ItMi_Zauberwasser, 1);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Dostalem magiczna wode z Constantino. Przejdzmy teraz do Lestera.");

	Mod_ConstantinoZauberwasser = 3;

	Info_ClearChoices	(Info_Mod_Constantino_PaketZauberwasser);
};

INSTANCE Info_Mod_Constantino_Zauberwasser (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam wszystko.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_Condition()
{
	if (Mod_ConstantinoZauberwasser == 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= 3)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(hero, ItFo_Water) >= 10)
	&& (Npc_HasItems(hero, ItMi_Salzwasser) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_00"); //Mam wszystko.

	B_ShowGivenThings	("Podane 26 pozycji!");

	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Blueplant, 3);
	Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, 1);
	Npc_RemoveInvItems	(hero, ItFo_Water, 10);
	Npc_RemoveInvItems	(hero, ItMi_Salzwasser, 2);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_01"); //Bardzo dobry. Daj mi ja!

	AI_UseMob (self, "LAB", 1);
	AI_UseMob (self, "LAB", -1);

	AI_TurnToNpc	(self, hero);

	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_15_02"); //Czy moge miec butelke teraz?
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_03"); //Trzeba przyznac, ze bardzo mi pomoglas, ale to jeszcze nie pokrywa dlugu Lester!
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_04"); //Dostarczamy te cztery dostawy, a my bedziemy to nazywac nawet.

	CreateInvItems	(self, ItMi_Zauberwasser_MIS, 32);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser_MIS, 32);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_10_05"); //Dostawa do Orlanu, tawerny do Dead Harpie, dostawa do pubu w dzielnicy portowej, dostawa do pubu w dolnym miasteczku, dostawa do najemników w Onars Hof. Daj ja tam Thekli.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Konstantyn ma dla mnie cos innego do zrobienia: mam dostarczyc magiczna wode. Dostawy sa dla: Orlan w Taverne zur Toten Harpie, pub w dzielnicy portowej, pub w dolnym miescie i najemnicy w Onars Hof.");
};

INSTANCE Info_Mod_Constantino_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Constantino_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostarczylem magiczna wode.";
};

FUNC INT Info_Mod_Constantino_Zauberwasser_MIS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thekla_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Kardif_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Coragon_Zauberwasser))
	&& (Npc_KnowsInfo(hero, Info_Mod_Orlan_Zauberwasser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Zauberwasser_MIS_15_00"); //Dostarczylem magiczna wode.
	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_01"); //No cóz, oto Twoja magiczna woda.

	CreateInvItems	(self, ItMi_Zauberwasser, 8);
	B_GiveInvItems	(self, hero, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_Zauberwasser_MIS_10_02"); //Teraz wyjde stad, jestem zajety!

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Konstantyn dal mi butelke magicznej wody. Przejdzmy teraz do Lestera.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Constantino_VitaminC (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_VitaminC_Condition;
	information	= Info_Mod_Constantino_VitaminC_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tu powinienem kupic witamine C.";
};

FUNC INT Info_Mod_Constantino_VitaminC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Owen_Auftrag))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_00"); //Tu powinienem kupic witamine C.
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_01"); //Tak, jest tu torba.

	CreateInvItems	(self, ItFo_Addon_VitaminC, 1);
	B_GiveInvItems	(self, hero, ItFo_Addon_VitaminC, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_02"); //To daje 500 zlotych monet.
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_03"); //Nie oszukujesz mnie, czy to ty?
	AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_10_04"); //Dobrze, podam Ci okazala cene. Kosztowac to bedzie tylko 400 zlotych monet.

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);

		B_RaiseHandelsgeschick (2);

		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Zaakceptowac.", Info_Mod_Constantino_VitaminC_Ok_400);
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Zegluga.", Info_Mod_Constantino_VitaminC_Feilschen_400);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_15_05"); //Oto Twoje zloto.
	
		B_GiveInvItems	(hero, self, ItMi_Gold, 400);
	};
};

FUNC VOID Info_Mod_Constantino_VitaminC_Ok_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Ok_400_15_00"); //Oto Twoje zloto.
	
	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
};

FUNC VOID Info_Mod_Constantino_VitaminC_Feilschen_400()
{
	AI_Output(hero, self, "Info_Mod_Constantino_VitaminC_Feilschen_400_15_00"); //To zbyt wiele.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Constantino_VitaminC_Feilschen_400_10_01"); //Wszystko w porzadku, 300.

		B_GiveInvItems	(hero, self, ItMi_Gold, 300);

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Constantino_VitaminC_Feilschen_400_10_02"); //Chce miec wszystkie moje 400 zlotych monet.

		Info_ClearChoices	(Info_Mod_Constantino_VitaminC);
		
		Info_AddChoice	(Info_Mod_Constantino_VitaminC, "Zaakceptowac.", Info_Mod_Constantino_VitaminC_Ok_400);
	};
};

INSTANCE Info_Mod_Constantino_BosperLehrling (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling_Condition;
	information	= Info_Mod_Constantino_BosperLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozna z tego zaklecia zrobic nalewke?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling_Condition()
{
	if (Mod_Bosper_Tinktur == 1)
	&& (Npc_HasItems(hero, ItSc_Rueckverwandlung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_00"); //Czy mozna z tego zaklecia zrobic nalewke?

	B_GiveInvItems	(hero, self, ItSc_Rueckverwandlung, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_01"); //Próbujesz ukrasc mój cenny czas?
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling_15_02"); //Czy mozesz lub nie mozesz?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_03"); //Oczywiscie moge. Ale nie jest to takie latwe.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling_10_04"); //Przy awansie 100 zlotych monet, móglbym zrobic to jutro.
};

INSTANCE Info_Mod_Constantino_BosperLehrling2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling2_Condition;
	information	= Info_Mod_Constantino_BosperLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nastepnie rozpocznij prace!";
};

FUNC INT Info_Mod_Constantino_BosperLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling2_15_00"); //Nastepnie rozpocznij prace!

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling3 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling3_Condition;
	information	= Info_Mod_Constantino_BosperLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy wykonales/as nalewke?";
};

FUNC INT Info_Mod_Constantino_BosperLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling2))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_00"); //Czy wykonales/as nalewke?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_01"); //Nope.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_02"); //Dlaczego nie?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_03"); //Nie pozwole ci spieszyc sie. Moje badania nad Kamieniem Filozoficznym maja pierwszenstwo.
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling3_15_04"); //Kiedy bedziesz gotowy?
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling3_10_05"); //Przyjrzyjmy sie. Mozesz spasc jutro, ale nie martw sie o mnie.

	Mod_Bosper_Constantino = Wld_GetDay();
};

INSTANCE Info_Mod_Constantino_BosperLehrling4 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_BosperLehrling4_Condition;
	information	= Info_Mod_Constantino_BosperLehrling4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcialbym podniesc nalewke.";
};

FUNC INT Info_Mod_Constantino_BosperLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_BosperLehrling3))
	&& (Wld_GetDay() > Mod_Bosper_Constantino)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_BosperLehrling4_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_BosperLehrling4_15_00"); //Chcialbym podniesc nalewke.
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_01"); //Wygladasz bardzo dobrze wypoczety. (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_02"); //Wczoraj w dobrym nastroju przerwalem moje wazne eksperymenty.

	B_GiveInvItems	(self, hero, ItMi_Rueckverwandlungstinktur, 1);

	AI_Output(self, hero, "Info_Mod_Constantino_BosperLehrling4_10_03"); //Teraz juz nie martwcie sie!

	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Teraz mam nalewke i musze tylko ja naniesc.");

	Wld_InsertNpc	(Warg_Atalante,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION3");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_03");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_25_01_M");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_27_04");
};

INSTANCE Info_Mod_Constantino_Mitgift (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift_Condition;
	information	= Info_Mod_Constantino_Mitgift_Info;
	permanent	= 0;
	important	= 0;
	description	= "Widze, ze macie przy sobie trucizne zwierzeca....";
};

FUNC INT Info_Mod_Constantino_Mitgift_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_00"); //Widze, ze macie przy sobie trucizne zwierzeca....
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_01"); //Co nalezy z Toba zrobic?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_02"); //Potrzebowalabym butelki tak jak to....
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_03"); //Nie, to nie jest na sprzedaz. Bo to moja jedyna kopia.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_04"); //Lowca znalazl go w ukrytym trupie wsród dzikich zwierzat i przyprowadzil do mnie.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_05"); //Wlasnie zorientowalem sie, jak taka trucizne sobie sam sobie wyrobilem.....
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_06"); //Czy móglby pan zrobic mi z tego butelke....
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_07"); //To jest coraz lepsze i lepsze. Dlaczego bym to zrobil?
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift_15_08"); //Mistrz Neoras potrzebuje go do swoich badan.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_09"); //Ach, tak..... oczywiscie, ze to cos innego.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_10"); //To bylby zaszczyt pomagac magowi ognia i doswiadczonemu alchemikowi w jego badaniach.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_11"); //Do produkcji trucizny potrzebowalbym co najmniej Blufliegenstachel i Minecrawlerzerzange.
	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift_10_12"); //Byc moze w doku znajdziesz to, czego szukasz w starej Zausel.

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Konstantyn mógl produkowac dla mnie trucizne zwierzeca, ale potrzebowalby kregoslupa i kleszczy do miotania.");
};

INSTANCE Info_Mod_Constantino_Mitgift2 (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Mitgift2_Condition;
	information	= Info_Mod_Constantino_Mitgift2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj dostalem zadlo i kleszcze.";
};

FUNC INT Info_Mod_Constantino_Mitgift2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Mitgift))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Neoras_Mitgift2))
	&& (Npc_HasItems(hero, ItAt_Sting) >= 1)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Mitgift2_Info()
{
	AI_Output(hero, self, "Info_Mod_Constantino_Mitgift2_15_00"); //Tutaj dostalem zadlo i kleszcze.

	Npc_RemoveInvItems	(hero, ItAt_Sting, 1);
	Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, 1);

	B_ShowGivenThings	("Szczypce do mikaczy i kregoslup krwi podanej");

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_01"); //Bardzo dobry. Po prostu daj mi chwile....

	AI_UseMob	(self, "LAB", 1);

	AI_Wait	(self, 3);

	AI_UseMob	(self, "LAB", -1);

	AI_Output(self, hero, "Info_Mod_Constantino_Mitgift2_10_02"); //Oto koncentrat dla neorasów. I niech go pozdrawiam.

	B_GiveInvItems	(self, hero, ItPo_Tiergift, 1);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_NEORAS_MITGIFT, "Constantino zrobilo mi trucizne zwierzeca.");
};

INSTANCE Info_Mod_Constantino_MangelQuest (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_MangelQuest_Condition;
	information	= Info_Mod_Constantino_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zakup srodka grzybobójczego (80 zl)";
};

FUNC INT Info_Mod_Constantino_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Constantino_Anschlagtafel (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Anschlagtafel_Condition;
	information	= Info_Mod_Constantino_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Constantino_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Constantino == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel)
	&& (Npc_HasItems(hero, ItPl_Blueplant) >= Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder)
	&& (Npc_HasItems(hero, ItMi_Flask) >= Mod_Anschlagtafel_Khorinis_Constantino_Flasche)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel)
	&& (Npc_HasItems(hero, ItPl_Temp_Herb) >= Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich)
	&& (Npc_HasItems(hero, ItPl_Mushroom_02) >= Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch)
	&& (Npc_HasItems(hero, ItPl_Mushroom_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz)
	&& (Npc_HasItems(hero, ItPl_Mushroom_03) >= Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz)
	&& (Npc_HasItems(hero, ItPl_SwampHerb) >= Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut)
	&& (Npc_HasItems(hero, ItPl_Heilknospe) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe)
	&& (Npc_HasItems(hero, ItPl_Weed) >= Mod_Anschlagtafel_Khorinis_Constantino_Unkraut)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze)
	{
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Feuernessel);
		Npc_RemoveInvItems	(hero, ItPl_Blueplant, Mod_Anschlagtafel_Khorinis_Constantino_Blauflieder);
		Npc_RemoveInvItems	(hero, ItMi_Flask, Mod_Anschlagtafel_Khorinis_Constantino_Flasche);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Heilkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Heilwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_02, Mod_Anschlagtafel_Khorinis_Constantino_Feuerkraut);
		Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_03, Mod_Anschlagtafel_Khorinis_Constantino_Feuerwurzel);
		Npc_RemoveInvItems	(hero, ItPl_Temp_Herb, Mod_Anschlagtafel_Khorinis_Constantino_Feldknoeterich);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_02, Mod_Anschlagtafel_Khorinis_Constantino_Buddlerfleisch);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_01, Mod_Anschlagtafel_Khorinis_Constantino_Dunkelpilz);
		Npc_RemoveInvItems	(hero, ItPl_Mushroom_03, Mod_Anschlagtafel_Khorinis_Constantino_Fliegenpilz);
		Npc_RemoveInvItems	(hero, ItPl_SwampHerb, Mod_Anschlagtafel_Khorinis_Constantino_Sumpfkraut);
		Npc_RemoveInvItems	(hero, ItPl_Heilknospe, Mod_Anschlagtafel_Khorinis_Constantino_Heilknospe);
		Npc_RemoveInvItems	(hero, ItPl_Weed, Mod_Anschlagtafel_Khorinis_Constantino_Unkraut);
		Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, Mod_Anschlagtafel_Khorinis_Constantino_Heilpflanze);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Constantino_Gold);

		AI_Output(self, hero, "Info_Mod_Constantino_Anschlagtafel_10_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Constantino_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Constantino = 0;
		Mod_Anschlagtafel_Khorinis_Constantino_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Constantino, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Constantino_Lehrer (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Lehrer_Condition;
	information	= Info_Mod_Constantino_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie alchemii.";
};

FUNC INT Info_Mod_Constantino_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Hi))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Constantino_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Constantino_Lehrer_10_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
	Info_AddChoice 		(Info_Mod_Constantino_Lehrer,DIALOG_BACK,Info_Mod_Constantino_Lehrer_BACK);
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_07] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Napój lekkiego leczenia", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_07)), Info_Mod_Constantino_Lehrer_Health_07);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Lekki eliksir leczniczy", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_06)), Info_Mod_Constantino_Lehrer_Health_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Napoje szybko lecznicze", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_05)), Info_Mod_Constantino_Lehrer_Health_05);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Istota uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Constantino_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Ekstrakt z ekstraktu leczniczego", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Constantino_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Eliksir uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Constantino_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_06] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Pic lekka mane", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_06)), Info_Mod_Constantino_Lehrer_Mana_06);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_05] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Eliksir lekki", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_05)), Info_Mod_Constantino_Lehrer_Mana_05);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Constantino_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("ekstrakt z maneny", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Constantino_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Constantino_Lehrer_Mana_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Szybkosc", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Constantino_Lehrer_Speed);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice	  (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Eliksir Ducha Swietego", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), Info_Mod_Constantino_Lehrer_Perm_Mana);
	};                                                                                                                                                                            
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	&& (Kapitel >= 3)
	{                                                                                                                                                                                     
		Info_AddChoice (Info_Mod_Constantino_Lehrer, B_BuildLearnString ("Skrobia Eliksir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), Info_Mod_Constantino_Lehrer_PermSTR);               
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice (Info_Mod_Constantino_Lehrer,B_BuildLearnString ("Eliksir umiejetnosci", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), Info_Mod_Constantino_Lehrer_Perm_DEX);
	};
};
FUNC VOID Info_Mod_Constantino_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Constantino_Lehrer);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Health_07()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_07);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_05()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_05);
};
FUNC VOID Info_Mod_Constantino_Lehrer_MANA_06()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_06);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};
FUNC VOID Info_Mod_Constantino_Lehrer_PermStr()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_STR);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_DEX);
};
FUNC VOID Info_Mod_Constantino_Lehrer_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Perm_Mana);
};

INSTANCE Info_Mod_Constantino_Trade (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Trade_Condition;
	information	= Info_Mod_Constantino_Trade_Info;
	trade		= 1;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Constantino_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Constantino_Pickpocket (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_Pickpocket_Condition;
	information	= Info_Mod_Constantino_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Constantino_Pickpocket_Condition()
{
	C_Beklauen	(110, ItPl_Perm_Herb, 1);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_BACK, Info_Mod_Constantino_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Constantino_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Constantino_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Constantino_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Constantino_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Constantino_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Constantino_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Constantino_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Constantino_EXIT (C_INFO)
{
	npc		= Mod_532_NONE_Constantino_NW;
	nr		= 1;
	condition	= Info_Mod_Constantino_EXIT_Condition;
	information	= Info_Mod_Constantino_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Constantino_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Constantino_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
