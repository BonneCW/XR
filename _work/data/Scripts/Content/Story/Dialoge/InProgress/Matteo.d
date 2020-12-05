INSTANCE Info_Mod_Matteo_Hi (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Hi_Condition;
	information	= Info_Mod_Matteo_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matteo_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_Hi_23_00"); //Klient, klient! Wejdzcie, obcy i grzebiecie w przepieknych towarach!
	AI_Output(hero, self, "Info_Mod_Matteo_Hi_15_01"); //Brak uprzedzen wobec bylego skazanego?
	AI_Output(self, hero, "Info_Mod_Matteo_Hi_23_02"); //Nie ma drogi! Wszyscy klienci! Interesujacy platni klienci!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Matteo sprzedaje zywnosc.");
};

INSTANCE Info_Mod_Matteo_Angebot_Kissen (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Kissen_Condition;
	information	= Info_Mod_Matteo_Angebot_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam czegos miekkiego dla glowy.";
};

FUNC INT Info_Mod_Matteo_Angebot_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_00"); //Szukam czegos miekkiego dla glowy.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_01"); //Co dokladnie? Moze kapelusz futrzany? Tam bym tam mial....
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_02"); //Nie, nie, nie, nie, nie. Co, aby polozyc glowe na nim podczas snu?
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_03"); //Uh-huh. I co to ma byc?
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_04"); //Gdybym tylko wiedzial. Moze w nim worek suchej trawy.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kissen_23_05"); //Ja tego nie mam. Moze chlopi....
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kissen_15_06"); //W kazdym razie dziekuje. Bede dalej patrzyl.

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Matteo nie mógl mi pomóc.");
};

INSTANCE Info_Mod_Matteo_ThorbenLehrling (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_ThorbenLehrling_Condition;
	information	= Info_Mod_Matteo_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Wld_IsTime(10,00,10,30))
	&& (Npc_HasItems(hero, ItMi_MatteoFesttisch) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_23_00"); //Oh, powitanie. Czy wiesz, gdzie jest Thorben?
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_15_01"); //Jestem jego zastepca. Chcesz podniesc swój stól?
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_23_02"); //Prawo, prawo, prawo, prawo. Thorben i ja wynegocjowalismy cene 100 zlotych monet.

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Slyszalem o zupelnie innej cenie.", Info_Mod_Matteo_ThorbenLehrling_B);
	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Oto tabele.", Info_Mod_Matteo_ThorbenLehrling_A);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_B_15_00"); //Slyszalem o zupelnie innej cenie.
	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_B_23_01"); //Widze, ze latwo nie da sie cie oszukac. Dobrze, oto 150 zlotych monet.

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Kolejny maly bonus dla ciezko chorego mistrza?", Info_Mod_Matteo_ThorbenLehrling_D);
	};

	Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Ladunek.", Info_Mod_Matteo_ThorbenLehrling_C);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_A_15_00"); //Oto tabele.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_A_23_01"); //No cóz, to wlasnie nazywam szybkim serwisem. Miej wspanialy dzien!

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_D()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_D_15_00"); //Kolejny maly bonus dla ciezko chorego mistrza?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_D_23_01"); //Dlaczego nie? Dzis i tak jestem w nastroju dawcy. Tutaj idziesz i spedzasz mily dzien.

		Npc_RemoveInvItems	(hero, ItMi_MatteoFesttisch, 2);

		CreateInvItems	(hero, ItMi_Gold, 250);

		B_GivePlayerXP	(150);

		B_RaiseHandelsgeschick (2);

		Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_D_23_02"); //Jestem w biznesie zbyt dlugo, aby upasc na te liczbe.

		Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);

		Info_AddChoice	(Info_Mod_Matteo_ThorbenLehrling, "Ladunek.", Info_Mod_Matteo_ThorbenLehrling_C);
	};
};

FUNC VOID Info_Mod_Matteo_ThorbenLehrling_C()
{
	AI_Output(hero, self, "Info_Mod_Matteo_ThorbenLehrling_C_15_00"); //Ladunek.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_ThorbenLehrling_C_23_01"); //Dobre, dobre, które ja osadza. Pozwól mi powitac Thorben!

	B_GiveInvItems	(self, hero, ItMi_Gold, 150);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Matteo_ThorbenLehrling);
};

INSTANCE Info_Mod_Matteo_OberesViertel (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_OberesViertel_Condition;
	information	= Info_Mod_Matteo_OberesViertel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce przejsc do górnej czesci.";
};

