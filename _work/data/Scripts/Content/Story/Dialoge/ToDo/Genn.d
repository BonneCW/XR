INSTANCE Info_Mod_Genn_Hi (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Hi_Condition;
	information	= Info_Mod_Genn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_00"); //Jestes na czasie.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_01"); //Jestes z dwoma przyjaciólmi.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_02"); //Jestes w towarzystwie przyjaciela.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_03"); //Kim jestes?
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_04"); //Chce dolaczyc do Was magów transformacji.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_05"); //Wtedy dostales sam punkt plus na tym. Jesli chcesz, to powiem ci kilka taktów o naszym malym problemie tutaj w dolinie.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_06"); //Dlatego jestem tutaj.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_07"); //To dobra wiadomosc. Spójrzcie na siebie tutaj. Gobliny niszcza nasza ukochana doline. Nie wiemy dokladnie, skad pochodza, ale mamy przeczucie.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_08"); //Kilka dni temu mialo miejsce trzesienie ziemi, które ujawnilo wejscie do ogromnej jaskini.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_09"); //Podejrzewamy, ze jaskinie zostaly zakopane, a gobliny wziely nasza doline jako droge ucieczki.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_10"); //Ale macewy nie przestaja dostawac nowych miotów, wiec nie mamy od nich spokoju.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_11"); //Co chcesz, abym zrobil?
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_12"); //Najlepiej jest zabic matrony. My poradzimy sobie z reszta.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_13"); //Oczywiscie mozesz równiez zabic goblina, który przecina Twoja droge.
	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_14"); //Bede w drodze od razu.
	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_15"); //Zanim wyjedziesz, zdejmij to i pomozesz.

	B_GiveInvItems	(self, hero, ItSc_TrfSnapper, 2);

	AI_Output(self, hero, "Info_Mod_Genn_Hi_09_16"); //Ale nie uzywaj go w obecnosci ludzi, lub moga myslec, ze jestes potworem.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_17"); //A co z moim towarzyszem?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_18"); //Beda Ci towarzyszyc tylko do wioski, reszta musisz zrobic samodzielnie.
	}
	else if (Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Hi_15_19"); //A co z moim towarzyszem?
		AI_Output(self, hero, "Info_Mod_Genn_Hi_09_20"); //On bedzie ci towarzyszyl tylko do wioski, reszta musisz zrobic samodzielnie.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Hi_15_21"); //Widze. Wtedy lepiej by bylo.

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Mam zabic wklady goblinowe, zeby nie mogly miec potomstwa.");
};

INSTANCE Info_Mod_Genn_Matronen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Matronen_Condition;
	information	= Info_Mod_Genn_Matronen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Matronen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lorforn_Hi))
	&& (TUG_Lorforn == TRUE)
	&& (Npc_IsDead(Gobbo_Matrone))
	&& (((Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1))
	|| (!Npc_IsDead(Mod_1962_OUT_Lorforn_TUG)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Matronen_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_00"); //Czy matrony sa martwe?
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_15_01"); //Tak, zabilem ja. Poza tym znam winowajce odpowiedzialnego za trzesienie ziemi.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_09_02"); //Kim to jest?

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	if (Npc_IsDead(Mod_1962_OUT_Lorforn_TUG))
	&& (Npc_HasItems(hero, ItWr_LorfornsBrief) == 1)
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "Tam byl ten facet imieniem Lorforn......", Info_Mod_Genn_Matronen_B);
	}
	else
	{
		Info_AddChoice	(Info_Mod_Genn_Matronen, "Tam byl ten facet z skórzanymi ubraniami....", Info_Mod_Genn_Matronen_A);
	};
};

