INSTANCE Info_Mod_Brauer_Hi (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Hi_Condition;
	information	= Info_Mod_Brauer_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy to jest Twój browar?";
};

FUNC INT Info_Mod_Brauer_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Hi_15_00"); //Czy to jest Twój browar?
	AI_Output(self, hero, "Info_Mod_Brauer_Hi_06_01"); //W miedzyczasie tak. Do niedawna nalezala ona do mojego wujka, ale on mi ja pozostawil, a potem nieszczesliwie utonal w jednym z basenów zlewni.
};

INSTANCE Info_Mod_Brauer_Bierhexen (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen_Condition;
	information	= Info_Mod_Brauer_Bierhexen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wygladasz na troche ponury.";
};

FUNC INT Info_Mod_Brauer_Bierhexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Richter_Unfrieden))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_00"); //Wygladasz na troche ponury.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_01"); //Chcialbym, zeby nie mialam powodu.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_02"); //Ale czarownice piwa zawsze psuja mi plany!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_03"); //Czarownice piwa?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_04"); //Dokladnie! Nie slyszales o nich?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_05"); //Oni czaruja piwo, zeby nie bylo z niego nic.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_06"); //I oni sa szczególnie po mnie.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_07"); //Nigdy wczesniej nie udalo mi sie zaparzyc dobrego piwa. Zawsze smakuje gorzki i rufowy.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_08"); //Ostatnim razem przybijalem do piwowara wieniec z dzikich ziól, choc nie jestem przesadny.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_09"); //Nawet to nie pomaga!

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_10"); //(samo siebie) Nie sadze, ze to beda czarownice....

	AI_TurnToNpc	(hero, self);

	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen_15_11"); //Jak dlugo cwiczyles/as w swoim browku?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen_06_12"); //Bylem tu tylko kilka tygodni..... a moje pierwsze próby zniknely w drenazu.
};

INSTANCE Info_Mod_Brauer_Bierhexen2 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen2_Condition;
	information	= Info_Mod_Brauer_Bierhexen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz pomysl jak odjechac czarownice?";
};

FUNC INT Info_Mod_Brauer_Bierhexen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen2_15_00"); //Masz pomysl jak odjechac czarownice?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_01"); //Próbowalem wszystkiego.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_02"); //Nikt jednak nie wie, co robia z piwem, wiec nie moge sie oprzec.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen2_06_03"); //Musze spróbowac ja jakos uspokoic.
};

INSTANCE Info_Mod_Brauer_Bierhexen3 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen3_Condition;
	information	= Info_Mod_Brauer_Bierhexen3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jestes pewien, ze naprawde piwowarujesz?";
};

FUNC INT Info_Mod_Brauer_Bierhexen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_00"); //Czy jestes pewien, ze naprawde piwowarujesz?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_01"); //Tak. Kiedy odebralem sklep od wujka, dal mi szczególowa instrukcje.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_02"); //I nie wydawalo sie, zeby czarownice go nie nawiedzaly.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_03"); //W prawo, teraz zatrzymujesz sie z bykiem czarownic.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_04"); //Czy przynajmniej sprawdziles, czy skladniki sa w porzadku?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_05"); //Co jest z nimi zle? Rolnik Erhard nie oszuka mnie.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen3_15_06"); //Przyjrzyjmy sie teraz.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_07"); //Mozesz to zrobic. Ale czarownice nie zostawia sladu.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen3_06_08"); //Na szczycie browaru znajduje sie jeczmien, chmiel i drozdze.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Naiwny browarnik wierzy, ze czarownice piwa sprawia, ze jego napar nie zamieni sie w nic innego. Ale albo blad jest jego wina, albo uzywa zlych skladników.");

	Wld_InsertItem	(ItMi_Hefe,	"FP_ITEM_BIERHEXEN_HEFE");
	Wld_InsertItem	(ItMi_Hopfen,	"FP_ITEM_BIERHEXEN_HOPFEN");
	Wld_InsertItem	(ItMi_Gerste,	"FP_ITEM_BIERHEXEN_GERSTE");
};

INSTANCE Info_Mod_Brauer_Bierhexen4 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen4_Condition;
	information	= Info_Mod_Brauer_Bierhexen4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ktos zagladal do jeczmienia.";
};