FUNC INT Info_Mod_Matteo_OberesViertel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_OberesViertel_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_OberesViertel_15_00"); //Chce przejsc do górnej czesci.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_01"); //Nie ma problemu! Czekaj, moze bede czekal. Och, nie, wymyslimy!
	AI_Output(hero, self, "Info_Mod_Matteo_OberesViertel_15_02"); //Co o tym chodzi?
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_03"); //Aby dostac sie do Górnej Dzielnicy, musisz byc obywatelem miasta lub dolaczyc do milicji. Wolno) Które bym odradzal.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_04"); //Najprostszym sposobem na uzyskanie statusu obywatela jest przyjecie go jako praktykanta przez jednego z mistrzów.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_05"); //Najlepiej przy mnie, pilnie potrzebuje praktykanta!
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_06"); //Ale zanim bede mógl cie zatrudnic, potrzebuje zgody wszystkich pozostalych mistrzów rzemieslników: Bosper, Thorben, Harad i Constantino.
	AI_Output(self, hero, "Info_Mod_Matteo_OberesViertel_23_07"); //Wiec Twoja praca bedzie ich przekonac!

	Log_CreateTopic	(TOPIC_MOD_BÜRGER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_OBERESVIERTEL, TOPIC_MOD_BÜRGER, "Aby dostac sie do górnej dzielnicy, musze byc obywatelem miasta lub czlonkiem milicji.", "Aby zostac obywatelem miasta, musze byc uczniem jednego z pieciu mistrzów.");
};

INSTANCE Info_Mod_Matteo_Miliz (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Miliz_Condition;
	information	= Info_Mod_Matteo_Miliz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co musze zrobic, aby dolaczyc do milicji?";
};

FUNC INT Info_Mod_Matteo_Miliz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Miliz_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Miliz_15_00"); //Co musze zrobic, aby dolaczyc do milicji?
	AI_Output(self, hero, "Info_Mod_Matteo_Miliz_23_01"); //Jesli chcesz dolaczyc do milicji, powinienes isc do Pana Andre.
	AI_Output(self, hero, "Info_Mod_Matteo_Miliz_23_02"); //Decyduje, kto zostanie przyjety do milicji.
};

INSTANCE Info_Mod_Matteo_Andre (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Andre_Condition;
	information	= Info_Mod_Matteo_Andre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gdzie moge znalezc Pana Andre' a?";
};

FUNC INT Info_Mod_Matteo_Andre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Miliz))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Andre_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Andre_15_00"); //Gdzie moge znalezc Pana Andre' a?
	AI_Output(self, hero, "Info_Mod_Matteo_Andre_23_01"); //W barakach w poblizu drugiej bramy.
	AI_Output(self, hero, "Info_Mod_Matteo_Andre_23_02"); //Wielki czlowiek - i mój dobry przyjaciel!
};

INSTANCE Info_Mod_Matteo_Auftrag_2 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Auftrag_2_Condition;
	information	= Info_Mod_Matteo_Auftrag_2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie prace?";
};

FUNC INT Info_Mod_Matteo_Auftrag_2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Auftrag_2_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Auftrag_2_15_00"); //Masz dla mnie prace?
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_01"); //Jesli pytasz: tak!
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_02"); //Trzeba wiedziec, ze jestem juz teraz zachwycony i musze zadbac o pewne przygotowania.
	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_03"); //Nie pozostalo wiele czasu na promowanie mojego biznesu. Przejmiesz to zadanie!
	
	B_GiveInvItems	(self, hero, MatteoFlugblaetter, 20);

	AI_Output(self, hero, "Info_Mod_Matteo_Auftrag_2_23_04"); //Rozdaj ulotki mieszkancom tego miasta, a takze poinformuj o tym heraldów. On i tak nie ma sensu, zeby sie wykrzykiwac!

	Log_CreateTopic	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MATTEOFLUGBLATT, "Aby uzyskac glos Matteo, powinienem rozdawac mu ulotki.");
};

INSTANCE Info_Mod_Matteo_WieLehrling (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_WieLehrling_Condition;
	information	= Info_Mod_Matteo_WieLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge zostac uczniem innego mistrza?";
};

FUNC INT Info_Mod_Matteo_WieLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;	
	};
};

