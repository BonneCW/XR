INSTANCE Info_Mod_Erika_Hi (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Hi_Condition;
	information	= Info_Mod_Erika_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Erika_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Erika_Hi_43_01"); //Jestem handlarzem. Sprzedaje wszystko, czego potrzebujesz w zyciu codziennym.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Erika handluje na rynku towarami.");
};

INSTANCE Info_Mod_Erika_Landvermessung (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Landvermessung_Condition;
	information	= Info_Mod_Erika_Landvermessung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wiesz co Hubert znaczy przez jego gorzalke?";
};

FUNC INT Info_Mod_Erika_Landvermessung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hubert_Landvermessung))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hubert_LandvermessungAlk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Landvermessung_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_15_00"); //Wiesz co Hubert znaczy przez jego gorzalke?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_43_01"); //(rezolutnie) Oczywiscie robisz! Zaledwie wczoraj zabronilem mu kupowac u mnie alkohol. Mezczyzna pije umarlych!

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Wszystko w porzadku, zobacze gdzie indziej....", Info_Mod_Erika_Landvermessung_B);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Czy moge miec jego gorzalke?", Info_Mod_Erika_Landvermessung_A);
};

FUNC VOID Info_Mod_Erika_Landvermessung_B()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_B_15_00"); //Wszystko w porzadku, zobacze gdzie indziej....

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_A()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_A_15_00"); //Czy moge miec jego gorzalke?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_A_43_01"); //(ironiczne) Oczywiscie! Nie, to niemozliwe. Ukrylem prawie wszystkie produkty alkoholowe w klatce piersiowej w domu, dzieki czemu Hubert nie ma mozliwosci ich zdobycia.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);

	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "Zbyt zle, nie ma nic do zrobienia.", Info_Mod_Erika_Landvermessung_D);
	Info_AddChoice	(Info_Mod_Erika_Landvermessung, "I który dom jest Twój?", Info_Mod_Erika_Landvermessung_C);
};

FUNC VOID Info_Mod_Erika_Landvermessung_D()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_D_15_00"); //Zbyt zle, nie ma nic do zrobienia.

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

FUNC VOID Info_Mod_Erika_Landvermessung_C()
{
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_00"); //I który dom jest Twój?
	AI_Output(self, hero, "Info_Mod_Erika_Landvermessung_C_43_01"); //Polozony jest nad duzym jeziorem w tym miescie, niedaleko od rynku. Ale cos mi jednak powiedziec..... Dlaczego chcesz to wiedziec tak wiele?
	AI_Output(hero, self, "Info_Mod_Erika_Landvermessung_C_15_02"); //Nikt nie rozumie samotnych bohaterów.... Wiecej

	B_LogEntry	(TOPIC_MOD_KHORATA_LANDVERMESSUNG, "Handlowiec Erika przechowywala alkohol w klatce piersiowej w swoim domu nad jeziorem miejskim.");

	Info_ClearChoices	(Info_Mod_Erika_Landvermessung);
};

INSTANCE Info_Mod_Erika_Nagelnachschub (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub_Condition;
	information	= Info_Mod_Erika_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Szukam paznokci.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_00"); //Szukam paznokci.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_01"); //Nie jestes gonna paznokiec mnie dzis wieczorem, czy jestes?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_02"); //Um....
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_03"); //Tak, tak, zawsze zaklócac sen innych ludzi!
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_04"); //Jakie przepisy zabraniaja tego prawa?
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_05"); //Sam nie potrzebuje paznokci.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_06"); //Wszakze przeciez.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_07"); //Masz jakies?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_08"); //Tak. Za jedna mala laske zostawilem ci paczke.
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub_15_09"); //Jaka jest to laska?
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub_43_10"); //Przeslij ten list ode mnie do Wendela. (dziewczeta dziewczece)

	B_GiveInvItems	(self, hero, ItWr_ErikaLiebesbrief, 1);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Erika przekazala mi list do Wendela.");
};

INSTANCE Info_Mod_Erika_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Nagelnachschub2_Condition;
	information	= Info_Mod_Erika_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Panski list nadszedl.";
};                       

