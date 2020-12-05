INSTANCE Info_Mod_Skip_Hi (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Hi_Condition;
	information	= Info_Mod_Skip_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Skip_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_01"); //Pomine sie.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_02"); //Jesli potrzebujesz jakichkolwiek towarów, mozesz do mnie przyjechac.
	AI_Output(self, hero, "Info_Mod_Skip_Hi_08_03"); //Bron jest dostepna tylko w Garrett' s.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Pominac cos poza bronia.");
};

INSTANCE Info_Mod_Skip_Malcom (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Malcom_Condition;
	information	= Info_Mod_Skip_Malcom_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wtedy mozesz sie upewnic, ze Malcom dostaje jedzenie na zewnatrz.";
};

FUNC INT Info_Mod_Skip_Malcom_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malcom_AW_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Malcom_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_00"); //Wtedy mozesz sie upewnic, ze Malcom dostaje jedzenie na zewnatrz.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_01"); //Upewnie sie, ze cos dostanie. Jest przeciez jednym z najbardziej ruchliwych w obozie.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_02"); //Wiekszosc z nich tak czy owak sie tu przytlacza. Próbujesz....?
	AI_Output(hero, self, "Info_Mod_Skip_Malcom_15_03"); //Przepraszam za to. Ja równiez chce byc piratem i musze zajac sie swoim nagraniem.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_04"); //Mysle, ze czeka Cie wiele pracy. Nie pozwólcie, ze zatrzymam sie.
	AI_Output(self, hero, "Info_Mod_Skip_Malcom_08_05"); //Moge sobie z tym poradzic.

	B_GivePlayerXP	(50);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_MALCOM, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skip_Francis (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Francis_Condition;
	information	= Info_Mod_Skip_Francis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Franciszek poslal mnie.";
};

FUNC INT Info_Mod_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Francis_Entertrupp))
	&& (Mod_InEntertrupp == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Francis_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_00"); //Duch, gospodyni. Czy to prawda, ze istnieje droga do Khorinis? Henry mówi tak.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_01"); //Tak, to sie skonczy.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_02"); //To dobrze. Zawsze trwa mnie to pól dnia na lodzi.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_03"); //Tylko wtedy, gdy wiatr jest korzystny.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_04"); //Franciszek powiedzial mi, ze nie handlujesz juz z jego straznikiem.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_05"); //Klabautermann! Te dranie spalaly moje wiosla. Zbyt leniwy, aby dostac drewno opalowe.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_06"); //I nie moge sie obejsc bez wiosla. Co mam robic, gdy nie ma wiatru, eh?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_07"); //Czy w jakis sposób moge to zrobic dla Ciebie?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_08"); //Móglbys przejac poród, potem znów z Franciszkiem i jego chlopcami.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_09"); //Co powinienem zrobic?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_10"); //Wez ten pakiet rumu do Khorinis. Karczmarz w pubie dzielnicy portowej juz czeka na niego.

	B_GiveInvItems	(self, hero, Mod_RumPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_11"); //Zabierasz te paczke Grog do jednego z najemników stacjonujacych na farmie Onar.
	
	B_GiveInvItems	(self, hero, Mod_GrogPaket, 1);

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_12"); //I wez ten pakiet róznych rzeczy do Lehmar, pozyczkodawcy pieniedzy.

	B_GiveInvItems	(self, hero, Mod_KleinodPaket, 1);

	if (Assassinen_Dabei)
	{
		AI_Output(hero, self, "Info_Mod_Skip_Francis_15_13"); //Nie bede mógl przyprowadzic Lehmara, on umarl.
		AI_Output(self, hero, "Info_Mod_Skip_Francis_08_14"); //Nastepnie wymysl sposób na zdobycie zlota.
	};

	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_15"); //Oddajesz mi 1500 sztuk zlota, które ludzie placa wiecej, to twoje.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_16"); //Znasz wszystkich tych ludzi?
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_17"); //Oczywiscie. Regularnie przyjezdzalem do Khorinis lodzia. Oczywiscie ukryte.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_18"); //Nie ma tu nic poza miesem i woda.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_19"); //I twoja gorzala zartobliwosc.....
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_20"); //Dostarczone równiez. A moze widzisz pole trzciny cukrowej lub pole ziemniaczane?
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_21"); //Masz racje.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_08_22"); //Jestem równie dobry jak z powrotem.
	AI_Output(self, hero, "Info_Mod_Skip_Francis_08_23"); //Poczekaj minute! Moze mozesz mnie dostac nowe wiosla w centrum miasta.
	AI_Output(hero, self, "Info_Mod_Skip_Francis_15_24"); //Chcesz zobaczyc, co moge zrobic.

	Log_CreateTopic	(TOPIC_MOD_SKIP_PADDEL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_FRANCIS_ENTERTRUPP, TOPIC_MOD_SKIP_PADDEL, "Mam dostarczyc Skipowi kilka rzeczy: pakiet rumu dla wlasciciela w dzielnicy portowej Khorinis, pakiet pelen grogów dla jednego z najemników na farmie Onar i pakiet wszelkiego rodzaju rzeczy dla Lehmar, pozyczkodawcy pieniedzy.", "Pomin nowe padliny. Hm.... Kto móglby to miec? Ktos w porcie.... Oh, a takze 1500 zlota.");
};

