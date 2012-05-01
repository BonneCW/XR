INSTANCE Info_Mod_Omid_Urs (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_Urs_Condition;
	information	= Info_Mod_Omid_Urs_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo Koch. Ich habe hier was Nettes für deine Küche.";
};

FUNC INT Info_Mod_Omid_Urs_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Urs_Hi))
	&& (Npc_HasItems(hero, ItMi_MagischePfanne) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Omid_Urs_Info()
{
	AI_Output(hero, self, "Info_Mod_Omid_Urs_15_00"); //Hallo Koch. Ich habe hier was Nettes für deine Küche. Diese lodernde Pfanne.
	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_01"); //(überrascht) Hä, wie?
	AI_Output(hero, self, "Info_Mod_Omid_Urs_15_02"); //Hier, schau.

	B_GiveInvItems	(hero, self, ItMi_MagischePfanne, 1);

	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_03"); //Die Pfanne ... heiß? Kann es wirklich sein ...?

	B_UseItem	(self, ItMi_MagischePfanne);

	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_04"); //(verblüfft) Tatsächlich. Hätte nicht geglaubt, dass Urs das wirklich hinbekommt. Alle Achtung.
	AI_Output(self, hero, "Info_Mod_Omid_Urs_02_05"); //Das wird mir die Arbeit um einiges Erleichtern und den Gaumen der Erzbarone erfreuen. Hier, nimm, 500 Goldmünzen. Das ist sie mir Wert.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_URS_HUND, "Omid hat seine Pfanne und ich 500 Münzen.");
};

INSTANCE Info_Mod_Omid_Pickpocket (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_Pickpocket_Condition;
	information	= Info_Mod_Omid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Omid_Pickpocket_Condition()
{
	C_Beklauen	(46, ItMi_Gold, 150);
};

FUNC VOID Info_Mod_Omid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Omid_Pickpocket);

	Info_AddChoice	(Info_Mod_Omid_Pickpocket, DIALOG_BACK, Info_Mod_Omid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Omid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Omid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Omid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Omid_Pickpocket);
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

INSTANCE Info_Mod_Omid_EXIT (C_INFO)
{
	npc		= Mod_1172_STT_Omid_MT;
	nr		= 1;
	condition	= Info_Mod_Omid_EXIT_Condition;
	information	= Info_Mod_Omid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Omid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Omid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};