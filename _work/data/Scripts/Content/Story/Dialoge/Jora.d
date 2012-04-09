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
	AI_Output(self, hero, "Info_Mod_Jora_Hi_08_00"); //Hey du. Brauchst du 'ne Waffe oder sonst was? Ich kann dir was verkaufen.
	
	Log_CreateTopic	(TOPIC_MOD_HÄNDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HÄNDLER_STADT, "Jora verkauft Waffen und andere Sachen.");
};

INSTANCE Info_Mod_Jora_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_MatteoLehrling1_Condition;
	information	= Info_Mod_Jora_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich da unter deinem Stand gerade etwas bewegt? (Apfel platzieren)";
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
	description	= "Hey, wird der da drüben nicht gesucht? (Apfel platzieren)";
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
	description	= "Schöne Äpfel hast du da ... (Apfel platzieren)";
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
	description	= "Wie immer gut sortiert, dein Angebot.";
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
	AI_Output(hero, self, "Info_Mod_Jora_Blutkelch_15_00"); //Wie immer gut sortiert, dein Angebot. Hast du vielleicht auch einen Blutkelch?
	AI_Output(self, hero, "Info_Mod_Jora_Blutkelch_08_01"); //Nie gehört. Was soll das sein?
	AI_Output(hero, self, "Info_Mod_Jora_Blutkelch_15_02"); //Weiß ich auch nicht genau. Bis ein andermal.
};

INSTANCE Info_Mod_Jora_Anschlagtafel (C_INFO)
{
	npc		= Mod_589_NONE_Jora_NW;
	nr		= 1;
	condition	= Info_Mod_Jora_Anschlagtafel_Condition;
	information	= Info_Mod_Jora_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
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

		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Jora_Gold);

		AI_Output(self, hero, "Info_Mod_Jora_Anschlagtafel_08_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

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
	Backup_Questitems();

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
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Jora_Pickpocket_Condition()
{
	C_Beklauen	(56, ItMi_Gold, 160);
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
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jora_Pickpocket);
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