FUNC VOID Info_Mod_Genn_Matronen_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_C_15_00"); //Dzieki. Zobacze cie dookola.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_01"); //Oczywiscie. Zycze panu wszystkiego najlepszego. Teleporter jest nadal aktywny. Jesli sie spieszysz, mozesz spieszyc sie przed Minentalem.

	if (Mod_Struk_Dabei == TRUE)
	&& (Mod_Thorge_Dabei == TRUE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_02"); //Twoi dwaj towarzysze beda jednak musieli tu pozostac.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	}
	else if ((Mod_Struk_Dabei == TRUE)
	|| (Mod_Thorge_Dabei == TRUE))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorge_TUG_AtDorf))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Struk_TUG_AtDorf))
	{
		AI_Output(self, hero, "Info_Mod_Genn_Matronen_C_09_03"); //Twój towarzysz musi jednak tu pozostac.

		B_StartOtherRoutine	(Mod_1961_VMK_Struk_TUG, "ATCITY");
		B_StartOtherRoutine	(Mod_1960_VMG_Thorge_TUG, "ATCITY");

		Struk_Abgeliefert = 1;
		Thorge_Abgeliefert = 1;

		Mod_1961_VMK_Struk_TUG.aivar[AIV_Partymember] = FALSE;
		Mod_1960_VMG_Thorge_TUG.aivar[AIV_Partymember] = FALSE;
	};

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "STUDIEREN");
};

FUNC VOID Info_Mod_Genn_Matronen_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_B_15_00"); //Byl taki facet o imieniu Lorforn, ten z' P'. aby rozpoczac trzesienie. Oto dowód.

	B_GiveInvItems	(hero, self, ItWr_LorfornsBrief, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Genn_Matronen_B_09_01"); //Dziekuje za ten list. Bedziemy trzymac sie tego celu. Oto nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Opisalem sytuacje Gennowi i dostalem zaplate. Powinienem powrócic do Minentala.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

FUNC VOID Info_Mod_Genn_Matronen_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Matronen_A_15_00"); //Tam byl ten facet w skórzanych ubraniach, który powiedzial, ze zostal poslany, aby to zrobic. Pozwolilem mu odejsc.
	AI_Output(self, hero, "Info_Mod_Genn_Matronen_A_09_01"); //Dziekujemy za informacje. Bedziemy trzymac sie tego celu. Oto nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_FERCO_GOBLIN, "Opisalem sytuacje Gennowi i dostalem zaplate. Powinienem powrócic do Minentala.");

	Info_ClearChoices	(Info_Mod_Genn_Matronen);

	Info_Mod_Genn_Matronen_C();
};

INSTANCE Info_Mod_Genn_Faice (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Faice_Condition;
	information	= Info_Mod_Genn_Faice_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Faice_Condition()
{
	if (Mod_VMG_FaiceGifty_Gift == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Faice_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Faice_09_00"); //To zbieg okolicznosci, rozmawialismy tylko o Tobie.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Info_AddChoice	(Info_Mod_Genn_Faice, "Kim jest ten facet?", Info_Mod_Genn_Faice_B);
	Info_AddChoice	(Info_Mod_Genn_Faice, "O co w tym wszystkim chodzilo?", Info_Mod_Genn_Faice_A);
};

FUNC VOID Info_Mod_Genn_Faice_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_00"); //Kim jest ten facet?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_01"); //To Sören. Przyjezdza z daleka, aby pomóc nam odbudowac nasza osade.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_B_15_02"); //Ciesze sie, Sören. Jestem.....
	AI_Output(self, hero, "Info_Mod_Genn_Faice_B_09_03"); //To Sören. Przyjezdza z daleka, aby pomóc nam odbudowac nasza osade.

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	AI_StopProcessInfos	(self);

	Mod_VMG_FaiceGifty_Gift = 4;
};

FUNC VOID Info_Mod_Genn_Faice_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_00"); //O co w tym wszystkim chodzilo?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_01"); //To byl osuwisko przed plaga Goblina, jesli pamietasz.
	AI_Output(hero, self, "Info_Mod_Genn_Faice_A_15_02"); //Tak, jak móglbym zapomniec?
	AI_Output(self, hero, "Info_Mod_Genn_Faice_A_09_03"); //Dlaczego tu jestes?

	Info_ClearChoices	(Info_Mod_Genn_Faice);

	Mod_VMG_FaiceGifty_Gift = 5;
};

INSTANCE Info_Mod_Genn_Mendulus (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Mendulus_Condition;
	information	= Info_Mod_Genn_Mendulus_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam duzej rosliny leczniczej z fioletowymi klonicami. Widziales ja?";
};

