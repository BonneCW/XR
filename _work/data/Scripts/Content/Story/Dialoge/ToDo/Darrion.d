INSTANCE Info_Mod_Darrion_Hi (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hi_Condition;
	information	= Info_Mod_Darrion_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_00"); //Witam w mojej kuzni.
	AI_Output(self, hero, "Info_Mod_Darrion_Hi_11_01"); //Jesli potrzebujesz miecza, mozesz go ode mnie zdobyc.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Darrion sprzedaje bron.");
};

INSTANCE Info_Mod_Darrion_Urs (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs_Condition;
	information	= Info_Mod_Darrion_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kowal, oto Twoja blogoslawiona stal.";
};

FUNC INT Info_Mod_Darrion_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_ErzpaketDarrion) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_00"); //Kowal, oto Twoja blogoslawiona stal.

	B_GiveInvItems	(hero, self, ItMi_ErzpaketDarrion, 1);

	Npc_RemoveInvItems	(self, ItMi_ErzpaketDarrion, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_01"); //Sceptycznie) Naprawde? Cóz, spróbuje to najpierw.

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_02"); //Wiec ostrze bedzie zrobione. Zabieram go teraz do Gor Na Ran.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_03"); //Pozwól mu wypróbowac je na obsesyjnych roslinach, które obecnie strzelaja z ziemi jak chwasty.
	AI_Output(hero, self, "Info_Mod_Darrion_Urs_15_04"); //Posiadane rosliny?
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_05"); //Cóz, maly eksperyment, który wyszedl z reki.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_06"); //Baals próbowal zwiekszyc zniwa bagna poprzez magiczne oddzialywanie na ziolo..... z zakleciami rózniacymi sie od zaklec.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_07"); //Niestety, cala rzecz zabrala niekontrolowane, demoniczne ekscesy.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_08"); //Posiadane ziele jest niezwykle agresywne i trwale. Jak tylko z trudem skonczysz zaklad, zaczynasz strzelac do nowego zakladu gdzie indziej.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_09"); //Jezeli stal rzeczywiscie bedzie miala mozliwosc zakazania demonicznych sil, znacznie ulatwi to zadanie templariuszy.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs_11_10"); //Teraz podazaj za mna.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOGORNARAN");
};

INSTANCE Info_Mod_Darrion_Urs2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Urs2_Condition;
	information	= Info_Mod_Darrion_Urs2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Urs2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaRan_Urs2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Urs2_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_00"); //Cóz, ta imponujaca demonstracja stali jest dla mnie wystarczajaca. W tym pakiecie oplaca sie kazdy galazka kapusty.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_01"); //Ach, wezcie te lodygi tutaj jako bonus.... po drodze.

	CreateInvItems	(hero, ItMi_Addon_Joint_02, 3);
	CreateInvItems	(hero, ItMi_Traumruf, 3);

	B_ShowGivenThings	("3 Czarni Medrcy i 3 Marzenia Otrzymane Wezwanie");

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_02"); //Dzieki. Mam nadzieje, ze czegos sie z tego nauczyles.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_03"); //Oczywiscie oczywiscie. Nigdy juz tego nie zrobimy. Musza istniec lepsze sposoby na zwiekszenie zbiorów ziól.
	AI_Output(self, hero, "Info_Mod_Darrion_Urs2_11_04"); //Niektórzy z naszych chlopców sa obecnie na drodze w calym Khorinis i testuja wzrost roslin na glebach pod wplywem magicznych wplywów.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Darrion_Urs2_15_05"); //(wlasnie do siebie) No cóz, to nie jest dokladnie to, co mialem na mysli. Ale co to za pieklo.
	AI_Output(self, hero, "DEFAULT"); //

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "No cóz, mam paczke chwastów z obozu bagiennego.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Hueterklinge (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Hueterklinge_Condition;
	information	= Info_Mod_Darrion_Hueterklinge_Info;
	permanent	= 1;
	important	= 0;
	description	= "Zrób mi ostrze straznika!";
};

