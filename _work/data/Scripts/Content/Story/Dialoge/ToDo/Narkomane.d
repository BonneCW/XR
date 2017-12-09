INSTANCE Info_Mod_Narkomane_Teutonica (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_Teutonica_Condition;
	information	= Info_Mod_Narkomane_Teutonica_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Narkomane_Teutonica_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Narkomane_Teutonica_Info()
{
	AI_Output(self, hero, "Info_Mod_Narkomane_Teutonica_14_00"); //(zugedröhnt) ... die Klippen ... das große, böse Monster ... haha, alte Ruinen ... große Grashüpfer ... aufrecht mit lauter Schuppen ... Schuppen, wie Fische ...

	if (Mod_NL_Teutonica >= 1)
	{
		AI_Output(self, hero, "Info_Mod_Narkomane_Teutonica_14_01"); // ... 100 Meter südöstlich wo gelandet ... alle aufgemampft ...
	};
};

INSTANCE Info_Mod_Narkomane_Pickpocket (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_Pickpocket_Condition;
	information	= Info_Mod_Narkomane_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Narkomane_Pickpocket_Condition()
{
	C_Beklauen	(11, ItMi_Gold, 11);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

	Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_BACK, Info_Mod_Narkomane_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Narkomane_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

		Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Narkomane_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Narkomane_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Narkomane_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Narkomane_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Narkomane_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Narkomane_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Narkomane_EXIT (C_INFO)
{
	npc		= Mod_7424_OUT_Narkomane_REL;
	nr		= 1;
	condition	= Info_Mod_Narkomane_EXIT_Condition;
	information	= Info_Mod_Narkomane_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Narkomane_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Narkomane_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};