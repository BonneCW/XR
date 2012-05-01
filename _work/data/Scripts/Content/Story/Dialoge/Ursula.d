INSTANCE Info_Mod_Ursula_Hi (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_Hi_Condition;
	information	= Info_Mod_Ursula_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ursula_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ursula_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Ursula_Hi_17_00"); //Schau dich doch mal um! Ich bin die Gerberin.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Ursula, die Gerberin, kann mit mir handeln.");
};

INSTANCE Info_Mod_Ursula_Aufgabe (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_Aufgabe_Condition;
	information	= Info_Mod_Ursula_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Suchst du noch Felle?";
};

FUNC INT Info_Mod_Ursula_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ursula_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ursula_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Ursula_Aufgabe_15_00"); //Suchst du noch Felle?
	AI_Output(self, hero, "Info_Mod_Ursula_Aufgabe_17_01"); //Sicher doch! Ich nehme dir deine Felle für gute Preise ab, ist immer noch günstiger, als wenn ich sie bei den Wucherern vom Marktplatz kaufe.
	AI_Output(self, hero, "Info_Mod_Ursula_Aufgabe_17_02"); //Ich benötige auch noch dringend Schafsfelle. Davon gibt's nämlich hier nur wenige.
	AI_Output(self, hero, "Info_Mod_Ursula_Aufgabe_17_03"); //Für 15 Schafsfelle würde ich dir eine großzügige Belohnung auszahlen. Was meinst du?

	Info_ClearChoices	(Info_Mod_Ursula_Aufgabe);

	Info_AddChoice	(Info_Mod_Ursula_Aufgabe, "Das wäre mir zu anstrengend.", Info_Mod_Ursula_Aufgabe_B);
	Info_AddChoice	(Info_Mod_Ursula_Aufgabe, "Ich kümmere mich darum.", Info_Mod_Ursula_Aufgabe_A);
};

FUNC VOID Info_Mod_Ursula_Aufgabe_B()
{
	AI_Output(hero, self, "Info_Mod_Ursula_Aufgabe_B_15_00"); //Das wäre mir zu anstrengend.

	Info_ClearChoices	(Info_Mod_Ursula_Aufgabe);
};

FUNC VOID Info_Mod_Ursula_Aufgabe_A()
{
	AI_Output(hero, self, "Info_Mod_Ursula_Aufgabe_A_15_00"); //Ich kümmere mich darum.
	AI_Output(self, hero, "Info_Mod_Ursula_Aufgabe_A_17_01"); //(ironisch) Aber nicht wildern gehen, klar?
	AI_Output(hero, self, "Info_Mod_Ursula_Aufgabe_A_15_02"); //Würde ich nicht im Traum drauf kommen.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_SCHAFSFELLE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_SCHAFSFELLE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_SCHAFSFELLE, "Ursula, die Gerberin in Khorata, sucht dringend nach Schafsfellen. Für 15 Stück würde sie mich gut entlohnen.");

	Mod_Ursula_SchafsfellQuest = 1;

	Info_ClearChoices	(Info_Mod_Ursula_Aufgabe);
};

INSTANCE Info_Mod_Ursula_HabSchafsfelle (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_HabSchafsfelle_Condition;
	information	= Info_Mod_Ursula_HabSchafsfelle_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du deine Felle.";
};

FUNC INT Info_Mod_Ursula_HabSchafsfelle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ursula_Aufgabe))
	&& (Npc_HasItems(hero, ItAt_SheepFur)+Npc_HasItems(hero, ItAt_SheepFur_Rein)+Npc_HasItems(hero, ItAt_SheepFur_Feuer) >= 15)
	&& (Mod_Ursula_SchafsfellQuest == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ursula_HabSchafsfelle_Info()
{
	AI_Output(hero, self, "Info_Mod_Ursula_HabSchafsfelle_15_00"); //Hier hast du deine Felle.

	var int fellcounter;
	fellcounter = 0;

	fellcounter = Npc_HasItems(hero, ItAt_SheepFur);

	if (fellcounter >= 15)
	{
		B_GiveInvItems	(hero, self, ItAt_SheepFur, 15);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItAt_SheepFur, fellcounter);

		if (Npc_HasItems(hero, ItAt_SheepFur_Rein) >= 15-fellcounter)
		{
			B_GiveInvItems	(hero, self, ItAt_SheepFur_Rein, 15-fellcounter);
		}
		else
		{
			fellcounter += Npc_HasItems(hero, ItAt_SheepFur_Rein);

			B_GiveInvItems	(hero, self, ItAt_SheepFur_Rein, Npc_HasItems(hero, ItAt_SheepFur_Rein));
			B_GiveInvItems	(hero, self, ItAt_SheepFur_Feuer, 15-fellcounter);
		};
	};

	AI_Output(self, hero, "Info_Mod_Ursula_HabSchafsfelle_17_01"); //Das reicht, danke. Vielleicht hast du noch weiter Lust zu handeln ...?

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	B_LogEntry	(TOPIC_MOD_KHORATA_SCHAFSFELLE, "Ich habe die Felle übergeben und meine Bezahlung erhalten.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_SCHAFSFELLE, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Ursula_Trade (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_Trade_Condition;
	information	= Info_Mod_Ursula_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Ursula_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ursula_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ursula_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Ursula_Pickpocket (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_Pickpocket_Condition;
	information	= Info_Mod_Ursula_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ursula_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Ursula_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);

	Info_AddChoice	(Info_Mod_Ursula_Pickpocket, DIALOG_BACK, Info_Mod_Ursula_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ursula_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ursula_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ursula_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);
};

FUNC VOID Info_Mod_Ursula_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);

		Info_AddChoice	(Info_Mod_Ursula_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ursula_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ursula_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ursula_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ursula_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ursula_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ursula_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ursula_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ursula_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ursula_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ursula_EXIT (C_INFO)
{
	npc		= Mod_7423_OUT_Ursula_REL;
	nr		= 1;
	condition	= Info_Mod_Ursula_EXIT_Condition;
	information	= Info_Mod_Ursula_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ursula_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ursula_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};