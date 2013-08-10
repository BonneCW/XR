// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_9_EXIT_Condition;
	information	= DIA_PAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_EXIT_Info()
{	
	AI_Output(self, hero, "DIA_PAL_9_EXIT_09_00"); //Möge Innos Feuer uns zum Sieg führen!

	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_9_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_9_JOIN_Condition;
	information	= DIA_PAL_9_JOIN_Info;
	permanent	= TRUE;
	description = "Wie kann ich Paladin werden?";
};                       

FUNC INT DIA_PAL_9_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_PAL_9_JOIN_15_00"); //Wie kann ich Paladin werden?
	AI_Output (self, hero, "DIA_PAL_9_JOIN_09_01"); //Diejenigen, die sich im Dienste Innos' oder des Königs würdig erweisen, werden erwählt!
	AI_Output (self, hero, "DIA_PAL_9_JOIN_09_02"); //Das heißt im Klartext: Nur die Besten werden genommen. Aber davon bist DU noch sehr weit entfernt, mein Junge!
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_9_PEOPLE_Condition;
	information	= DIA_PAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Kommando?";
};                       

FUNC INT DIA_PAL_9_PEOPLE_Condition()
{
	if (Mod_Gilde != 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_PAL_9_PEOPLE_15_00"); //Wer hat hier das Kommando?
	AI_Output (self, hero, "DIA_PAL_9_PEOPLE_09_01"); //Lord Hagen.
	AI_Output (hero, self, "DIA_PAL_9_PEOPLE_15_02"); //Und?
	AI_Output (self, hero, "DIA_PAL_9_PEOPLE_09_03"); //Und sonst niemand. Lord Hagen ist der Oberbefehlshaber über die ganze Insel.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_9_LOCATION_Condition;
	information	= DIA_PAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "Warum seid ihr Paladine nach Khorinis gekommen?";
};                       

FUNC INT DIA_PAL_9_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_PAL_9_LOCATION_15_00"); //Warum seid ihr Paladine nach Khorinis gekommen?
	AI_Output (self, hero, "DIA_PAL_9_LOCATION_09_01"); //Das geht dich nichts an, Bursche! Für dich muss es reichen zu wissen, dass wir im Dienste Innos' und des Königs handeln!
};

INSTANCE Info_Mod_PAL_9_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PAL_9_Pickpocket_Condition;
	information	= Info_Mod_PAL_9_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_PAL_9_Pickpocket_Condition()
{
	C_Beklauen	(90 + r_max(30), ItMi_Gold, 35 + r_max(10));
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);

	Info_AddChoice	(Info_Mod_PAL_9_Pickpocket, DIALOG_BACK, Info_Mod_PAL_9_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PAL_9_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PAL_9_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);

		Info_AddChoice	(Info_Mod_PAL_9_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_PAL_9_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_PAL_9_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_PAL_9_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_PAL_9_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_PAL_9_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_PAL_9_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_PAL_9_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_9 (var c_NPC slf)
{
	DIA_PAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_9_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
