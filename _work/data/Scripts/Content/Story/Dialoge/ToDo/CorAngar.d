INSTANCE Info_Mod_Angar_Hi (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hi_Condition;
	information	= Info_Mod_Angar_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_00"); //(zdziwiony)? Nie sadzilem, ze nigdy wiecej cie juz nie zobacze.
	AI_Output(self, hero, "Info_Mod_Angar_Hi_34_01"); //Czy pokonales sypialnia?
	AI_Output(hero, self, "Info_Mod_Angar_Hi_15_02"); //Tak, odsylalem go tam, skad przybyl. Powinnismy go do tej pory pozbyc sie.
};

INSTANCE Info_Mod_Angar_Irdorath (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath_Condition;
	information	= Info_Mod_Angar_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chce odbyc podróz morska na wyspe.";
};

FUNC INT Info_Mod_Angar_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_00"); //Wkrótce wyrusze w morska podróz na wyspe, aby zblizyc sie do zniszczenia Xeres.
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath_15_01"); //Jest zlym magikiem i mistrzem wielu zlowrogich stworzen, w tym takze sypialnego.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_02"); //Co? Wtedy musze towarzyszyc wam w kazdych okolicznosciach.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath_34_03"); //Dopiero gdy ten przyjaciel zostal zniszczony, smierc naszego bylego przywódcy duchowego, Y' Beriona, zostala odpokutowana.
};

INSTANCE Info_Mod_Angar_Irdorath2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Irdorath2_Condition;
	information	= Info_Mod_Angar_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dobrze, spotkam sie z Toba w porcie w Khorinis.";
};

FUNC INT Info_Mod_Angar_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Irdorath2_15_00"); //Dobrze, spotkam sie z Toba w porcie w Khorinis.
	AI_Output(self, hero, "Info_Mod_Angar_Irdorath2_34_01"); //Czekam na Ciebie tam.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar pragnie zrobic swoja czesc, aby zniszczyc Xeres i bedzie mi towarzyszyl w podrózy.");

	B_GivePlayerXP	(100);

	Mod_AngarDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Angar_Fanatiker (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Fanatiker_Condition;
	information	= Info_Mod_Angar_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy jest jeszcze wiecej osób sypialnych?";
};

FUNC INT Info_Mod_Angar_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Fanatiker_15_00"); //Czy jest jeszcze wiecej osób sypialnych?
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_01"); //Wiekszosc z nich opuscila spiwora po smierci Y' Beriona, ale czesc z nich pozostala do znalezienia sypialni.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_02"); //Bylo kilka malych grup. Niektórzy z nich poszli wówczas do swiatyni z Kor Kalomem, inni po upadku zapory wyjechali do Khorinis.
	AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_03"); //Prawdopodobnie ukrywa sie w lasach wokól miasta.

	if (Mod_Import_Dusty == LOG_SUCCESS)
	|| (Mod_Import_Dusty == -1)
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_04"); //Porozmawiaj z Dusty, wlasnie teraz poluje w lesie wokól Khorinis. W nocy powinienes go znalezc w miescie.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Chyba fanatyczne, kultowe blystki kultowe znajduja sie w lesie wokól Khorinis. Powinienem porozmawiac z Dusty. Powinien byc w Khorinis w nocy.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Fanatiker_34_05"); //Porozmawiaj z Lester, lepiej zna okolice.

		B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Chyba fanatyczne, kultowe blystki kultowe znajduja sie w lesie wokól Khorinis. Powinienem porozmawiac z Lester, który lepiej zna ten obszar.");
	};
};

INSTANCE Info_Mod_Angar_Namib (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Namib_Condition;
	information	= Info_Mod_Angar_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib mnie wyslal.";
};

FUNC INT Info_Mod_Angar_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_AtTempel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_00"); //Baal Namib mnie wyslal. Chce, aby zajela pani swoje stanowisko.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_01"); //Bardzo dobry. Ale niestety nie ma tu Gor Na Vid. Musisz zamiast tego przejac dowodzenie nad druga grupa. Czy mozna to zrobic?
	AI_Output(hero, self, "Info_Mod_Angar_Namib_15_02"); //Mysle, ze tak, tak.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_34_03"); //Doskonaly. Twój oddzial musi udac sie na bagniste pole zbawienne Balora. Och, jest jeszcze jedna rzecz. Wolisz bron lub magie?

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Cor Angar jest gotowy i powierzyl mi prowadzenie drugiej druzyny. Musze isc na pole chwastów Balora.");

	B_StartOtherRoutine	(self, "POSTEN");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "POSTEN");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "POSTEN");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = TRUE;

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "bron", Info_Mod_Angar_Namib_Waffen);
	Info_AddChoice	(Info_Mod_Angar_Namib, "czary", Info_Mod_Angar_Namib_Magie);
};