FUNC INT Info_Mod_Genn_Mendulus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Faice))
	&& (Mod_VMG_FaiceGifty_Gift == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Mendulus_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_15_00"); //Szukam duzej rosliny leczniczej z fioletowymi klonicami. Widziales ja?
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_01"); //Oczywiscie znam ziolo Mendulusa. Pamietajmy o jaskini z matronami? To tu rosnie, jesli sie nie myle.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_09_02"); //Jesli jestes juz tam, mozesz mnie przyniesc.

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Roslina ta nazywana jest 'ziolem Mendulus' a' i rosnie w poblizu wejscia do jaskini, gdzie znajdowaly sie gobliny.");

	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_01");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_02");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_03");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_04");
	Wld_InsertItem	(ItPl_Mendulus, "FP_ITEM_MENDULUS_05");

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Nie gram dla ciebie chlopca, który sie sprawil.", Info_Mod_Genn_Mendulus_B);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Wszystko jasne. Zobacze cie dookola.", Info_Mod_Genn_Mendulus_A);
};

FUNC VOID Info_Mod_Genn_Mendulus_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_B_15_00"); //Nie gram dla ciebie chlopca, który sie sprawil.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_B_09_01"); //Chodz dalej, jesli i tak jestes na drodze....
	
	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	AI_StopProcessInfos	(self);

	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Nie, zapomnij.", Info_Mod_Genn_Mendulus_D);
	Info_AddChoice	(Info_Mod_Genn_Mendulus, "Okay.", Info_Mod_Genn_Mendulus_C);
};

FUNC VOID Info_Mod_Genn_Mendulus_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_A_15_00"); //Wszystko jasne. Zobacze cie dookola.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Zycze powodzenia.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_D_15_00"); //Nie, zapomnij.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_D_09_01"); //Zmieniles sie. Niestety.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

FUNC VOID Info_Mod_Genn_Mendulus_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Mendulus_C_15_00"); //Okay.
	AI_Output(self, hero, "Info_Mod_Genn_Mendulus_C_09_01"); //Zycze powodzenia.

	Info_ClearChoices	(Info_Mod_Genn_Mendulus);

	Mod_VMG_FaiceGifty_Gift = 6;
};

INSTANCE Info_Mod_Genn_Soeren (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Soeren_Condition;
	information	= Info_Mod_Genn_Soeren_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Soeren_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Soeren_Mendulus))
	&& (Mod_VMG_FaiceGifty_Gift == 8)
	&& (Npc_HasItems(hero, ItWr_SoerensPBrief) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Soeren_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_00"); //Czy widziales Sören? Zniknal tak nagle.
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_15_01"); //Tak, rzeczywiscie. Tutaj przeczytaj to.

	B_GiveInvItems	(hero, self, ItWr_SoerensPBrief, 1);

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_Genn_Soeren_09_02"); //Ale.... To okropne! Jak móglbym za niego upadnac? I to znowu P.

	B_StartOtherRoutine	(self, "START");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "A co z nagroda?", Info_Mod_Genn_Soeren_B);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "Co zamierzasz teraz zrobic?", Info_Mod_Genn_Soeren_A);
};

FUNC VOID Info_Mod_Genn_Soeren_E()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_E_15_00"); //Wróce do Minentala, jesli nie przeszkadzasz.
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_01"); //Nie, teleporter jest nadal aktywny.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Soeren_E_09_02"); //Ach, zanim zapomne, oto Twoja nagroda. Zrobiliscie nam Panstwo wspaniala obsluge.

		B_GiveInvItems	(self, hero, ItMi_Gold, 500);

		B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Rozmawialam z Gennem i dostalam nagrode. Powinienem teraz wrócic do Doliny Minental, kiedy teleporter jest nadal aktywny.");

		Mod_VMG_FaiceGifty_Gift = 9;
	};
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_B_15_00"); //A co z nagroda?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_B_09_01"); //Oczywiscie tutaj. Wez to zloto jako nagrode.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	Mod_VMG_FaiceGifty_Gift = 9;

	B_LogEntry	(TOPIC_MOD_FAICE_HEILUNG, "Rozmawialam z Gennem i dostalam nagrode. Powinienem teraz wrócic do Doliny Minental, kiedy teleporter jest nadal aktywny.");
	
	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	Info_AddChoice	(Info_Mod_Genn_Soeren, "Co to wszystko?", Info_Mod_Genn_Soeren_D);
	Info_AddChoice	(Info_Mod_Genn_Soeren, "Dzieki. Co zamierzasz teraz zrobic?", Info_Mod_Genn_Soeren_C);
};