FUNC VOID Info_Mod_Matteo_WieLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_WieLehrling_15_00"); //Czy moge zostac uczniem innego mistrza?
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_01"); //Cóz, nie potrzebuja!
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_02"); //Harad i Thorben juz niektóre, Constantino wolalby zgniliznec w swoim domu, a Bosper...... nie bedzie dobrze mówic o Tobie.
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_03"); //Uwierz mi, jestes w dobrych rekach!
	AI_Output(hero, self, "Info_Mod_Matteo_WieLehrling_15_04"); //Ale czy jest to mozliwe?
	AI_Output(self, hero, "Info_Mod_Matteo_WieLehrling_23_05"); //Teoretycznie, tak. Ale z pewnoscia nie przydatne.
};

INSTANCE Info_Mod_Matteo_Flugblaetter (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Flugblaetter_Condition;
	information	= Info_Mod_Matteo_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Rozdawalem ulotki.";
};

FUNC INT Info_Mod_Matteo_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Mod_Flugblaetter == 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Flugblaetter_15_00"); //Rozdawalem ulotki.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_01"); //Zauwazylem, ze to miejsce jest dzis spakowane.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_02"); //Uwielbiam ogladac ludzi ogladajacych i wazacych moje jedzenie.
	AI_Output(self, hero, "Info_Mod_Matteo_Flugblaetter_23_03"); //Dzieki temu spelniles moja czesc warunku. Wróc, gdy masz zgode wszystkich mistrzów.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_LogEntry	(TOPIC_MOD_MATTEOFLUGBLATT, "Matteo byl bardzo zadowolony z mojej pracy. On odda mi swój glos.");
	B_SetTopicStatus	(TOPIC_MOD_MATTEOFLUGBLATT, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	Mod_LehrlingsStimmen += 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Matteo_Aufnahme (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Aufnahme_Condition;
	information	= Info_Mod_Matteo_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestem gotowy na praktykanta.";
};

FUNC INT Info_Mod_Matteo_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_15_00"); //Jestem gotowy na praktykanta.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_23_01"); //Masz ochote na powitanie?

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);

	Info_AddChoice	(Info_Mod_Matteo_Aufnahme, "Nie, wybralem innego mistrza.", Info_Mod_Matteo_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Matteo_Aufnahme, "Tak, bede twoim uczniem.", Info_Mod_Matteo_Aufnahme_A);
};

FUNC VOID Info_Mod_Matteo_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_B_15_00"); //Nie, wybralem innego mistrza.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_01"); //(zniszczony) To jest moja wdziecznosc za przybycie?
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_02"); //Nie - nie mów nic. Nie chce tego sluchac!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_B_23_03"); //Po prostu upewnij sie, ze wyjdziesz i nie wrócisz!

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);
};