FUNC VOID Info_Mod_Angar_Namib_Waffen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Waffen_15_00"); //Bron.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Waffen_34_01"); //Melee czy zasieg?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Walka reczna", Info_Mod_Angar_Namib_Nahkampf);
	Info_AddChoice	(Info_Mod_Angar_Namib, "walka na odleglosc", Info_Mod_Angar_Namib_Fernkampf);
};

FUNC VOID Info_Mod_Angar_Namib_Nahkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Nahkampf_15_00"); //Melee.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Nahkampf_34_01"); //Czy jedna czy dwie osoby?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "jedna osoba", Info_Mod_Angar_Namib_Einhand);
	Info_AddChoice	(Info_Mod_Angar_Namib, "dwurecznosc", Info_Mod_Angar_Namib_Zweihand);
};

FUNC VOID Info_Mod_Angar_Namib_Einhand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Einhand_15_00"); //Jedna reka.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Einhand_34_01"); //Wszystko w porzadku, tutaj wez ten klub.

	CreateInvItems	(self, ItMw_1H_Mace_02, 1);
	B_GiveInvItems	(self, hero, ItMw_1H_Mace_02, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Zweihand()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Zweihand_15_00"); //Dwuosobowy.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Zweihand_34_01"); //Wszystko w porzadku, tutaj wez ten klub.

	CreateInvItems	(self, ItMw_Stabkeule, 1);
	B_GiveInvItems	(self, hero, ItMw_Stabkeule, 1);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Fernkampf()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Fernkampf_15_00"); //Zawieszony.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Fernkampf_34_01"); //Kusza czy luk?

	Info_ClearChoices	(Info_Mod_Angar_Namib);

	Info_AddChoice	(Info_Mod_Angar_Namib, "Armbrust", Info_Mod_Angar_Namib_Armbrust);
	Info_AddChoice	(Info_Mod_Angar_Namib, "Bogen", Info_Mod_Angar_Namib_Bogen);
};

