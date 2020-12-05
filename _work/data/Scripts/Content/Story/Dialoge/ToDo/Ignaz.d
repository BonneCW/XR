INSTANCE Info_Mod_Ignaz_Hi (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Hi_Condition;
	information	= Info_Mod_Ignaz_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Ignaz_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_01"); //Nikt w szczególnosci nie - tylko w ciemnosci zaoruje sie ptakiem.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_15_02"); //Widze.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_03"); //Dawno temu ktos mi to powiedzial! (smiech) Smiertelny materac unosi sie nad zimnym wiatrem.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_14_04"); //Czy masz wiecej gotówki?

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "To staje sie zbyt glupie.", Info_Mod_Ignaz_Hi_B);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Czy nie myslisz?", Info_Mod_Ignaz_Hi_A);
};

FUNC VOID Info_Mod_Ignaz_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_B_15_00"); //To staje sie zbyt glupie.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_A_15_00"); //Czy nie myslisz?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_A_14_01"); //Wszyscy nazywaja mnie szalonymi, od magty do mulu.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Dlaczego jestes zwariowany?", Info_Mod_Ignaz_Hi_D);
	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Czy nie istnieje cos, co mozesz z tym zrobic?", Info_Mod_Ignaz_Hi_C);
};

FUNC VOID Info_Mod_Ignaz_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_00"); //Dlaczego jestes zwariowany?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_01"); //Nie zwariowalem!
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_02"); //Co zatem?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_03"); //Jestem nieskonczenie madry! Pomysl w przyszlosci i przeszlosci, we wszystkich mozliwych wymiarach - przekletym pysznym gulaszu, przekletym wkretem, wyciagnij oczy z mojego wózka!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_04"); //Ciezkosc ciezkosci ciezko jest zabrac z noga w góre.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_05"); //A gdzie to robi.... nieskonczona madrosc?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_06"); //Tylko kamien filozoficzny moze pomóc stopie zawodnika.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_07"); //Znalazles go, Kamien Filozofowski?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_08"); //Zalozyciel? Zaparzone, zjadane, strawione, gówno! Ahahahahaha!
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_09"); //Naprawde, mój brat wpadl w otchlan.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_10"); //Kim jest twój brat?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_11"); //Constantino, podróznik..... kierowca podrózujacy? Miejmy nadzieje, ze beda kule miesne.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_12"); //Konstantyn jest twoim bratem?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_13"); //Jak mówia górnicy, jedna blizniacza gwiazda.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_14"); //A co masz na mysli, on idzie w otchlan?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_15"); //Gra w pilke to zabawa.
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_D_15_16"); //Nieskonczona madrosc zdaje sie Cie przeplacac.
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_D_14_17"); //Dla mnie i moich trzech kotów nie stanowi to zadnego problemu.

	Mod_Ignaz_Bruder = 1;

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);
};

FUNC VOID Info_Mod_Ignaz_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Hi_C_15_00"); //Czy nie istnieje cos, co mozesz z tym zrobic?
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_01"); //Dlaczego? W szczególnosci bardzo praktyczne jest szalenstwo. Wlasciwie to szalenstwo, zeby nie zwariowac. (smiech pominiety, a nastepnie natychmiast znowu stonowany)
	AI_Output(self, hero, "Info_Mod_Ignaz_Hi_C_14_02"); //Nie rozumiem tego teraz.

	Info_ClearChoices	(Info_Mod_Ignaz_Hi);

	Info_AddChoice	(Info_Mod_Ignaz_Hi, "Dlaczego jestes zwariowany?", Info_Mod_Ignaz_Hi_D);
};

INSTANCE Info_Mod_Ignaz_Handel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Handel_Condition;
	information	= Info_Mod_Ignaz_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sprzedajesz dostawy alchemiczne?";
};

FUNC INT Info_Mod_Ignaz_Handel_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Handel_15_00"); //Sprzedajesz dostawy alchemiczne?
	AI_Output(self, hero, "Info_Mod_Ignaz_Handel_14_01"); //Tak, tak, tak, tu wszystko. A moze sie myle?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Ignaz moze sprzedac mi eliksiry.");
};

INSTANCE Info_Mod_Ignaz_Lehrer (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Lehrer_Condition;
	information	= Info_Mod_Ignaz_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie czegos nauczyc?";
};

FUNC INT Info_Mod_Ignaz_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_00"); //Czy mozesz mnie czegos nauczyc?
	AI_Output(self, hero, "Info_Mod_Ignaz_Lehrer_14_01"); //Moge pokazac Ci, jak umiescic 10 magów na polu, aby wygrac! I jak robisz zaklecia na rolkach!
	AI_Output(hero, self, "Info_Mod_Ignaz_Lehrer_15_02"); //Wtedy lepiej pokazac mi ten z rolkami zaklecia.
};

