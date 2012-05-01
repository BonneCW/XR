// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_4_EXIT_Condition;
	information	= DIA_PAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_4_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_4_JOIN_Condition;
	information	= DIA_PAL_4_JOIN_Info;
	permanent	= TRUE;
	description = "Wie werde ich Paladin?";
};                       

FUNC INT DIA_PAL_4_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_PAL_4_JOIN_15_00"); //Wie werde ich Paladin?
	AI_Output (self, hero, "DIA_PAL_4_JOIN_04_01"); //Wenn es dir wirklich ernst ist, solltest du dich in den Dienst der Paladine stellen.
	AI_Output (self, hero, "DIA_PAL_4_JOIN_04_02"); //Geh zur Kaserne und rede mit Lord Andre. Lass dich in die Miliz aufnehmen.
	AI_Output (self, hero, "DIA_PAL_4_JOIN_04_03"); //Vielleicht bekommst du dann eine Chance, dich als würdig zu erweisen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_4_PEOPLE_Condition;
	information	= DIA_PAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Wer hat hier das Kommando?";
};                       

FUNC INT DIA_PAL_4_PEOPLE_Condition()
{
	if (Mod_Gilde != 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_PAL_4_PEOPLE_15_00"); //Wer hat hier das Kommando?
	AI_Output (self, hero, "DIA_PAL_4_PEOPLE_04_01"); //Lord Hagen ist der Oberbefehlshaber über alle Truppen auf der Insel.
	AI_Output (self, hero, "DIA_PAL_4_PEOPLE_04_02"); //Aber er ist sehr beschäftigt. Wenn du etwas zu klären hast, geh zur Kaserne und rede mit Lord Andre.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_4_LOCATION_Condition;
	information	= DIA_PAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Was macht ihr Paladine hier in Khorinis?";
};                       

FUNC INT DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_PAL_4_LOCATION_15_00"); //Was macht ihr Paladine hier in Khorinis?
	AI_Output (self, hero, "DIA_PAL_4_LOCATION_04_01"); //Ich bin nicht befugt, dir das zu sagen.
};

INSTANCE Info_Mod_PAL_4_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PAL_4_Pickpocket_Condition;
	information	= Info_Mod_PAL_4_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_PAL_4_Pickpocket_Condition()
{
	C_Beklauen	(90, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);

	Info_AddChoice	(Info_Mod_PAL_4_Pickpocket, DIALOG_BACK, Info_Mod_PAL_4_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PAL_4_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PAL_4_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);

		Info_AddChoice	(Info_Mod_PAL_4_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_PAL_4_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_PAL_4_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_PAL_4_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_PAL_4_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_PAL_4_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_PAL_4_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_PAL_4_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_4 (var c_NPC slf)
{
	DIA_PAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_4_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
