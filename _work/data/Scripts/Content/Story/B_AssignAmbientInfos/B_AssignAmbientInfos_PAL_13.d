// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE Info_Mod_PAL_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_Mod_PAL_13_EXIT_Condition;
	information	= Info_Mod_PAL_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Mod_PAL_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Info_Mod_PAL_13_EXIT_Info()
{	
	AI_Output(self, hero, "Info_Mod_PAL_13_EXIT_13_00"); //Für Innos!
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE Info_Mod_PAL_13_Trank(C_INFO)
{
	nr			= 3;
	condition	= Info_Mod_PAL_13_Trank_Condition;
	information	= Info_Mod_PAL_13_Trank_Info;
	permanent	= TRUE;
	description = "Hier hast du einen Trank.";
};                       

FUNC INT Info_Mod_PAL_13_Trank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (Npc_HasItems(hero, ItPo_Health_02) > 0)
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Health < 10)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_PAL_13_Trank_Info()
{	
	AI_Output (hero, self, "Info_Mod_PAL_13_Trank_15_00"); //Hier hast du einen Trank.

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);
	AI_UseItem	(self, ItPo_Health_02);

	Mod_FM_TrankCounter_Health += 1;

	AI_Output (self, hero, "Info_Mod_PAL_13_Trank_13_01"); //Danke.

	self.aivar[AIV_TrankBekommen] = TRUE;
};

INSTANCE Info_Mod_PAL_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PAL_13_Pickpocket_Condition;
	information	= Info_Mod_PAL_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_PAL_13_Pickpocket_Condition()
{
	C_Beklauen	(150+r_max(30), ItMi_Gold, 1000+r_max(500));
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

	Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_BACK, Info_Mod_PAL_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PAL_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

		Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_PAL_13_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_PAL_13_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_PAL_13_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_13 (var c_NPC slf)
{
	Info_Mod_PAL_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_13_Trank.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
