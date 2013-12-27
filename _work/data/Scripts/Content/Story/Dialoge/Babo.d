INSTANCE Info_Mod_Babo_Daemonisch (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch_Condition;
	information	= Info_Mod_Babo_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_UrnolKap4))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch_36_00"); //(verstört) Schwarzer Rauch aus seinem Schlund, schwarzer Rauch aus seinem Körper, Schreie ...
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_01"); //Nun, beruhige dich mal. Was genau ist passiert?
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch_36_02"); //(verstört) Kurz nachdem er die Kirche verließ ... nein, nein ...
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_03"); //Nein, viel mehr bekomme ich aus ihm nicht heraus.

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch_15_04"); //Ach jaa, in der Kirche war er zuletzt. Da sollte ich mich mal umhören.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Babo ist tatsächlich ziemlich verstört, berichtet von schwarzem Rauch aus dem Körper des Verstorbenen. Dyrian war zuvor offensichtlich noch in der Kirche gewesen ...");

	Mod_BaboVerwirrt_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Babo_Daemonisch2 (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch2_Condition;
	information	= Info_Mod_Babo_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Babo_Daemonisch))
	&& (Wld_GetDay() > Mod_BaboVerwirrt_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch2_36_00"); //Na, wie sieht’s aus?
	AI_Output(hero, self, "Info_Mod_Babo_Daemonisch2_15_01"); //Ähh, du bist wieder in Ordnung? Du hast mir doch solche Sachen erzählt ...
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch2_36_02"); //Ach, vergiss den Unsinn. Ich war einfach verwirrt über Dyrians Tod. Aber jetzt geht es mir wieder gut.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Komisch ... Babo scheint wieder voll beisammen zu sein und tut die Sachen, die er mir zuvor berichtet hatte, als Folge des Schocks über Dyrians Tod ab.");
};

INSTANCE Info_Mod_Babo_Daemonisch3 (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Daemonisch3_Condition;
	information	= Info_Mod_Babo_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Babo_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Babo_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Babo_Daemonisch3_36_00"); //Die schwarzen Schatten in der Höhle beim See ... ich muss sofort das Kloster davon in Kenntnis setzen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Babo_Pickpocket (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Pickpocket_Condition;
	information	= Info_Mod_Babo_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Babo_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Babo_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

	Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_BACK, Info_Mod_Babo_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Babo_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Babo_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);
};

FUNC VOID Info_Mod_Babo_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Babo_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

		Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Babo_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Babo_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Babo_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Babo_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Babo_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Babo_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Babo_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Babo_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Babo_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Babo_EXIT (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_EXIT_Condition;
	information	= Info_Mod_Babo_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Babo_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Babo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};