FUNC VOID Info_Mod_Genn_Soeren_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_A_15_00"); //Co zamierzasz teraz zrobic?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_A_09_01"); //Jestem gonna prowadzic badania. Musimy dowiedziec sie, kim jest P. is.

	if (Mod_VMG_FaiceGifty_Gift == 8)
	{
		Info_ClearChoices	(Info_Mod_Genn_Soeren);

		Info_AddChoice	(Info_Mod_Genn_Soeren, "A co z nagroda?", Info_Mod_Genn_Soeren_B);
		Info_AddChoice	(Info_Mod_Genn_Soeren, "Wróce do Minentala, jesli nie przeszkadzasz.", Info_Mod_Genn_Soeren_E);
	}
	else
	{
		Info_Mod_Genn_Soeren_E();
	};
};

FUNC VOID Info_Mod_Genn_Soeren_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_D_15_00"); //Co to wszystko?
	AI_Output(self, hero, "Info_Mod_Genn_Soeren_D_09_01"); //Badz z tego zadowolony. Teraz wyjdz stad, teleporter jest nadal aktywny.

	Info_ClearChoices	(Info_Mod_Genn_Soeren);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Soeren_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Soeren_C_15_00"); //Dzieki.

	Info_Mod_Genn_Soeren_A();
};

INSTANCE Info_Mod_Genn_Gift (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Gift_Condition;
	information	= Info_Mod_Genn_Gift_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Gift_Condition()
{
	if (Mod_Turendil_Faice_Day == 1)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Gift_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Gift_09_00"); //Powitanie mnie. Czy moge Ci pomóc? Po tym wszystkim, co zrobiliscie dla nas, pomoc wam bylaby zaszczytem.
		
	Info_ClearChoices	(Info_Mod_Genn_Gift);

	Info_AddChoice	(Info_Mod_Genn_Gift, "Odkryje swoja droge.", Info_Mod_Genn_Gift_B);
	Info_AddChoice	(Info_Mod_Genn_Gift, "Szukam trucizny, która zatruto.", Info_Mod_Genn_Gift_A);
};

FUNC VOID Info_Mod_Genn_Gift_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_B_15_00"); //Odkryje swoja droge.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_B_09_01"); //Cokolwiek mówisz.

	Info_ClearChoices	(Info_Mod_Genn_Gift);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_Gift_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_00"); //Szukam trucizny, która zatrules sie, jesli slyszales o niej.

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Gift_A_15_01"); //O winowajcy mówi sie, ze jest tu w Tugettso i przemieniajacym sie magiem lub wojownikiem.
		AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_02"); //Co? Jak to jest mozliwe? Znam osobiscie prawie wszystkich poslów.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_03"); //Moge jedynie przyjac zalozenia dotyczace trucizny. Mamy tu kilka trujacych roslin.
	AI_Output(self, hero, "Info_Mod_Genn_Gift_A_09_04"); //Najlepiej, jesli przynosisz mnie po jednym. Oto Twoja lista.

	B_GiveInvItems	(self, hero, ItWr_GennGiftListe, 1);

	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_01");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_02");
	Wld_InsertItem	(ItPl_Mushroom_04, "FP_ITEM_FUNGO_03");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_01");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_02");
	Wld_InsertItem	(ItPl_Ponzola, "FP_ITEM_PONZOLA_03");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_01");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_02");
	Wld_InsertItem	(ItPl_VENENA, "FP_ITEM_VENENA_03");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_01");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_02");
	Wld_InsertItem	(ItPl_Mithrida, "FP_ITEM_MITHRIDA_03");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_01");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_02");
	Wld_InsertItem	(ItPl_Piante, "FP_ITEM_PIANTE_03");

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Genn wyslal do mnie liste wszystkich trujacych roslin wystepujacych w Tugettso. Mam go dostac jakakolwiek kopie.");

	Mod_Turendil_Faice_Day = 2;

	Info_ClearChoices	(Info_Mod_Genn_Gift);
};