FUNC VOID Info_Mod_Angar_Namib_Armbrust()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Armbrust_15_00"); //kusza.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Armbrust_34_01"); //W prawo, tutaj wez te kusze i kilka srub z toba.

	CreateInvItems	(self, ItRw_Crossbow_M_01, 1);
	B_GiveInvItems	(self, hero, ItRw_Crossbow_M_01, 1);

	CreateInvItems	(hero, ItRw_SchmetterBolt, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Bogen()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Bogen_15_00"); //luk.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Bogen_34_01"); //Cóz, tutaj wez te luk i kilka strzalek.

	CreateInvItems	(self, ItRw_Bow_L_04, 1);
	B_GiveInvItems	(self, hero, ItRw_Bow_L_04, 1);

	CreateInvItems	(hero, ItRw_SchmetterArrow, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

FUNC VOID Info_Mod_Angar_Namib_Magie()
{
	AI_Output(hero, self, "Info_Mod_Angar_Namib_Magie_15_00"); //Magia.
	AI_Output(self, hero, "Info_Mod_Angar_Namib_Magie_34_01"); //Wszyscy maja racje, podejmuja sie tych ról.

	CreateInvItems	(self, ItSc_Windfist, 10);
	B_GiveInvItems	(self, hero, ItSc_Windfist, 10);
	
	Info_ClearChoices	(Info_Mod_Angar_Namib);
};

INSTANCE Info_Mod_Angar_SSUD (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_SSUD_Condition;
	information	= Info_Mod_Angar_SSUD_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_SSUD_Condition()
{
	if (Mod_Sekte_SH_Kampf >= 2)
	&& (Npc_IsDead(Swampshark_Undead))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_SSUD_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_00"); //Ciesze sie, ze przyszedles. Nie liczylismy na nieumarle rekiny bagienne.
	AI_Output(hero, self, "Info_Mod_Angar_SSUD_15_01"); //Tak, bylismy tez dosc zaskoczeni.
	AI_Output(self, hero, "Info_Mod_Angar_SSUD_34_02"); //Powinienes teraz udac sie do Baal Namib i zlozyc sprawozdanie.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Równiez w Cor Angar pracowaly nieumarle rekiny bagienne. Powinienem teraz udac sie do Baala Namiba i zglosic sie do niego.");

	B_StartOtherRoutine	(Mod_106_TPL_Angar_MT, "START");
	B_StartOtherRoutine	(Mod_1219_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1218_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1221_TPL_Templer_MT, "START");
	B_StartOtherRoutine	(Mod_1226_TPL_Templer_MT, "START");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1218_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1219_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1221_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
	Mod_1226_TPL_Templer_MT.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE Info_Mod_Angar_Wambo (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Wambo_Condition;
	information	= Info_Mod_Angar_Wambo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Przychodze na konto Wambo.";
};

FUNC INT Info_Mod_Angar_Wambo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wambo_Asylanten))
	&& (Npc_HasItems(hero, ItMi_AngarHalskette) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Wambo_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_00"); //Przychodze na konto Wambo.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_01"); //(spójrzmy na Wambo? Ze wciaz pamieta mnie!
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_02"); //Nie mam jednak dla Ciebie dobrych wiesci.

	B_GiveInvItems	(hero, self, ItMi_AngarHalskette, 1);

	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_03"); //Masz na mysli....
	AI_Output(hero, self, "Info_Mod_Angar_Wambo_15_04"); //Tak. Do dzis Wambo nadal cierpi na wyrzuty sumienia.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_05"); //Nigdy nie spodziewalem sie jej wiecej zobaczyc.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_06"); //Teraz jednak wszelka nadzieja zniknela.
	AI_Output(self, hero, "Info_Mod_Angar_Wambo_34_07"); //Dziekujemy za serwis gwarancyjny. l-- Teraz musze byc samotny.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_WAMBO_ANGAR, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Angar_Hueterklinge (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge_Condition;
	information	= Info_Mod_Angar_Hueterklinge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Hueterklinge_Condition()
{
	if (Templer_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_00"); //Wiec jestes teraz templariuszem, ale jestes pelnoprawnym tylko wtedy, gdy bedziesz prowadzil wlasne ostrze straznika.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_15_01"); //A gdzie je dostaje?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_34_02"); //Zalezy od tego, czy chcesz miecza jednej reki, czy oburecznego.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);

	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "Chce miecza dwurecznego.", Info_Mod_Angar_Hueterklinge_B);
	Info_AddChoice	(Info_Mod_Angar_Hueterklinge, "Chce miecza jednej reki.", Info_Mod_Angar_Hueterklinge_A);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_C()
{
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_00"); //Trzeba przywiezc do kuzni niezbedne surowce.
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_C_15_01"); //A gdzie na ziemi mam dostac to wszystko?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_02"); //Znalezienie pracy bedzie pierwszym krokiem.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_C_34_03"); //Wystarczy zapytac innych templariuszy, skad sie wzieli.

	Info_ClearChoices	(Info_Mod_Angar_Hueterklinge);
};

FUNC VOID Info_Mod_Angar_Hueterklinge_B()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_B_15_00"); //
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_B_34_01"); //

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Do ostrza opiekuna dwurecznego potrzebuje 8 bryl magicznej rudy, 6 ziól ryzowych, sztylet, który wypil krew 4 królów i cialo padlinozercy, który nie wylegal sie z jajka. Wszystko to musze zabrac do Darrion. Aby dowiedziec sie, jak to zrobic, powinienem zapytac pozostale szablony.");

	Mod_TPL_Hueterklinge_Art = 2;
	
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_11");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_25");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_13");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_14");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_3_NC_17");
	Wld_InsertItem(ItPl_Health_Herb_01_Reisfresser, "FP_PICKRICE_2_NC_16");

	Info_Mod_Angar_Hueterklinge_C();
};

FUNC VOID Info_Mod_Angar_Hueterklinge_A()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge_A_15_00"); //Chce miecza jednej reki.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge_A_34_01"); //Na jednoosobowe ostrze opiekuna potrzebne sa 4 klody magicznej rudy, orkowa statuetka z kamienia z kamienia Stonehenge, kosc starego wladcy, który rzadzil przez tysiac lat i zeby wilka, który zlamal wlasna matke.

	Log_CreateTopic	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Na jednoosobowe ostrze opiekuna potrzebuje 4 klody magicznej rudy, orkowej statuetki z kamienia z kamienia Stonehenge, kosci starego wladcy, który rzadzil przez tysiac lat i zebów wilka, który zlamal wlasna matke. Wszystko to musze zabrac do Darrion. Aby dowiedziec sie, jak to zrobic, powinienem zapytac pozostale szablony.");

	Mod_TPL_Hueterklinge_Art = 1;

	Info_Mod_Angar_Hueterklinge_C();
};