FUNC VOID Info_Mod_Matteo_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_00"); //Tak, bede twoim uczniem.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_01"); //I to nie jest na Twoja niekorzysc!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_02"); //Chce powiedziec wszystko, czego potrzebujesz jako przyszly kupiec.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);

	B_ShowGivenThings	("przyjac odziez cywilna");

	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_03"); //Podzielmy lekcje na czesc teoretyczna i praktyczna.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_04"); //W te praktyczne dadza mi Panstwo reke i dowiedza sie, ze praca nie jest tylko dla przyjemnosci.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_05"); //Co wiecej, nadasz teraz oczywiscie obywatelstwo - tego wlasnie chciales?
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_06"); //Tak czy owak nie moze sie skrzywdzic.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_07"); //Drobne, drobne, drobne, grzywny. Wtedy zaczynamy tu i teraz z pierwsza lekcja:
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_08"); //Jestem pewien, ze bedziesz sie zastanawiac, dlaczego mój owoc zawsze wyglada tak swiezo i dobrze zaokraglony.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_09"); //Oczywiscie nie wszystkie moje dostawy sa tak apetyczne - niestety!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_10"); //Dlatego tez sprytny detalista stosuje sztuczke: uszkodzone towary po prostu nie sa prezentowane otwarcie!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_11"); //Na przyklad, przed mna na stole - zabrac wierzchnia warstwe grzybów i nie dotykac od spodu ostrymi palcami.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_12"); //Niemniej jednak sa one kupowane, poniewaz wielu klientów nie patrzy wystarczajaco uwaznie. To jest nasza zaleta!
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_13"); //Czego sie z tego dowiedzielismy? Prezentacja to wszystko! Upewnij sie wiec, ze Twoja firma wyglada schludnie i schludnie.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_14"); //Koncówka od mnie: natluszczyc powierzchnie wyswietlacza tluszczem, który sprawia, ze swieca i wygladaja blyszczaco w sloncu.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_15"); //Jest to szybsze niz polerowanie. (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_16"); //Po tym wprowadzeniu mam dla Was pierwsze zadanie.
	AI_Output(hero, self, "Info_Mod_Matteo_Aufnahme_A_15_17"); //Czysc?
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_18"); //Nie, nie, nie, poradze sobie samemu. Ale dostalem kosz z jablek.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_19"); //Sortuje sie jablka wedlug przydatnosci - najlepiej w dwóch czesciach, pasujacych i nieodpowiednich.
	AI_Output(self, hero, "Info_Mod_Matteo_Aufnahme_A_23_20"); //Koszyk znajdziesz tam z powrotem na stole. Pozwól mi wiedziec, jak tylko sie skonczysz.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 3;

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_MATTEO_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Matteo, kupiec, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Pierwsza rzecza, o jaka poprosila mnie Matteo, bylo sortowanie koszyka pelnego jablek wedlug jablek, które nie nadaja sie do wystawiania. Na kazde jablko powinienem patrzec indywidualnie.", "Poniewaz Matteo przyjal mnie jako swojego ucznia, jestem teraz w stanie wejsc do wyzszej kwatery.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_MATTEO_ONE, "Matteo, kupiec, przyjal mnie jako swojego ucznia. To czyni mnie teraz obywatelem miasta.", "Pierwsza rzecza, o jaka poprosila mnie Matteo, bylo sortowanie koszyka pelnego jablek wedlug jablek, które nie nadaja sie do wystawiania. Na kazde jablko powinienem patrzec indywidualnie.");
	};

	Wld_SendTrigger	("EVT_MATTEO_APFELKORB");

	Wld_AssignRoomToGuild ("matteo",		GIL_NONE);

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	B_RaiseHandelsgeschick	(5);

	Info_ClearChoices	(Info_Mod_Matteo_Aufnahme);
};

INSTANCE Info_Mod_Matteo_GildenZeug (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_GildenZeug_Condition;
	information	= Info_Mod_Matteo_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_00"); //No cóz, spójrz, kto idzie do milicji.
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_01"); //Czy zgubiles droge do Innosów, huh? (smiertelnicy)
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_02"); //Widze, ze dokonal Pan dobrego wyboru z frakcja.
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_03"); //Chcesz byc najemnikiem? Nie myslisz nigdy o mieszaniu moich przesylek towarowych!
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_GildenZeug_23_04"); //Uwielbiasz Beliara? Pomyslalbym, ze bylbys madrzejszy....
	};
};