INSTANCE Info_Mod_Genn_Trador (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trador_Condition;
	information	= Info_Mod_Genn_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trador_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_00"); //Co sie dzieje? Nie wygladasz tak dobrze.
	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_01"); //Kiedy zbieralem rosliny, zostalem zaatakowany przez golemy.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_02"); //Potem jakis dziwak o imieniu Trador zabral ode mnie rosliny.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_03"); //Potem podszedl do mnie dziwak o imieniu Trador i chcial miec rosliny.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_04"); //Powiedzial, ze jest wysokim czlonkiem magów przemieniajacych.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_05"); //To okropne!
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_06"); //Nie znam czlonka tego imienia, ale jesli nosil jeden z naszych szat, musial zabic jednego z nas.
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_07"); //Taka szate dajemy tylko wybranym czlonkom.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_08"); //Och, a ponadto musze poprosic o ponowne zebranie roslin, poniewaz nadal ich potrzebuje.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_09"); //Czy Trador powiedzial ci dlaczego to zrobil?

	if (Mod_VMG_FaiceGifty_Gift == 13)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_10"); //Dzieki ekstradycji Furt, Trador dowiedzial sie o mnie.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_11"); //On i Furt uczynili wspólna sprawe.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_12"); //Po wypuszczeniu Furt poszedl do Tradora i opowiedzial mu o mnie.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_13"); //Zrobili cos wspólnego.
	};

	AI_Output(hero, self, "Info_Mod_Genn_Trador_15_14"); //Ale on mi nie powiedzial, dlaczego chca zatruc Faice.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_15"); //Natychmiast odchodze i znów zbieram rosliny.
	};

	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_16"); //Proponuje postapic nastepujaco:
	AI_Output(self, hero, "Info_Mod_Genn_Trador_09_17"); //Idzcie do wioski i spróbujcie dowiedziec sie kto zniknal, zebysmy wiedzieli od kogo ten Trador ma szate, a moze nawet troche wiecej wiedzy o nas.

	if (Mod_VMG_Giftpflanzen == 5)
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_18"); //Najpierw przyprowadz mi rosliny.
		AI_Output(hero, self, "Info_Mod_Genn_Trador_15_19"); //Przyniose ci rosliny i dowiemy sie, który magik zostal zabity.

		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Aby kontynuowac swoje sledztwo, musze otrzymac jeszcze jedna kopie Genn' a dla kazdego trujacego zakladu.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Genn_Trador_09_20"); //Czy dasz mi rosliny, prosze? Zbadam ja tak dlugo, jak chce.
	};
};

INSTANCE Info_Mod_Genn_Giftpflanzen (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Giftpflanzen_Condition;
	information	= Info_Mod_Genn_Giftpflanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto rosliny.";
};

FUNC INT Info_Mod_Genn_Giftpflanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Trador))
	&& (Npc_HasItems(hero, ItPl_Mushroom_04) >= 1)
	&& (Npc_HasItems(hero, ItPl_Venena) >= 1)
	&& (Npc_HasItems(hero, ItPl_Mithrida) >= 1)
	&& (Npc_HasItems(hero, ItPl_Piante) >= 1)
	&& (Npc_HasItems(hero, ItPl_Ponzola) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Giftpflanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Giftpflanzen_15_00"); //Oto rosliny.

	Npc_RemoveInvItems	(hero, ItPl_Mushroom_04, 1);
	Npc_RemoveInvItems	(hero, ItPl_Mithrida, 1);
	Npc_RemoveInvItems	(hero, ItPl_Piante, 1);
	Npc_RemoveInvItems	(hero, ItPl_Ponzola, 1);
	Npc_RemoveInvItems	(hero, ItPl_Venena, 1);

	B_ShowGivenThings	("sadzenie");

	AI_Output(self, hero, "Info_Mod_Genn_Giftpflanzen_09_01"); //Dziekuje bardzo, zbadam ja tak dlugo, jak dlugo bedziesz miec oko na zaginionego maga.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Teraz to od mnie zalezy, kto zostal zabity przez Tradora. Powinienem rozejrzec sie po wsi.");

	AI_UnequipArmor	(Mod_7357_VMG_Dean_Tug);
	Npc_RemoveInvItems	(Mod_7357_VMG_Dean_TUG, ItAr_Naturmagier2, 1);

	B_StartOtherRoutine	(Mod_7357_VMG_Dean_TUG, "ERMORDET");
	B_KillNpc	(Mod_7357_VMG_Dean_TUG);

	Wld_InsertNpc	(Golem_DeanKiller, "TUG_83");
};