INSTANCE Info_Mod_Skip_Geld (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Geld_Condition;
	information	= Info_Mod_Skip_Geld_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto zloto.";
};

FUNC INT Info_Mod_Skip_Geld_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1500)
	&& (Npc_HasItems(hero, ItMi_Paddel) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Geld_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_00"); //Oto zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 1500);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_01"); //Bardzo dobre, dzieciak! Tak wiec spór z Franciszkiem zostaje zapomniany.
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_02"); //Masz tez wiosla.

	B_GiveInvItems	(hero, self, ItMi_Paddel, 2);

	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_03"); //Potem moge znów wyplynac na morze. Co ci zawdzieczam?
	AI_Output(hero, self, "Info_Mod_Skip_Geld_15_04"); //Za to zaplacilem 200. No i moze mnie zabrac na swój statek gdzies tam....
	AI_Output(self, hero, "Info_Mod_Skip_Geld_08_05"); //Hmm. Bedziesz musial zapytac kapitana. Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry	(TOPIC_MOD_FRANCIS_ENTERTRUPP, "Pominiecie jest satysfakcjonujace i teraz znów bedzie handlowac z Franciszkiem i jego porywca.");
	B_SetTopicStatus	(TOPIC_MOD_SKIP_PADDEL, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_Schatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzsuche_Condition;
	information	= Info_Mod_Skip_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg mnie wyslal.";
};

FUNC INT Info_Mod_Skip_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_00"); //Greg mnie wyslal. Wkrótce ma on wygasnac. Czy moge Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_01"); //Tak, nasze dostawy miesa sa niskie.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_02"); //Przynies mi 30 kawalków surowego miesa, ugryzien lub szczurów.
	AI_Output(self, hero, "Info_Mod_Skip_Schatzsuche_08_03"); //No Razorfleisch. Jest ciezki i trudny do wyleczenia.
	AI_Output(hero, self, "Info_Mod_Skip_Schatzsuche_15_04"); //Jestem na drodze.

	Log_CreateTopic	(TOPIC_MOD_SKIP_VORRÄTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Mam przywiezc Skip 30 kawalków surowego miesa.");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36A");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_36");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_33");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_30");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_29");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_07");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_70");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_04");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_06");

	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_57");
	Wld_InsertNpc	(Giant_DesertRat,	"FP_ROAM_CANYON_MONSTER_59");
	
	// Canyonziegen

	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");
	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");
	Wld_InsertNpc	(Canyon_Ziege,	"ADW_CANYON_PATH_TO_BANDITS_36");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_ENTRANCE_2_PIRATECAMP_05");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_045");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_043");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_J");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_038_E");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_032_G");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");
	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_116_A");

	Wld_InsertNpc	(Scavenger_Demon,	"ADW_VALLEY_PATH_110");
};

INSTANCE Info_Mod_Skip_Fleisch (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch_Condition;
	information	= Info_Mod_Skip_Fleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj dostalem wasze mieso.";
};

FUNC INT Info_Mod_Skip_Fleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Schatzsuche))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_00"); //Tutaj dostalem wasze mieso.
	AI_Output(self, hero, "Info_Mod_Skip_Fleisch_08_01"); //Zabierz ja do Samuela. Powiedz mu, zeby wzial go na rece. I spiesz sie.
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch_15_02"); //Robie to.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Teraz zabiore cialo do Samuela, który go osoli.");
};

INSTANCE Info_Mod_Skip_Fleisch2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Fleisch2_Condition;
	information	= Info_Mod_Skip_Fleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto Twoje przepisy. Powiedzialem, ze pozwole mu wyschnac.";
};