INSTANCE Info_Mod_Matteo_LehrlingQuest (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto sortowane jablka.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Gut) == 10)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest_15_00"); //Oto sortowane jablka.

	Npc_RemoveInvItems	(hero, Itfo_Apple_Matteo_Gut, 10);
	Npc_RemoveInvItems	(hero, Itfo_Apple_Matteo_Schlecht, 10);

	B_ShowGivenThings	("10 chrupiacych jablek i 10 zgnilych jablek podawanych");

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest_23_01"); //(Zabawa) To bylo szybkie! Pozwólcie mi widziec.... Tak, czysta praca, ja to nazywam! To bardzo mi pomaga!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest_23_02"); //Wkrótce wrócimy, wtedy mozemy kontynuowac nasza prace!

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest2_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jeszcze raz jestem gotowy na jakas teorie.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_00"); //Jeszcze raz jestem gotowy na jakas teorie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_01"); //Mam tez troche czasu. Prosze pozwolic mi pomyslec krótko..... Tym razem bedzie o konkursie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_02"); //Jak zapewne wiesz, w miescie jest wielu dealerów.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_03"); //Teraz mozna sobie z pewnoscia zadac pytanie, dlaczego ta róznorodnosc istnieje i dlaczego jeden nie moze przewazyc nad drugim.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_04"); //Odpowiedz brzmi: specjalizacja.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_05"); //Kazdy detalista ma swoja wlasna oferte, a niektóre towary sa dostepne tylko u niektórych detalistów.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_06"); //Kazdy z nas ma wiec prawo istniec.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_07"); //Istnieja jednak równiez inne sposoby zdobycia przewagi konkurencyjnej:
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_08"); //Moga Panstwo na przyklad oferowac towary o szczególnej jakosci - tak jak ja to robie - lub byc szczególnie tanie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_09"); //Najwazniejsze jest to, ze istnieje na to zapotrzebowanie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_10"); //Dzieki reklamie zwracasz uwage na klientów. Zdobyles juz pierwsze doswiadczenia w tym zakresie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_11"); //Dzisiejsze cwiczenie praktyczne ma byc o, uh, kuszace.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_12"); //Zdobadz sie od konkurencji?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_13"); //Tak! Wymyslilem cos milego.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_14"); //Pamietasz jablka, które sortowales ostatni raz?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_15"); //Wiele z nich jest naprawde bezuzytecznych.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_15_16"); //Co mam z tym zrobic?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_17"); //Daje wam piec zgnilych jablek, poczekaj minute, a ty zamiescisz je w swojej ofercie dla pieciu sprzedawców w khorynach. Do kazdego sprawiedliwy i sprawiedliwy.

	B_GiveInvItems	(self, hero, ItFo_Apple_Matteo_Schlecht, 5);

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_18"); //Najlepiej jest zaangazowac ich wczesniej w rozmowe, a jesli wygladaja inaczej, to w inny sposób - whoops - przygotowaliscie stoisko.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_23_19"); //Kiedy ktos przychodzi na ich stoisko i widzi jablko..... Zwyciezylem juz! (smiertelnicy)

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_MATTEO_TWO, "Matteo dal mi piec zgnilych jablek do rozdania do sklepów spozywczych w Khorinis. Aby nie zostac odkrytym, powinienem wczesniej zaangazowac dealerów w rozmowe.");

	B_RaiseHandelsgeschick	(5);

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest2, "Czy zatem jest to sluszne?", Info_Mod_Matteo_LehrlingQuest2_B);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest2, "To juz wszystko.", Info_Mod_Matteo_LehrlingQuest2_A);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_B_15_00"); //Czy zatem jest to sluszne?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest2_B_23_01"); //Nie musisz sie tym martwic. Gramy duzo gorzej na sobie nawzajem.

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest2_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest2_A_15_00"); //To juz wszystko.

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest2);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest3_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& ((Mod_Baltram_Apfel+Mod_Jora_Apfel+Mod_Rupert_Apfel+Mod_Fenia_Apfel+Mod_Coragon_Apfel) == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest3_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_00"); //Mój pomysl jest owocny! Klienci wlewaja do mojego sklepu jak dym do pluc sekciarskiej blystki.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_01"); //Jeszcze raz dziekuje za pomoc!
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest3_15_02"); //Kiedy bedziemy kontynuowac lekcje?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_03"); //W najblizszej przyszlosci sytuacja prawdopodobnie bedzie wygladac zle.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_04"); //Moje zaangazowanie w Valentine jest nieuchronne, a my... zrobic cos innego. Jesli rozumiesz, co mam na mysli.... (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest3_23_05"); //Oczywiscie i tak zapraszamy Panstwa do odwiedzenia mnie. Poinformuje Cie, kiedy to sie rozpocznie. Milego czasu!

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(200);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Matteo_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest4_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "A co z kolejna lekcja?";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest3))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_15_00"); //A co z kolejna lekcja?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_01"); //Czas na to, czyz nie?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_02"); //Musze jednak panstwa ostrzec: w nastepnym temacie moge zaproponowac panstwu tylko male cwiczenie praktyczne, nie ma znacznie wiecej.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_03"); //Dzisiaj mówimy o polityce cenowej.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_04"); //Odrózniamy cene sprzedajacego od ceny kupujacego.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_05"); //Cena sprzedajacego jest cena, która chcialbym sprzedac, wiec po odjeciu wszystkich kosztów zakupu i kosztów dodatkowych mam przyzwoity zysk.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_06"); //Ale przede wszystkim musze dostosowac te cene do konkurencji.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_07"); //Moge po prostu sprzedawac tansze lub swiadomie sluchac ceny, aby kupujacy mysleli, ze mam dobra jakosc - co, jak panstwo wiedza, ma miejsce w przypadku mnie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_08"); //Nastepnym czynnikiem sa kupujacy. Sprzedaje swoje towary bezposrednio przy wejsciu do Górnej Dzielnicy, wiec ja równiez mam klientów stamtad.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_09"); //Prawdopodobnie chetniej beda chcieli wyciagnac spust niz biedne dranie z doków.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_10"); //Ostatnim punktem, na który nalezy zwrócic uwage jest cena otoczenia.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_11"); //Oznacza to po prostu: jesli sprzedajesz tylko drogie rzeczy, mozesz podniesc cene nawet z tymi tanimi.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_12"); //Z drugiej strony, oferowanie drogich produktów po nizszej cenie jest malo uzyteczne.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_15_13"); //Mysle, ze ja dostaje.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_14"); //Dobrze! Pózniej chcialbym sprawdzic za pomoca trzech pytan, czy wiesz, czy znasz te sprawe!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_23_15"); //Idziemy tutaj! Kto bedzie sprzedawal drozszy chleb - Fenia z dzielnicy portowej czy ja?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Ty.", Info_Mod_Matteo_LehrlingQuest4_B);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Fenia.", Info_Mod_Matteo_LehrlingQuest4_A);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_C()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_C_23_00"); //Dalej: sprzedaje tanie akcesoria rzemieslnicze i znalazlem zlote pudelko.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_C_23_01"); //Czy teraz sprzedam je powyzej lub ponizej wartosci innych moich produktów?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Sprzedajesz pudelko ponizej jego wartosci.", Info_Mod_Matteo_LehrlingQuest4_E);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Sprzedajesz pudelko powyzej jego wartosci.", Info_Mod_Matteo_LehrlingQuest4_D);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_B()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_B_15_00"); //Ty.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_C();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_A()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_A_15_00"); //Fenia.

	Info_Mod_Matteo_LehrlingQuest4_C();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_F()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_F_23_00"); //I po trzecie: Dostaje towar, dodaje kilka zlotych monet do mojej ceny zakupu i sprzedaje je.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_F_23_01"); //Jaka cene pominalem?

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);

	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Cena sprzedazy.", Info_Mod_Matteo_LehrlingQuest4_H);
	Info_AddChoice	(Info_Mod_Matteo_LehrlingQuest4, "Cena nabywcy.", Info_Mod_Matteo_LehrlingQuest4_G);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_E()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_E_15_00"); //Sprzedajesz pudelko ponizej jego wartosci.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_F();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_D()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_D_15_00"); //Sprzedajesz pudelko powyzej jego wartosci.

	Info_Mod_Matteo_LehrlingQuest4_F();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_I()
{
	if (Mod_Matteo_Fragen == 0)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_00"); //O czym wam mówie, jesli i tak tego nie zachowacie? No cóz, to jest Twój problem.
	}
	else if (Mod_Matteo_Fragen == 1)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_01"); //Nie ma z toba zbyt wiele. Lub nie pasuje jako handlowiec. Zawsze trzeba sie uczyc!

		B_GivePlayerXP	(50);
	}
	else if (Mod_Matteo_Fragen == 2)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_02"); //To brzmi jak dobry pomysl. Nie do konca jeszcze wolne od bledów, ale mozesz stac sie czyms innym!

		B_GivePlayerXP	(100);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_03"); //Bardzo dobra, nieskazitelna wydajnosc!

		B_GivePlayerXP	(200);
	};

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest4_I_23_04"); //To znów na ten czas. Wkrótce wróc!

	Info_ClearChoices	(Info_Mod_Matteo_LehrlingQuest4);
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_H()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_H_15_00"); //Cena sprzedazy.

	Info_Mod_Matteo_LehrlingQuest4_I();
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest4_G()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest4_G_15_00"); //Cena nabywcy.

	Mod_Matteo_Fragen += 1;

	Info_Mod_Matteo_LehrlingQuest4_I();
};

