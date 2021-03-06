INSTANCE Info_Mod_Pardos_Unheil (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_Unheil_Condition;
	information	= Info_Mod_Pardos_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. du siehst mitgenommen aus.";
};

FUNC INT Info_Mod_Pardos_Unheil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Unheil))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pardos_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Pardos_Unheil_15_00"); //Hallo. du siehst mitgenommen aus.
	AI_Output(self, hero, "Info_Mod_Pardos_Unheil_03_01"); //(verst�rt) Gro�, wie ein Haus, ein Flammemeer, Schreie, brennende Leiber. Mitgenommen?! Nur mein Leben.
	AI_Output(self, hero, "Info_Mod_Pardos_Unheil_03_02"); //Alles verbrannt zerst�rt, verw�stet, von D�monenhand, was hereinbrach, wie aus dem Nichts ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Pardos_Pickpocket (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_Pickpocket_Condition;
	information	= Info_Mod_Pardos_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Pardos_Pickpocket_Condition()
{
	C_Beklauen	(33, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

	Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_BACK, Info_Mod_Pardos_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Pardos_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

		Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Pardos_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Pardos_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Pardos_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Pardos_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Pardos_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Pardos_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Pardos_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Pardos_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Pardos_EXIT (C_INFO)
{
	npc		= Mod_108_BAU_Pardos_NW;
	nr		= 1;
	condition	= Info_Mod_Pardos_EXIT_Condition;
	information	= Info_Mod_Pardos_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pardos_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pardos_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};