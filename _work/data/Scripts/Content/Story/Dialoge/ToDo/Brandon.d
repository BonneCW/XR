INSTANCE Info_Mod_Brandon_Hi (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Hi_Condition;
	information	= Info_Mod_Brandon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brandon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_00"); //Hej, co tu robisz?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_01"); //Chce Greg.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_02"); //A wiec co z Gregem? A czego chcesz z kapitanem?
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_03"); //Chce byc piratem.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_04"); //Chcesz byc piratem? Z puszystymi ramionami?
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_05"); //Przedstawie Ci propozycje. Strzelasz do wiekszego monitora plazowego wedrujacego po obozie.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_06"); //Przeraza niektóre z pioracych sie dziewczynek. (smiertelnicy)
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_07"); //Pranie dziewczyny? Nie widze tu zadnych kobiet.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_08"); //(lacht hämisch) Die Waschweiber sind die "chlopcy" aus Henrys Entertrupp.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_09"); //Ale zobaczysz je dosc szybko, kozleta.
	AI_Output(self, hero, "Info_Mod_Brandon_Hi_04_10"); //Jesli dobrze pamietam, powinienes zabic kolejny monitor.
	AI_Output(hero, self, "Info_Mod_Brandon_Hi_15_11"); //Bede.....

	Log_CreateTopic	(TOPIC_MOD_BRANDON_WARAN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "Mam zabic duzy monitor plazowy dla Brandon.");
};

INSTANCE Info_Mod_Brandon_Waran (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Waran_Condition;
	information	= Info_Mod_Brandon_Waran_Info;
	permanent	= 0;
	important	= 0;
	description	= "Monitor jest wylaczony.";
};

FUNC INT Info_Mod_Brandon_Waran_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Npc_IsDead(BrandonWaran))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Waran_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Waran_15_00"); //Monitor jest wylaczony.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_01"); //I tak wlasnie idziesz. Kobiety piorace sie powinny byc z tego zadowolone.
	AI_Output(self, hero, "Info_Mod_Brandon_Waran_04_02"); //Teraz zobacz Greg.

	B_LogEntry	(TOPIC_MOD_BRANDON_WARAN, "W koncu moge dotrzec do Greg.");
	B_SetTopicStatus	(TOPIC_MOD_BRANDON_WARAN, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Brandon_Schatzsuche (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche_Condition;
	information	= Info_Mod_Brandon_Schatzsuche_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wygladasz na szczesliwy.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Karte))
	&& (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_00"); //Wygladasz na szczesliwy.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_01"); //Ja równiez jestem. Zauwazylem, ze Greg próbowal uciekac. Cos wreszcie sie dzieje.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_02"); //To prawda. I mam pomagac w przygotowaniach.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_03"); //Czy moge Cie tam poprzec?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_04"); //Ale tak..... Ale jest to miedzy nami!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_05"); //Jaki jest nacisk na but?
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_06"); //To zabawna rzecz.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_07"); //Poplynac pewnego dnia w skalach nad alternatywnym obozem. Z ciekawosci.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_08"); //Nagle straszny palasz o mnie.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_09"); //Dwie dziwne istoty wygladaly jak mali ludzie, ale z skrzydlami i potezna pazura.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_10"); //Znam je wszystkie. To sa harfy.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_11"); //Zreszta atakowali mnie.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_12"); //Po prostu mialem przy sobie siekiewke i nie moglem ich pokonac.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_13"); //Wiec ucieklem i stracilem chwytajacy hak.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_14"); //I moze nam to byc potrzebne, kiedy sie skonczy.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_15"); //Nie wiem, moze tak jest. Wiec powinienem ci to cos oddac.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_16"); //Mówisz to. Nie lubie stworzen.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_17"); //To nie powinno byc twoim uszkodzeniem.
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche_15_18"); //Uh-huh. Jestes przesadny.
	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche_04_19"); //Czy nie pirujemy wszystkich?

	Log_CreateTopic	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PIR_ENTERHAKEN, "Musze znalezc chwytajacy hak Brandona w skale nad obozem zastepczym i przywiezc go z powrotem.");

	Wld_InsertItem	(ItMi_Enterhaken, "FP_ITEM_ENTERHAKEN");

	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_01");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_02");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_03");
	Wld_InsertNpc	(Harpie, "FP_ROAM_HARPIE_PIRATEN_04");
};

INSTANCE Info_Mod_Brandon_Schatzsuche2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Schatzsuche2_Condition;
	information	= Info_Mod_Brandon_Schatzsuche2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Tutaj dostalem twój hak.";
};