INSTANCE Info_Mod_Matteo_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest5_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_LehrlingQuest5_Condition()
{
	if (Mod_LehrlingBei == 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Moe_Anschlaege))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest5_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest5_23_00"); //Powiedzcie - te wasze plakaty....
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest5_15_01"); //... Byla to kampania rozmazana.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest5_23_02"); //Cóz, jestem z ulga.
};

INSTANCE Info_Mod_Matteo_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest6_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tu znów jestem.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest4))
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest6_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_00"); //Tu znów jestem.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_01"); //I jeszcze jestem tutaj. (smiech) Nie znalazles czasu dla starego Matteo na wszystkie swoje wedrówki?
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_02"); //Wyjatkowo.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_03"); //Cóz, ciesze sie! Jestes mala celebryta!
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_04"); //To jest zycie.....
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_05"); //Prawie brzmi to tak, jakbys sie spieszyl. Wtedy nie chce zbyt dlugo zajmowac sie wam dzisiejszym tematem.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_06"); //Dzisiaj opowiem wam, jak dostac tu w Khorinis specjalne towary.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_07"); //Przez to rozumiem towary, których nie dostaja inni handlowcy, towary, z którymi tak sie ciesze.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_08"); //Mój sekret, ze tak powiem.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_09"); //Brzmi to ekscytujaco.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_10"); //Wierze w ciebie! Jedno slowo: Tajemnica - zwrócenie pelnej uwagi!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_11"); //I to jest tak sekretne, ze nie trzeba nawet znac miejskiego zegarka.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_12"); //Zwykla wymiane towarów kontroluja paladyny.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_13"); //Dwie bramy miasta oferuja jedzenie, produkty górnicze i okazjonalnie wyroby rzemieslnicze.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_14"); //W samym miescie produkuje sie glównie rekodzielo i oczywiscie bron.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_15"); //Wysylki z Myrtany rzadko docieraja droga morska, a jesli tak sie stanie, Lord Hagen natychmiast je pomiesci.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_16"); //A potem sa piraci....
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_17"); //Rozumiem.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_18"); //Czyz nie? Jharkendar oferuje mnóstwo egzotycznych produktów, a grog piratów tez nie nalezy lekcewazyc!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_19"); //Punktem przeladunkowym jest plaza na pólnoc od Khorinis. Tam co tydzien spotykam sie z nimi i kupuje ich majatek.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_20"); //Wlasnie dzisiaj musialem je zobaczyc jeszcze raz.
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_21"); //Praca dla mnie.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_22"); //On to widzial. Mozesz wypróbowac swoje umiejetnosci handlowe na nich od razu, twardych partnerów negocjacyjnych.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_23"); //Oto 300 zlotych monet na dwa skrzynki grog. Wszystko, co mozesz wynegocjowac, to twoje wlasne.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest6_15_24"); //Bede wiec w drodze.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest6_23_25"); //Zrób to. Powodzenia!

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_MATTEO_THREE, "Mam miec dwie skrzynki grog dostarczone do piratów na plazy na pólnoc od Khorinis i mnie. Poniewaz otrzymalem tylko 300 zlotych monet od Matteo, powinienem spróbowac podniesc cene.");

	B_RaiseHandelsgeschick	(5);

	Wld_InsertNpc	(Mod_7585_PIR_PIRAT_NW,	"NW_CITY_PIRATESCAMP_03");
};