INSTANCE Info_Mod_Ignaz_Irdorath (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Irdorath_Condition;
	information	= Info_Mod_Ignaz_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj mistrza alchemii, eliksiru i botaniki.";
};

FUNC INT Info_Mod_Ignaz_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_00"); //Witaj Mistrz alchemii, eliksirów i botaniki, chcialem....
	AI_Output(self, hero, "Info_Mod_Ignaz_Irdorath_14_01"); //Napoje i rosliny? Nie, szczególnie znam sie na mówieniu ról i komponentów zwierzecych....
	AI_Output(hero, self, "Info_Mod_Ignaz_Irdorath_15_02"); //Ach, to juz sie stalo.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Ignaz nie jest alchemikiem, którego szukam....");
};

INSTANCE Info_Mod_Ignaz_Amulett (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Amulett_Condition;
	information	= Info_Mod_Ignaz_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co sie stalo z Toba?";
};

FUNC INT Info_Mod_Ignaz_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Myxir_GotoIgnaz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_00"); //Co sie stalo z Toba?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_01"); //(grozy) Mä...... Mezczyzni! nowicjusze Oni maja mnie...... skradziony i pobity......
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_02"); //Co kradna?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_03"); //Stary amulet!
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_04"); //Amulet? Gdzie oni to robili?
	AI_Output(self, hero, "Info_Mod_Ignaz_Amulett_14_05"); //Kamienne kolo..... duzy las..... rytualny
	AI_Output(hero, self, "Info_Mod_Ignaz_Amulett_15_06"); //Co to jest sprawa, stary czlowiek?

	Wld_InsertNpc	(Mod_1995_UntoterNovize_01_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1996_UntoterNovize_02_NW, "BIGFARM");
	Wld_InsertNpc	(Mod_1997_UntoterNovize_03_NW, "BIGFARM");

	Wld_InsertItem	(ItAm_GardeInnos, "FP_TROLLAREA_RITUAL_ITEM");

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BEL_SUCHE, "Ignaz jest bliski smierci, a amulet zostal skradziony przez nowicjuszy. Wydaje sie, ze sa na kamiennym kole w duzym lesie.");
};

INSTANCE Info_Mod_Ignaz_MangelQuest (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_MangelQuest_Condition;
	information	= Info_Mod_Ignaz_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zakup srodka grzybobójczego (80 zl)";
};

