INSTANCE Info_Mod_Samuel_Hi (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Hi_Condition;
	information	= Info_Mod_Samuel_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Samuel_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_01"); //Jestem Samuel. Wez dobry lyk grog.
	
	B_GiveInvItems	(self, hero, ItFo_Addon_Grog, 1);

	B_UseItem	(hero, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Samuel_Hi_14_02"); //Jesli chcesz wiecej, przejdz do Skip, zazwyczaj zabieram mu swoje rzeczy. Nie mam wiele, ale jesli chcesz, moge ci cos sprzedac.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Samuel dostal grog, który mógl mi sprzedac.");
};

INSTANCE Info_Mod_Samuel_Auftrag (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Auftrag_Condition;
	information	= Info_Mod_Samuel_Auftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg wysyla mnie";
};

FUNC INT Info_Mod_Samuel_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Auftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_00"); //Greg mnie wyslal. Mam sie przydac, bo on chce ustawiac zagle.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_01"); //Bardzo dobrze, potrzebuje kogos, kto pozyskalby mi skladniki na przyzwoity rum.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_02"); //Przynies mi 10 szklanek melasy i 20 butelek wody.
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_03"); //Lasse?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_04"); //Melasy! Jak miód.
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_05"); //To jest przyzwoite, powiadam wam!
	AI_Output(hero, self, "Info_Mod_Samuel_Auftrag_15_06"); //A skad pochodzi melasa?
	AI_Output(self, hero, "Info_Mod_Samuel_Auftrag_14_07"); //Z miasta. Zarówno na rynku, jak i w dzielnicy portowej.

	Log_CreateTopic	(TOPIC_MOD_SAMUEL_RUM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SAMUEL_RUM, "W miescie Khorini mam dostac 10 szklanek melasy i 20 butelek wody dla Samuela.");
};

INSTANCE Info_Mod_Samuel_HabZeug (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_HabZeug_Condition;
	information	= Info_Mod_Samuel_HabZeug_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem rzeczy.";
};

FUNC INT Info_Mod_Samuel_HabZeug_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Auftrag))
	&& (Npc_HasItems(hero, ItFo_Water) > 19)
	&& (Npc_HasItems(hero, ItFo_Melasse) > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_HabZeug_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_HabZeug_15_00"); //Dostalem rzeczy.

	Npc_RemoveInvItems	(hero, ItFo_Water, 20);
	Npc_RemoveInvItems	(hero, ItFo_Melasse, 20);

	B_ShowGivenThings	("20 wody i 20 dodanych melas");

	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_01"); //No cóz, wtedy zabezpieczylismy nasza dostawe rumu.
	AI_Output(self, hero, "Info_Mod_Samuel_HabZeug_14_02"); //Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, 400);

	B_GivePlayerXP	(200);

	Mod_PiratenVorbereitungen += 1;

	B_Göttergefallen(2, 1);

	B_SetTopicStatus	(TOPIC_MOD_SAMUEL_RUM, LOG_SUCCESS);

	B_LogEntry	(TOPIC_MOD_PIRATEN_SCHATZSUCHE, "Pomagalem Samuelowi zabezpieczyc dostawy rumu.");
};

INSTANCE Info_Mod_Samuel_SkipFleisch (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch_Condition;
	information	= Info_Mod_Samuel_SkipFleisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj! Tutaj dostal stos miesa.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Fleisch))
	&& (Npc_HasItems(hero, ItFo_MuttonRaw) >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_00"); //Witaj! Tutaj dostal stos miesa. Chce, zeby pan go solil. I spiesz sie.

	B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 30);

	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_01"); //Solenie? Próbuje sie skonczyc z Gregiem?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch_15_02"); //Oczywiscie. Ma mape skarbów.....
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch_14_03"); //Jest to cos nowego. Jutro mieso bedzie gotowe.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Samuel bedzie mial jutro gotowe mieso. Tak dlugo, jak dlugo bede dbal o innych....");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch2_Condition;
	information	= Info_Mod_Samuel_SkipFleisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jestes gotowy?";
};

FUNC INT Info_Mod_Samuel_SkipFleisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_00"); //Czy jestes gotowy?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_01"); //Niestety nie. Jestem z soli.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_02"); //A gdzie dostajesz nowe?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_03"); //To jest problem. Kiedys uderzalem ja w tyl jaskini.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_04"); //Ostatnio jednak w nim zagniezdzaja sie minecrawlery. Nikt mnie juz tam nie zaprowadzi.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_05"); //Wtedy chyba bede musial zadbac o sól.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch2_14_06"); //Tak wlasnie jest. Potrzebuje co najmniej trzech bulek.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch2_15_07"); //Zawsze na malych....

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Niestety Samuel nie jest wykonczony miesem, bo zabraklo mu soli. W jaskini przy pólnocnej plazy znajduje sie zyla solna, ale ostatnio jest tam kilka minecrawlerów. Ale nie mam wyboru....");

	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(Minecrawler,	"ADW_PIRATECAMP_CAVE3_04");
	Wld_InsertNpc	(MinecrawlerWarrior,	"ADW_PIRATECAMP_CAVE3_04");
};