FUNC INT Info_Mod_Brauer_Bierhexen4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen3))
	&& (Mod_Bierhexen == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_00"); //Ktos zagladal do jeczmienia.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_01"); //(perplex) Co?
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_02"); //Zdecydowanie smakuje jak mocz.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_03"); //Nie ma czegos takiego!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_04"); //I kilka dni temu zastanawialem sie skad pochodzi przenikajacy zapach!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_05"); //To zostalo juz rozwiazane.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_15_06"); //Wasze czarownice zanieczyszczaja jeczmien w sposób bardzo swiecki.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_07"); //Tak, smiech! Moge sobie wyobrazic, jak smieje sie on z toba, gdy smieje sie na zbozu, zanim je mi przywiozl!
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_06_08"); //Pokaze tego syna z suki!

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "Nie brakuje mi tego.", Info_Mod_Brauer_Bierhexen4_B);
	Info_AddChoice	(Info_Mod_Brauer_Bierhexen4, "Zrobie to i uspokoje sie najpierw.", Info_Mod_Brauer_Bierhexen4_A);
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_B()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_B_15_00"); //Nie brakuje mi tego.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_B_06_01"); //Chodzcie dalej, odejdzmy!

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ERHARD");

	B_SetTopicStatus	(TOPIC_MOD_KHORATA_BIERHEXEN, LOG_SUCCESS);

	Mod_Bierhexen = 2;
};

FUNC VOID Info_Mod_Brauer_Bierhexen4_A()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_00"); //Zrobie to i uspokoje sie najpierw.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen4_A_06_01"); //Dobrze, ze sie tym zajmujecie. Ale po prostu powiedz mu swoja opinie!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen4_A_15_02"); //Jestem na drodze.

	Mod_Bierhexen = 3;

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Piwowar podejrzewa Erhard, ze jest odpowiedzialny za zanieczyszczony jeczmien. Zaoferowalem sie jako posrednik.");

	Info_ClearChoices	(Info_Mod_Brauer_Bierhexen4);
};

INSTANCE Info_Mod_Brauer_Bierhexen5 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen5_Condition;
	information	= Info_Mod_Brauer_Bierhexen5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Gdzie moge znalezc Erharda?";
};

FUNC INT Info_Mod_Brauer_Bierhexen5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen4))
	&& (Mod_Bierhexen == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen5_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen5_15_00"); //Gdzie moge znalezc Erharda?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_01"); //Jesli idziecie z miasta w kierunku przeleczy do Khorinis, skrecamy w lewo przed jaskinia i spacerujemy po górskiej twarzy.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen5_06_02"); //Wtedy nie mozna przegapic jego farmy.
};

INSTANCE Info_Mod_Brauer_Bierhexen6 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen6_Condition;
	information	= Info_Mod_Brauer_Bierhexen6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Leonhard jest tym, którego szukamy.";
};

FUNC INT Info_Mod_Brauer_Bierhexen6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen6_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_00"); //Leonhard jest tym, którego szukamy.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_01"); //Tak? Ta kanalia! Co mysli?
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_02"); //Pytanie brzmi: co mamy na mysli, aby powrócic do niego?
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_03"); //Anselm przynajmniej sie nie obchodzi, tak wiele zauwazylem tutaj w krótkim czasie.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_04"); //Warto spróbowac. Bez jego zgody trudno byloby ukarac Leonharda.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_05"); //Daje Wam pierwsza szanse. Pamietaj o tym, co juz sie zorientowales.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen6_06_06"); //Wydaje sie, ze jest pan z ludzmi dobry.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen6_15_07"); //Mozliwe.

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Mam sklonic Anselma do ukarania Leonharda.");
};

INSTANCE Info_Mod_Brauer_Bierhexen7 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen7_Condition;
	information	= Info_Mod_Brauer_Bierhexen7_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_Bierhexen7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Bierhexen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen7_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_00"); //Leonhard wlasnie przyniósl pierwszy ladunek jeczmienia.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_01"); //Nie chce nawet wiedziec, jak to zrobiles.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_02"); //Tak czy owak, jestem Tobie wdzieczny. Miejmy nadzieje, ze od tej pory odniose sukces.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_03"); //Dopóki czarownice piwa nie uderza ponownie.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_04"); //Straznik Adanos!
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_05"); //Po prostu odrobina.
	AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen7_06_06"); //Jesli spadniesz obok, kupie Ci steine kazdego dnia.
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen7_15_07"); //Dziekujemy za oferte.
};

