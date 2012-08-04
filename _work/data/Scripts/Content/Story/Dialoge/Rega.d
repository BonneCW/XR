INSTANCE Info_Mod_Rega_Unheil (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_Unheil_Condition;
	information	= Info_Mod_Rega_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, schönes Kind.";
};

FUNC INT Info_Mod_Rega_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rega_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Rega_Unheil_15_00"); //Hallo, schönes Kind.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_01"); //Hallo, Wanderer? Was verschlägt euch an diesen finsteren Tagen hierhin?
	AI_Output(hero, self, "Info_Mod_Rega_Unheil_15_02"); //Och, ich wollte mich nur etwas umsehen und fragen, ob etwas Ungewohntes in den letzten Tagen und Wochen hier passiert ist.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_03"); //Ach, es ist einfach schrecklich. Dem Hof ist es dieses Jahr mehr als schlecht ergangen. Und jetzt noch diese Untoten auf dem Friedhof.
	AI_Output(self, hero, "Info_Mod_Rega_Unheil_17_04"); //Nimm es dann anderen nicht übel, wenn sie etwas unfreundlich erscheinen sollten. Aber diese Tage ist es sehr schwer.
};

INSTANCE Info_Mod_Rega_Pickpocket (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_Pickpocket_Condition;
	information	= Info_Mod_Rega_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Rega_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Rega_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

	Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_BACK, Info_Mod_Rega_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rega_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rega_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);
};

FUNC VOID Info_Mod_Rega_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rega_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

		Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rega_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rega_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rega_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rega_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rega_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rega_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rega_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rega_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rega_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rega_EXIT (C_INFO)
{
	npc		= Mod_104_BAU_Rega_NW;
	nr		= 1;
	condition	= Info_Mod_Rega_EXIT_Condition;
	information	= Info_Mod_Rega_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rega_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rega_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};