INSTANCE Info_Mod_Samuel_SkipFleisch3 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch3_Condition;
	information	= Info_Mod_Samuel_SkipFleisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto Twoja sól.";
};

FUNC INT Info_Mod_Samuel_SkipFleisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch2))
	&& (Npc_HasItems(hero, ItMi_Salznugget) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_00"); //Oto Twoja sól.

	B_GiveInvItems	(hero, self, ItMi_Salznugget, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_01"); //Niewiele gasienic masz samotnie....
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_02"); //O czym myslisz? Jestem naukowcem, a nie rzeznikiem.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_03"); //A zatem wszystko w porzadku. Kiedy moge....
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_04"); //Mieso musi dojrzewac przez noc.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch3_15_05"); //Jutro wiec?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch3_14_06"); //Dokladnie.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Jutro mieso powinno byc gotowe.");

	Mod_PIR_Samuel_Poekelfleisch = Wld_GetDay();
};

INSTANCE Info_Mod_Samuel_SkipFleisch4 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipFleisch4_Condition;
	information	= Info_Mod_Samuel_SkipFleisch4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Samuel_SkipFleisch4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipFleisch3))
	&& (Wld_GetDay() > Mod_PIR_Samuel_Poekelfleisch)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipFleisch4_Info()
{
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_00"); //Jestes na czasie. Mieso jest gotowe.

	B_GiveInvItems	(self, hero, ItFo_Poekelfleisch_Skip, 30);

	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_01"); //Wiec moge dostac go do Skipu.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipFleisch4_14_02"); //Tak. Powiedz mu, aby ja polozyc lub powiesic do wyschniecia.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipFleisch4_15_03"); //Wlasciwie, bede.

	B_LogEntry	(TOPIC_MOD_SKIP_VORRÄTE, "Dostalem solone mieso. Teraz przejdz do Skipu....");
};

INSTANCE Info_Mod_Samuel_Kompass (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Kompass_Condition;
	information	= Info_Mod_Samuel_Kompass_Info;
	permanent	= 0;
	important	= 0;
	description	= "Greg uwaza, ze masz kilka rolek lodowych. Czy moge to osiagnac?";
};

FUNC INT Info_Mod_Samuel_Kompass_Condition()
{
	if (Mod_VorbereitungenFertig == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Kompass_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_00"); //Greg uwaza, ze masz kilka rolek lodowych. Czy moge to osiagnac?
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_01"); //Hm.... Ungern. Czasami potrzebuje lodów do moich eliksirów.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_02"); //AndSkip przychodzi czesto i dostaje troche. Mysli, ze rum lepiej smakuje na lodzie niz rum na skalach.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_03"); //Dostalem sie na druga plaze, jest prawdopodobnie monitor ognia. Moglem uzywac kólek.
	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_04"); //Pózniej otrzymam Cie troche pózniej. Obiecuje.
	AI_Output(self, hero, "Info_Mod_Samuel_Kompass_14_05"); //Bardzo dobrze. Oto trzy z nich.

	B_GiveInvItems	(self, hero, ItSc_IceCube, 3);

	AI_Output(hero, self, "Info_Mod_Samuel_Kompass_15_06"); //Dzieki.
};

INSTANCE Info_Mod_Samuel_SkipToDead (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_SkipToDead_Condition;
	information	= Info_Mod_Samuel_SkipToDead_Info;
	permanent	= 0;
	important	= 0;
	description	= "Samuel, naprawde potrzebuje pana, aby mi pomóc.";
};