INSTANCE Info_Mod_Brauer_Bierhexen8 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Bierhexen8_Condition;
	information	= Info_Mod_Brauer_Bierhexen8_Info;
	permanent	= 1;
	important	= 0;
	description	= "Masz dla mnie piwo?";
};

FUNC INT Info_Mod_Brauer_Bierhexen8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_Bierhexen7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_Bierhexen8_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_Bierhexen8_15_00"); //Masz dla mnie piwo?

	if (Mod_Bierhexen_Tag < Wld_GetDay())
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_01"); //To jest w domu!

		B_GiveInvItems	(self, hero, ItFo_Beer_Khorata, 1);

		Mod_Bierhexen_Tag = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Brauer_Bierhexen8_06_02"); //Nie wiecej dzisiaj. Wróc jutro.
	};
};

INSTANCE Info_Mod_Brauer_August (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August_Condition;
	information	= Info_Mod_Brauer_August_Info;
	permanent	= 0;
	important	= 0;
	trade		= 1;
	description	= "Czy znasz ciemne piwo?";
};

FUNC INT Info_Mod_Brauer_August_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August_Info()
{
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_00"); //Czy znasz ciemne piwo?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_01"); //Oczywiscie tak jest. Moje wlasne nowe stworzenie. Bardzo silne. Sprzedam nawet troche.
	AI_Output(hero, self, "Info_Mod_Brauer_August_15_02"); //Czy moge miec smak?
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_03"); //Oczywiscie. To najlepsza reklama. Tutaj.

	B_GiveInvItems	(self, hero, ItFo_Dunkelbier, 1);

	B_UseItem	(hero, ItFo_Dunkelbier);

	AI_Output(hero, self, "Info_Mod_Brauer_August_15_04"); //Nie zly. Chce ja odebrac.
	AI_Output(self, hero, "Info_Mod_Brauer_August_06_05"); //Prosze, pomózcie sobie.

	CreateInvItems	(self, ItFo_Dunkelbier, 20);

	B_GiveTradeInv (self);
};

INSTANCE Info_Mod_Brauer_August02 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August02_Condition;
	information	= Info_Mod_Brauer_August02_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August02_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_00"); //Oh, tak. Masz troche czasu?
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_01"); //Wlasciwie nie. Co o tym chodzi?
	AI_Output(self, hero, "Info_Mod_Brauer_August02_06_02"); //Jestem poza chmielem. Erhard nie dostarcza.
	AI_Output(hero, self, "Info_Mod_Brauer_August02_15_03"); //A zatem wszystko w porzadku. Zobacze.
};

INSTANCE Info_Mod_Brauer_August03 (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_August03_Condition;
	information	= Info_Mod_Brauer_August03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brauer_August03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brauer_August02))
	&& (Npc_HasItems(hero, ItMi_Hopfensack) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brauer_August03_Info()
{
	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_00"); //Och, tam jestescie. Wynajmujacy ma juz zlecenie. Musze ogrzac kociol.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_01"); //Oto chmiel. Jestes winien Erhard 150 zlota.

	B_GiveInvItems	(hero, self, ItMi_Hopfensack, 3);

	AI_Output(self, hero, "Info_Mod_Brauer_August03_06_02"); //Wszystkie sluszne, wszystkie sluszne. Za pszenice i tak otrzyma pieniadze.
	AI_Output(hero, self, "Info_Mod_Brauer_August03_15_03"); //Cokolwiek mówisz....

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brauer_Trade (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Trade_Condition;
	information	= Info_Mod_Brauer_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brauer_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brauer_Pickpocket (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_Pickpocket_Condition;
	information	= Info_Mod_Brauer_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Brauer_Pickpocket_Condition()
{
	C_Beklauen	(105, ItFo_Beer_Khorata, 4);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_BACK, Info_Mod_Brauer_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brauer_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brauer_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brauer_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brauer_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brauer_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brauer_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brauer_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brauer_EXIT (C_INFO)
{
	npc		= Mod_7578_OUT_Brauer_REL;
	nr		= 1;
	condition	= Info_Mod_Brauer_EXIT_Condition;
	information	= Info_Mod_Brauer_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brauer_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brauer_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
