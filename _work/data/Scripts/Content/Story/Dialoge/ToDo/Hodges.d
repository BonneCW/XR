INSTANCE Info_Mod_Hodges_Unheil (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_Unheil_Condition;
	information	= Info_Mod_Hodges_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist in letzter Zeit etwas Ungewöhnliches geschehen?";
};

FUNC INT Info_Mod_Hodges_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hodges_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_15_00"); //Ist in letzter Zeit etwas Ungewöhnliches geschehen?
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_03_01"); //Nun ja, z.B. die ganzen Ungeheuer, die sich hier auf den Höfen breit gemacht haben. Das ist schon etwas ungewöhnlich, würde ich sagen. Warum fragst du?

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);

	if (Mod_WM_Hexeninfos > 1)
	{
		Info_AddChoice	(Info_Mod_Hodges_Unheil, "Ich bin auf der Suche nach Hexen.", Info_Mod_Hodges_Unheil_B);
	};
	Info_AddChoice	(Info_Mod_Hodges_Unheil, "Nur so.", Info_Mod_Hodges_Unheil_A);
};

FUNC VOID Info_Mod_Hodges_Unheil_B()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_B_15_00"); //Ich bin auf der Suche nach Hexen.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_01"); //Was Hexen?! Und da fragst du noch?
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_B_15_02"); //Ja, weißt du etwas?
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_03"); //Ja, nicht weit hinter der Krypta in einer Höhle. Da hast du deine Hexe. Sagitta nennt sie sich.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_04"); //Die war mir noch nie geheuer. Sitzt alleine in der Einöde und macht bestimmt ihre finsteren Rituale.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_05"); //Verscheuchen sollte man sie. Dann würde bestimmt alles besser.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hodges äußerte die Überzeugung, dass Sagitta eine Hexe sei.");

	Mod_HinweiseDerBauernZuHexen += 1;

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);
};

FUNC VOID Info_Mod_Hodges_Unheil_A()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_A_15_00"); //Nur so.

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);
};

INSTANCE Info_Mod_Hodges_Pickpocket (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_Pickpocket_Condition;
	information	= Info_Mod_Hodges_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Hodges_Pickpocket_Condition()
{
	C_Beklauen	(16, ItMi_Gold, 12);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

	Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_BACK, Info_Mod_Hodges_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hodges_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

		Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hodges_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hodges_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hodges_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hodges_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hodges_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hodges_EXIT (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_EXIT_Condition;
	information	= Info_Mod_Hodges_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hodges_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hodges_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};