FUNC INT Info_Mod_Samuel_SkipToDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_SkipToDead_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_00"); //Samuel, naprawde potrzebuje pana, aby mi pomóc.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_01"); //Co sie dzieje?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_02"); //Pominiecie zostalo ciezko ranne podczas wielkiej walki i na pewno wkrótce umrze bez odpowiedniego lekarstwa.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_03"); //Co sie z nim dzieje?
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_04"); //Zostal uderzony przez strazaka.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_05"); //Da gibt es tatsächlich einen Trank dagegen. Er nennt sich "Blogoslawienstwo Adano".
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_06"); //W starych pismach tutaj w Jharkendarzu znalazlem kiedys przepis na to.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_07"); //Czy mozesz dac mi ten eliksir?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_08"); //Niestety, nigdy nie moglem go warzyc, poniewaz nie mialem skladników.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_09"); //Jakie skladniki sa potrzebne?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_10"); //W sumie sa trzy wazne rzeczy, których potrzebuje.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_11"); //Które z nich sa?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_12"); //Po pierwsze, potrzebuje runa lekkiej gojenia sie ran. Do uzyskania efektu eliksiru potrzebny jest kawalek kamienia runowego.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_13"); //Gdzie moge znalezc taka rune?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_14"); //Zapytaj, ze Myxir, moze on go dostanie.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_15"); //Czego jeszcze potrzebujesz?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_16"); //Po drugie, potrzebuje wisnia trollowa.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_17"); //Gdzie moge dostac wisnie trollowa?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_18"); //Dookola poludniowej plazy powinien wisiec troll. Takie owoce mozna znalezc w odchodach trollów.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_19"); //A ostatni?
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_20"); //Brakuje kilku ziól. Jeden Kronstöckl, cztery rosliny lecznicze i piec pokrzyw.
	AI_Output(self, hero, "Info_Mod_Samuel_SkipToDead_14_21"); //Znajdziesz je wszedzie, poza Kronstöckl trzeba cos szukac.
	AI_Output(hero, self, "Info_Mod_Samuel_SkipToDead_15_22"); //Dobrze, od razu bede w drodze.

	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel zna recepture na eliksir leczniczy, który moze zaoszczedzic Skip, ale lista skladników jest dluga. Oprócz rundy lekkiego gojenia sie ran, która moge dostac z odrobina szczescia na Myxirie, potrzebuje tez wisni trollowej, która ma znalezc sie w odchodach trollów, kiju koronowego, czterech roslin leczniczych i pieciu pokrzyw. Mówi sie, ze troll jest w poblizu poludniowej plazy, reszte musze szukac.");

	B_TeachPlayerTalentAlchemy (self, hero, POTION_AdanosWohltat);

	Wld_InsertNpc	(Troll, "FP_ROAM_LONEBEACH_11");

	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_01");
	Wld_InsertItem	(ItPl_Trollkirsche, "FP_ITEM_TROLLKIRSCHE_02");
	Wld_InsertItem	(ItPl_Perm_Herb, "FP_ITEM_KRONSTOECKL_01");
};

INSTANCE Info_Mod_Samuel_AdanosWohltat (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam wszystko.";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_SkipToDead))
	&& (Npc_HasItems(hero, ItRu_LightHeal) >= 1)
	&& (Npc_HasItems(hero, ItPl_Trollkirsche) >= 1)
	&& (Npc_HasItems(hero, ItPl_Perm_Herb) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mana_Herb_01) >= 5)
	&& (Npc_HasItems(hero, ItPl_Health_Herb_01) >= 4)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skip_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_00"); //Znalazlem wszystkie potrzebne mi rzeczy.

	B_ShowGivenThings	("przedmioty");

	Npc_RemoveInvItems	(hero, ItRu_LightHeal, 1);
	Npc_RemoveInvItems	(hero, ItPl_Trollkirsche, 1);
	Npc_RemoveInvItems	(hero, ItPl_Perm_Herb, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mana_Herb_01, 5);
	Npc_RemoveInvItems	(hero, ItPl_Health_Herb_01, 4);

	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat_14_01"); //Bardzo dobry. Do jutra mam gotowa eliksir. Bede z powrotem.
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat_15_02"); //Okay.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Przywiózlem skladniki do Samuela. Do jutra bedzie mial gotowy eliksir.");

	Mod_SamuelSkipsTrank = Wld_GetDay();

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Samuel_AdanosWohltat2 (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_AdanosWohltat2_Condition;
	information	= Info_Mod_Samuel_AdanosWohltat2_Info;
	permanent	= 0;
	important	= 0;
	description	= "A co?";
};

FUNC INT Info_Mod_Samuel_AdanosWohltat2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_AdanosWohltat))
	&& (Wld_GetDay() > Mod_SamuelSkipsTrank)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_AdanosWohltat2_Info()
{
	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_00"); //A co?
	AI_Output(self, hero, "Info_Mod_Samuel_AdanosWohltat2_14_01"); //Zajelo to duzo czasu, ale oto eliksir. Natychmiast zabierz go do Skoku.

	B_GiveInvItems	(self, hero, ItPo_AdanosWohltat, 1);

	AI_Output(hero, self, "Info_Mod_Samuel_AdanosWohltat2_15_02"); //Zrozumiale.
	
	B_LogEntry	(TOPIC_MOD_BEL_PIRSKIP, "Samuel dal mi eliksir. Teraz powinienem dotrzec do Skipu.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Samuel_Trade (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Trade_Condition;
	information	= Info_Mod_Samuel_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Samuel_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Samuel_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Samuel_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Samuel_Pickpocket (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_Pickpocket_Condition;
	information	= Info_Mod_Samuel_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Samuel_Pickpocket_Condition()
{
	C_Beklauen	(84, ItFo_Addon_Rum, 19);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_BACK, Info_Mod_Samuel_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Samuel_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Samuel_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Samuel_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Samuel_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Samuel_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Samuel_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Samuel_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Samuel_EXIT (C_INFO)
{
	npc		= Mod_940_PIR_Samuel_AW;
	nr		= 1;
	condition	= Info_Mod_Samuel_EXIT_Condition;
	information	= Info_Mod_Samuel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Samuel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Samuel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
