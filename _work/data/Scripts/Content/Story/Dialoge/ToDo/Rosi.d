INSTANCE Info_Mod_Rosi_Hi (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Hi_Condition;
	information	= Info_Mod_Rosi_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rosi_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Hi_17_00"); //Hej, szukasz czegos do jedzenia?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Rosi moze sprzedac mi niektóre artykuly spozywcze.");
};

INSTANCE Info_Mod_Rosi_Daemonisch (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Daemonisch_Condition;
	information	= Info_Mod_Rosi_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_00"); //Co przynosi ci tutaj?
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_01"); //Chcialem tylko zapytac, czy ostatnio nastapily jakies zmiany lub rzeczy niezwykle.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_02"); //Hmm, tak, od kiedy o tym mówisz.... jak moge to ujac.... Jakos juz nie jest tak samo. Zmienil sie.
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_03"); //Cóz, kto by mu tego nie zyczyl.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_04"); //Nie, on jest --- To juz nie jest moje oddzielenie.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_05"); //Póznym wieczorem udal sie z sluga do lasu, aby uzyskac obraz tego, gdzie slugom najlepiej scinac drewno, to juz nie jest mój secob....

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Rosi zauwazyla powazne zmiany w swoim mezu Sekobie od czasu jego pobytu w lesie.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Rosi_Daemonisch2 (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Daemonisch2_Condition;
	information	= Info_Mod_Rosi_Daemonisch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak to robisz?";
};

FUNC INT Info_Mod_Rosi_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch4))
	&& (!Npc_IsDead(Mod_105_BAU_Sekob_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Daemonisch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch2_15_00"); //Jak to robisz?
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch2_17_01"); //Och, moje odosobnienie znów jest takie samo.
};

INSTANCE Info_Mod_Rosi_Unheil (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Unheil_Condition;
	information	= Info_Mod_Rosi_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Powitania. Czy ostatnio mialy miejsce jakies dziwne wydarzenia?";
};

FUNC INT Info_Mod_Rosi_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Unheil_15_00"); //Powitania. Czy ostatnio mialy miejsce jakies dziwne wydarzenia?
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_01"); //Cóz, jestes dla mnie dobry. Caly cmentarz przed naszym gospodarstwem tetni zyciem.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_02"); //Ach, jak to nie wszystko bylo za zle w tym roku. Poczatkowo byl suszony przez tygodnie, potem gradobicie.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_03"); //Jak to sie dzieje?

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Rosi narzekal na niekorzystne warunki pogodowe i gradobicie od poczatku sezonu.");

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Rosi_SagittaKraeuter (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_SagittaKraeuter_Condition;
	information	= Info_Mod_Rosi_SagittaKraeuter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_SagittaKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_SagittaKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_SagittaKraeuter_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_00"); //Tutaj juz naprawilem pakiet dla Sagitty.

	B_GiveInvItems	(self, hero, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_01"); //I dziekuje ci tak bardzo za przyniesienie mu jego lekarstwa.
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_02"); //W ostatnich dniach bylo to dla niego niemal nie do zniesienia.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Przynióslem Sekobowi lekarstwa i pakiet dla Sagitty.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Rosi_Kleinvieh (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Kleinvieh_Condition;
	information	= Info_Mod_Rosi_Kleinvieh_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rosi_Kleinvieh_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balthasar_Wolf))
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Kleinvieh_Info()
{
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_00"); //Ciesze sie, ze jestes tutaj. Móglbym uzyc waszej pomocy z odrazajaca bestia.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh_15_01"); //Co mozna pokonac? Orki, trolly, nieumarle?
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_02"); //Slyszalem, jak patrzyliscie na owce Balthazara i broniliscie ich przed mlodymi wilkami.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_03"); //Dlatego tez na pewno bedziesz w stanie oczyscic nasza stodole z obrzydliwych szczurów, które sie tam rozsypaly.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_04"); //Nie odwazylem sie juz tam wejsc.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_05"); //(pólbrzmiacy do siebie) a ja bym musial wrócic do zaopatrzenia w tulów....

	AI_TurnToNpc	(self, hero);

	Log_CreateTopic	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ROSI_KLEINVIEH, "Rosi narzekal, ze szczury rozprzestrzeniaja sie w stodole. Mam ja zabic.");

	Wld_InsertNpc	(Giant_Rat_Rosi_01, "FP_ROAM_SEKOBSRATTE_02");

	Wld_InsertNpc	(Rat_Rosi_01, "FP_ROAM_SEKOBSRATTE_02");
	Wld_InsertNpc	(Rat_Rosi_02, "FP_ROAM_SEKOBSRATTE_02");
	Wld_InsertNpc	(Rat_Rosi_03, "FP_ROAM_SEKOBSRATTE_02");

	Wld_InsertNpc	(Giant_Rat_Rosi_02, "NW_FARM4_STABLE_01");

	Wld_InsertNpc	(Rat_Rosi_04, "NW_FARM4_STABLE_01");
	Wld_InsertNpc	(Rat_Rosi_05, "NW_FARM4_STABLE_01");
};

INSTANCE Info_Mod_Rosi_Kleinvieh2 (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Kleinvieh2_Condition;
	information	= Info_Mod_Rosi_Kleinvieh2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Istoty sa plaskie.";
};

FUNC INT Info_Mod_Rosi_Kleinvieh2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Kleinvieh))
	&& (Npc_IsDead(Rat_Rosi_01))
	&& (Npc_IsDead(Rat_Rosi_02))
	&& (Npc_IsDead(Rat_Rosi_03))
	&& (Npc_IsDead(Rat_Rosi_04))
	&& (Npc_IsDead(Rat_Rosi_05))
	&& (Npc_IsDead(Giant_Rat_Rosi_01))
	&& (Npc_IsDead(Giant_Rat_Rosi_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Kleinvieh2_Info()
{
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_00"); //Istoty sa plaskie.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_01"); //Dziekuje, dziekuje. Jestes naprawde odwazny.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_02"); //Hmph.....
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_03"); //Tutaj masz do jedzenia troche jedzenia i kilka zlotych kawalków dziekujemy.

	B_ShowGivenThings	("30 Otrzymane zloto, chleb, mleko, sery i prazone mieso");

	CreateInvItems	(hero, ItMi_Gold, 30);
	CreateInvItems	(hero, ItFo_Bread, 1);
	CreateInvItems	(hero, ItFo_Milk, 1);
	CreateInvItems	(hero, ItFo_Cheese, 1);
	CreateInvItems	(hero, ItFo_Mutton, 1);

	B_SetTopicStatus	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(60);
};

INSTANCE Info_Mod_Rosi_Trade (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Trade_Condition;
	information	= Info_Mod_Rosi_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rosi_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rosi_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rosi_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rosi_Pickpocket (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Pickpocket_Condition;
	information	= Info_Mod_Rosi_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30_Female;
};

FUNC INT Info_Mod_Rosi_Pickpocket_Condition()
{
	C_Beklauen	(16, ItMi_Gold, 12);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

	Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_BACK, Info_Mod_Rosi_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rosi_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rosi_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rosi_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rosi_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rosi_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rosi_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rosi_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rosi_EXIT (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_EXIT_Condition;
	information	= Info_Mod_Rosi_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rosi_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rosi_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
