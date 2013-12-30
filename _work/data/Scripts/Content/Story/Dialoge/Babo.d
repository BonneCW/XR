INSTANCE Info_Mod_Babo_Hi (C_INFO)
{
	npc		= Mod_914_NOV_Babo_NW;
	nr		= 1;
	condition	= Info_Mod_Babo_Hi_Condition;
	information	= Info_Mod_Babo_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schlechte Laune?";
};

FUNC INT Info_Mod_Babo_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Babo_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Babo_Hi_15_00"); //Schlechte Laune?
	AI_Output(self, hero, "Info_Mod_Babo_Hi_36_01"); //(niedergeschlagen) Ja. Sieht man doch.
	AI_Output(hero, self, "Info_Mod_Babo_Hi_15_02"); //Was gibt's?
	AI_Output(self, hero, "Info_Mod_Babo_Hi_36_03"); //Verdammt, jemand hat sich an meiner Truhe zu schaffen gemacht und mir ein wichtiges Stück Papier gestohlen.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_36_04"); //Das Einzige, was das Novizenleben hier im Kloster noch erträglich gemacht hat.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_36_05"); //Aber ich hab keinen Schimmer, wer das getan haben könnte. Ärgern tun sie mich alle, sogar die Magier.

	Info_ClearChoices	(Info_Mod_Babo_Hi);

	Info_AddChoice	(Info_Mod_Babo_Hi, "(auslachen)", Info_Mod_Babo_Hi_B);
	Info_AddChoice	(Info_Mod_Babo_Hi, "Was ist das für ein Gegenstand? Soll ich die Augen offen halten?", Info_Mod_Babo_Hi_A);
};

FUNC VOID Info_Mod_Babo_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Babo_Hi_B_15_00"); //(auslachen)
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Babo_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Babo_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Babo_Hi_A_15_00"); //Was ist das für ein Gegenstand? Soll ich die Augen offen halten?
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_01"); //(panisch) Um Innos' Willen, nein! Das ist sehr privat.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_02"); //Ich hätte dir gar nichts erzählen dürfen...
	AI_Output(hero, self, "Info_Mod_Babo_Hi_A_15_03"); //Willst du nicht mal ein wenig an die frische Luft?
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_04"); //Das habe ich den Magiern schon oft gesagt. Aber sie wählen mich nie für die Botengänge aus.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_05"); //Ich darf fegen und den Wein stampfen, bis mir schlecht wird. Und das war's.
	AI_Output(hero, self, "Info_Mod_Babo_Hi_A_15_06"); //Ich könnte ein gutes Wort bei den Magiern für dich einlegen...
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_07"); //(argwöhnisch) Warum so hilfsbereit? Willst du mich auf den Arm nehmen, oder was?
	AI_Output(hero, self, "Info_Mod_Babo_Hi_A_15_08"); //Ich biete es nur an.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_A_36_09"); //Hast du ein Stück Kohle? Dann könnte ich mir die Zeichnung aus dem Gedächtnis wieder anfertigen.

	Info_ClearChoices	(Info_Mod_Babo_Hi);

	Info_AddChoice	(Info_Mod_Babo_Hi, "Gerade nicht.", Info_Mod_Babo_Hi_D);

	if (Npc_HasItems(hero, ItMi_Coal) >= 1) {
		Info_AddChoice	(Info_Mod_Babo_Hi, "Klar, hier hast du es.", Info_Mod_Babo_Hi_C);
	};
};

FUNC VOID Info_Mod_Babo_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Babo_Hi_D_15_00"); //Gerade nicht.
	AI_Output(self, hero, "Info_Mod_Babo_Hi_D_36_01"); //Schade...

	Info_ClearChoices	(Info_Mod_Babo_Hi);
};

FUNC VOID Info_Mod_Babo_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Babo_Hi_C_15_00"); //Klar, hier hast du es.

	B_GiveInvItems	(hero, self, ItMi_Coal, 1);

	AI_Output(self, hero, "Info_Mod_Babo_Hi_C_36_01"); //Danke, wenigstens etwas.

	B_GivePlayerXP	(50);

	Info_ClearChoices	(Info_Mod_Babo_Hi);
};

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