FUNC INT Info_Mod_Skip_Fleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_Poekelfleisch_Skip) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Fleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Fleisch2_15_00"); //Oto Twoje przepisy. Pozostaw go do wyschniecia.

	B_GiveInvItems	(hero, self, ItFo_Poekelfleisch_Skip, 30);

	Npc_RemoveInvItems	(self, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(self, hero, "Info_Mod_Skip_Fleisch2_08_01"); //Wszystkie sluszne, wszystkie sluszne. Wiem o tym.

	Mod_PiratenVorbereitungen += 1;

	B_SetTopicStatus	(TOPIC_MOD_SKIP_VORRÄTE, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Dostalem troche zapasów na Skip.");

	B_GivePlayerXP	(200);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Skip_AllesFertig (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AllesFertig_Condition;
	information	= Info_Mod_Skip_AllesFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg chce wiedziec, czy wszystko jest na pokladzie.";
};

FUNC INT Info_Mod_Skip_AllesFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Saebel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AllesFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_AllesFertig_15_00"); //Greg chce wiedziec, czy wszystko jest na pokladzie.
	AI_Output(self, hero, "Info_Mod_Skip_AllesFertig_08_01"); //Mysle, ze tak, tak. Z wyjatkiem zalogi.
};

INSTANCE Info_Mod_Skip_AufbruchSchatzsuche (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_AufbruchSchatzsuche_Condition;
	information	= Info_Mod_Skip_AufbruchSchatzsuche_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_AufbruchSchatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Kompass))
	&& (Kapitel >= 4)
	&& (Mod_Piraten_Aufbruch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_AufbruchSchatzsuche_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_AufbruchSchatzsuche_08_00"); //Czekamy na Ciebie. Pozostali sa juz na pokladzie.

	AI_StopProcessInfos	(self);

	Mod_VorbereitungenFertig = 5;
	
	B_SetTopicStatus	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Skip_Schatzaufteilung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Schatzaufteilung_Condition;
	information	= Info_Mod_Skip_Schatzaufteilung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Skip_Schatzaufteilung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_DI_ZumSchiff_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Schatzaufteilung_Info()
{
	AI_Output(self, hero, "Info_Mod_Skip_Schatzaufteilung_08_00"); //Hej, obudziles sie. Oczekujac ciebie, idz do niego!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_963_PIR_Malcom_NW,	"START");
	B_StartOtherRoutine	(Mod_928_PIR_AlligatorJack_AW,	"START");
	B_StartOtherRoutine	(Mod_929_PIR_Bill_AW,	"START");
	B_StartOtherRoutine	(Mod_930_PIR_Bones_AW,	"START");
	B_StartOtherRoutine	(Mod_931_PIR_Brandon_AW,	"START");
	B_StartOtherRoutine	(Mod_932_PIR_Francis_AW,	"START");
	B_StartOtherRoutine	(Mod_933_PIR_Garett_AW,	"START");
	B_StartOtherRoutine	(Mod_934_PIR_Henry_AW,	"START");
	B_StartOtherRoutine	(Mod_935_PIR_Malcom_AW,	"START");
	B_StartOtherRoutine	(Mod_936_PIR_Matt_AW,	"START");
	B_StartOtherRoutine	(Mod_938_PIR_Morgan_AW,	"START");
	B_StartOtherRoutine	(Mod_939_PIR_Owen_AW,	"START");
	B_StartOtherRoutine	(Mod_940_PIR_Samuel_AW,	"START");
	B_StartOtherRoutine	(Mod_941_PIR_Angus_AW,	"START");
	B_StartOtherRoutine	(Mod_942_PIR_Hank_AW,	"START");
};

INSTANCE Info_Mod_Skip_Befreiung (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung_Condition;
	information	= Info_Mod_Skip_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy masz racje?";
};

FUNC INT Info_Mod_Skip_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_00"); //Czy masz racje?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_01"); //(grozy) Nr. Kiedy przyjechalem do Kamf, uderzyl mnie ogien, który spowodowal straszliwa rane ciala. Nie wiem, jak dlugo moge dluzej trwac.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_02"); //Jak moge Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung_08_03"); //Przejdz do Samuela. Moze byc w stanie pomóc.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung_15_04"); //Dobrze, bede szybki.

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRSKIP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Skip lezy ciezko ranny w jego chacie. Podczas walki uderzyla go strazaka. Teraz powinienem zobaczyc Samuela i sprawdzic, czy moze pomóc.");
};