INSTANCE Info_Mod_Genn_Dean (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Dean_Condition;
	information	= Info_Mod_Genn_Dean_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_Dean_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Dean))
	|| (Npc_KnowsInfo(hero, Info_Mod_Dever_Dean))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Dean_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_00"); //A co? Co sie dowiedziales/as?
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_01"); //Zabitym magikiem jest dziekan.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_02"); //Zostal zaatakowany przez golema, który wyruszyl do zbadania starego kamiennego kregu.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_03"); //Co dziwne, nikt wczesniej nie widzial Golema.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_04"); //Dziekan wtedy. To jest dosyc duzy strzal.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_05"); //Zajmowal sie sprawami mistycznymi i niewytlumaczalnymi.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_06"); //Musimy zalozyc, ze nasz wróg wie, co go nie dotyczy.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_07"); //Co dzieje sie teraz?
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_08"); //Oh, tak, dokladnie. Sprawdzilem rosliny.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_09"); //Mysle, ze zostal on zatruty roslina Veneny. Oto jej kopia.

	B_GiveInvItems	(self, hero, ItPl_Venena, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_10"); //Teraz udaj sie do Turendilu i powiedz mu wszystko, czego sie dowiedziales.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_11"); //Bedzie wiedzial, co robic.
	AI_Output(hero, self, "Info_Mod_Genn_Dean_15_12"); //Dobrze, dziekuje. Bede wtedy w drodze.
	AI_Output(self, hero, "Info_Mod_Genn_Dean_09_13"); //Chodz, spiesz sie.

	B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Genn dowiedzial sie, ze Faice zostalo zatrute przez jad rosliny Weneny. Powinienem teraz wrócic do Turendila i powiedziec mu wszystko, czego sie dowiedzialem.");
};

INSTANCE Info_Mod_Genn_TradorTot (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_TradorTot_Condition;
	information	= Info_Mod_Genn_TradorTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Genn_TradorTot_Condition()
{
	if (Mod_VMG_WSTrador == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_TradorTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_09_00"); //Skad pochodziles? A co tam bylo halasem?

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	Info_AddChoice	(Info_Mod_Genn_TradorTot, "Dluga wersja.", Info_Mod_Genn_TradorTot_B);
	Info_AddChoice	(Info_Mod_Genn_TradorTot, "Krótka wersja", Info_Mod_Genn_TradorTot_A);
};

FUNC VOID Info_Mod_Genn_TradorTot_C()
{
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_00"); //Bardzo dobrze, jestem z Ciebie dumny.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_01"); //Mysle, ze najlepiej byloby, gdybym aktywowal teleportera z powrotem w Minental dla Ciebie, wiec mozesz powiedziec Turendilowi o tym.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_C_15_02"); //Zrób to.
	AI_Output(self, hero, "Info_Mod_Genn_TradorTot_C_09_03"); //Tam mozna to zrobic. Zobacze cie dookola.

	B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Genn zna i wlaczyl portal na droge powrotna. Teraz powinienem udac sie do Turendilu.");

	Info_ClearChoices	(Info_Mod_Genn_TradorTot);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Genn_TradorTot_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_00"); //Dluga wersja:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_01"); //Po tym jak Trador manipulowal teleporterami, wyszedlem w odleglej dolinie.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_02"); //Tam poznalem dwóch pustelników Sette i Buffa i naprawilem teleportera doliny.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_03"); //Potem przyjechalismy tu i bylismy zaskoczeni przez Tradora.
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_B_15_04"); //Zabilem go i zabralem jego zaklecie do zaklec.

	Info_Mod_Genn_TradorTot_C();
};

