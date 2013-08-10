// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Eis_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Eis_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Eis_6_EXIT_Condition;
	information	= Info_Eis_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Eis_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Eis_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								GotoThys
// *************************************************************************

INSTANCE Info_Eis_6_GoToThys (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Eis_6_GoToThys_Condition;
	information	= Info_Eis_6_GoToThys_Info;
	permanent	= 0;
	important = 1;
};                       

FUNC INT Info_Eis_6_GoToThys_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thys_Zauber))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID Info_Eis_6_GoToThys_Info()
{
	AI_Output(self, hero, "Info_Eis_6_GoToThys_06_00"); //Was willst du?

	Info_ClearChoices	(Info_Eis_6_GoToThys);

	Info_AddChoice	(Info_Eis_6_GoToThys, "Hast du Lust, eine kleine Spritztour mit mir zu machen?", Info_Eis_6_GoToThys_B);
	Info_AddChoice	(Info_Eis_6_GoToThys, "Thys verlangt nach dir. Ich würde mich sofort auf den Weg machen.", Info_Eis_6_GoToThys_A);
};

FUNC VOID Info_Eis_6_GotoThys_B()
{
	AI_Output(hero, self, "Info_Eis_6_GotoThys_B_15_00"); //Hast du Lust, eine kleine Spritztour mit mir zu machen?
	AI_Output(self, hero, "Info_Eis_6_GotoThys_B_06_01"); //Wohin soll's denn gehen?
	AI_Output(hero, self, "Info_Eis_6_GotoThys_B_15_02"); //Wie wäre es, wenn wir zur Hütte von Thys laufen?
	AI_Output(self, hero, "Info_Eis_6_GotoThys_B_06_03"); //Meinetwegen, aber ich werde erst zu ihm gehen, wenn er Zeit hat.

	Info_ClearChoices	(Info_Eis_6_GotoThys);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATTHYS");
	B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "ATTHYS");

	VMG_Second = 9;
};

FUNC VOID Info_Eis_6_GotoThys_A()
{
	AI_Output(hero, self, "Info_Eis_6_GotoThys_A_15_00"); //Thys verlangt nach dir. Ich würde mich sofort auf den Weg machen.
	AI_Output(self, hero, "Info_Eis_6_GotoThys_A_06_01"); //Ja ... na klar. Ich mache mich sofort auf den Weg, sobald er Zeit hat.

	Info_ClearChoices	(Info_Eis_6_GotoThys);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATTHYS");
	B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "ATTHYS");

	VMG_Second = 9;
};

INSTANCE Info_Eis_6_AlvarDead (C_INFO) // E1
{
	nr		= 1;
	condition	= Info_Eis_6_AlvarDead_Condition;
	information	= Info_Eis_6_AlvarDead_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Eis_6_AlvarDead_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Serra_AlvarTagebuch))
	&& (Wld_GetDay() > Mod_SeraHatBuch)
	&& (Mod_AlvarDead == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Eis_6_AlvarDead_Info()
{
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_00"); //Hast du schon gehört? Alvar wurde tot auf dem Hang eines Berges gesehen.
	AI_Output(hero, self, "Info_Eis_6_AlvarDead_15_01"); //Was?! Wie ist das geschehen?
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_02"); //Tja, die Schneegeister müssen ihn wohl erwischt haben. Geschieht ihm aber im Grunde genommen recht.
	AI_Output(hero, self, "Info_Eis_6_AlvarDead_15_03"); //Warum das?
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_04"); //Er war doch ein ganz schlimmer Mensch. Oft genug hat man davon gehört, was er wieder verbrochen hatte.
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_05"); //Sogar an Frauen soll er sich vergriffen haben. Dieses Schwein.
	AI_Output(hero, self, "Info_Eis_6_AlvarDead_15_06"); //Über ihn wurde schlimmes berichtet? Von wem weißt du das mit den Frauen?
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_07"); //Ach, da er ja jetzt tot ist, kann ich es ruhig erzählen.
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_08"); //Es waren Serra und Malfama, denen er nachstellte und welche bedrohte. Nicht vorzustellen, oder?
	AI_Output(hero, self, "Info_Eis_6_AlvarDead_15_09"); //(zu sich selbst) Kommt mir bekannt vor.
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_10"); //Die zwei freundlichsten und gutmütigsten Frauen des ganzen Dorfes durch dieses Schwein bedrängt.
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_11"); //Ha, die Rechnung bekam er dann auch am Marktplatz. Da hat ihm keiner mehr etwas verkauft.
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_12"); //Achja, es kommt noch besser. Man hat sein Tagebuch gefunden, in welchem seine Missetaten aufgeführt sind.
	AI_Output(hero, self, "Info_Eis_6_AlvarDead_15_13"); //Das Tagebuch? Wo ist es?
	AI_Output(self, hero, "Info_Eis_6_AlvarDead_06_14"); //Man brachte es zum Dorfältesten Thys, damit er sich davon überzeugen kann.

	Mod_AlvarDead = 1;

	B_StartOtherRoutine	(Mod_7561_OUT_Alvar_EIS, "TOT");
};

INSTANCE Info_Mod_Eis_6_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_Eis_6_Pickpocket_Condition;
	information	= Info_Mod_Eis_6_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Eis_6_Pickpocket_Condition()
{
	C_Beklauen	(90 + r_max(30), ItMi_Gold, 35 + r_max(10));
};

FUNC VOID Info_Mod_Eis_6_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Eis_6_Pickpocket);

	Info_AddChoice	(Info_Mod_Eis_6_Pickpocket, DIALOG_BACK, Info_Mod_Eis_6_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Eis_6_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Eis_6_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Eis_6_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Eis_6_Pickpocket);
};

FUNC VOID Info_Mod_EIS_6_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);

		Info_AddChoice	(Info_Mod_EIS_6_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_EIS_6_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_EIS_6_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_EIS_6_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_EIS_6_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_EIS_6_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_EIS_6_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_EIS_6_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_EIS_6_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_EIS_6_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Eis_6(var c_NPC slf)
{
	Info_Eis_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Eis_6_GoToThys.npc	= Hlp_GetInstanceID(slf);
	Info_Eis_6_AlvarDead.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_Eis_6_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