FUNC INT Info_Mod_Ignaz_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Faros_MangelQuest2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 80)
	&& (Npc_HasItems(hero, ItMi_Fungizid) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_MangelQuest_Info()
{
	B_GiveInvItems	(hero, self, ItMi_Gold, 80);

	B_GiveInvItems	(self, hero, ItMi_Fungizid, 1);
};

INSTANCE Info_Mod_Ignaz_Flugblaetter (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Flugblaetter_Condition;
	information	= Info_Mod_Ignaz_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dla Ciebie ulotke.";
};

FUNC INT Info_Mod_Ignaz_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Ignaz_Flugblaetter_15_00"); //Mam dla Ciebie ulotke.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_01"); //Dziekuje, dziekuje. Zobaczmy jak.....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Ignaz_Flugblaetter_14_02"); //Ah tak. Moze zatrzymam sie przy Matteo' s.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Ignaz_Anschlagtafel (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Anschlagtafel_Condition;
	information	= Info_Mod_Ignaz_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Ignaz_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Ignaz == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Pitch) >= Mod_Anschlagtafel_Khorinis_Ignaz_Pech)
	&& (Npc_HasItems(hero, ItMi_Coal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Kohle)
	&& (Npc_HasItems(hero, ItMi_Quartz) >= Mod_Anschlagtafel_Khorinis_Ignaz_Quartz)
	&& (Npc_HasItems(hero, ItMi_RockCrystal) >= Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall)
	&& (Npc_HasItems(hero, ItWr_Paper) >= Mod_Anschlagtafel_Khorinis_Ignaz_Papier)
	&& (Npc_HasItems(hero, ItAt_Sting) >= Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel)
	&& (Npc_HasItems(hero, ItAt_CrawlerMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen)
	&& (Npc_HasItems(hero, ItAt_SpiderMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen)
	&& (Npc_HasItems(hero, ItAt_BugMandibles) >= Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen)
	&& (Npc_HasItems(hero, ItAt_GoblinBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen)
	&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen)
	&& (Npc_HasItems(hero, ItSc_Sleep) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber)
	&& (Npc_HasItems(hero, ItSc_Charm) >= Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber)
	&& (Npc_HasItems(hero, ItSc_Fear) >= Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber)
	&& (Npc_HasItems(hero, ItMi_Sulfur) >= Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel)
	{
		Npc_RemoveInvItems	(hero, ItMi_Pitch, Mod_Anschlagtafel_Khorinis_Ignaz_Pech);
		Npc_RemoveInvItems	(hero, ItMi_Coal, Mod_Anschlagtafel_Khorinis_Ignaz_Kohle);
		Npc_RemoveInvItems	(hero, ItMi_Quartz, Mod_Anschlagtafel_Khorinis_Ignaz_Quartz);
		Npc_RemoveInvItems	(hero, ItMi_RockCrystal, Mod_Anschlagtafel_Khorinis_Ignaz_Bergkristall);
		Npc_RemoveInvItems	(hero, ItWr_Paper, Mod_Anschlagtafel_Khorinis_Ignaz_Papier);
		Npc_RemoveInvItems	(hero, ItAt_Sting, Mod_Anschlagtafel_Khorinis_Ignaz_Blutfliegenstachel);
		Npc_RemoveInvItems	(hero, ItAt_CrawlerMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Minecrawlerzangen);
		Npc_RemoveInvItems	(hero, ItAt_SpiderMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Spinnenzangen);
		Npc_RemoveInvItems	(hero, ItAt_BugMandibles, Mod_Anschlagtafel_Khorinis_Ignaz_Feldraeuberzangen);
		Npc_RemoveInvItems	(hero, ItAt_GoblinBone, Mod_Anschlagtafel_Khorinis_Ignaz_Goblinknochen);
		Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, Mod_Anschlagtafel_Khorinis_Ignaz_Skelettknochen);
		Npc_RemoveInvItems	(hero, ItSc_Sleep, Mod_Anschlagtafel_Khorinis_Ignaz_Schlafzauber);
		Npc_RemoveInvItems	(hero, ItSc_Charm, Mod_Anschlagtafel_Khorinis_Ignaz_Vergessenszauber);
		Npc_RemoveInvItems	(hero, ItSc_Fear, Mod_Anschlagtafel_Khorinis_Ignaz_Angstzauber);
		Npc_RemoveInvItems	(hero, ItMi_Sulfur, Mod_Anschlagtafel_Khorinis_Ignaz_Schwefel);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Ignaz_Gold);

		AI_Output(self, hero, "Info_Mod_Ignaz_Anschlagtafel_14_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Ignaz_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Ignaz = 0;
		Mod_Anschlagtafel_Khorinis_Ignaz_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Ignaz, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Ignaz_LearnScrolls (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_LearnScrolls_Condition;
	information	= Info_Mod_Ignaz_LearnScrolls_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString ("jalowcy", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));
};

FUNC INT Info_Mod_Ignaz_LearnScrolls_Condition()
{
	Info_Mod_Ignaz_LearnScrolls.description = B_BuildLearnString ("jalowcy", B_GetLearnCostTalent (hero, NPC_TALENT_SCROLLS, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Lehrer))
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_SCROLLS) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_LearnScrolls_Info()
{
	if (B_TeachPlayerTalentScrolls(self, hero, 1))
	{
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_00"); //Aby stworzyc zaklecie, najpierw potrzebujesz runy odpowiedniego kierunku magii.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_01"); //Efekt runa mozna cwiczyc na kartce papieru uzywajac kamienia runowego i skladników zaklecia.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_02"); //Jednakze, mozna zrobic runa nie tylko czar, ale takze mocniejszy, ale bedzie trzeba przepis i wszystkie skladniki kazdego etapu posredniego.
		AI_Output(self, hero, "Info_Mod_Ignaz_LearnScrolls_14_03"); //Wiec jesli chcesz stworzyc rolke fireballowa, potrzebujesz wszystkiego, czego potrzebujesz dla rolki fireballowej, jak równiez wszystkiego, czego potrzebujesz do stworzenia strzaly przeciwpozarowej.
	};
};

INSTANCE Info_Mod_Ignaz_Trade (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Trade_Condition;
	information	= Info_Mod_Ignaz_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Ignaz_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ignaz_Handel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Ignaz_Pickpocket (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_Pickpocket_Condition;
	information	= Info_Mod_Ignaz_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ignaz_Pickpocket_Condition()
{
	C_Beklauen	(43, ItPl_Temp_Herb, 3);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_BACK, Info_Mod_Ignaz_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ignaz_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ignaz_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ignaz_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ignaz_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ignaz_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ignaz_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ignaz_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ignaz_EXIT (C_INFO)
{
	npc		= Mod_584_NONE_Ignaz_NW;
	nr		= 1;
	condition	= Info_Mod_Ignaz_EXIT_Condition;
	information	= Info_Mod_Ignaz_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ignaz_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
