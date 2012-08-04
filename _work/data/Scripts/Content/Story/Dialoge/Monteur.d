INSTANCE Info_Mod_Monteur_Hi (C_INFO)
{
	npc		= Mod_7481_OUT_Monteur_REL;
	nr		= 1;
	condition	= Info_Mod_Monteur_Hi_Condition;
	information	= Info_Mod_Monteur_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie läuft die Arbeit?";
};

FUNC INT Info_Mod_Monteur_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Monteur_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Monteur_Hi_15_00"); //Wie läuft die Arbeit?
	AI_Output(self, hero, "Info_Mod_Monteur_Hi_06_01"); //Kann nicht klagen. Gibt genug zu tun, und die Bezahlung stimmt.
};

INSTANCE Info_Mod_Monteur_Endres (C_INFO)
{
	npc		= Mod_7481_OUT_Monteur_REL;
	nr		= 1;
	condition	= Info_Mod_Monteur_Endres_Condition;
	information	= Info_Mod_Monteur_Endres_Info;
	permanent	= 0;
	important	= 0;
	description	= "War Wendel zum Zeitpunkt von Endres' Tod bei dir?";
};

FUNC INT Info_Mod_Monteur_Endres_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Monteur_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Wendel_Endres06))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Monteur_Endres_Info()
{
	AI_Output(hero, self, "Info_Mod_Monteur_Endres_15_00"); //War Wendel zum Zeitpunkt von Endres' Tod bei dir?
	AI_Output(self, hero, "Info_Mod_Monteur_Endres_06_01"); //Ja, an dem Tag sind wir an den Leitungen entlang gegangen und haben sie auf Lecks untersucht.
	AI_Output(self, hero, "Info_Mod_Monteur_Endres_06_02"); //Wir waren die ganze Zeit zu zweit, abgesehen von den ganzen Passanten, die uns gesehen haben müssen.

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Wendels Alibi wird von seinem Assistenten bestätigt.");
};

INSTANCE Info_Mod_Monteur_Freudenspender (C_INFO)
{
	npc		= Mod_7481_OUT_Monteur_REL;
	nr		= 1;
	condition	= Info_Mod_Monteur_Freudenspender_Condition;
	information	= Info_Mod_Monteur_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Freudenspender gefällig?";
};                       

FUNC INT Info_Mod_Monteur_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Monteur_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Monteur_Freudenspender_15_00"); //Freudenspender gefällig?
	AI_Output(self, hero, "Info_Mod_Monteur_Freudenspender_06_01"); //Nö. Reicht das als Antwort?
};

INSTANCE Info_Mod_Monteur_Pickpocket (C_INFO)
{
	npc		= Mod_7481_OUT_Monteur_REL;
	nr		= 1;
	condition	= Info_Mod_Monteur_Pickpocket_Condition;
	information	= Info_Mod_Monteur_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Monteur_Pickpocket_Condition()
{
	C_Beklauen	(71, ItMi_Hammer, 1);
};

FUNC VOID Info_Mod_Monteur_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);

	Info_AddChoice	(Info_Mod_Monteur_Pickpocket, DIALOG_BACK, Info_Mod_Monteur_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Monteur_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Monteur_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Monteur_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);
};

FUNC VOID Info_Mod_Monteur_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);

		Info_AddChoice	(Info_Mod_Monteur_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Monteur_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Monteur_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Monteur_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Monteur_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Monteur_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Monteur_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Monteur_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Monteur_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Monteur_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Monteur_EXIT (C_INFO)
{
	npc		= Mod_7481_OUT_Monteur_REL;
	nr		= 1;
	condition	= Info_Mod_Monteur_EXIT_Condition;
	information	= Info_Mod_Monteur_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Monteur_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Monteur_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};