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
	AI_Output(self, hero, "Info_Mod_Rosi_Hi_17_00"); //Hey, suchst du was zu essen?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_ONAR, "Rosi kann mir Lebensmittel verkaufen.");
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
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_00"); //Was führt dich denn hier her?
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_01"); //Ich wollte mich nur umhören, ob es besondere Veränderungen, oder Ungewöhnliches in letzter Zeit gab.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_02"); //Hmm, ja, wo du davon sprichst ... wie soll ich sagen ... irgendwie ist mein Sekob nicht mehr derselbe. Er hat sich verändert.
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch_15_03"); //Naja, wer hätte ihm das nicht gewünscht.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_04"); //Nein, er ist ... es ist nicht mehr mein Sekob.
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch_17_05"); //Seit dem er spät abends mit einem Knecht in den Wald ging, um sich davon ein Bild zu machen, wo die Knechte am besten Holz schlagen sollen, ist es nicht mehr mein Sekob ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Rosi hat große Veränderungen an ihrem Mann Sekob bemerkt, seitdem er im Wald war.");

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
	description	= "Wie geht’s?";
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
	AI_Output(hero, self, "Info_Mod_Rosi_Daemonisch2_15_00"); //Wie geht’s?
	AI_Output(self, hero, "Info_Mod_Rosi_Daemonisch2_17_01"); //(erfreut) Ach, mein Sekob ist wieder ganz der alte.
};

INSTANCE Info_Mod_Rosi_Unheil (C_INFO)
{
	npc		= Mod_772_BAU_Rosi_NW;
	nr		= 1;
	condition	= Info_Mod_Rosi_Unheil_Condition;
	information	= Info_Mod_Rosi_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sei gegrüßt. Gab es in letzter Zeit irgendwelche merkwürdigen Vorkommnisse?";
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
	AI_Output(hero, self, "Info_Mod_Rosi_Unheil_15_00"); //Sei gegrüßt. Gab es in letzter Zeit irgendwelche merkwürdigen Vorkommnisse?
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_01"); //Na, du bist mir gut. Der ganze Friedhof vor unserem Bauernhof wimmelt nur so vor üblen Untoten.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_02"); //Ach, als ob es nicht schon alles schlimm genug gewesen wäre dieses Jahr. Zuerst wochenlange Trockenheit, dann immer diese Hagelschauer.
	AI_Output(self, hero, "Info_Mod_Rosi_Unheil_17_03"); //Wie soll das nur weitergehen.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Rosi hat sich über ungünstige Wetterverhältnisse und Hagelschauer seit Beginn der Saison beklagt.");

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
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_00"); //Hier, ich habe das Paket für Sagitta schon gerichtet.

	B_GiveInvItems	(self, hero, ItMi_SekobSagitta, 1);

	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_01"); //Und hab vielen Dank, dass du ihm seine Medizin gebracht hast.
	AI_Output(self, hero, "Info_Mod_Rosi_SagittaKraeuter_17_02"); //Es war schier unerträglich mit ihm in den letzten Tagen.

	B_LogEntry	(TOPIC_MOD_SAGITTA_KRAEUTER, "Ich habe Sekob die Medizin gebracht und das Paket für Sagitta bei mir.");

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
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_00"); //Gut, dass du da bist. Ich könnte deine Hilfe bei einigem ekligen Ungetier brauchen.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh_15_01"); //Was gilt es zu bezwingen? Orks, Trolle, Untote?
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_02"); //Ich habe mitbekommen, dass du auf Balthasars Schafe aufgepasst hast und sie gegen junge Wölfe verteidigt hast.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_03"); //Daher bist du bestimmt auch dazu in der Lage unsere Scheune von den widerlichen fetten Ratten zu säubern, die sich dort ausgebreitet haben.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_04"); //Ich trau mich dort gar nicht mehr hinein.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh_17_05"); //(halblaut zu sich selbst) ... und ich müsste doch mal wieder an die Vorräte in der Truhe ...

	AI_TurnToNpc	(self, hero);

	Log_CreateTopic	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ROSI_KLEINVIEH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ROSI_KLEINVIEH, "Rosi beklagte, dass sich in der Scheune Ratten breit gemacht haben. Ich soll sie erledigen.");

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
	description	= "Die Viecher sind platt.";
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
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_00"); //Die Viecher sind platt.
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_01"); //Ich danke dir. Du bist wirklich mutig.
	AI_Output(hero, self, "Info_Mod_Rosi_Kleinvieh2_15_02"); //Hmpf ...
	AI_Output(self, hero, "Info_Mod_Rosi_Kleinvieh2_17_03"); //Hier hast du etwas Essen zur Stärkung und einige Goldstücke als Dankeschön.

	B_ShowGivenThings	("30 Gold, Brot, Milch, Käse und gebratenes Fleisch erhalten");

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
	Backup_Questitems();

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