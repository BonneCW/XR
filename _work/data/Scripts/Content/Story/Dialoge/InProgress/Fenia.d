INSTANCE Info_Mod_Fenia_Hi (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Hi_Condition;
	information	= Info_Mod_Fenia_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Hi_19_00"); //Czesc, jestem Fenia. Potrzebujesz czegos do jedzenia?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Fenia zdaje sie zajmowac zywnoscia.");
};

INSTANCE Info_Mod_Fenia_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling1_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy cos sie po prostu poruszylo pod twoimi stopami? (miescic jablko)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling2_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, nie szukaja go tam? (miescic jablko)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling3_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mile jablka, które tam masz.... (miescic jablko)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_Daemonisch (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Daemonisch_Condition;
	information	= Info_Mod_Fenia_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Daemonisch_19_00"); //Czlowiek, szybko pobiegl do poludniowej bramy.
	
	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "To musi byc on. Do bramy poludniowej, nastepnie.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Fenia_Wanzen (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Wanzen_Condition;
	information	= Info_Mod_Fenia_Wanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co Pan tutaj robi?";
};

FUNC INT Info_Mod_Fenia_Wanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_WanzenBack))
	&& (Eddas_Wanzen_Back == 2)
	&& (Wld_IsTime(22,05,04,55))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Wanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_00"); //Co Pan tutaj robi?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_01"); //(polowione odchody) Uh...... nic.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_02"); //Nie mialbys nic wspólnego z robakami w kabinie Eddie' ego, czy móglbys?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_03"); //Uh.... Ja?
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_04"); //Tak, Ty.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_05"); //No cóz, uh.... To inaczej, wiec myslisz.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_06"); //Jak to jest?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_07"); //Edda zasluguje na to, wiesz? Próbowala zahaczyc sie o mojego meza.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_08"); //I dlatego wkladasz pluskwy miesne do jej kabiny? Chetnie o tym dowie sie.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_09"); //Prosze mnie nie zdradzic.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_10"); //Dlaczego bym tego nie zrobil?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_19_11"); //Moge Ci zaplacic. Jestem handlarzem, mam zloto.

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "Wlasciwie nie powiem Eddie.", Info_Mod_Fenia_Wanzen_Fenia);
	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "Nie, powie Edda wszystko.", Info_Mod_Fenia_Wanzen_Edda);
};

FUNC VOID Info_Mod_Fenia_Wanzen_Fenia()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Fenia_15_00"); //Wlasciwie nie powiem Eddie.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Fenia_19_01"); //Dziekuje, ze Edda mnie zabilaby. Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	Eddas_Wanzen_Back = 4;

	B_Göttergefallen (2, 1);

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	B_LogEntry	(TOPIC_MOD_EDDASWANZENBACK, "Wzielam oferte Fenii i nie oddalam jej do Eddy.");

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_SUCCESS);

	CurrentNQ += 1;
};

FUNC VOID Info_Mod_Fenia_Wanzen_Edda()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Edda_15_00"); //Nie, powie Edda wszystko.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Edda_19_01"); //Och, nie, ona mnie zabije gonna.

	Eddas_Wanzen_Back = 3;

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);
};

INSTANCE Info_Mod_Fenia_AllesKlar (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_AllesKlar_Condition;
	information	= Info_Mod_Fenia_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy masz racje?";
};

FUNC INT Info_Mod_Fenia_AllesKlar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_00"); //Czy masz racje?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_01"); //Czy wygladam na przygnebiajaco? Byloby to zle dla biznesu.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_02"); //Co Cie niepokoi?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_03"); //Chwycilem mojego meza Halvora i wciaz szukam dziwnych kobiet.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_04"); //Ale mam tez wrazenie, ze wszystkie kobiety próbuja mnie zniechecic do uzywania szyi.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_05"); //Czy kiedykolwiek rozmawiales z nim na ten temat?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_06"); //Masz? Zawsze sie z nim konfrontuje, ale on zaprzecza wszystkim goraco i rozmawia sie z nim rozmowami handlowymi i tak dalej.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_19_07"); //Przylapuje go do akcji....
};

INSTANCE Info_Mod_Fenia_BH (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH_Condition;
	information	= Info_Mod_Fenia_BH_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH_Condition()
{
	if (Mod_Garvell_Fenia == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_00"); //Tlusta rakieta! Czy zdejmiesz rece z rak? kopalnia puszczac sie!
	AI_Output(hero, self, "Info_Mod_Fenia_BH_15_01"); //Ale....
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_02"); //Przypuszczam, ze wymysliles pretekst do wziecia udzialu w tej akcji.
	AI_Output(self, hero, "Info_Mod_Fenia_BH_19_03"); //Zamknij sie i zostan z dala od mnie!

	B_LogEntry	(TOPIC_MOD_GARVELL_FENIA, "Ktos bardzo mnie zasilil....");
};

INSTANCE Info_Mod_Fenia_BH2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH2_Condition;
	information	= Info_Mod_Fenia_BH2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garvell_Fenia3))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH2_19_00"); //Zapomnijmy o moim biznesie.... kopalnia Tak?
	AI_Output(hero, self, "Info_Mod_Fenia_BH2_15_01"); //Nie zdarzyc sie ponownie.
};

INSTANCE Info_Mod_Fenia_Trade (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Trade_Condition;
	information	= Info_Mod_Fenia_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fenia_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fenia_Pickpocket (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Pickpocket_Condition;
	information	= Info_Mod_Fenia_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Fenia_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_BACK, Info_Mod_Fenia_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fenia_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fenia_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fenia_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fenia_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fenia_EXIT (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_EXIT_Condition;
	information	= Info_Mod_Fenia_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fenia_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
