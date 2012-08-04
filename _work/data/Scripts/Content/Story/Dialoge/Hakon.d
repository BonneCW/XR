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
	AI_Output(self, hero, "Info_Mod_Hakon_Hi_12_00"); //Hallo Fremder, ich bin Hakon der Waffenhändler. Wenn du ein Schwert brauchst bist du bei mir richtig.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Hakon verkauft am Marktplatz Waffen.");
};

INSTANCE Info_Mod_Hakon_Ueberfall (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Ueberfall_Condition;
	information	= Info_Mod_Hakon_Ueberfall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das ist ein Überfall!";
};

FUNC INT Info_Mod_Hakon_Ueberfall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Senyan_Edgor))
	&& (Mod_HakonUeberfall == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hakon_Ueberfall_Info()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Ueberfall_15_00"); //Das ist ein Überfall!
	
	AI_ReadyMeleeWeapon		(hero);

	AI_StopProcessInfos	(hero);

	if (Hlp_StrCmp(Npc_GetNearestWP(Mod_561_NONE_Baltram_NW), "NW_CITY_BEER_05"))
	{
		Npc_ExchangeRoutine	(self, "RUNAWAY");

		AI_UnequipWeapons	(self);
		Npc_RemoveInvItems	(self, ItMw_HakonSchwert_02, 1);

		Wld_InsertItem	(ItMw_HakonSchwert_01, "NW_CITY_HAKON_02");

		B_Göttergefallen(3, 1);
	}
	else
	{
		B_Attack (self, hero, AR_NONE, 1);
	};

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
	description	= "Hey, ich habe da was Interessantes vor der Stadt gefunden (...)";
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
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_15_00"); //Hey, ich habe da was Interessantes vor der Stadt gefunden, was du dir unbedingt ansehen musst.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_12_01"); //Ja, was ist es?

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "Das kann ich dir hier nicht verraten. Du musst es dir schon ansehen.", Info_Mod_Hakon_Weglocken_C);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "In einer Höhle vor der Stadt fand ich einen großen Schatz.", Info_Mod_Hakon_Weglocken_B);
	Info_AddChoice	(Info_Mod_Hakon_Weglocken, "In einer Höhle vor der Stadt fand ich einige Waffen.", Info_Mod_Hakon_Weglocken_A);
};

FUNC VOID Info_Mod_Hakon_Weglocken_C()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_C_15_00"); //Das kann ich dir hier nicht verraten. Du musst es dir schon ansehen.
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_C_12_01"); //Was noch?! Als ob ich nichts besseres zu tun hätte, mir etwas vor der Stadt anzuschauen ...

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);

	Mod_HakonUeberfall = 2;

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Hakon_Weglocken_B()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_B_15_00"); //In einer Höhle vor der Stadt fand ich einen großen Schatz. Leider sind zwei Riesenratten aufgetaucht und haben mich vertrieben. Kannst du mir helfen den Schatz zu bergen?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_B_12_01"); //Ein großer Schatz in einer Höhle vor der Stadt? Ne, Jungchen, Märchenstunde ist erst heute Abend.

	Info_ClearChoices	(Info_Mod_Hakon_Weglocken);
};

FUNC VOID Info_Mod_Hakon_Weglocken_A()
{
	AI_Output(hero, self, "Info_Mod_Hakon_Weglocken_A_15_00"); //In einer Höhle vor der Stadt fand ich einige Waffen. Leider sind zwei Goblin’s aufgetaucht und haben mich vertrieben. Kannst du mir helfen die Waffen zu bergen?
	AI_Output(self, hero, "Info_Mod_Hakon_Weglocken_A_12_01"); //Zwei Gobbos? Ha, lächerlich. Bring mich zu der Höhle. Die Waffen muss ich mir unbedingt ansehen.

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
	AI_Output(self, hero, "Info_Mod_Hakon_Neugier_12_00"); //Ähh, na ja, vielleicht doch ein kurzer Blick. Bring mich hin. Aber wehe, es ist nichts Interessantes.

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
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_12_00"); //Also, wo ist jetzt die Höhle mit Waffen und Goblin’s?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_01"); //Ach, die Waffen sind schon hier nur Goblins waren es doch nicht sondern ... ein Bandit.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hakon_Falle_12_02"); //Also, wo ist jetzt das, was du mir zeigen wolltest?
		AI_Output(hero, self, "Info_Mod_Hakon_Falle_15_03"); //Einen Banditen.
	};

	AI_Output(self, hero, "Info_Mod_Hakon_Falle_12_04"); //Was, wo?

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
	description	= "Ich suche einen sogenannten Blutkelch.";
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
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_00"); //Ich suche einen sogenannten Blutkelch.
	AI_Output(self, hero, "Info_Mod_Hakon_Blutkelch_12_01"); //Da kann ich dir auch nicht helfen. Ich handle mit Waffen.
	AI_Output(hero, self, "Info_Mod_Hakon_Blutkelch_15_02"); //Danke trotzdem.
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
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_12_00"); //Oh Mann, bin ich gerade sauer. Irgendein Idiot hat mich angezeigt, dass ich gestohlene Ware verkaufen würde.
	AI_Output(hero, self, "Info_Mod_Hakon_Mario_15_01"); //Solche Störenfriede gibt es immer wieder.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_12_02"); //Das Problem ist, dass ich tatsächlich nicht ganz ... legale Waffen dabei hatte.
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_12_03"); //Aber ich hatte sie nicht einmal ausgelegt. Einer meiner Mittelsmänner muss geplaudert haben. So ein Schwein!
	AI_Output(self, hero, "Info_Mod_Hakon_Mario_12_04"); //Jetzt durfte ich erst mal ordentlich Strafgeld blechen.
};

INSTANCE Info_Mod_Hakon_Anschlagtafel (C_INFO)
{
	npc		= Mod_581_NONE_Hakon_NW;
	nr		= 1;
	condition	= Info_Mod_Hakon_Anschlagtafel_Condition;
	information	= Info_Mod_Hakon_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
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

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_12_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_12_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Hakon_Gold);

		AI_Output(self, hero, "Info_Mod_Hakon_Anschlagtafel_12_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

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
	Backup_Questitems();

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
	C_Beklauen	(108, ItMi_Gold, 195);
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