INSTANCE Info_Mod_Pock_Hi (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_Hi_Condition;
	information	= Info_Mod_Pock_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Pock_Hi_Condition()
{
	if (Mod_LeftysBauern == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pock_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Pock_Hi_04_00"); //Hey, ich habe gehört, dass du Leftys Angebot abgeschlagen hast, uns Bauern zu verprügeln.
	AI_Output(self, hero, "Info_Mod_Pock_Hi_04_01"); //Hier, nimm diesen Schlüssel. Ich habe ihn mal im Morast des Reisfeldes gefunden. Der muss dem Reislord, oder einem seiner Schläger aus der Tasche gefallen sein.

	B_GiveInvItems	(self, hero, ItKe_ReislordVonPock, 1);

	B_GivePlayerXP	(250);

	Mod_Reislord_DayChecker = Wld_GetDay();

	Mod_LeftysBauern = 4;
};

INSTANCE Info_Mod_Pock_Pickpocket (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_Pickpocket_Condition;
	information	= Info_Mod_Pock_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Pock_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_OldCoin, 10);
};

FUNC VOID Info_Mod_Pock_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

	Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_BACK, Info_Mod_Pock_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pock_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pock_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);
};

FUNC VOID Info_Mod_Pock_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Pock_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

		Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Pock_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Pock_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Pock_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Pock_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Pock_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Pock_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Pock_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Pock_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Pock_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Pock_EXIT (C_INFO)
{
	npc		= Mod_1081_BAU_Pock_MT;
	nr		= 1;
	condition	= Info_Mod_Pock_EXIT_Condition;
	information	= Info_Mod_Pock_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pock_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};