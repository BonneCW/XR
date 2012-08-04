// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_10_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_10 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_10_EXIT_Condition;
	information	= Info_Stt_10_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Stt_10_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Stt_10_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Stt_10_EinerVonEuchWerden_Condition;
	information	= Info_Stt_10_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will ein Gardist werden.";
};                       

FUNC INT Info_Stt_10_EinerVonEuchWerden_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //Ich will ein Gardist werden.
	AI_Output(self,hero,"Info_Stt_10_EinerVonEuchWerden_10_01"); //So? Hast du schon mit Thorus geredet?
	
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden, "Nein.", Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden, "Ja.", Info_Stt_10_EinerVonEuchWerden_Ja);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(hero,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Bis jetzt noch nicht.
	AI_Output(self,hero,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Dann mach das, du findest ihn am Eingang der Burg.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(hero,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Ja, habe ich.
	AI_Output(self,hero,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //Gut. Tu einfach, was er sagt. Das hat mir auch nicht geschadet. Jedenfalls nicht wirklich.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Stt_10_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Stt_10_WichtigePersonen_Condition;
	information	= Info_Stt_10_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wen von den Leuten hier sollte ich kennen?";
};                       

FUNC INT Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Stt_10_WichtigePersonen_15_00"); //Wen von den Leuten hier sollte ich kennen?
	AI_Output(self,hero,"Info_Stt_10_WichtigePersonen_10_01"); //Wenn du mal Probleme mit den Gardisten hast, geh zu Gravo. Du findest ihn am Waschplatz beim Burgtor. Er kümmert sich um Leute, die Ärger haben. Besonders bei Neuen passiert das hier schneller, als du denkst.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Stt_10_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Stt_10_DasLager_Condition;
	information	= Info_Stt_10_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir über das Lager sagen?";
};                       

FUNC INT Info_Stt_10_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DasLager_Info()
{
	AI_Output(hero,self,"Info_Stt_10_DasLager_15_00"); //Was kannst du mir über das Lager sagen?
	AI_Output(self,hero,"Info_Stt_10_DasLager_10_01"); //Am interessantesten hier ist wohl der Marktplatz. Wenn du mal was Bestimmtes suchst - da kriegst du fast alles.
	AI_Output(self,hero,"Info_Stt_10_DasLager_10_02"); //Es ist der Platz unter dem großen Dach im Süden des äußeren Rings.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Stt_10_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Stt_10_DieLage_Condition;
	information	= Info_Stt_10_DieLage_Info;
	permanent	= 1;
	description = "Hi!";
};                       

FUNC INT Info_Stt_10_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DieLage_Info()
{
	AI_Output(hero,self,"Info_Stt_10_DieLage_15_00"); //Hi!
	AI_Output(self,hero,"Info_Stt_10_DieLage_10_01"); //Was willst du?
};

INSTANCE Info_Mod_STT_10_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_STT_10_Pickpocket_Condition;
	information	= Info_Mod_STT_10_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_STT_10_Pickpocket_Condition()
{
	C_Beklauen	(60+r_max(30), ItMi_Gold, 200+r_max(100));
};

FUNC VOID Info_Mod_STT_10_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);

	Info_AddChoice	(Info_Mod_STT_10_Pickpocket, DIALOG_BACK, Info_Mod_STT_10_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_STT_10_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_STT_10_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_STT_10_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);
};

FUNC VOID Info_Mod_STT_10_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);

		Info_AddChoice	(Info_Mod_STT_10_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_STT_10_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_STT_10_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_STT_10_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_STT_10_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_STT_10_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_STT_10_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_STT_10_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_STT_10_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_STT_10_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_10(var c_NPC slf)
{
	Info_Stt_10_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_STT_10_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