FUNC INT Info_Mod_Erika_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Nagelnachschub))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Nagelnachschub2_15_00"); //Panski list nadszedl.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_43_01"); //Jestem ciekawy, co on powie.
	AI_Output(self, hero, "Info_Mod_Erika_Nagelnachschub2_43_02"); //Masz swoje paznokcie, ale nie osmielisz sie kluc w nocy!

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_NAGELNACHSCHUB, "Erika dala mi paznokcie.");
};

INSTANCE Info_Mod_Erika_Kissen (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kissen_Condition;
	information	= Info_Mod_Erika_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Masz jakas poduszke na glowe?";
};                       

FUNC INT Info_Mod_Erika_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_00"); //Masz jakas poduszke na glowe?
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_01"); //Jestes wojownikiem?
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_02"); //Nie, do spania. Nalóz glowe na nia. Lezenie miekkie.....
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_03"); //Myslalem o rolce siersciowej.
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_04"); //Nie moge tego zrobic. Nie jest wystarczajaco miekki i smierdzi.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_05"); //Wtedy tez nie moge wam pomóc.
	AI_Output(self, hero, "Info_Mod_Erika_Kissen_43_06"); //Moze Daniel w nastepnym pokoju. Zajmuje sie rzeczami magicznymi. Albo Morpheus. Stylowy mezczyzna....
	AI_Output(hero, self, "Info_Mod_Erika_Kissen_15_07"); //W kazdym razie dziekuje.
};

INSTANCE Info_Mod_Erika_Kimon (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Kimon_Condition;
	information	= Info_Mod_Erika_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Dobra kobieta, czy mozesz mi dac radosc?";
};                       

FUNC INT Info_Mod_Erika_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_00"); //Dobra kobieta, czy mozesz mi dac radosc?
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_43_01"); //Wyjdz stad, dranie! Jestem uczciwa kobieta.
	AI_Output(hero, self, "Info_Mod_Erika_Kimon_15_02"); //Musze powiedziec to zle. Szukam smakoszy.
	AI_Output(self, hero, "Info_Mod_Erika_Kimon_43_03"); //Nie ze mna, punkujesz.
};

INSTANCE Info_Mod_Erika_WendelS (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_WendelS_Condition;
	information	= Info_Mod_Erika_WendelS_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Erika_WendelS_Condition()
{
	if (Mod_REL_Stadthalter == 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_WendelS_Info()
{
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_00"); //Od czasu, gdy Wendel zostal gubernatorem miasta, uchylil wiele bezuzytecznych zasad i przepisów, dzieki czemu handlowcy zarabiaja teraz jeszcze wiecej.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_01"); //Slysze, ze byles tym, który promowal Wendel na swoje stanowisko?
	AI_Output(hero, self, "Info_Mod_Erika_WendelS_15_02"); //To tylko jeden sposób, aby to ujac.
	AI_Output(self, hero, "Info_Mod_Erika_WendelS_43_03"); //Wtedy musze podziekowac panstwu za decyzje. Mam tutaj szczególnie chrupiace i slodkie jablko, które chcialbym panstwu przekazac.

	B_GiveInvItems	(self, hero, ItFo_AppleErika, 1);
};

INSTANCE Info_Mod_Erika_Freudenspender (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Freudenspender_Condition;
	information	= Info_Mod_Erika_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Czy mozna uzyc dozowników blyszczacych?";
};                       

FUNC INT Info_Mod_Erika_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Erika_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Erika_Freudenspender_15_00"); //Czy mozna uzyc dozowników blyszczacych?
	AI_Output(self, hero, "Info_Mod_Erika_Freudenspender_43_01"); //Nie kusz mnie! Nie, nie moge!
};

INSTANCE Info_Mod_Erika_Trade (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Trade_Condition;
	information	= Info_Mod_Erika_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Erika_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erika_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Erika_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Erika_Pickpocket (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_Pickpocket_Condition;
	information	= Info_Mod_Erika_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Erika_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_BACK, Info_Mod_Erika_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Erika_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Erika_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
};

FUNC VOID Info_Mod_Erika_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Erika_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Erika_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Erika_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Erika_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Erika_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Erika_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Erika_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Erika_EXIT (C_INFO)
{
	npc		= Mod_7381_OUT_Erika_REL;
	nr		= 1;
	condition	= Info_Mod_Erika_EXIT_Condition;
	information	= Info_Mod_Erika_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Erika_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Erika_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