INSTANCE Info_Mod_Matteo_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest7_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj idziesz, dwa pudelka z grogiem.";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pirat_Hi))
	&& (Npc_HasItems(hero, ItMi_GrogPaket_Matteo) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest7_15_00"); //Tutaj idziesz, dwa pudelka z grogiem.

	B_GiveInvItems	(hero, self, ItMi_GrogPaket_Matteo, 2);

	Npc_RemoveInvItems	(self, ItMi_GrogPaket_Matteo, 2);

	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_01"); //Dzieki, czlowiek. Szczerze mówiac, nie lubie pirackich skarpetek. Ale grog sprzedaje sie dobrze!
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_02"); //Na tym konczy sie twoja praktyka u mnie. Powiedzialem ci wszystko, czego potrzebujesz, aby przetrwac jako handlowiec.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_03"); //I zrobiles dobra robote, zeby mi pomóc. Nie chce pozostawiac tego calkowicie niedocenianego.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_04"); //Chce, zebys mial ten blyszczacy pierscien. To zaimponuj swoim negocjatorom!

	B_GiveInvItems	(self, hero, ItRi_Verhandlungsring, 1);

	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest7_15_05"); //Dziekuje bardzo.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest7_23_06"); //Nie wspominajmy o tym. Teraz zajmijcie sie!

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_MATTEO_THREE, LOG_SUCCESS);
	
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_46);
};

INSTANCE Info_Mod_Matteo_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_LehrlingQuest8_Condition;
	information	= Info_Mod_Matteo_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to sie dzieje z Toba?";
};

FUNC INT Info_Mod_Matteo_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest7))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest8_15_00"); //Jak to sie dzieje z Toba?
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest8_23_01"); //Ze znowu cie zobacze! Dobre, dobre, dobre, dobre, wszystko w porzadku. I wciaz jestes zajety podrózowaniem?
	AI_Output(hero, self, "Info_Mod_Matteo_LehrlingQuest8_15_02"); //Ktos musi wszystko naprawic.
	AI_Output(self, hero, "Info_Mod_Matteo_LehrlingQuest8_23_03"); //No cóz, dokad idziesz! (smiertelnicy)
};

