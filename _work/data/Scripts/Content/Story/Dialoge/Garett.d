INSTANCE Info_Mod_Garett_Hi (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Hi_Condition;
	information	= Info_Mod_Garett_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Garett_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Garett_Hi_09_00"); //Hey Neuer, brauchst 'ne Waffe?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PIRATEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PIRATEN, "Garett scheint Waffen zu verkaufen.");
};

INSTANCE Info_Mod_Garett_Befreiung (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung_Condition;
	information	= Info_Mod_Garett_Befreiung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich etwas für dich tun?";
};

FUNC INT Info_Mod_Garett_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_00"); //Kann ich etwas für dich tun?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_09_01"); //Wieso?
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_02"); //Greg hat mich gebeten, euch unter die Arme zu greifen, damit hier alles wieder in Gang kommt.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_09_03"); //(lacht) Achso. Das ist ja was Anderes.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_04"); //Also hast du etwas?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_09_05"); //Allerdings. Wenn es wieder zu einem Angriff der Untoten kommen sollte, haben wir kaum Waffen um uns zu verteidigen.
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_09_06"); //Ich benötige zehn Entermesser, um wieder genug Vorrat zu haben.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_07"); //Woher bekomm ich die Entermesser?
	AI_Output(self, hero, "Info_Mod_Garett_Befreiung_09_08"); //Geh' am Strand entlang, dort liegen noch einige Waffen herum. Da müsstest du fündig werden.
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung_15_09"); //Dann mach ich mich mal auf die Suche.
	
	Log_CreateTopic	(TOPIC_MOD_BEL_PIRGARETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRGARETT, "Garett braucht neue Waffen. Am Strand sollen noch welche herumliegen.");

	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_01");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_02");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_03");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_04");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_05");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_06");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_07");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_08");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_09");
	Wld_InsertItem	(ItMw_Addon_PIR1hSword, "FP_ITEM_ENTERMESSER_10");
};

INSTANCE Info_Mod_Garett_Befreiung2 (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Befreiung2_Condition;
	information	= Info_Mod_Garett_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du deine zehn Entermesser.";
};

FUNC INT Info_Mod_Garett_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Befreiung))
	&& (Npc_HasItems(hero, ItMw_Addon_PIR1hSword) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Befreiung2_15_00"); //Hier hast du deine zehn Entermesser.

	B_GiveInvItems	(hero, self, ItMw_Addon_PIR1hSword, 10);

	AI_Output(self, hero, "Info_Mod_Garett_Befreiung2_09_01"); //Danke, hier hast du eine Belohnung.

	B_ShowGivenThings	("120 Gold und 15 Grog erhalten");

	CreateInvItems	(hero, ItMi_Gold, 120);
	CreateInvItems	(hero, ItFo_Addon_Grog, 15);

	B_GivePlayerXP	(250);

	Mod_Piratenbefreiung += 1;
	
	B_LogEntry_More	(TOPIC_MOD_BEL_PIRGARETT, TOPIC_MOD_BEL_PIRATENLAGER, "Garett ist wieder mit Vorräten versorgt.", "Garett ist wieder mit Vorräten versorgt.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRGARETT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Garett_Blutkelch (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Blutkelch_Condition;
	information	= Info_Mod_Garett_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du vielleicht eine besonders harte Hacke im Sortiment?";
};

FUNC INT Info_Mod_Garett_Blutkelch_Condition()
{
	if (Mod_ASS_Blutkelch3 == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_00"); //Hast du vielleicht eine besonders harte Hacke im Sortiment?
	AI_Output(self, hero, "Info_Mod_Garett_Blutkelch_09_01"); //Was soll das sein. Ich kenne nur die gemeine Spitzhacke. Und davon hab ich keine.
	AI_Output(hero, self, "Info_Mod_Garett_Blutkelch_15_02"); //Schon gut. War nur ne Frage.
};

INSTANCE Info_Mod_Garett_Trade (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Trade_Condition;
	information	= Info_Mod_Garett_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Garett_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garett_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garett_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Garett_Pickpocket (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_Pickpocket_Condition;
	information	= Info_Mod_Garett_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Garett_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 471);
};

FUNC VOID Info_Mod_Garett_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);

	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_BACK, Info_Mod_Garett_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garett_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garett_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garett_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garett_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Garett_EXIT (C_INFO)
{
	npc		= Mod_933_PIR_Garett_AW;
	nr		= 1;
	condition	= Info_Mod_Garett_EXIT_Condition;
	information	= Info_Mod_Garett_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garett_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garett_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};