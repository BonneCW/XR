INSTANCE Info_Mod_Salandril_Hi (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Hi_Condition;
	information	= Info_Mod_Salandril_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Salandril_Hi_Condition()
{
	return 1;
};

FUNC VOId Info_Mod_Salandril_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Salandril_Hi_13_00"); //Willkommen in meinem Laden, Fremder!
	AI_Output(self, hero, "Info_Mod_Salandril_Hi_13_01"); //Bei mir kannst du Tränke kaufen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Bei Salandril kann ich Tränke kaufen.");
};

INSTANCE Info_Mod_Salandril_Alkohol (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Alkohol_Condition;
	information	= Info_Mod_Salandril_Alkohol_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll bei dir Alkohol abholen.";
};

FUNC INT Info_Mod_Salandril_Alkohol_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorax_Aufgabe))
	&& (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold)	>=	100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Alkohol_Info()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_00"); //Ich soll bei dir Alkohol abholen.
	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_01"); //Dann bist du also der Bote der Feuermagier?
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_02"); //Ja, der bin ich.
	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_03"); //Hier ist der Alkohol.

	B_GiveInvItems	(self, hero, ItMi_Alchemy_Alcohol_01, 4);

	AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_13_04"); //Das macht dann 100 Goldmünzen.

	B_LogEntry	(TOPIC_MOD_GORAX_ALKOHOL, "Salandril hat mir den Alkohol gegeben.");

	if (Mod_Verhandlungsgeschick > 0)
	{
		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);

		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Akzeptieren.", Info_Mod_Salandril_Alkohol_Ok_100);
		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Feilschen.", Info_Mod_Salandril_Alkohol_Feilschen_100);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_15_04"); //Hier ist dein Gold.
	
		B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	};
};

FUNC VOID Info_Mod_Salandril_Alkohol_Ok_100()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_Ok_100_15_00"); //Hier ist dein Gold.
	
	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
};

FUNC VOID Info_Mod_Salandril_Alkohol_Feilschen_100()
{
	AI_Output(hero, self, "Info_Mod_Salandril_Alkohol_Feilschen_100_15_00"); //Das ist er doch niemals wert.
	
	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Salandril_Alkohol_Feilschen_100_13_01"); //(sauer) Nun gut, 70 Münzen.

		B_GiveInvItems	(hero, self, ItMi_Gold, 70);

		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Inf_Mod_Salandril_Alkohol_Feilschen_100_13_02"); //Ich will meine ganzen 100 Goldmünzen.

		Info_ClearChoices	(Info_Mod_Salandril_Alkohol);
		
		Info_AddChoice	(Info_Mod_Salandril_Alkohol, "Akzeptieren.", Info_Mod_Salandril_Alkohol_Ok_100);
	};
};

INSTANCE Info_Mod_Salandril_SonjaFreier (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_SonjaFreier_Condition;
	information	= Info_Mod_Salandril_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du häufig Kunde bei Sonja gewesen?";
};

FUNC INT Info_Mod_Salandril_SonjaFreier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	&& (Mod_Sonja_Freier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Salandril_SonjaFreier_15_00"); //Bist du häufig Kunde bei Sonja gewesen?
	AI_Output(self, hero, "Info_Mod_Salandril_SonjaFreier_13_01"); //(verdutzt) Was wird das? Willst du mich verleumden?
	AI_Output(hero, self, "Info_Mod_Salandril_SonjaFreier_15_02"); //Ein Nein würde mir schon reichen.
	AI_Output(self, hero, "Info_Mod_Salandril_SonjaFreier_13_03"); //Nein!
};

INSTANCE Info_Mod_Salandril_Trade (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Trade_Condition;
	information	= Info_Mod_Salandril_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Salandril_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Salandril_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Salandril_Pickpocket_Gaertner (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Pickpocket_Gaertner_Condition;
	information	= Info_Mod_Salandril_Pickpocket_Gaertner_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Salandril_Pickpocket_Gaertner_Condition()
{
	if (C_Beklauen	(96, ItPo_Perm_DEX_Salandril, 1))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaertner_Dieb))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_Info()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);

	Info_AddChoice	(Info_Mod_Salandril_Pickpocket_Gaertner, DIALOG_BACK, Info_Mod_Salandril_Pickpocket_Gaertner_BACK);
	Info_AddChoice	(Info_Mod_Salandril_Pickpocket_Gaertner, DIALOG_PICKPOCKET, Info_Mod_Salandril_Pickpocket_Gaertner_DoIt);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_BACK()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Gaertner_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket_Gaertner);
};

INSTANCE Info_Mod_Salandril_Pickpocket (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_Pickpocket_Condition;
	information	= Info_Mod_Salandril_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Salandril_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket);

	Info_AddChoice	(Info_Mod_Salandril_Pickpocket, DIALOG_BACK, Info_Mod_Salandril_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Salandril_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Salandril_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket);
};

FUNC VOID Info_Mod_Salandril_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Salandril_Pickpocket);
};

INSTANCE Info_Mod_Salandril_EXIT (C_INFO)
{
	npc		= Mod_751_NONE_Salandril_NW;
	nr		= 1;
	condition	= Info_Mod_Salandril_EXIT_Condition;
	information	= Info_Mod_Salandril_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Salandril_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Salandril_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};