FUNC VOID Info_Mod_Genn_TradorTot_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_00"); //Krótka wersja:
	AI_Output(hero, self, "Info_Mod_Genn_TradorTot_A_15_01"); //Trador jest martwy, a ja zabezpieczylem zaklecie do Golembeschwurge. Sklamal teleportera.

	Info_Mod_Genn_TradorTot_C();
};

INSTANCE Info_Mod_Genn_Pruefung (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung_Condition;
	information	= Info_Mod_Genn_Pruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Faice wyslala mnie.";
};

FUNC INT Info_Mod_Genn_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Albert_Pruefung))
	&& (Mod_VMG_Pruefung == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_15_00"); //Faice wyslala mnie.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_09_01"); //Tak, wiem. Chcesz opanowac trzy testy, które moga Cie nauczyc w naszych praktykach, prawda?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Jakiego rodzaju testy?", Info_Mod_Genn_Pruefung_B);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Tak wlasnie jest.", Info_Mod_Genn_Pruefung_A);
};

FUNC VOID Info_Mod_Genn_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_B_15_00"); //Jakiego rodzaju testy?
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_01"); //Faice nie powiedzial ci tego? Wtedy tez nie jestem mój.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_02"); //Zostaniesz poproszony o wykonanie kolejnych zadan, które bedziesz musial rozwiazac bez pomocy.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_B_09_03"); //Teraz powierze panstwu pierwsze z tych zadan. Czy jestes gotowy?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Jest cos, co musze zrobic.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Jestem gotowy.", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_A_15_00"); //Tak wlasnie jest.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_A_09_01"); //Nastepnie wykonam pierwsze zadanie. Czy jestes gotowy?

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Jest cos, co musze zrobic.", Info_Mod_Genn_Pruefung_D);
	Info_AddChoice	(Info_Mod_Genn_Pruefung, "Jestem gotowy.", Info_Mod_Genn_Pruefung_C);
};

FUNC VOID Info_Mod_Genn_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_D_15_00"); //Jest cos, co musze zrobic.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_D_09_01"); //Chodz, spiesz sie.

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);
};

FUNC VOID Info_Mod_Genn_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_00"); //Jestem gotowy.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_01"); //Byc moze zauwazyles swiatynie przed naszym obozem.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_02"); //Jesli nie, przygotowalem dla Ciebie mape pokazujaca pozycje.

	B_GiveInvItems	(self, hero, ItWr_Map_Tugettso_Tempel, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_03"); //Podam równiez trzy zaklecia w rolkach, które nalezy madrze uzywac.

	B_ShowGivenThings	("3 Utrzymywanie listew rolkowych");

	CreateInvItems	(hero, ItSc_TrfMeatbug, 1);
	CreateInvItems	(hero, ItSc_TrfBloodfly, 1);
	CreateInvItems	(hero, Itsc_TrfSheep, 1);

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_04"); //W dól w swiatyni, na samym koncu jest klatka piersiowa. Przynies mi przedmiot, który jest w nim. Teleporter zaprowadzi Cie z powrotem do mnie.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_05"); //Ale badzcie ostrzegani: mozecie osiagnac swój cel tylko z rola rzucania czarów, poniewaz droga jest zablokowana przez trzy przeszkody.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_06"); //Zastanówcie sie uwaznie nad rola, jaka odgrywacie dla danej przeszkody. Jakies pytania?
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_07"); //Nie.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_08"); //Wszystko w porzadku, tutaj klucz i zaklecie teleportowe.

	B_ShowGivenThings	("Zachowanie klucza i rola mówcy");

	CreateInvItems	(hero, ItSc_TeleportGenn, 1);
	CreateInvItems	(hero, ItKe_TugettsoTempel, 1);

	AI_Output(hero, self, "Info_Mod_Genn_Pruefung_C_15_09"); //Dobrze, bede na drodze.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung_C_09_10"); //Powodzenia!

	Mod_VMG_Pruefung = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Mam isc do swiatyni, która jest zaznaczona na mapie Tugettso i z pomoca trzech rzedów zaklec zaklec pobierac obiekt z jego sklepienia.");

	Info_ClearChoices	(Info_Mod_Genn_Pruefung);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Genn_Pruefung2 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung2_Condition;
	information	= Info_Mod_Genn_Pruefung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wracam.";
};

