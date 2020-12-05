INSTANCE Info_Mod_Aabid_Hi (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Hi_Condition;
	information	= Info_Mod_Aabid_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Aabid_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_Hi_Info()
{
	B_Say	(hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_00"); //Nazywam sie Aabid. Jestem tu jednym z oszustów i jednoczesnie handlarzem niezwyklymi odmianami tytoniu i lodyg ziól bagiennych.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_01"); //Ciekawe. Czy moge zobaczyc Panstwa oferte?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_02"); //Nie, nie moge tego zrobic.
	AI_Output(hero, self, "Info_Mod_Aabid_Hi_15_03"); //Dlaczego nie?
	AI_Output(self, hero, "Info_Mod_Aabid_Hi_01_04"); //Czekam od jakiegos czasu na dostawe trzech paczek, ale wydaje mi sie, ze chlopaki mnie zapomnieli i po prostu nie moge wyjsc z ukrycia.
};

INSTANCE Info_Mod_Aabid_Aufgabe (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Aufgabe_Condition;
	information	= Info_Mod_Aabid_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy przyniose wam pakiety chwastów?";
};

FUNC INT Info_Mod_Aabid_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Shakir_GaunerWerden))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_00"); //Czy przyniose wam pakiety chwastów?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_01"); //To byloby naprawde dobre, gdybyscie to zrobili. Ale dlaczego chcialbys to zrobic?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_02"); //Chcialbym dolaczyc do oszustów. Potrzebuje jednak panstwa glosu.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_03"); //Czy chcialbys oddac glos po tym zadaniu?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_04"); //Jesli otrzymasz wszystkie pakiety, oddam oczywiscie mój glos.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_05"); //Ladunek. Gdzie nalezy odebrac paczki?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_06"); //W miescie mozna znalezc wszystkich trzech dealerów. Jej imiona to Meldor, Borka i wreszcie Jason, militaman.
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_07"); //Ktos z milicji handlujacej bagnista ambrozja?
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_08"); //Czy uwazasz, ze wszyscy oni przestrzegaja swoich zasad?
	AI_Output(hero, self, "Info_Mod_Aabid_Aufgabe_15_09"); //Nie. Wszystko w porzadku, zobacze je trzy razy.
	AI_Output(self, hero, "Info_Mod_Aabid_Aufgabe_01_10"); //Dobre. Wróc po otrzymaniu pakietów.

	Log_CreateTopic	(TOPIC_MOD_ASS_AABID_PAKET, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Rozmawialam z Aabidem, jeden z nich zabil oszustów. Chce mi oddac swój glos, ale tylko wtedy, gdy przyniose mu trzy paczki chwastów, które powinny byc dostarczone przez róznych 'kupców' w miescie. Sa to: Meldor, Borka i Jason. Gdy otrzymalem od nich paczki, powinienem skontaktowac sie z Aabid.");
};

INSTANCE Info_Mod_Aabid_HabPakete (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_HabPakete_Condition;
	information	= Info_Mod_Aabid_HabPakete_Info;
	permanent	= 0;
	important	= 0;
	description	= "Otrzymalem wszystkie paczki.";
};

FUNC INT Info_Mod_Aabid_HabPakete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_HabPakete_Info()
{
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_00"); //Otrzymalem wszystkie paczki.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_01"); //To ty mnie oszukujesz!
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_02"); //Nie, tutaj sa.

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 3);
	Npc_RemoveInvItems(self, ItMi_HerbPaket, 3);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_04"); //Oni wszyscy, jak to zrobiliscie?
	AI_Output(hero, self, "Info_Mod_Aabid_HabPakete_15_05"); //Powiedzialbym: Czysta intuicja.
	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_06"); //Nie moge Ci wystarczajaco podziekowac. Tutaj wezmy to zloto jako znak mojej wdziecznosci.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Aabid_HabPakete_01_07"); //Poza tym otrzymuje mój glos.

	B_LogEntry	(TOPIC_MOD_ASS_AABID_PAKET, "Przynioslam Aabid wszystkie pakty i byl bardzo zadowolony z mojego wystepu. Najwyrazniej nie spodziewal sie tego. No cóz, to dobrze, bo teraz mam jeden glos i 500 zlotych monet bogatszych.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_AABID_PAKET, LOG_SUCCESS);

	B_GivePlayerXP	(200);
	
	CreateInvItems(self, ItMi_Joint, 50);
};

INSTANCE Info_Mod_Aabid_Trade (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Trade_Condition;
	information	= Info_Mod_Aabid_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Aabid_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aabid_HabPakete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aabid_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Aabid_Pickpocket (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_Pickpocket_Condition;
	information	= Info_Mod_Aabid_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Aabid_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 27);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_BACK, Info_Mod_Aabid_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aabid_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
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

INSTANCE Info_Mod_Aabid_EXIT (C_INFO)
{
	npc		= Mod_7105_ASS_Aabid_NW;
	nr		= 1;
	condition	= Info_Mod_Aabid_EXIT_Condition;
	information	= Info_Mod_Aabid_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aabid_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aabid_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