INSTANCE Info_Mod_Angar_Hueterklinge3 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge3_Condition;
	information	= Info_Mod_Angar_Hueterklinge3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej.";
};

FUNC INT Info_Mod_Angar_Hueterklinge3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaMon_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge3_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_00"); //Hej.
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_01"); //Co sie dzieje?

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_02"); //Chcialbym nauczyc sie kilku trików i sztuczek od starszych templarów, z kim powinienem sie skontaktowac?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_03"); //Dobrze rozumiem, ze Gor Na Kar jest prawdopodobnie templariuszem z najwiekszym doswiadczeniem bojowym, Gor Na Mon stal sie templariuszem w mlodym wieku, wiec juz od wielu lat duzo przeszedl.
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_04"); //Najstarszym templariuszem jest Gor Na Drak, ale jest on dosc starczy i nie uslyszy sie od niego wiele pozytecznych rzeczy.

		Mod_TPL_Hueterklinge_Drak = TRUE;

		B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Chyba powinienem odwiedzic Gor Na Drak.");
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge3_15_05"); //Szukam starszego templariusza. nie wiesz, kto jest pytany?
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge3_34_06"); //Próbujesz mnie zabrac za glupca? Zdobadz wlasne ostrze straznika!
	};
};

INSTANCE Info_Mod_Angar_Hueterklinge4 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge4_Condition;
	information	= Info_Mod_Angar_Hueterklinge4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Otrzymalem ostrze straznika.";
};

FUNC INT Info_Mod_Angar_Hueterklinge4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_Hueterklinge_1H_Geschaerft) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge4_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge4_15_00"); //Otrzymalem ostrze straznika.

	if ((Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_2H_Geschaerft) == 1)
	|| (Npc_HasItems(hero, ItMw_FalscheHueterklinge_1H_Geschaerft) == 1))
	{
		if (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_2H_Geschaerft) == 1)
		|| (Npc_HasItems(hero, ItMw_AlteHueterklinge_1H_Geschaerft) == 1)
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_01"); //Ona wyglada mi bardzo dawno.....
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_02"); //Ostrze straznika? Wyglada to jednak dosc zwyczajnie.....
		};

		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_03"); //Tak czy inaczej, wykonales swoja prace. Jestes teraz pelnoprawnym templariuszem.

		B_GivePlayerXP	(200);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge4_34_04"); //Naprawde piekny miecz.... Jestem pod wrazeniem! Jestes godnym templariuszem!

		B_GivePlayerXP	(350);
	};

	B_SetTopicStatus	(TOPIC_MOD_SL_SCHMIEDEFEUERN, LOG_SUCCESS);
};

INSTANCE Info_Mod_Angar_Eroberung_03 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Eroberung_03_Condition;
	information	= Info_Mod_Angar_Eroberung_03_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Angar_Eroberung_03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cadar_Eroberung_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Eroberung_03_Info()
{
	AI_Output(self, hero, "Info_Mod_Angar_Eroberung_03_34_00"); //Towarzyszyc ci beda dwaj moi templariusze.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Angar_Hueterklinge2 (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Hueterklinge2_Condition;
	information	= Info_Mod_Angar_Hueterklinge2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Skad sie wzielibyscie?";
};

FUNC INT Info_Mod_Angar_Hueterklinge2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Hueterklinge2_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Hueterklinge2_15_00"); //Skad sie wzielibyscie?
	AI_Output(self, hero, "Info_Mod_Angar_Hueterklinge2_34_01"); //Nie robie tego tak latwo.
};

INSTANCE Info_Mod_Angar_Woher (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Woher_Condition;
	information	= Info_Mod_Angar_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dlaczego mimo wszystko znalazles sie w kolonii?";
};

