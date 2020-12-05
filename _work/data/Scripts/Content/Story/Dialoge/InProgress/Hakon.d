INSTANCE Info_Mod_Hakon_Hi (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Hi_Condition;
	information	= Info_Mod_Hakon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Hi_Condition()
{
	if (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Hi_03_00"); //Witajcie nieznajomego, jestem Hakonem dealerem broni. Jesli potrzebujesz miecza, trafiles we wlasciwe miejsce.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Hakon sprzedaje bron na rynku.");
};

INSTANCE Info_Mod_Hakon_Ueberfall (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Ueberfall_Condition;
	information	= Info_Mod_Hakon_Ueberfall_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Hakon prowokujacy bijatyke)";
};

FUNC INT Info_Mod_Hakon_Ueberfall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Mod_HakonUeberfall == 0)
	&& (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Ueberfall_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_00"); //Wlasnie sprzedajesz ostatni kawalek smieci! Przy pomocy twoich karabinów nie moglam pozbyc sie brudu pomiedzy palcami palców.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_01"); //Hej, obserwuj swoje usta. Jedyne, co tu mam, to towar wysokiej jakosci.
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_02"); //Jakby mozna bylo to ocenic. Na pierwszy rzut oka widze, ze jestes zbyt slaby, aby nosic nawet jedna z wlasnych broni.
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_03"); //No cóz, nie dmuchajcie sie w ten sposób, bo za lyzkami bede cos wkladal.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_04"); //Chlopak, tu przeciagasz luk. Lepiej ogladac siebie lub cos sie wydarzy!
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_05"); //Tak, nie zloscijcie sie, dzieciak. Pójde na targowisko i rozbudze posmiewisko wokól ludzi. Jestem pewien, ze nie przeszkadza ci to. Nie moze nic z tym zrobic.
	AI_Output(self, hero, "Info_Mod_Hakon_Ueberfall_03_06"); //Wszystko w porzadku, to wystarczy!
	
	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_NONE, 1);

	Mod_HakonUeberfall = 1;
};

INSTANCE Info_Mod_Hakon_Weglocken (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Weglocken_Condition;
	information	= Info_Mod_Hakon_Weglocken_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, znalazlem cos ciekawego poza miastem. )";
};

FUNC INT Info_Mod_Hakon_Weglocken_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Mod_HakonUeberfall == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Weglocken_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_15_00"); //Hej, znalazlem cos ciekawego poza miastem, co trzeba zobaczyc.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_03_01"); //Tak, co to jest?

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "Nie moge ci to powiedziec tutaj. Musisz go najpierw zobaczyc.", Info_Mod_Hakon_Weglocken_C);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "W jaskini przed miastem znalazlem wielki skarb.", Info_Mod_Hakon_Weglocken_B);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "W jaskini poza miastem znalazlem bron.", Info_Mod_Hakon_Weglocken_A);
};

FUNC VOID Info_Mod_Hakon_Weglocken_C()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_C_15_00"); //Nie moge ci to powiedziec tutaj. Musisz go najpierw zobaczyc.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_C_03_01"); //Co jeszcze! Tak jak ja nie mam nic lepszego do zrobienia niz spojrzec na cos poza miastem....

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Mod_HakonUeberfall = 2;

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Hakon_Weglocken_B()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_B_15_00"); //W jaskini przed miastem znalazlem wielki skarb. Niestety, dwoje olbrzymich szczurów pojawilo sie i scigalo mnie. Czy mozesz pomóc mi odzyskac skarb?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_B_03_01"); //Duzy skarb w jaskini poza miastem? Nie, chlopak, chlopiec, bajkowa godzina po prostu dzis wieczorem.

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);
};