FUNC INT Info_Mod_Genn_Pruefung2_Condition()
{
	if (Mod_VMG_Pruefung == 1)
	&& (Mod_VMG_Pruefung_Teleport > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_00"); //Wracam.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_01"); //A co? Czy dostales/as przedmiot?

	if (Npc_HasItems(hero, ItMi_Statue_Genn) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_02"); //Oto popiersie.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_03"); //Cudowny, wykonales pierwsza prace! Daj mi popiersie.
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_04"); //Tutaj je masz.

		B_GiveInvItems	(hero, self, ItMi_Statue_Genn, 1);

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Rozwiazalem pierwsze zadanie ku zadowoleniu Genna. Teraz Asko da mi nastepne zadanie. Czeka na mnie w wiosce.");

		Mod_VMG_Pruefung_Genn = 1;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_05"); //Nie.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_06"); //Och, widze. To trudna sytuacja, nie powinienem pozwolic, zebys mógl dalej isc.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_07"); //Ale zrobiles juz tak wiele dla naszej doliny, ze przymknalem oko.
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_08"); //Opowiem o tym Faice, ale teraz nie mozesz zawiesc w zadnym innym zadaniu!
		AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_09"); //Czy rozumiesz mnie?
		AI_Output(hero, self, "Info_Mod_Genn_Pruefung2_15_10"); //Wszystko jasne.

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Nie moglem rozwiazac problemu Genna. Teraz Asko ma dac mi kolejne zadanie, którego nie powinienem zawiesc.");

		Mod_VMG_Pruefung_Genn = 2;
	};

	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_11"); //Dobre. Asko da ci nastepne zadanie. Dlaczego nie idziesz do niego prosto?
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung2_09_12"); //Wraca do wioski.

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "START");
};

INSTANCE Info_Mod_Genn_Pruefung3 (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pruefung3_Condition;
	information	= Info_Mod_Genn_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wracam.";
};

FUNC INT Info_Mod_Genn_Pruefung3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Per_Pruefung4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Genn_Pruefung3_Info()
{
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_00"); //Wracam.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_01"); //Ciesze sie, ze Pan to zrobil. Nie chce Cie dlugo trzymac, poniewaz Faice chce cie widziec.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_02"); //Dowiemy sie, jak sie okazalo. Na pewno zycze powodzenia!
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_03"); //Teleporter jest aktywny, mozesz od razu dostac sie w droge.
	AI_Output(hero, self, "Info_Mod_Genn_Pruefung3_15_04"); //Dziekuje bardzo.
	AI_Output(self, hero, "Info_Mod_Genn_Pruefung3_09_05"); //Oto teraz!
};

var int Mod_Knows_GennTrader;

INSTANCE Info_Mod_Genn_Trade (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Trade_Condition;
	information	= Info_Mod_Genn_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Genn_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_Trade_Info()
{
	if (Mod_Knows_GennTrader == FALSE)
	{
		Mod_Knows_GennTrader = TRUE;

		Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Genn zajmuje sie akcesoriami magicznymi.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Genn_Pickpocket (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_Pickpocket_Condition;
	information	= Info_Mod_Genn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Genn_Pickpocket_Condition()
{
	C_Beklauen	(55, ItSc_TrfBloodfly, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_BACK, Info_Mod_Genn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Genn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Genn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
};

FUNC VOID Info_Mod_Genn_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Genn_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Genn_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Genn_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Genn_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Genn_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Genn_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Genn_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Genn_EXIT (C_INFO)
{
	npc		= Mod_1959_VMG_Genn_TUG;
	nr		= 1;
	condition	= Info_Mod_Genn_EXIT_Condition;
	information	= Info_Mod_Genn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Genn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Genn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