INSTANCE Info_Mod_Matteo_Einschaetzung (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Einschaetzung_Condition;
	information	= Info_Mod_Matteo_Einschaetzung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Czy mozesz ocenic moje umiejetnosci negocjacyjne?";
};

FUNC INT Info_Mod_Matteo_Einschaetzung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Einschaetzung_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Einschaetzung_15_00"); //Czy mozesz ocenic moje umiejetnosci negocjacyjne?
	AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_01"); //Pewne. Cóz, powiedzialbym, ze.....

	if (Mod_Verhandlungsgeschick	<	30)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_02"); //... Praktykant handlowca.
	}
	else if (Mod_Verhandlungsgeschick	<	50)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_03"); //... Maly przedsiebiorca.
	}
	else if (Mod_Verhandlungsgeschick	<	75)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_04"); //... Dystrybutor.
	}
	else if (Mod_Verhandlungsgeschick	<	100)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_05"); //... Dobry dealer.
	}
	else if (Mod_Verhandlungsgeschick	==	100)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Einschaetzung_23_06"); //... Doskonaly dealer.
	};
};

INSTANCE Info_Mod_Matteo_Angebot_Kaese (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Kaese_Condition;
	information	= Info_Mod_Matteo_Angebot_Kaese_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przeczytalem cos o Panstwa ofercie.";
};

FUNC INT Info_Mod_Matteo_Angebot_Kaese_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	&& (Mod_AngebotMatteo == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Kaese_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Angebot_Kaese_15_00"); //Przeczytalem cos o Panstwa ofercie.
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Kaese_23_01"); //Masz na mysli ser. Tak, kosztuje tylko 10 zlotych monet i jest dostepny tylko w ciagu najblizszych kilku dni.

	Mod_MatteosKaeseAngebot	= Wld_GetDay();
};

INSTANCE Info_Mod_Matteo_Angebot_Vorbei (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Angebot_Vorbei_Condition;
	information	= Info_Mod_Matteo_Angebot_Vorbei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matteo_Angebot_Vorbei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Kaese))
	&& ((Wld_GetDay() - Mod_MatteosKaeseAngebot) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Angebot_Vorbei_Info()
{
	AI_Output(self, hero, "Info_Mod_Matteo_Angebot_Vorbei_23_00"); //Oferta traci waznosc.
};

INSTANCE Info_Mod_Matteo_Kaese (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Kaese_Condition;
	information	= Info_Mod_Matteo_Kaese_Info;
	permanent	= 1;
	important	= 0;
	description	= "Daj mi kawalek sera.";
};

FUNC INT Info_Mod_Matteo_Kaese_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Kaese))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Angebot_Vorbei))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Kaese_Info()
{
	AI_Output(hero, self, "Info_Mod_Matteo_Kaese_15_00"); //Daj mi kawalek sera.

	if (Npc_HasItems(hero, ItMi_Gold) >= 10)
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Kaese_23_01"); //Oto twój ser.

		B_GiveInvItems	(hero, self, ItMi_Gold, 10);

		CreateInvItems	(self, ItFo_Cheese, 1);
		B_GiveInvItems	(self, hero, ItFo_Cheese, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Matteo_Kaese_23_02"); //Przyjedz z powrotem, gdy masz wystarczajaco duzo zlota.
	};
};

INSTANCE Info_Mod_Matteo_Trade (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Trade_Condition;
	information	= Info_Mod_Matteo_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Matteo_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Hi))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Matteo_Aufnahme))
	|| (Mod_LehrlingBei == 3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matteo_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Matteo_Pickpocket (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_Pickpocket_Condition;
	information	= Info_Mod_Matteo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Matteo_Pickpocket_Condition()
{
	C_Beklauen	(109, ItMi_Gold, 38);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

	Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_BACK, Info_Mod_Matteo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Matteo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Matteo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Matteo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Matteo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Matteo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Matteo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Matteo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Matteo_EXIT (C_INFO)
{
	npc		= Mod_529_NONE_Matteo_NW;
	nr		= 1;
	condition	= Info_Mod_Matteo_EXIT_Condition;
	information	= Info_Mod_Matteo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Matteo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matteo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
