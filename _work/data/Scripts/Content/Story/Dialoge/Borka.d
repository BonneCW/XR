INSTANCE Info_Mod_Borka_Hi (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Hi_Condition;
	information	= Info_Mod_Borka_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_Hi_42_00"); //Krok w slepa uliczke, a Twoje najsmielsze marzenia i fantazje spelnia sie.
};

INSTANCE Info_Mod_Borka_Flugblaetter (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Flugblaetter_Condition;
	information	= Info_Mod_Borka_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dla Ciebie ulotke.";
};

FUNC INT Info_Mod_Borka_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_42_01"); //Dziekuje, dziekuje. Zobaczmy jak.....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Borka_Flugblaetter_42_02"); //Ah tak. Moze zatrzymam sie przy Matteo' s.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Borka_Aabid (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Aabid_Condition;
	information	= Info_Mod_Borka_Aabid_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pochodze z Aabid i.....";
};

FUNC INT Info_Mod_Borka_Aabid_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Aabid_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_00"); //Pochodze z Aabid i.....
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_01"); //Znowu gosc.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_02"); //A co z tym?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_03"); //On ciagle chce, zebym mial odebrac jego paczke z miasta, ale nie mam ochoty. Czy moze pan przekazac mu wiadomosc?
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_04"); //Przyszedlem, zeby odebrac pakiet.
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_05"); //(smiech) Aabid to leniwa swinia. Oto pakiet.

	B_GiveInvItems	(self, hero, ItMi_HerbPaket, 1);

	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_06"); //Tak wlasnie jest?
	AI_Output(self, hero, "Info_Mod_Borka_Aabid_42_07"); //Jest juz zaplacona. Przynies pakiet do Aabid i powiem hello, nastepnym razem powinien przyjsc sam.
	AI_Output(hero, self, "Info_Mod_Borka_Aabid_15_08"); //Wlasciwie to zrobie.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Dostalem pakiet od Borki bez placenia.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Borka_SchutzgeldErpresser (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_SchutzgeldErpresser_Condition;
	information	= Info_Mod_Borka_SchutzgeldErpresser_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_SchutzgeldErpresser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Whistler_NW_WasGeht))
	&& (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Wld_IsTime(23,00,01,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_SchutzgeldErpresser_Info()
{
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_42_00"); //Dostales pieniadze?
	AI_Output(hero, self, "Info_Mod_Borka_SchutzgeldErpresser_15_01"); //Zapomnij o tym! Powiedz mi natychmiast, kto cie wyslal, albo zyczysz ci, zebys nie przezyl porodu!
	AI_Output(self, hero, "Info_Mod_Borka_SchutzgeldErpresser_42_02"); //Chcesz miec klopoty? Serdecznie zapraszamy.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Borka_Umgehauen (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Umgehauen_Condition;
	information	= Info_Mod_Borka_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Borka_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_SchutzgeldErpresser))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_00"); //Jezu Chryste! Dostales na ciebie pieklo ponczu.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_02"); //Chcesz mi powiedziec, kto Cie wyslal?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_03"); //Wszystko jest w porzadku, nie badz podekscytowany. Bromor mnie przyslal, chce, abysmy rozbili twój sklep i pobrali od ciebie pieniadze.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_04"); //Dlaczego tego chce?
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_05"); //Nie podobaja mu sie skazancy, wiec nie chce ich tu na nabrzezu.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_06"); //Cóz, jestem pewien, ze Lord Andre bedzie zainteresowany.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_07"); //City Watch nie dba o Twoje problemy.
			AI_Output(hero, self, "Info_Mod_Borka_Umgehauen_15_08"); //No cóz, wtedy wiem, co chcialem wiedziec. Teraz wyjmij z niego pieklo, zanim dostaniesz kolejny strzal do ust.
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_09"); //Wszystko w porzadku, wszystko w porzadku, jestem poza nia.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "FLEETOBORDELL");

			Mod_AL_BorkaAusgequetscht	=	1;

			B_LogEntry	(TOPIC_MOD_AL_LAGERHAUS, "To byla Borka. Pracuje dla Bromora, który zdaje sie nie lubic nas skazanych. To wlasnie powinienem powiedziec Whistlerowi.");
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Borka_Umgehauen_42_01"); //No cóz, to bylo nic.

			AI_StopProcessInfos	(self);

			B_StartOtherRoutine	(self, "START");
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Borka_Lucy (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Lucy_Condition;
	information	= Info_Mod_Borka_Lucy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sprzedajesz ambrozje bagienna?";
};

FUNC INT Info_Mod_Borka_Lucy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Hi))
	&& (Mod_Borka_Sumpfkraut == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Lucy_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_00"); //Sprzedajesz ambrozje bagienna?
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_42_01"); //Mówi kto kogo?
	AI_Output(hero, self, "Info_Mod_Borka_Lucy_15_02"); //Mam zloto.
	AI_Output(self, hero, "Info_Mod_Borka_Lucy_42_03"); //Cóz, w takim przypadku.....
};

INSTANCE Info_Mod_Borka_Skinner (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Skinner_Condition;
	information	= Info_Mod_Borka_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Interesuja Cie nowicjusze zieleni?";
};

FUNC INT Info_Mod_Borka_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_00"); //Interesuja Cie nowicjusze zieleni?
	AI_Output(self, hero, "Info_Mod_Borka_Skinner_42_01"); //Oczywiscie zabiore wszystko, co dostales.
	AI_Output(hero, self, "Info_Mod_Borka_Skinner_15_02"); //Wez to tutaj.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Borka_Skinner_42_03"); //Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*20);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Pozbylem sie wiec wszystkich zielonych nowicjuszy w miescie.");
};

var int Mod_BorkaTrader;

INSTANCE Info_Mod_Borka_Trade (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Trade_Condition;
	information	= Info_Mod_Borka_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Borka_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Borka_Lucy))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Borka_Trade_Info()
{
	if (!Mod_BorkaTrader) {
		Mod_BorkaTrader = TRUE;
		
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Borka zawiera transakcje z bagnista.");
	};

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Borka_Pickpocket (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_Pickpocket_Condition;
	information	= Info_Mod_Borka_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Borka_Pickpocket_Condition()
{
	C_Beklauen	(67, ItMi_Joint, 13);
};

FUNC VOID Info_Mod_Borka_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_BACK, Info_Mod_Borka_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Borka_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Borka_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
};

FUNC VOID Info_Mod_Borka_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Borka_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Borka_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Borka_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Borka_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Borka_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Borka_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Borka_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Borka_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Borka_EXIT (C_INFO)
{
	npc		= Mod_563_NONE_Borka_NW;
	nr		= 1;
	condition	= Info_Mod_Borka_EXIT_Condition;
	information	= Info_Mod_Borka_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Borka_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Borka_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