FUNC INT Info_Mod_Darrion_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Hueterklinge_15_00"); //Zrób mi ostrze straznika!
	AI_Output(self, hero, "Info_Mod_Darrion_Hueterklinge_13_01"); //Masz wszystkie skladniki?

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);

	Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, DIALOG_BACK, Info_Mod_Darrion_Hueterklinge_BACK);

	if (Mod_TPL_Hueterklinge_Art == 2)
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(wybrac niewlasciwe skladniki)", Info_Mod_Darrion_Hueterklinge_B2);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 8)
		&& (Npc_HasItems(hero, ItPl_Health_Herb_01_Reisfresser) >= 6)
		&& (Npc_HasItems(hero, ItMw_1H_VLK_Dagger_Blut) >= 1)
		&& (Npc_HasItems(hero, ItFo_MuttonRaw_Scav) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(dodac wlasciwe skladniki)", Info_Mod_Darrion_Hueterklinge_A2);
		};
	}
	else
	{
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(wybrac niewlasciwe skladniki)", Info_Mod_Darrion_Hueterklinge_B1);
		};
		if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
		&& (Npc_HasItems(hero, ItMi_Orkstatuette_Stonehenge) >= 1)
		&& (Npc_HasItems(hero, ItAt_SkeletonBone_Herrscher) >= 1)
		&& (Npc_HasItems(hero, ItAt_Teeth_Wolf) >= 1)
		{
			Info_AddChoice	(Info_Mod_Darrion_Hueterklinge, "(dodac wlasciwe skladniki)", Info_Mod_Darrion_Hueterklinge_A1);
		};
	};
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Mialem Darrion sfalszowac falszywe ostrze straznika dla mnie. Mam pójsc do Cor Angar i przedstawic sie.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A2()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 8);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01_Reisfresser, 6);
	Npc_RemoveInvItems	(hero, ItMw_1H_Vlk_Dagger_Blut, 1);
	Npc_RemoveInvItems	(hero, ItFo_MuttonRaw_Scav, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_2H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Darrion podrobil mi ostrze straznika. Mam pójsc do Cor Angar i przedstawic sie.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_B1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_FalscheHueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Mialem Darrion sfalszowac falszywe ostrze straznika dla mnie. Mam pójsc do Cor Angar i przedstawic sie.");

	Mod_TPL_Hueterklinge = 2;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

FUNC VOID Info_Mod_Darrion_Hueterklinge_A1()
{
	Npc_RemoveInvItems	(hero, ItMi_Nugget, 4);
	Npc_RemoveInvItems	(hero, ItMi_Orkstatuette_Stonehenge, 1);
	Npc_RemoveInvItems	(hero, ItAt_SkeletonBone_Herrscher, 1);
	Npc_RemoveInvItems	(hero, ItAt_Teeth_Wolf, 1);

	AI_UseMob	(self, "FIRE", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "FIRE", -1);

	AI_UseMob	(self, "ANVIL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "ANVIL", -1);

	AI_UseMob	(self, "COOL", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "COOL", -1);

	AI_UseMob	(self, "SHARP", 1);

	AI_Wait	(self, 2);

	AI_UseMob	(self, "SHARP", -1);

	AI_GotoNpc	(self, hero);

	AI_TurnToNpc	(self, hero);
	AI_TurnToNpc	(hero, self);

	B_GiveInvItems	(self, hero, ItMw_Hueterklinge_1H, 1);

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Darrion podrobil mi ostrze straznika. Mam pójsc do Cor Angar i przedstawic sie.");

	Mod_TPL_Hueterklinge = 3;

	Info_ClearChoices	(Info_Mod_Darrion_Hueterklinge);
};

INSTANCE Info_Mod_Darrion_Sumpfmensch (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fortuno powiedzial mi, ze zobaczyliscie wydzielajace sie bagna.";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_00"); //Fortuno powiedzial mi, ze zobaczyliscie wydzielajace sie bagna.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_01"); //Tak, zrobilem, a kosztowalo mnie to prawie cale moje zycie! Nie wiem, któremu Bogu dziekuje, ale to, ze wciaz zyje, graniczy z cudem.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_15_02"); //Gdzie go spotkales/as?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_03"); //Gleboko w bagnie. Kiedys uprawialem tam specjalne chwasty torfowiskowe, które po prostu nie rozwijaja sie na obszarach peryferyjnych.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_04"); //Kilka tygodni temu, kiedy chcialem zobaczyc, co tam bylo, to stworzenie nagle stanelo przed mna. Prawie grzebie moje spodnie!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_05"); //Nawet czulem sie jak dziewczynka!
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_11_06"); //Powiedzialem innym i powiem wam:"Jesli kiedykolwiek natkniesz sie na tego potwora, wlóz nogi do dloni i biegnij!

	B_StartOtherRoutine	(Mod_951_PSINOV_Fortuno_MT, "START");
	B_StartOtherRoutine	(Mod_1339_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_2008_PSINOV_Ghorim_MT, "START");
	B_StartOtherRoutine	(Mod_1337_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1336_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1338_PSINOV_Novize_MT, "START");

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Gdzie w bagnie zasadziles swoje bagienne chwasty?", Info_Mod_Darrion_Sumpfmensch_C);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Poszedles na morze wczesniej?", Info_Mod_Darrion_Sumpfmensch_B);
	Info_AddChoice	(Info_Mod_Darrion_Sumpfmensch, "Jakie specjalne torfowisko zasadziles tam?", Info_Mod_Darrion_Sumpfmensch_A);
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_C()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_C_15_00"); //Gdzie w bagnie zasadziles swoje bagienne chwasty?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_C_11_01"); //Gdzies daleko w srodku, ale nie wpadam na pomysl szukania tego, chlopiec, powiem jeszcze raz: stworzenie jest niebezpieczne, to gonna rozerwac tylek!
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_B()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_00"); //Poszedles na morze wczesniej?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_01"); //Kiedys bylem piratem, chlopcem! I co za facet!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_B_15_02"); //Dlaczego opusciles piratów?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_03"); //Bylem zmeczony, ze jestem piratem, chlopcem.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_04"); //A tu? W tym miejscu w ciagu dnia troche sie rozbijam, zeby moje miesnie nie zardzewialy, nie palily troche ziól bagiennych, a slonce swiecilo na brzuchu przez reszte dnia.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_B_11_05"); //Teraz zostaw mnie sam na sam.

	Info_ClearChoices	(Info_Mod_Darrion_Sumpfmensch);

	AI_StopProcessInfos	(self);
	
	B_StartOtherRoutine(Mod_3001_PSINOV_Balor_MT, "ATDARRION");
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch_A()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch_A_15_00"); //Jakie specjalne torfowisko zasadziles tam?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_01"); //To bylo bardzo ladne, wykopalem ja z duzego bagna, które jest nieco oddalone od zatoki piratów i przywiozlem ja ze mna.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch_A_11_02"); //Musial straszyc kilka brzydkich bestii, aby dostac sie do niego.
};

