INSTANCE Info_Mod_Bilgot_Hi (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_Hi_Condition;
	information	= Info_Mod_Bilgot_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Bilgot_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bilgot_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bilgot_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Bilgot_Hi_05_01"); //Hi.
};

INSTANCE Info_Mod_Bilgot_Mortis (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_Mortis_Condition;
	information	= Info_Mod_Bilgot_Mortis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mortis schickt mich.";
};

FUNC INT Info_Mod_Bilgot_Mortis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bilgot_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Mortis_Andre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bilgot_Mortis_Info()
{
	AI_Output(hero, self, "Info_Mod_Bilgot_Mortis_15_00"); //Mortis schickt mich. Ist bei dir alles in Ordnung?

	if (!Npc_KnowsInfo(hero, Info_Mod_Bartok_ArbeiteWieder))
	{
		AI_Output(self, hero, "Info_Mod_Bilgot_Mortis_05_01"); //Geh mal zu Bromor, ich glaube bei ihm gibt es Probleme.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Bilgot_Mortis_05_02"); //Bei mir ist alles in Ordnung.

		Mod_BilgotOK = 1;

		B_GivePlayerXP	(50);
	};
};

INSTANCE Info_Mod_Bilgot_OK (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_OK_Condition;
	information	= Info_Mod_Bilgot_OK_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Sache ist erledigt.";
};

FUNC INT Info_Mod_Bilgot_OK_Condition()
{
	if (Mod_BilgotOK == 0)
	&& (Mod_BilgotBromorBartok == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Bromor_Bartok))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bilgot_OK_Info()
{
	AI_Output(hero, self, "Info_Mod_Bilgot_OK_15_00"); //Die Sache ist erledigt.
	AI_Output(self, hero, "Info_Mod_Bilgot_OK_05_01"); //Gut, dann ist bei mir jetzt alles in Ordnung.

	Mod_BilgotOK = 1;

	B_LogEntry	(TOPIC_MOD_MORTIS_KONTROLLE, "Bei Bilgot ist alles in Ordnung.");

	B_Göttergefallen(1, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Bilgot_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_AndreVermaechtnis_Condition;
	information	= Info_Mod_Bilgot_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bilgot_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis6))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bilgot_AndreVermaechtnis_Info()
{
	AI_TurnToNpc	(self, Mod_583_NONE_Hanna_NW);

	AI_Output(self, hero, "Info_Mod_Bilgot_AndreVermaechtnis_05_00"); //Warte nur, dass wird ein Nachspiel für dich haben.
	AI_Output(self, hero, "Info_Mod_Bilgot_AndreVermaechtnis_05_01"); //Leute, die mit Verbrechern zusammenarbeiten, bekommen die volle Härte des Gesetzes zu spüren.

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Bilgot_AndreVermaechtnis_05_02"); //(bemerkt den Helden) Ohh, da bist du ja. Diese Türe hier führt zu der Diebesbande.
	AI_Output(self, hero, "Info_Mod_Bilgot_AndreVermaechtnis_05_03"); //Den Rest hat dir Lord Hagen vermutlich schon erklärt.
	AI_Output(self, hero, "Info_Mod_Bilgot_AndreVermaechtnis_05_04"); //Ich werde hier oben bleiben und aufpassen, dass ja keiner entkommt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Bilgot_Pickpocket (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_Pickpocket_Condition;
	information	= Info_Mod_Bilgot_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Bilgot_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 175);
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);

	Info_AddChoice	(Info_Mod_Bilgot_Pickpocket, DIALOG_BACK, Info_Mod_Bilgot_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bilgot_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bilgot_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);

		Info_AddChoice	(Info_Mod_Bilgot_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bilgot_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bilgot_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bilgot_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bilgot_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bilgot_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bilgot_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bilgot_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bilgot_EXIT (C_INFO)
{
	npc		= Mod_968_MIL_Bilgot_NW;
	nr		= 1;
	condition	= Info_Mod_Bilgot_EXIT_Condition;
	information	= Info_Mod_Bilgot_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bilgot_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};