FUNC INT Info_Mod_Angar_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_00"); //Dlaczego mimo wszystko znalazles sie w kolonii?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_01"); //Bylem wówczas czlonkiem Gwardii Królewskiej, ale niektórzy ludzie nie lubili tego.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_02"); //Wrobili mnie za zbrodnie, a król uwierzyl im i wrzucil mnie do zapory.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_03"); //To samo stalo sie z najemnikiem Lee, slyszalem.
	AI_Output(hero, self, "Info_Mod_Angar_Woher_15_04"); //I potem poszedles do obozu jachtu?
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_05"); //Nie, obóz Bractwa nie istnial wówczas. Zaprzyjaznilem sie z Y' Berionem w starym obozie, a potem zalozylem z nim i Cor Kalomem obóz.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_06"); //Y' Berion przejal szkolenie guru, podczas gdy ja trenowalem templariuszy w walce.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_07"); //Po smierci Y' Berion, prowadzilem obóz az do konca najgorszego czasu.
	AI_Output(self, hero, "Info_Mod_Angar_Woher_03_08"); //Potem wspieral mnie Cor Cadar, który jest teraz duchowym przywódca obozu.
};

var int Angar_LastPetzCounter;
var int Angar_LastPetzCrime;

INSTANCE Info_Mod_Angar_PMSchulden (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PMSchulden_Condition;
	information 	= Info_Mod_Angar_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Angar_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Angar_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_00"); //Czy przyszedles/as zaplacic grzywne?

	if (B_GetTotalPetzCounter(self) > Angar_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_01"); //Zastanawialem sie, czy nawet nie osmieliscie sie tu przyjechac!
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_02"); //Najwyrazniej nie sa to ostatnie oskarzenia!

		if (Angar_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_03"); //Ostrzegam cie! Grzywna, która musisz zaplacic jest teraz wyzsza!
			AI_Output (hero, self, "Info_Mod_Angar_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Angar_LastPetzCounter);
		
			if (diff > 0)
			{
				Angar_Schulden = Angar_Schulden + (diff * 50);
			};
		
			if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Angar_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_04"); //Zapusciles mnie tak zle!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Angar_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_05"); //Pojawily sie nowe rzeczy.
		
		if (Angar_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_06"); //Nagle nie ma juz nikogo, kto oskarzalby cie o morderstwo.
		};
		
		if (Angar_LastPetzCrime == CRIME_THEFT)
		|| ( (Angar_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_07"); //Nikt nie pamieta, ze widzisz sie przy kradziezy.
		};
		
		if (Angar_LastPetzCrime == CRIME_ATTACK)
		|| ( (Angar_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_08"); //Nie ma juz zadnych swiadków tego, ze kiedykolwiek walczyles.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_09"); //Widocznie wszystkie zarzuty przeciwko Tobie zniknely.
		};
		
		AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_10"); //Nie wiem, co sie stalo, ale ostrzegam: nie graj ze mna.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_11"); //Zrezygnowalem z waszego zadluzenia.
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_12"); //Upewnij sie, ze nie popadniesz ponownie w klopoty.
	
			Angar_Schulden			= 0;
			Angar_LastPetzCounter 	= 0;
			Angar_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_13"); //Jedno jest pewne: nadal trzeba zaplacic kare w calosci.
			B_Say_Gold (self, hero, Angar_Schulden);
			AI_Output (self, hero, "Info_Mod_Angar_PMSchulden_34_14"); //Co to jest?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Angar_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Ile to znów bylo?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"Chce zaplacic grzywne.",Info_Mod_Angar_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Angar_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Angar_PMSchulden_HowMuchAgain_15_00"); //Ile to znów bylo?
	B_Say_Gold (self, hero, Angar_Schulden);

	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Angar_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Angar_PMSchulden,"Ile to znów bylo?",Info_Mod_Angar_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PMSchulden,"Chce zaplacic grzywne.",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Angar_PETZMASTER   (C_INFO)
{
	npc         	= Mod_106_TPL_Angar_MT;
	nr          	= 1;
	condition   	= Info_Mod_Angar_PETZMASTER_Condition;
	information 	= Info_Mod_Angar_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Angar_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Angar_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Angar_PETZMASTER_Info()
{
	Angar_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_01"); //Ciesze sie, ze przyszedles do mnie, zanim sytuacja sie pogorszyla.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_02"); //Morderstwo jest powaznym wykroczeniem!

		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Angar_Schulden = Angar_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_03"); //Nie wspominajac o innych rzeczach, które zrobiles.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_06"); //Nie interesuje mnie to, ze moge panstwa umiescic na szubienicy.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_07"); //Ale nie bedzie latwo sprawic, by ludzie znów byli laskawi.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_08"); //Mozesz okazac swoja pokute placac grzywne - oczywiscie kara musi byc odpowiednia.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_09"); //Dobrze! Jestes oskarzony o kradziez! Sa swiadkowie!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_10"); //Nie chce nawet mówic o innych rzeczach, które slyszalem.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_11"); //Takie zachowanie nie bedzie tolerowac tutaj w obozie!
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_12"); //Bedziesz musial zaplacic grzywne za swoje przestepstwo!
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_14"); //Jesli zmyliscie sie z naszymi bracmi, bede musial cie pociagnac do odpowiedzialnosci.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_15"); //I nie sadze, aby tak bylo w przypadku owiec.
		};

		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_16"); //Jesli pozwole wam sie z tym uporac, wszyscy beda robic to, co chca.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_17"); //Placi sie wiec odpowiednia grzywne - a cala sprawa zostanie zapomniana.
		
		Angar_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_18"); //Slyszalem, ze balaganiles sie z naszymi owcami.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_19"); //Zdajesz sobie sprawe, ze nie moge tego przepuscic.
		AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_34_20"); //Bedziesz musial wyplacic odszkodowanie!
		
		Angar_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_15_21"); //Ile?
	
	if (Angar_Schulden > 1000)	{	Angar_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Angar_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_AddChoice		(Info_Mod_Angar_PETZMASTER,"Nie mam wystarczajaco duzo zlota!",Info_Mod_Angar_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Angar_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Angar_PETZMASTER,"Chce zaplacic grzywne.",Info_Mod_Angar_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Angar_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayNow_15_00"); //Chce zaplacic grzywne!
	B_GiveInvItems (hero, self, itmi_gold, Angar_Schulden);
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayNow_34_01"); //Dobrze! Doloze wszelkich staran, aby wszyscy w obozie sie o tym dowiedzieli - w pewnym stopniu przywróci to Twoja reputacje.

	B_GrantAbsolution (LOC_PSICAMP);
	
	Angar_Schulden			= 0;
	Angar_LastPetzCounter 	= 0;
	Angar_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Angar_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Angar_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Angar_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Angar_PETZMASTER_PayLater_15_00"); //Nie mam wystarczajaco duzo zlota!
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_01"); //Nastepnie zobacz, ze zloto dostaniesz jak najszybciej.
	AI_Output (self, hero, "Info_Mod_Angar_PETZMASTER_PayLater_34_02"); //I ostrzegam cie, ze jesli cokolwiek zawdzieczasz sobie, to bedzie ci gorzej.
	
	Angar_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Angar_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Angar_Lehrer (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lehrer_Condition;
	information	= Info_Mod_Angar_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie czegos nauczyc?";
};

FUNC INT Info_Mod_Angar_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hi))
	&& (Templer_Dabei == 1)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Angar_Lehrer_34_00"); //Moge pomóc wam wzmocnic sie. Poza tym, moge nauczyc cie jak walczyc dwiema rekami.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SUMPF, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SUMPF, "Cor Angar moze mi pomóc w wzmocnieniu sie i nauczyc mnie jak obchodzic sie z dwoma rekami.");
};

