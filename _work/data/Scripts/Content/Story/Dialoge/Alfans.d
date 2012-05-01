INSTANCE Info_Mod_Alfans_Hi (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Hi_Condition;
	information	= Info_Mod_Alfans_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_01_00"); //Hallo Fremder. Du scheinst von weit weg zu kommen.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_01_01"); //Wenn du nach Lebensmitteln und Kräutern suchst, so soll es dir bei mir an nichts fehlen.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_01_02"); //Ich habe eine ausgezeichnete Auswahl an allem, was den Körper belebt und ihm Linderung von Leid verschafft.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_EISGEBIET, "Bei Alfans bekomme ich Lebensmittel und Kräuter.");

	Npc_SetRefuseTalk (self, 300);
};

INSTANCE Info_Mod_Alfans_Aufgabe (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Aufgabe_Condition;
	information	= Info_Mod_Alfans_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_00"); //Sei gegrüßt, da bist da ja wieder.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_01"); //Ich hätte ein Anliegen an dich und wäre überaus dankbar, wenn du mir dabei helfen könntest.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_02"); //Selbstverständlich würde ich dich auch entlohnen.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_03"); //Worum geht es.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_04"); //Nun, ich wandte mich an dich, da du von weit her kommst und somit bewiesen hast, dass du ein exzellenter Fährtensucher bist und den Gefahren der Wildnis trotzen kannst.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_05"); //Es geht um den Einsiedler Halfmar. Bislang kam er selten, jedoch regelmäßig ins unser Dorf und überbrachte mir Kräuter und Pflanzen welche er in der Wildnis fand.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_06"); //Sein letzter Besuch liegt jedoch weit länger zurück, als es üblich ist.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_07"); //Und ich beginne mir Sorgen zu machen ... (nachgeschoben) selbstverständlich nicht nur meiner Waren wegen.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_08"); //Er lebt fernab von hier im Süden. Ich wäre dir über die Maßen dankbar, wenn du nach dem Rechten sehen könntest.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_09"); //Nun, ich schaue, was sich machen lässt.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_01_10"); //Hab Dank. Es soll dir auch nicht zum Nachteil gedeihen.

	Log_CreateTopic	(TOPIC_MOD_ALFANS_HALFMAR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALFANS_HALFMAR, "Alfans bat mich darum nach dem Einsiedler Halfmar im Süden zu sehen. Dieser bringt Alfans für gewöhnlich Kräuter und Pflanzen, die er in der Wildnis findet. Sein letzter Besuch steht jedoch schon lange aus.");

	Mod_AlfansQuest_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Alfans_Halfmar (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Halfmar_Condition;
	information	= Info_Mod_Alfans_Halfmar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich war bei Halfmar.";
};

FUNC INT Info_Mod_Alfans_Halfmar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halfmar_HabKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Halfmar_Info()
{
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_00"); //Ich war bei Halfmar.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_01_01"); //Und, was ist mit ihm?
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_02"); //Er war erkrankt, ist jetzt jedoch auf dem Weg der Besserung.
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_03"); //In den nächsten Tagen sollte er dich besuchen.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_01_04"); //Ahh, sehr gut. Vielen Dank für die erfreuliche Nachricht.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_01_05"); //Und hier die versprochene Belohnung. Such dir einen Trank aus.

	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);

	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(Elixier des Geistes)", Info_Mod_Alfans_Halfmar_C);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(Trank des Geschicks)", Info_Mod_Alfans_Halfmar_B);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(Trank der Stärke)", Info_Mod_Alfans_Halfmar_A);
};

FUNC VOID Info_Mod_Alfans_Halfmar_Fertig()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_Fertig_01_00"); //Es war mir eine Freude. Ich hoffe, wir sehen uns bald wieder.

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);
};

FUNC VOID Info_Mod_Alfans_Halfmar_C()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Mana, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_B()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Dex, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_A()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Str, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

INSTANCE Info_Mod_Alfans_Trade (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Trade_Condition;
	information	= Info_Mod_Alfans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Alfans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Alfans_Pickpocket (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Pickpocket_Condition;
	information	= Info_Mod_Alfans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Alfans_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_BACK, Info_Mod_Alfans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alfans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alfans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alfans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alfans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alfans_EXIT (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_EXIT_Condition;
	information	= Info_Mod_Alfans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alfans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};