INSTANCE Info_Mod_Maria_Unheil (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Unheil_Condition;
	information	= Info_Mod_Maria_Unheil_Info;
	permanent	= 1;
	important	= 0;
	description	= "Slyszalem, ze nie czujesz sie tak dobrze.";
};

FUNC INT Info_Mod_Maria_Unheil_Condition()
{
	if ((Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13))
	&& ((Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	|| (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Unheil)))
	&& (Mod_WM_MariaGeheilt == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_15_00"); //Slyszalem, ze nie czujesz sie tak dobrze.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_01"); //Ach, to bardzo zle. To uczucie opresyjne, ta slabosc i te mroczne wizje. I nic nie wydaje sie pomocne.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_17_02"); //Gdyby moja nowa pokojówka nie troszczyla sie o mnie tak oddana, nie wiedzialabym, co robie.

	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	|| (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Moze ten eliksir moze Ci pomoze.", Info_Mod_Maria_Unheil_B);
	};
	Info_AddChoice	(Info_Mod_Maria_Unheil, "Przykro mi to slyszec. Zycze panu powodzenia.", Info_Mod_Maria_Unheil_A);
};

FUNC VOID Info_Mod_Maria_Unheil_B()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_B_15_00"); //Moze ten eliksir moze Ci pomoze.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);

	if (Npc_HasItems(hero, ItPo_HealBesessenheit) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Uzdrowienie obsesji", Info_Mod_Maria_Unheil_D);
	};
	if (Npc_HasItems(hero, ItPo_Health_01) > 0)
	{
		Info_AddChoice	(Info_Mod_Maria_Unheil, "Istota uzdrawiania", Info_Mod_Maria_Unheil_C);
	};
};

FUNC VOID Info_Mod_Maria_Unheil_A()
{
	AI_Output(hero, self, "Info_Mod_Maria_Unheil_A_15_00"); //Przykro mi to slyszec. Zycze panu powodzenia.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_D()
{
	B_GiveInvItems	(hero, self, ItPo_HealBesessenheit, 1);

	B_UseItem	(self, ItPo_HealBesessenheit);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_00"); //Co sie stalo? Czuje, ze moje sily powracaja, mój duch staje sie jasny.
	AI_Output(self, hero, "Info_Mod_Maria_Unheil_D_17_01"); //Jak moge wam podziekowac.... Przejdz do Onar. Powiedz mu, ze zaplaci 400 zlotych monet.

	Mod_WM_MariaGeheilt = 1;
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

FUNC VOID Info_Mod_Maria_Unheil_C()
{
	B_GiveInvItems	(hero, self, ItPo_Health_01, 1);

	B_UseItem	(self, ItPo_Health_01);

	AI_Output(self, hero, "Info_Mod_Maria_Unheil_C_17_00"); //Och, dziekuje, ale to tez nie pomaga.
	
	Info_ClearChoices	(Info_Mod_Maria_Unheil);
};

INSTANCE Info_Mod_Maria_BelohnungOnar (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungOnar_Condition;
	information	= Info_Mod_Maria_BelohnungOnar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bylem z Onar. Dal mi tylko 200 zlotych monet.";
};

FUNC INT Info_Mod_Maria_BelohnungOnar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungOnar_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungOnar_15_00"); //
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungOnar_17_01"); //
};

INSTANCE Info_Mod_Maria_BelohnungWasili (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_BelohnungWasili_Condition;
	information	= Info_Mod_Maria_BelohnungWasili_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wasili dal mi tylko 100 zlotych monet.";
};

FUNC INT Info_Mod_Maria_BelohnungWasili_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wasili_BelohnungMaria))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Maria_BelohnungWasili_Info()
{
	AI_Output(hero, self, "Info_Mod_Maria_BelohnungWasili_15_00"); //Wasili dal mi tylko 100 zlotych monet.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_01"); //Ohh, hmm..... Nie mam innego wyboru. Sluzy mu dobrze dla starej swini.
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_02"); //Chyba nic nie wiem o jego historiach z pokojówkami i chlopami....
	AI_Output(self, hero, "Info_Mod_Maria_BelohnungWasili_17_03"); //Jesli spojrzysz pod materac Onar' s, z pewnoscia znajdziesz wiecej niz wystarczy. Ale tylko po to, aby utrzymac ja miedzy nami....

	MOBNAME_XR_ONARSVERSTECK = "Ukrywanie sie Onara";
};

INSTANCE Info_Mod_Maria_Pickpocket (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_Pickpocket_Condition;
	information	= Info_Mod_Maria_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Maria_Pickpocket_Condition()
{
	C_Beklauen	(51, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Maria_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_BACK, Info_Mod_Maria_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Maria_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Maria_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
};

FUNC VOID Info_Mod_Maria_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Maria_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Maria_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Maria_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Maria_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Maria_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Maria_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Maria_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Maria_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Maria_EXIT (C_INFO)
{
	npc		= Mod_789_BAU_Maria_NW;
	nr		= 1;
	condition	= Info_Mod_Maria_EXIT_Condition;
	information	= Info_Mod_Maria_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Maria_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Maria_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
