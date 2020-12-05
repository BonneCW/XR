INSTANCE Info_Mod_Caine_Hi (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Hi_Condition;
	information	= Info_Mod_Caine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj.";
};

FUNC INT Info_Mod_Caine_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Hi_15_00"); //Witaj.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_31_01"); //Ach, widzac cie jeszcze raz, nie pomyslalbym, ze to mozliwe.
	AI_Output(self, hero, "Info_Mod_Caine_Hi_31_02"); //Teraz, gdy jestem odpowiedzialny za eliksiry i powiedzenia, moge sprzedac je do Ciebie.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Baal Caine moze sprzedac mi eliksiry i zaklecia.");
};

INSTANCE Info_Mod_Caine_GotoTempel (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_GotoTempel_Condition;
	information	= Info_Mod_Caine_GotoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jestescie oczekiwani w swiatyni.";
};

FUNC INT Info_Mod_Caine_GotoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_KarrasDa))
	&& (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_GotoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_GotoTempel_15_00"); //Jestescie oczekiwani w swiatyni.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TEMPEL");
};

INSTANCE Info_Mod_Caine_Leichengase (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase_Condition;
	information	= Info_Mod_Caine_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Znaleziono problem z zapachem?";
};

FUNC INT Info_Mod_Caine_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_00"); //Znaleziono problem z zapachem?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_01"); //Tak..... Nie.... Nie. Moze. Stworzylem rózne zabójcy zapachów, maski i neutralizatory.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_02"); //Ale nie wiem, czy i jesli tak, to które z nich dziala. Po pierwsze, potrzebuje próbki zapachu lub jeszcze lepiej.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_03"); //Czy bylbys tak uprzejmy?
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase_15_04"); //Co? Ten jest niewidomy! Nie chodzi tylko tam!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_05"); //Tak, tak, tak....... Rozumiem. Wez to tutaj.

	B_GiveInvItems	(self, hero, ItSc_TrfGolem, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_06"); //Cóz, zamienilismy rekiny bagienne w dwie góry.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_07"); //Idz na góre i po prostu troche ja wyryj.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase_31_08"); //Potem odwracasz sie i przynosisz mi próbke.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Baal Caine potrzebuje próbki. W tym celu mam uzyc metamorficznej roli, która mi powierzyl i wyciagnac kawalek jednej z gór zarlacza bagiennego.");
};

INSTANCE Info_Mod_Caine_Leichengase2 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase2_Condition;
	information	= Info_Mod_Caine_Leichengase2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Twoja..... Próby.";
};

FUNC INT Info_Mod_Caine_Leichengase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase))
	&& (Npc_HasItems(hero, ItMi_Sumpfhaiprobe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase2_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_00"); //Twoja..... Próby.

	B_GiveInvItems	(hero, self, ItMi_Sumpfhaiprobe, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_01"); //Doskonaly! Zrobiles bardzo dobrze i jestem z Ciebie dumny!
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase2_15_02"); //Dziekuje.....
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_03"); //Jetzt brauche ich noch ein paar "ochotnicy".
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_04"); //Nastepnie wejdz na platforme Templar. Chce byc otoczony jak najwieksza iloscia swiezego powietrza.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase2_31_05"); //W miedzyczasie poczynie niezbedne przygotowania.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Mam pózniej udac sie na templarna platforme. Baal Caine przygotuje wszystko do procesu.");

	B_StartOtherRoutine	(self, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1324_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "LEICHENGASE");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "LEICHENGASE");
};

INSTANCE Info_Mod_Caine_Leichengase3 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase3_Condition;
	information	= Info_Mod_Caine_Leichengase3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase2))
	&& (Npc_GetDistToWP(self, "PSI_TRAINING_TEACHER") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_00"); //Tutaj wreszcie przyjdziesz. Wszystko jest juz przygotowane.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_01"); //Ich habe die "badanie" mit verschiedenen Substanzen bearbeitet.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_02"); //Teraz od testerów zalezy, który z nich pracuje.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase3_15_03"); //A jak to robimy?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_04"); //Mam jakies szklane fiolki zwiazane z strzalkami.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_05"); //Na skutek uderzenia pekaja i daja nam tlusta, smierdzaca prawde.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase3_31_06"); //Wolontariusze dolaczaja do grupy wolontariuszy;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "LEICHENGASE2");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "LEICHENGASE2");
};