INSTANCE Info_Mod_Darrion_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch2_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch2_Info()
{
	AI_TurnAway(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_00"); //(jemu samemu) Czy moze to byc to, ze on....? Nie moze byc absolutnie niemozliwe! On nigdy nie chcialby Ale co jesli tak jest? Czy moze byc tak, ze on....?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_01"); //Dlaczego tak zdenerwowany?
	
	AI_TurnToNpc(self, hero);
	
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_02"); //Co? Cóz, uh...... denerwujacy? Co sprawia, ze myslisz o tym? wymuszony smiech
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch2_15_03"); //Co sie dzieje?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch2_11_04"); //Co sie dzieje? Co sie dzieje? (Wymuszony smiech) Nic, nic, nic, ale po prostu pamietam, ze wciaz mam herbate pod ogniem, lepiej sie spiesze!
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch3 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch3_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Na, j. j. Spózniona?";
};

FUNC INT Info_Mod_Darrion_Sumpfmensch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_00"); //Na, j. j. Spózniona?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_01"); //Slyszalem, jak byles z piratami....
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_02"); //Tak. Nauczylem sie od nich kilku ciekawych rzeczy.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_03"); //Poniewaz nigdzie indziej nie moge znalezc mojego starego klucza, przypuszczam, ze wiele sie nauczyles, czy masz?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_04"); //W kazdym razie wystarczy. Wiem, ze przyjechales tutaj tylko po to, aby znalezc dobre miejsce dla Twojego ziola.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_05"); //I przypuszczam, ze lisci, które byles po tym, jak nie byly jedynym, który wyrósl z rosliny, czy one?
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_06"); //Tak, masz racje. Bagnogolem jest wlasciwie golemem bagiennym. Kieruje nim fabryka.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_07"); //Poczatkowo myslalem, ze to tylko dziwny korzen, ale w pewnym momencie golem stal przed mna i patrzyl na mnie duzymi, bojazliwymi oczami.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_08"); //Wiem, ze powinienem byl bezposrednio zabic bestie, ale nie polozylem jej nad moim sercem nasyconym slona woda.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_09"); //Puscilem chlopaka, ale nie odszedl ode mnie w bagnie. Ostatecznie sie z tym pogodzilem.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_10"); //Moze to wydawac sie dziwne, ale mysle, ze nawiazalismy jakas przyjazn.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_11"); //Wiedzialam, ze templariusze zabijaja tego Golema przy pierwszym kontakcie, wiec opowiedzialam im cala historie wylewania ludzi z bagna, aby ich trzymac z dala od bagna.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_12"); //Ale potem nagle zaczal atakowac ludzi. Kiedy chcialem isc na bagno, zeby zobaczyc, co sie z nim dzieje, po prostu mnie przewrócil..... i slysze, ze pan zrobil to samo.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_13"); //Nie bylbym tego pewien. Bylem tez z pustelnikiem, który tlumaczyl ci ksiazke.
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_14"); //Poprosil mnie, abym powiedzial, ze roslina powinna byc w jakis sposób zwiazana z piecioma gigantami bagiennymi.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_15"); //Wierzysz, ze.... co oznacza...... Czyli jest wiecej golemów niz tylko moje?
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_16"); //To wlasnie ma to oznaczac. I to chyba ci czterej, którzy zaatakowali ludzi i ciebie.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_17"); //Piec olbrzymiów bagiennych.... jeden z nich juz sie splaszczyles i jeden z nich jest nieszkodliwy. Pozostaly trzy kawalki. Dostane je!
	AI_Output(hero, self, "Info_Mod_Darrion_Sumpfmensch3_15_18"); //Przychodze z wami.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch3_11_19"); //Jestem Panstwu to winien.
	
	AI_StopProcessInfos(self);

	B_StartOtherRoutine	(self, "GUIDETOFLOWER");
	B_StartOtherRoutine(Mod_2013_PSINOV_Joru_MT, "START");
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_02, "PATH_TAKE_HERB_022");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch4 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch4_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Sumpfmensch3))
	&& (Npc_GetDistToWP(hero, "OW_PATH_BLOODFLY11_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_00"); //Jest to roslina. Byc moze powinnismy sie rozpasc. Pójdziesz prosto, poznam okolice.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch4_11_01"); //Wszystkie sluszne, wszystkie sluszne.
	
	AI_StopProcessInfos(self);
	
	Wld_InsertNpc(SwampGolem_Sumpfmensch_03, "FP_ROAM_OW_BLOODFLY_12_02");
};