INSTANCE Info_Mod_Skip_Befreiung2 (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Befreiung2_Condition;
	information	= Info_Mod_Skip_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pic to.";
};

FUNC INT Info_Mod_Skip_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	&& (Npc_HasItems(hero, ItPo_AdanosWohltat) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_00"); //Pic to. Ten eliksir pomoze Ci.

	B_GiveInvItems	(hero, self, ItPo_AdanosWohltat, 1);
	B_UseItem	(self, ItPo_AdanosWohltat);

	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_01"); //Dzieki. To naprawde mi pomoglo.
	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_02"); //Wiec znów jestes w dobrej kondycji?
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_03"); //Tak, nigdy nie czulem sie lepiej. Wezmy to za dowód mojej wdziecznosci.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Skip_Befreiung2_15_04"); //Dzieki. Bede wiec jechal.
	AI_Output(self, hero, "Info_Mod_Skip_Befreiung2_08_05"); //Do zobaczenia dookola.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "PRESTART");

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRSKIP, TOPIC_MOD_BEL_PIRATENLAGER, "Dzieki eliksirowi pomylka znów pasuje do siebie.", "Pomin ponownie dopasowanie.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRSKIP, LOG_SUCCESS);

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(450);
};

INSTANCE Info_Mod_Skip_Sumpfmensch (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Sumpfmensch_Condition;
	information	= Info_Mod_Skip_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg powiedzial, ze moze pomóglbys mi pomóc.";
};

FUNC INT Info_Mod_Skip_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Sumpfmensch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_00"); //Greg powiedzial, ze moze pomóglbys mi pomóc.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Oczywiscie, co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_02"); //Co wiesz o Darrionie?
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //Darrion..... Masz na mysli starszego porywacza? Niewiele, szczerze mówiac. Nikt nie wie o nim wiele.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //Jako aktywny przedsiebiorca-lider nie mówil wiele o sobie i kiedy Greg zostal mianowany kapitanem, jedyne, co mozna bylo wydostac sie z niego, to bylo kilka ostatnich pucharów od czasu do czasu, kiedy ponownie przesadzal z grogiem.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_03"); //Przyszedl do mnie tylko do handlu.
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_04"); //Cokolwiek w szczególnosci?
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //Zwykly. Grot, pistolety, chwast bagienny; którzy mieli troche miekkiej plamki na takie narkotyki jak ten.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //Ach, a kilka tygodni przed jego zaginieciem, kupil mój kompletny sól do picia!
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_05"); //Nie pytaj mnie, co on z tym robil. Myslalem, ze wieze tam wysadzi w powietrze. Nigdy jednak nie wysadzil sie w powietrze.
	AI_Output(hero, self, "Info_Mod_Skip_Sumpfmensch_15_04"); //Okay. Dzieki.
	
	AI_TurnAway(hero, self);
	
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Poczekac! Pomysle o czyms innym.
	
	AI_TurnToNpc(hero, self);
	
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Musialam znalezc mu jakis zapachowy ser.
	AI_Output(self, hero, "Info_Mod_Skip_Sumpfmensch_08_01"); //Powiedzial, ze potrzebowal go dla pustelnika, który ma tu gdzies kabine. Moze ten facet wie wiecej o Darrionie.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Skip powiedzial mi, ze Darrion kupil duzo soli i zniknal w wiezy. Dla pustelnika potrzebowal takze sera zwinietego. Moze moge uciec przed tym?");
};

INSTANCE Info_Mod_Skip_Trade (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Trade_Condition;
	information	= Info_Mod_Skip_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Skip_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Skip_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Skip_Pickpocket (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_Pickpocket_Condition;
	information	= Info_Mod_Skip_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Skip_Pickpocket_Condition()
{
	C_Beklauen	(100, ItFo_Addon_Grog, 3);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_BACK, Info_Mod_Skip_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Skip_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Skip_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
};

FUNC VOID Info_Mod_Skip_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Skip_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Skip_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Skip_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Skip_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Skip_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Skip_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Skip_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Skip_EXIT (C_INFO)
{
	npc		= Mod_775_PIR_Skip_AW;
	nr		= 1;
	condition	= Info_Mod_Skip_EXIT_Condition;
	information	= Info_Mod_Skip_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Skip_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Skip_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
