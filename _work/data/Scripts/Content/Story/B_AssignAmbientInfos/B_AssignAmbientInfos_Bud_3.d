// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bud_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bud_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bud_3_EXIT_Condition;
	information	= Info_Bud_3_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Bud_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Bud_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Bud_3_EinerVonEuchWerden_Condition;
	information	= Info_Bud_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich mich diesem Lager anschliessen?";
};                       

FUNC INT Info_Bud_3_EinerVonEuchWerden_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Bud_3_EinerVonEuchWerden_Info()
{
	AI_Output(hero,self,"Info_Bud_3_EinerVonEuchWerden_15_00"); //Wie kann ich mich diesem Lager anschlie�en?
	AI_Output(self,hero,"Info_Bud_3_EinerVonEuchWerden_03_01"); //Ich bin nur ein Buddler. Wir haben hier gar nichts zu sagen. Du solltest mit den Gardisten oder mit den Schatten reden.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bud_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bud_3_WichtigePersonen_Condition;
	information	= Info_Bud_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer ist hier der Boss?";
};                       

FUNC INT Info_Bud_3_WichtigePersonen_Condition()
{
	if (Schatten_Dabei == FALSE)
	&& (Gardist_Dabei == FALSE)
	&& (Erzbaron_Dabei == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Bud_3_WichtigePersonen_Info()
{
	AI_Output(hero,self,"Info_Bud_3_WichtigePersonen_15_00"); //Wer ist hier der Boss?
	AI_Output(self,hero,"Info_Bud_3_WichtigePersonen_03_01"); //Thorus. Er lebt in der Burg. Aber wir Buddler haben immer nur mit seinen Gardisten zu tun.
	AI_Output(self,hero,"Info_Bud_3_WichtigePersonen_03_02"); //Am besten ist es, wenn sie dich gar nicht bemerken. Sobald du hier auff�llst, hast du ein Problem.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bud_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bud_3_DasLager_Condition;
	information	= Info_Bud_3_DasLager_Info;
	permanent	= 1;
	description = "Was gibt es hier f�r wichtige Orte?";
};                       

FUNC INT Info_Bud_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_3_DasLager_Info()
{
	AI_Output(hero,self,"Info_Bud_3_DasLager_15_00"); //Was gibt es hier f�r wichtige Orte?
	AI_Output(self,hero,"Info_Bud_3_DasLager_03_01"); //Nun, wenn du wetten willst, geh abends in die Arena. Wenn du Sachen kaufen willst, gehst du am besten zum Marktplatz.
	AI_Output(self,hero,"Info_Bud_3_DasLager_03_02"); //Da kriegt du fast alles. Au�er Karten. Wenn du Karten kaufen willst, geh zu Graham. Seine H�tte ist schr�g gegen�ber dem Burgtor.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bud_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bud_3_DieLage_Condition;
	information	= Info_Bud_3_DieLage_Info;
	permanent	= 1;
	description = "Wie steht's?";
};                       

FUNC INT Info_Bud_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bud_3_DieLage_Info()
{
	AI_Output(hero,self,"Info_Bud_3_DieLage_15_00"); //Wie steht's?
	AI_Output(self,hero,"Info_Bud_3_DieLage_03_01"); //Du wirst es auch noch lernen. Immer wachsam bleiben. Selbst nachts.
	AI_Output(self,hero,"Info_Bud_3_DieLage_03_02"); //Ich habe schon seit Tagen nicht mehr richtig geschlafen. Und wer hier nicht schl�ft, sitzt die doppelte Zeit ab!
};

INSTANCE Info_Mod_BUD_3_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_BUD_3_Pickpocket_Condition;
	information	= Info_Mod_BUD_3_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_BUD_3_Pickpocket_Condition()
{
	C_Beklauen	(8 + r_max(12), ItMi_Gold, 10 + r_max(5));
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);

	Info_AddChoice	(Info_Mod_BUD_3_Pickpocket, DIALOG_BACK, Info_Mod_BUD_3_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_BUD_3_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_BUD_3_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);

		Info_AddChoice	(Info_Mod_BUD_3_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_BUD_3_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_BUD_3_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_BUD_3_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_BUD_3_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_BUD_3_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_BUD_3_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_BUD_3_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bud_3(var c_NPC slf)
{
	Info_Bud_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bud_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Bud_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bud_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bud_3_DieLage.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_BUD_3_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
