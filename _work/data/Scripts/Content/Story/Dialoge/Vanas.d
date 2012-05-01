INSTANCE Info_Mod_Vanas_Hi (C_INFO)
{
	npc		= Mod_1537_WKR_Vanas_NW;
	nr		= 1;
	condition	= Info_Mod_Vanas_Hi_Condition;
	information	= Info_Mod_Vanas_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, ich bringe dir Erz und Sumpfkraut von Engardo.";
};

FUNC INT Info_Mod_Vanas_Hi_Condition()
{
	if (Mod_SLD_Engardo == 1)
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 12)
	&& (Npc_HasItems(hero, ItMi_Joint) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vanas_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Vanas_Hi_15_00"); //Hallo, ich bringe dir Erz und Sumpfkraut von Engardo.

	B_ShowGivenThings	("12 Erzbrocken und 12 Stängel Sumpfkraut gegeben");

	Npc_RemoveInvItems	(hero, ItMi_Nugget, 12);
	Npc_RemoveInvItems	(hero, ItMi_Joint, 12);

	AI_Output(self, hero, "Info_Mod_Vanas_Hi_06_01"); //Ahh, ausgezeichnet. Meinen Vorrat an magischer Energie habe ich kürzlich aufgebraucht. Das kommt mir sehr gelegen.
	AI_Output(hero, self, "Info_Mod_Vanas_Hi_15_02"); //Hast du was für mich?
	AI_Output(self, hero, "Info_Mod_Vanas_Hi_06_03"); //Ohh, ja, die Bezahlung.

	B_GiveInvItems	(self, hero, ItMi_VanasPaket, 1);

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Vanas_Hi_06_04"); //(etwas leiser) Ich habe gerade leider nicht alles dabei. Fünf Stück Käse, eine Eispfeilspruchrolle und sechs Bier fehlen im Packet.
	AI_Output(self, hero, "Info_Mod_Vanas_Hi_06_05"); //Aber für jemanden, der in der Kunst Erz zu Schmieden begabt ist, habe ich vielleicht etwas Interessantes für dich.

	Info_ClearChoices	(Info_Mod_Vanas_Hi);

	Info_AddChoice	(Info_Mod_Vanas_Hi, "Das weckt meine Neugierde. Worum geht’s?", Info_Mod_Vanas_Hi_B);
	Info_AddChoice	(Info_Mod_Vanas_Hi, "Kein Interesse. Gib mir einen Teil des Erzes und des Sumpfkrauts zurück.", Info_Mod_Vanas_Hi_A);
};

FUNC VOID Info_Mod_Vanas_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Vanas_Hi_B_15_00"); //Das weckt meine Neugierde. Worum geht’s?
	AI_Output(self, hero, "Info_Mod_Vanas_Hi_B_06_01"); //Mein Wasserkriegerkollege Everaldo hat einen Schmiedeplan der alten Kultur übersetzt. Geh zu ihm und sag ihm, dass du von mir kommst.
	
	Info_ClearChoices	(Info_Mod_Vanas_Hi);

	Mod_SLD_Engardo = 2;

	B_LogEntry	(TOPIC_MOD_SLD_ENGARDO, "Vanas hatte nicht alle Waren dabei. Dafür hat der Wasserkrieger Everaldo einen interessanten Schmiedebauplan für mich.");
};

FUNC VOID Info_Mod_Vanas_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Vanas_Hi_A_15_00"); //Kein Interesse. Gib mir einen Teil des Erzes und des Sumpfkrauts zurück.
	AI_Output(self, hero, "Info_Mod_Vanas_Hi_A_06_01"); //Schade. Da entgeht dir was. Hier hast du je vier Erz und Sumpfkraut zurück.

	B_ShowGivenThings	("4 Erzbrocken und 4 Stängel Sumpfkraut erhalten");

	CreateInvItems	(hero, ItMi_Nugget, 4);
	CreateInvItems	(hero, ItMi_Joint, 4);
	
	Info_ClearChoices	(Info_Mod_Vanas_Hi);

	Mod_SLD_Engardo = 3;

	B_LogEntry	(TOPIC_MOD_SLD_ENGARDO, "Vanas hatte nicht alle Waren dabei. Ich habe einen Teil des Sumpfkrauts und des Erzes zurückgefordert und auch bekommen.");
};

INSTANCE Info_Mod_Vanas_Pickpocket (C_INFO)
{
	npc		= Mod_1537_WKR_Vanas_NW;
	nr		= 1;
	condition	= Info_Mod_Vanas_Pickpocket_Condition;
	information	= Info_Mod_Vanas_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Vanas_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Vanas_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Vanas_Pickpocket);

	Info_AddChoice	(Info_Mod_Vanas_Pickpocket, DIALOG_BACK, Info_Mod_Vanas_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Vanas_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Vanas_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Vanas_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Vanas_Pickpocket);
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

INSTANCE Info_Mod_Vanas_EXIT (C_INFO)
{
	npc		= Mod_1537_WKR_Vanas_NW;
	nr		= 1;
	condition	= Info_Mod_Vanas_EXIT_Condition;
	information	= Info_Mod_Vanas_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vanas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vanas_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};