FUNC VOID Info_Mod_Hakon_Weglocken_A()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_A_15_00"); //W jaskini poza miastem znalazlem bron. Niestety, dwóch goblinów pojawilo sie i scigalo mnie. Czy mozesz pomóc mi odzyskac bron?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_A_03_01"); //Dwa gobosy? Huh, smieszny. Wez mnie do jaskini. Musze przyjrzec sie tym dzialom.

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Mod_HakonUeberfall = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Hakon_Neugier (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Neugier_Condition;
	information	= Info_Mod_Hakon_Neugier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Neugier_Condition()
{
	if (Mod_HakonUeberfall == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Neugier_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Neugier_03_00"); //Dobrze, moze na pierwszy rzut oka. Wez mnie tam. Ale biada, ze to nic ciekawego.

	Mod_HakonUeberfall = 4;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Hakon_Falle (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Falle_Condition;
	information	= Info_Mod_Hakon_Falle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Falle_Condition()
{
	if ((Mod_HakonUeberfall == 3)
	|| (Mod_HakonUeberfall == 4))
	&& (Npc_GetDistToWP(hero, "NW_CITY_HAKON") > 5000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Falle_Info()
{
	if (Mod_HakonUeberfall == 3)
	{
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_00"); //Gdzie wiec jaskinia z pistoletami i goblinem?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_01"); //Ach, bron jest tu juz tylko Goblins nie byly, ale.... bandyta.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_02"); //Gdzie wiec chciales mi pokazac?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_03"); //A bandyta.
	};

	AI_Output(self, hero, "Info_Mod_Hakon_Falle_03_04"); //Co, gdzie, gdzie?

	Mod_HakonUeberfall = 1;

	B_StartOtherRoutine	(self, "START");

	AI_DrawWeapon	(self);

	AI_TurnAway	(self, hero);

	AI_StopProcessInfos	(self);

	AI_DrawWeapon	(hero);

	B_Attack	(self, hero, AR_None, 2);
};

INSTANCE Info_Mod_Hakon_Blutkelch (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Blutkelch_Condition;
	information	= Info_Mod_Hakon_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Szukam tak zwanego kubka na krew.";
};

FUNC INT Info_Mod_Hakon_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_00"); //Szukam tak zwanego kubka na krew.
	AI_Output(self, hero, "Info_Mod_Hakon_Blutkelch_03_01"); //Nie moge Ci tez pomóc. Zajmuje sie bronia.
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_02"); //W kazdym razie dziekuje.
};

INSTANCE Info_Mod_Hakon_Mario (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Mario_Condition;
	information	= Info_Mod_Hakon_Mario_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hakon_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Olav_Mario))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Mario_Info()
{
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_00"); //Oh, czlowiek, jestem teraz podniecony. Pewien idiota donosil mi, ze sprzedaje skradzione towary.
	AI_Output(hero, self, "Info_Mod_Hakon_Mario_15_01"); //Wichrzyciele tacy ciagle istnieja.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_02"); //Problem polega na tym, ze wlasciwie nie jestem do konca..... z legalna bronia.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_03"); //Ale nawet nie polozylem go. Jeden z moich posredników musial miec czat. Co za swinia!
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_03_04"); //Teraz pozwolono mi zaplacic grzywne.
};

INSTANCE Info_Mod_Hakon_Anschlagtafel (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Anschlagtafel_Condition;
	information	= Info_Mod_Hakon_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Hakon_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Hakon == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMw_ShortSword1) >= Mod_Anschlagtafel_Khorinis_Hakon_MilizKurzchwert)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Sword) >= Mod_Anschlagtafel_Khorinis_Hakon_Degen)
	&& (Npc_HasItems(hero, ItMw_ShortSword3) >= Mod_Anschlagtafel_Khorinis_Hakon_Kurzschwert)
	&& (Npc_HasItems(hero, ItAm_Prot_Point_01) >= Mod_Anschlagtafel_Khorinis_Hakon_AmulettEichenhaut)
	&& (Npc_HasItems(hero, ItRi_Prot_Edge_01) >= Mod_Anschlagtafel_Khorinis_Hakon_RingEisenhaut)
	&& (Npc_HasItems(hero, ItRi_Str_01) >= Mod_Anschlagtafel_Khorinis_Hakon_RingKraft)
	&& (Npc_HasItems(hero, ItMw_1H_quantarie_Schwert_01) >= Mod_Anschlagtafel_Khorinis_Hakon_Schwert)
	{
		Npc_RemoveInvItems	(hero, ItMw_ShortSword1, Mod_Anschlagtafel_Khorinis_Hakon_MilizKurzchwert);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Sword, Mod_Anschlagtafel_Khorinis_Hakon_Degen);
		Npc_RemoveInvItems	(hero, ItMw_ShortSword3, Mod_Anschlagtafel_Khorinis_Hakon_Kurzschwert);
		Npc_RemoveInvItems	(hero, ItAm_Prot_Point_01, Mod_Anschlagtafel_Khorinis_Hakon_AmulettEichenhaut);
		Npc_RemoveInvItems	(hero, ItRi_Prot_Edge_01, Mod_Anschlagtafel_Khorinis_Hakon_RingEisenhaut);
		Npc_RemoveInvItems	(hero, ItRi_Str_01, Mod_Anschlagtafel_Khorinis_Hakon_RingKraft);
		Npc_RemoveInvItems	(hero, ItMw_1H_quantarie_Schwert_01, Mod_Anschlagtafel_Khorinis_Hakon_Schwert);

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Hakon_Gold);

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_03_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Hakon_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Hakon = 0;
		Mod_Anschlagtafel_Khorinis_Hakon_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Hakon, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Hakon_Trade (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Trade_Condition;
	information	= Info_Mod_Hakon_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hakon_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hakon_Hi))
	&& (Wld_IsTime(05,10,00,10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hakon_Pickpocket (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Pickpocket_Condition;
	information	= Info_Mod_Hakon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Hakon_Pickpocket_Condition()
{
	C_Beklauen	(108, ItMi_Gold, 38);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

	Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_BACK, Info_Mod_Hakon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hakon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hakon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hakon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hakon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hakon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hakon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hakon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hakon_EXIT (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_EXIT_Condition;
	information	= Info_Mod_Hakon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hakon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hakon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
