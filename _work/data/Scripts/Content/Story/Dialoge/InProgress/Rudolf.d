INSTANCE Info_Mod_Rudolf_Hi (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Hi_Condition;
	information	= Info_Mod_Rudolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rudolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rudolf_Hi_05_00"); //Swieze produkty, swieze produkty. Jedzenie wszelkiego rodzaju tylko ze mna!

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Rudolf w Khoracie sprzedaje wszystkie rodzaje zywnosci.");
};

INSTANCE Info_Mod_Rudolf_Aufgabe (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Aufgabe_Condition;
	information	= Info_Mod_Rudolf_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy moge zrobic cos dobrego?";
};

FUNC INT Info_Mod_Rudolf_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_00"); //Czy moge zrobic cos dobrego?
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_01"); //Cos dobrego?
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_02"); //Tak, wszystko, co jest blisko twojego serca....
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_03"); //Hm.... mozna bylo pójsc do Eriki. Ma tam w swojej ofercie szczególnie dobry alkohol.
	AI_Output(self, hero, "Info_Mod_Rudolf_Aufgabe_05_04"); //Móglbym ja odebrac mi. Daje ci zloto takze za nie, jesli przyniósles je do mnie.
	AI_Output(hero, self, "Info_Mod_Rudolf_Aufgabe_15_05"); //Cokolwiek mówisz.
};

INSTANCE Info_Mod_Rudolf_HabSchnaps (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_HabSchnaps_Condition;
	information	= Info_Mod_Rudolf_HabSchnaps_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dostalem dla Ciebie gorzalke.";
};

FUNC INT Info_Mod_Rudolf_HabSchnaps_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Aufgabe))
	&& (Npc_HasItems(hero, ItFo_BoozeRudolf) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_HabSchnaps_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_00"); //Dostalem dla Ciebie gorzalke.
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_01"); //I daj mi to wszystko.
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_02"); //Tutaj ja masz.

	B_GiveInvItems	(hero, self, ItFo_BoozeRudolf, 1);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_03"); //Ah.... Chce spróbowac tego kiedys.

	B_UseItem	(self, ItFo_BoozeRudolf);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_04"); //Ach, to jest calkiem niezly cios....
	AI_Output(hero, self, "Info_Mod_Rudolf_HabSchnaps_15_05"); //A co z moim zlotem?
	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_06"); //Tak, wezcie to.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Rudolf_HabSchnaps_05_07"); //Teraz pozwole sobie cieszyc sie wspanialym winem.

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Rudolf_Nagelnachschub (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Nagelnachschub_Condition;
	information	= Info_Mod_Rudolf_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz paznokcie?";
};

FUNC INT Info_Mod_Rudolf_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Nagelnachschub_15_00"); //Masz paznokcie?
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_05_01"); //Mozesz sprawdzic mój owoc, czy mam gdzies ukryte paznokcie.
	AI_Output(self, hero, "Info_Mod_Rudolf_Nagelnachschub_05_02"); //A jesli nie znajdziesz tego, czego szukasz, nie mam nic.
};

INSTANCE Info_Mod_Rudolf_Kissen (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kissen_Condition;
	information	= Info_Mod_Rudolf_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Potrzebuje czegos miekkiego.";
};

FUNC INT Info_Mod_Rudolf_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_00"); //Potrzebuje czegos miekkiego.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_01"); //W tym miejscu moge zaoferowac mój ser góralski. Roztopia sie na jezyku.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_02"); //To smierdzi.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_03"); //Co wiec? W przeciwnym razie nie bylby to ser.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kissen_15_04"); //To wystarczy. Nie, dziekuje. Zobacze cie dookola.
	AI_Output(self, hero, "Info_Mod_Rudolf_Kissen_05_05"); //Jesli masz na mysli....
};

INSTANCE Info_Mod_Rudolf_Kimon (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Kimon_Condition;
	information	= Info_Mod_Rudolf_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz cos innego niz jedzenie?";
};

FUNC INT Info_Mod_Rudolf_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_00"); //Masz cos innego niz jedzenie?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_05_01"); //Naprawde nic, naprawde nic.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_02"); //Czy wlasciwie? Byc moze Pan/Pani to robi? Byc moze przyjemny dawca?
	AI_Output(self, hero, "Info_Mod_Rudolf_Kimon_05_03"); //Zycze, zebym mial! Slysze, ze jest jeszcze lepiej niz likier Erika.
	AI_Output(hero, self, "Info_Mod_Rudolf_Kimon_15_04"); //Pytalem tylko o to. Bez twardych uczuc.
};

INSTANCE Info_Mod_Rudolf_Trade (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Trade_Condition;
	information	= Info_Mod_Rudolf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rudolf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rudolf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rudolf_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rudolf_Pickpocket (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_Pickpocket_Condition;
	information	= Info_Mod_Rudolf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Rudolf_Pickpocket_Condition()
{
	C_Beklauen	(97, ItFo_Booze, 2);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_BACK, Info_Mod_Rudolf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rudolf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rudolf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rudolf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rudolf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rudolf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rudolf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rudolf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rudolf_EXIT (C_INFO)
{
	npc		= Mod_7338_OUT_Lebensmittelhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Rudolf_EXIT_Condition;
	information	= Info_Mod_Rudolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rudolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rudolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