FUNC INT Info_Mod_Brandon_Schatzsuche2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Schatzsuche))
	&& (Npc_HasItems(hero, ItMi_Enterhaken) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Schatzsuche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_00"); //Tutaj dostalem twój hak.

	B_GiveInvItems	(hero, self, ItMi_Enterhaken, 1);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_01"); //Dziekuje, Adanos! Oto 300 zlota.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Brandon_Schatzsuche2_04_02"); //I nie slowa do innych!
	AI_Output(hero, self, "Info_Mod_Brandon_Schatzsuche2_15_03"); //Rozumiem. Do zobaczenia dookola.

	B_SetTopicStatus	(TOPIC_MOD_PIR_ENTERHAKEN, LOG_SUCCESS);

	Mod_PiratenVorbereitungen += 1;

	B_GivePlayerXP	(150);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Brandon_Befreiung (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung_Condition;
	information	= Info_Mod_Brandon_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Brandon_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_01"); //Czego od mnie oczekujesz?
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_02"); //Co jest z Toba?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_03"); //W ciagu trzech tygodni nie mialem napoju. Bede szalony, czlowiek!
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_04"); //Jak moge Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_05"); //Pozwól mi troche gorzej. Wystarczy 20 butelek grotu.
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung_15_06"); //Dobrze, pójde.
	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung_04_07"); //Chodz, spiesz sie.

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRBRANDON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRBRANDON, "Pirat Brandon w ciagu trzech tygodni nie wypil alkoholu. Chce odebrac mu 20 butelek grogu.");
};

INSTANCE Info_Mod_Brandon_Befreiung2 (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Befreiung2_Condition;
	information	= Info_Mod_Brandon_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto gorzalka, która mi obiecales.";
};

FUNC INT Info_Mod_Brandon_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Befreiung))
	&& (Npc_HasItems(hero, ItFo_Addon_Grog) >= 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Brandon_Befreiung2_15_00"); //Oto gorzalka, która mi obiecales.

	B_GiveInvItems	(hero, self, ItFo_Addon_Grog, 20);
	B_UseItem	(self, ItFo_Addon_Grog);

	AI_Output(self, hero, "Info_Mod_Brandon_Befreiung2_04_01"); //Dzieki, czlowiek. Ocaliles moje zycie. Wez to tutaj.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRBRANDON, TOPIC_MOD_BEL_PIRATENLAGER, "Uratowalem Brandonowi zycie.", "Uratowalem Brandonowi zycie.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRBRANDON, LOG_SUCCESS);

	B_GivePlayerXP	(185);

	Mod_Piratenbefreiung += 1;
};

INSTANCE Info_Mod_Brandon_Lehrer (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lehrer_Condition;
	information	= Info_Mod_Brandon_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz mnie czegos nauczyc?";
};

FUNC INT Info_Mod_Brandon_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brandon_Hi))
	&& (Piraten_Dabei == TRUE)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brandon_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Brandon_Lehrer_04_00"); //Moge pomóc wam wzmocnic sie.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_PIRATEN, "Marka moze mnie wzmocnic.");
};

INSTANCE Info_Mod_Brandon_Lernen(C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Lernen_Condition;
	information	= Info_Mod_Brandon_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Chce byc silniejszy!";
};   
                    
FUNC INT Info_Mod_Brandon_Lernen_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Mod_Brandon_Lehrer))
	&& (hero.attribute[ATR_STRENGTH] < 200)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};	
};

func VOID Info_Mod_Brandon_Lernen_Info()
{	
	AI_Output (hero, self, "Info_Mod_Brandon_Lernen_15_00"); //Naucz mnie czegos!
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen, DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_Back()
{
	Info_ClearChoices (Info_Mod_Brandon_Lernen);
};

FUNC VOID Info_Mod_Brandon_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);
};

FUNC VOID Info_Mod_Brandon_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices (Info_Mod_Brandon_Lernen);

	Info_AddChoice (Info_Mod_Brandon_Lernen,DIALOG_BACK,Info_Mod_Brandon_Lernen_Back);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_5);
	Info_AddChoice (Info_Mod_Brandon_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Brandon_Lernen_1);	
};

INSTANCE Info_Mod_Brandon_Pickpocket (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_Pickpocket_Condition;
	information	= Info_Mod_Brandon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Brandon_Pickpocket_Condition()
{
	C_Beklauen	(61, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_BACK, Info_Mod_Brandon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brandon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brandon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brandon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brandon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brandon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brandon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brandon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brandon_EXIT (C_INFO)
{
	npc		= Mod_931_PIR_Brandon_AW;
	nr		= 1;
	condition	= Info_Mod_Brandon_EXIT_Condition;
	information	= Info_Mod_Brandon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brandon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brandon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