INSTANCE Info_Mod_Caine_Leichengase4 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase4_Condition;
	information	= Info_Mod_Caine_Leichengase4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_Leichengase4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase3))
	&& (Mod_Caine_Leichengase == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase4_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_00"); //Ha! Spójrz, ktos stoi. Numer nowosci 3.... co oznacza, ze odczynnik 3 jest rozwiazaniem naszego problemu!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_01"); //Teraz musimy jedynie produkowac rzeczy na duza skale. Potrzebujemy tylko.... uh-huh.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_02"); //Co?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_03"); //Bedzie to troche skomplikowane. Odczynnikiem 3 byl Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_04"); //Czy to oznacza, ze mam teraz chodzic do trolli?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_05"); //Wäre die Sache doch nur so einfach. Es ist ... "wybredny" Trollkot.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_06"); //Szczególnie w jaki sposób?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_07"); //Trolla byla wegetarianska.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_08"); //Mieszkal na bagnie, nie wiem jak sie tam dostal.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_09"); //Zjadl glównie rekiny bagienne.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_10"); //Ale prawdopodobnie caly dym z rdestnicy bagnistej nieco zaciemnil mu glowe.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_11"); //Pewnego dnia jadl tylko rosliny. Swamport, paprocie, jagody.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_12"); //Co sie dzieje na bagnie.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_13"); //A co sie z nim stalo?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_14"); //Co myslisz? Zglodzony na smierc glodowa. Wegetarianski troll, to smieszne.
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_15"); //A dlaczego znów trzymales jego odchody?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_16"); //Nie ma to teraz znaczenia.
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_17"); //Wazne jest, ze dostajesz kilka trollów, aby zjesc tutaj te mieszanke bagiennych ziól, a nastepnie przynies do mnie ich cieple, miekkie, lagodne parowe sterty!

	B_GiveInvItems	(self, hero, ItMi_Sumpfkraeuter, 1);

	AI_Output(hero, self, "Info_Mod_Caine_Leichengase4_15_18"); //A jak mam to zrobic?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_19"); //Jestem pewien, ze znajdziesz sposób. Dlaczego nie pytasz ludzi, którzy o tym wiedza?
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase4_31_20"); //Mysliwi, chlopi, moze magowie moga Ci pomóc.

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Baal Caine potrzebuje kalu wegetarianskiego trolla do antidotum. Dal mi mieszanke ziól, które jakos potrzebuje dostac do trolli. Z kims, kto cos takiego wie. Chlop, mysliwy, czy moze magik. Hm, to prawdopodobnie najodpowiedniejsze dla Lobarta, Dragomira i Miltena.");

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1322_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1325_PSINOV_Novize_MT, "START");
	B_StartOtherRoutine	(Mod_1326_PSINOV_Novize_MT, "START");
};

INSTANCE Info_Mod_Caine_Leichengase5 (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Leichengase5_Condition;
	information	= Info_Mod_Caine_Leichengase5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto Twój poop!";
};