INSTANCE Info_Mod_Angar_Lernen (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Lernen_Condition;
	information	= Info_Mod_Angar_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Naucz mnie czegos.";
};

FUNC INT Info_Mod_Angar_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Angar_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Angar_Lernen_15_00"); //Naucz mnie czegos.
	AI_Output(self, hero, "Info_Mod_Angar_Lernen_34_01"); //Czego chcesz sie nauczyc?

	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_5()
{
	B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Zweihand_1()
{
	B_TeachFightTalentPercent	(self, hero, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Angar_Lernen);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Angar_Lernen_Staerke_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Angar_Lernen);

	Info_AddChoice 		(Info_Mod_Angar_Lernen, DIALOG_BACK, Info_Mod_Angar_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Angar_Lernen_Staerke_1);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_2H))		,Info_Mod_Angar_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Angar_Lernen, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,Info_Mod_Angar_Lernen_Zweihand_1);
};

INSTANCE Info_Mod_Angar_Pickpocket (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_Pickpocket_Condition;
	information	= Info_Mod_Angar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Angar_Pickpocket_Condition()
{
	C_Beklauen	(157, ItMi_Gold, 101);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_BACK, Info_Mod_Angar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Angar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Angar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
};

FUNC VOID Info_Mod_Angar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Angar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Angar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Angar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Angar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Angar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Angar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Angar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Angar_EXIT (C_INFO)
{
	npc		= Mod_106_TPL_Angar_MT;
	nr		= 1;
	condition	= Info_Mod_Angar_EXIT_Condition;
	information	= Info_Mod_Angar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Angar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Angar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
