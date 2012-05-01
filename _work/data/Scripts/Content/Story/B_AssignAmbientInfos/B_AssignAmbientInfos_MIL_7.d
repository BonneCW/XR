// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_MIL_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_MIL_7_EXIT_Condition;
	information	= DIA_MIL_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_MIL_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_MIL_7_JOIN_Condition;
	information	= DIA_MIL_7_JOIN_Info;
	permanent	= TRUE;
	description = "Ich will der Miliz beitreten!";
};                       

FUNC INT DIA_MIL_7_JOIN_Condition()
{
	if (Mod_Gilde == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_MIL_7_JOIN_Info()
{	
	AI_Output (hero, self, "DIA_MIL_7_JOIN_15_00"); //Ich will der Miliz beitreten!
	AI_Output (self, hero, "DIA_MIL_7_JOIN_07_01"); //Warum, denkst du, sollte dich Lord Andre aufnehmen?
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_MIL_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_MIL_7_PEOPLE_Condition;
	information	= DIA_MIL_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Was weißt du über die Paladine?";
};                       

FUNC INT DIA_MIL_7_PEOPLE_Condition()
{
	if (Mod_Gilde != 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MIL_7_PEOPLE_Info()
{	
	AI_Output (hero, self, "DIA_MIL_7_PEOPLE_15_00"); //Was weißt du über die Paladine?
	AI_Output (self, hero, "DIA_MIL_7_PEOPLE_07_01"); //Nicht viel. Keiner weiß so genau, warum sie hier sind. Auch wir von der Stadtwache nicht.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_MIL_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_MIL_7_LOCATION_Condition;
	information	= DIA_MIL_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Was habe ich hier in der Stadt für Möglichkeiten?";
};                       

FUNC INT DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_MIL_7_LOCATION_Info()
{	
	AI_Output (hero, self, "DIA_MIL_7_LOCATION_15_00"); //Was habe ich hier in der Stadt für Möglichkeiten?
	AI_Output (self, hero, "DIA_MIL_7_LOCATION_07_01"); //Wenn du nicht im Hafenviertel in der Gosse enden willst, such dir 'ne ordentliche Arbeit. Frag in der Unterstadt herum - vielleicht hast du Glück.
	AI_Output (self, hero, "DIA_MIL_7_LOCATION_07_02"); //Wenn du vorhast, länger hier in der Stadt zu bleiben, solltest du der Miliz beitreten oder dich zumindest im Kampf ausbilden lassen.
	AI_Output (self, hero, "DIA_MIL_7_LOCATION_07_03"); //Die Kampfausbilder in der Kaserne trainieren auch normale Bürger.
};

INSTANCE Info_Mod_MIL_7_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_MIL_7_Pickpocket_Condition;
	information	= Info_Mod_MIL_7_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_MIL_7_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 170);
};

FUNC VOID Info_Mod_MIL_7_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_MIL_7_Pickpocket);

	Info_AddChoice	(Info_Mod_MIL_7_Pickpocket, DIALOG_BACK, Info_Mod_MIL_7_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_MIL_7_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_MIL_7_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_MIL_7_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_MIL_7_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_MIL_7 (var c_NPC slf)
{
	DIA_MIL_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	Info_Mod_MIL_7_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