INSTANCE Info_Mod_Darrion_Sumpfmensch5 (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Sumpfmensch5_Condition;
	information	= Info_Mod_Darrion_Sumpfmensch5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Darrion_Sumpfmensch5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Sumpfmensch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Sumpfmensch5_Info()
{
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_00"); //Dzieki. Jestem Wam gleboko zawdzieczam. (Roger howls) Darrion smieje sie. Tak, i oczywiscie Roger.
	AI_Output(self, hero, "Info_Mod_Darrion_Sumpfmensch5_11_01"); //Tutaj. Nie jest wiele, ale prosze pozwolic mi dac ci to jako wyraz mojej wdziecznosci. Jest to tyton z ostatniego liscia rosliny Golem. Moze mozna cos z tym zrobic.
	
	B_GiveInvItems(self, hero, ItMi_SumpfTabak, 1);
	
	AI_StopProcessInfos(self);
	
	B_GivePlayerXP(500);
	
	B_SetTopicStatus(TOPIC_MOD_SL_SUMPFMENSCH, LOG_SUCCESS);
};

INSTANCE Info_Mod_Darrion_Trade (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Trade_Condition;
	information	= Info_Mod_Darrion_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Darrion_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Darrion_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Darrion_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Darrion_Pickpocket (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_Pickpocket_Condition;
	information	= Info_Mod_Darrion_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Darrion_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMiSwordRaw, 5);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_BACK, Info_Mod_Darrion_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Darrion_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Darrion_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Darrion_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Darrion_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Darrion_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Darrion_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Darrion_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Darrion_EXIT (C_INFO)
{
	npc		= Mod_2014_PSINOV_Darrion_MT;
	nr		= 1;
	condition	= Info_Mod_Darrion_EXIT_Condition;
	information	= Info_Mod_Darrion_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Darrion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Darrion_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
