INSTANCE Info_Mod_Jora_Hi (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Hi_Condition;
	information	= Info_Mod_Jora_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jora_Hi_Condition()
{
	if (Wld_IsTime(05,15,20,04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Jora_Hi_08_00"); //Hej, Ty. Potrzebujesz pistoletu lub czegos? Moge cos wam sprzedac.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Jora sprzedaje bron i inne przedmioty.");
};

INSTANCE Info_Mod_Jora_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_MatteoLehrling1_Condition;
	information	= Info_Mod_Jora_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy cos sie po prostu poruszylo pod twoimi stopami? (miescic jablko)";
};

FUNC INT Info_Mod_Jora_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Jora_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Jora_Apfel = 1;
};

INSTANCE Info_Mod_Jora_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_MatteoLehrling2_Condition;
	information	= Info_Mod_Jora_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, nie szukaja go tam? (miescic jablko)";
};

FUNC INT Info_Mod_Jora_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Jora_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Jora_Apfel = 1;
};

INSTANCE Info_Mod_Jora_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_MatteoLehrling3_Condition;
	information	= Info_Mod_Jora_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mile jablka, które tam masz.... (miescic jablko)";
};

FUNC INT Info_Mod_Jora_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Jora_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Jora_Apfel = 1;
};

INSTANCE Info_Mod_Jora_Blutkelch (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Blutkelch_Condition;
	information	= Info_Mod_Jora_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak zawsze dobrze posortowane, Twoja oferta.";
};

FUNC INT Info_Mod_Jora_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mustafa_PosWechsel))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Jora_Blutkelch_15_00"); //Jak zawsze dobrze posortowane, Twoja oferta. Masz kubek krwi?
	AI_Output(self, hero, "Info_Mod_Jora_Blutkelch_08_01"); //Nigdy o tym nie slyszalem. Co to ma byc?
	AI_Output(hero, self, "Info_Mod_Jora_Blutkelch_15_02"); //Tak naprawde nie wiem. Do zobaczenia nastepnym razem.
};

INSTANCE Info_Mod_Jora_Anschlagtafel (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Anschlagtafel_Condition;
	information	= Info_Mod_Jora_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Widzialem twój plakat na billboardzie....";
};

FUNC INT Info_Mod_Jora_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Jora == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItRw_Bolt) >= Mod_Anschlagtafel_Khorinis_Jora_Bolzen)
	&& (Npc_HasItems(hero, ItRw_Bow_L_01) >= Mod_Anschlagtafel_Khorinis_Jora_Kurzbogen)
	&& (Npc_HasItems(hero, ItRw_Bow_L_02) >= Mod_Anschlagtafel_Khorinis_Jora_Weidenbogen)
	&& (Npc_HasItems(hero, ItLsTorch) >= Mod_Anschlagtafel_Khorinis_Jora_Fackel)
	&& (Npc_HasItems(hero, ItMw_2H_Axe_L_01) >= Mod_Anschlagtafel_Khorinis_Jora_Spitzhacke)
	&& (Npc_HasItems(hero, ItMi_Lute) >= Mod_Anschlagtafel_Khorinis_Jora_Laute)
	&& (Npc_HasItems(hero, ItAm_Prot_Edge_01) >= Mod_Anschlagtafel_Khorinis_Jora_Harnischamulett)
	&& (Npc_HasItems(hero, ItFo_KWine) >= Mod_Anschlagtafel_Khorinis_Jora_Klosterwein)
	&& (Npc_HasItems(hero, ItFo_Schafswurst) >= Mod_Anschlagtafel_Khorinis_Jora_Schafswurst)
	&& (Npc_HasItems(hero, ItRw_Arrow) >= Mod_Anschlagtafel_Khorinis_Jora_Pfeil)
	{
		Npc_RemoveInvItems	(hero, ItRw_Bolt, Mod_Anschlagtafel_Khorinis_Jora_Bolzen);
		Npc_RemoveInvItems	(hero, ItRw_Bow_L_01, Mod_Anschlagtafel_Khorinis_Jora_Kurzbogen);
		Npc_RemoveInvItems	(hero, ItRw_Bow_L_02, Mod_Anschlagtafel_Khorinis_Jora_Weidenbogen);
		Npc_RemoveInvItems	(hero, ItLsTorch, Mod_Anschlagtafel_Khorinis_Jora_Fackel);
		Npc_RemoveInvItems	(hero, ItMw_2H_Axe_L_01, Mod_Anschlagtafel_Khorinis_Jora_Spitzhacke);
		Npc_RemoveInvItems	(hero, ItMi_Lute, Mod_Anschlagtafel_Khorinis_Jora_Laute);
		Npc_RemoveInvItems	(hero, ItAm_Prot_Edge_01, Mod_Anschlagtafel_Khorinis_Jora_Harnischamulett);
		Npc_RemoveInvItems	(hero, ItFo_KWine, Mod_Anschlagtafel_Khorinis_Jora_Klosterwein);
		Npc_RemoveInvItems	(hero, ItFo_Schafswurst, Mod_Anschlagtafel_Khorinis_Jora_Schafswurst);
		Npc_RemoveInvItems	(hero, ItRw_Arrow, Mod_Anschlagtafel_Khorinis_Jora_Pfeil);

		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_00"); //Co? Pokaz mi.... W rzeczywistosci to wszystko. Bardzo dobrze wykonane.
		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_01"); //Oto Twoja nagroda.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Jora_Gold);

		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_02"); //Mile robienie interesów z Toba.

		if (Mod_Anschlagtafel_Khorinis_Jora_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Jora_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Jora_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Jora = 0;
		Mod_Anschlagtafel_Khorinis_Jora_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Jora, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Jora_Trade (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Trade_Condition;
	information	= Info_Mod_Jora_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Jora_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jora_Hi))
	&& (Wld_IsTime(05,15,20,04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jora_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Jora_Pickpocket (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Pickpocket_Condition;
	information	= Info_Mod_Jora_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Jora_Pickpocket_Condition()
{
	C_Beklauen	(76, ItMi_Gold, 29);
};

FUNC VOID Info_Mod_Jora_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jora_Pickpocket);

	Info_AddChoice	(Info_Mod_Jora_Pickpocket, DIALOG_BACK, Info_Mod_Jora_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jora_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jora_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jora_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jora_Pickpocket);
};

FUNC VOID Info_Mod_Jora_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Jora_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Jora_Pickpocket);

		Info_AddChoice	(Info_Mod_Jora_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Jora_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Jora_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Jora_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Jora_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Jora_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Jora_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Jora_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Jora_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Jora_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Jora_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Jora_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Jora_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Jora_EXIT (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_EXIT_Condition;
	information	= Info_Mod_Jora_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jora_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jora_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