FUNC INT Info_Mod_Caine_Leichengase5_Condition()
{
	if (Npc_HasItems(hero, ItMi_Trollhaufen) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Leichengase5_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Leichengase5_15_00"); //Oto Twój poop!

	B_GiveInvItems	(hero, self, ItMi_Trollhaufen, 1);

	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_31_01"); //Jestem wam gleboko zadluzony!
	AI_Output(self, hero, "Info_Mod_Caine_Leichengase5_31_02"); //Idz do Baala Namiba i powiedz mu, ze jego nowicjusze moga oddychac ponownie.

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Caine_Woher (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Woher_Condition;
	information	= Info_Mod_Caine_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak dostales sie do tego obozu?";
};

FUNC INT Info_Mod_Caine_Woher_Condition()
{
	if (Guru_Dabei == 1)
	|| (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Caine_Woher_15_00"); //Jak dostales sie do tego obozu?
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_01"); //Kiedys bylem praktykantem w alchemiku Constantino Khoriniego, byc moze go znasz.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_02"); //W kazdym razie eksperymentuje z ówczesna bagnista i kiedy zlapalem sie, wrzucili mnie do kolonii.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_03"); //Skoro lubie palic takze troche bólem bagnistym, poszedlem do Bractwa i zostalem praktykantem Kaloma.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_04"); //Byl on zawsze moim wspanialym wzorem do nasladowania i staralem sie zyc tak jak on, ale po tym, jak sie wyprowadzil szukajac sypialni, zostalem tutaj.
	AI_Output(self, hero, "Info_Mod_Caine_Woher_31_05"); //Dopiero niedawno Cor Cadar i Cor Angar wyznaczyli mnie na mistrza guru i alchemika.
};

INSTANCE Info_Mod_Caine_BistGuru (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_BistGuru_Condition;
	information	= Info_Mod_Caine_BistGuru_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Caine_BistGuru_Condition()
{
	if (Guru_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_BistGuru_Info()
{
	AI_Output(self, hero, "Info_Mod_Caine_BistGuru_31_00"); //Teraz, gdy jestes jednym z nas guru, moge Cie nauczyc alchemii.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Baal Caine moze mnie nauczyc o alchemii.");
};

INSTANCE Info_Mod_Caine_Lehrer (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Lehrer_Condition;
	information	= Info_Mod_Caine_Lehrer_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie alchemii.";
};

FUNC INT Info_Mod_Caine_Lehrer_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_BistGuru))
	&& (Mod_IstLehrling == 1)
	{	
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Lehrer_Info()
{
	AI_Output (hero, self, "Info_Mod_Caine_Lehrer_15_00"); //Bring mir etwas über die Alchemie bei.	
	AI_Output (self, hero, "Info_Mod_Caine_Lehrer_31_01"); //Was willst du wissen?
		
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
	Info_AddChoice 		(Info_Mod_Caine_Lehrer,DIALOG_BACK,Info_Mod_Caine_Lehrer_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Szybkosc", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Speed)), Info_Mod_Caine_Lehrer_Speed);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice 		(Info_Mod_Caine_Lehrer,B_BuildLearnString ("Istota uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_01)),Info_Mod_Caine_Lehrer_HEALTH_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Ekstrakt z ekstraktu leczniczego", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_02)), Info_Mod_Caine_Lehrer_Health_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Eliksir uzdrawiania", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Health_03)), Info_Mod_Caine_Lehrer_Health_03);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	&& (Mod_LehrlingBei != 1)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Essence", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_01)), Info_Mod_Caine_Lehrer_Mana_01);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("ekstrakt z maneny", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_02)), Info_Mod_Caine_Lehrer_Mana_02);
	};
		
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice	  (Info_Mod_Caine_Lehrer, B_BuildLearnString ("Mana Elixir", B_GetLearnCostTalent (hero, NPC_TALENT_ALCHEMY, POTION_Mana_03)), Info_Mod_Caine_Lehrer_Mana_03);
	};
};
FUNC VOID Info_Mod_Caine_Lehrer_BACK()
{
	Info_ClearChoices 	(Info_Mod_Caine_Lehrer);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_Health_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Health_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_01()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_01);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_02()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_02);
};
FUNC VOID Info_Mod_Caine_Lehrer_MANA_03()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Mana_03);
};
FUNC VOID Info_Mod_Caine_Lehrer_Speed()
{
	B_TeachPlayerTalentAlchemy (self, hero, POTION_Speed);
};

INSTANCE Info_Mod_Caine_Trade (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_Trade_Condition;
	information	= Info_Mod_Caine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Caine_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Caine_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Caine_EXIT (C_INFO)
{
	npc		= Mod_1116_PSINOV_Caine_MT;
	nr		= 1;
	condition	= Info_Mod_Caine_EXIT_Condition;
	information	= Info_Mod_Caine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Caine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Caine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
