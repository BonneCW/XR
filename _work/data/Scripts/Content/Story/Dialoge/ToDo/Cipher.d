INSTANCE Info_Mod_Cipher_Hi (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Hi_Condition;
	information	= Info_Mod_Cipher_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Witaj.";
};

FUNC INT Info_Mod_Cipher_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cipher_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_15_00"); //Witaj.
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_32_01"); //Witaj.
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_15_02"); //Nadal handlujesz roslina bagnista?
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_32_03"); //Shh, nie tak glosne. Nie jest to latwy czas na handel ambrozja bagienna.
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_32_04"); //Um, nie zdarzyloby Ci sie miec z toba zadnych roslin kapusty bagiennej lub lodygi ziól bagiennych, czy ty?
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_32_05"); //Dziesiec osób bardzo mi pomoglo, a ja dalbym za to dobra cene.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_SOELDNER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_SOELDNER, "Cipher's gonna radzi sobie ze mna.");

	if (Npc_HasItems(hero, ItMi_Joint) >= 10)
	|| (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
	{
		Info_ClearChoices	(Info_Mod_Cipher_Hi);

		if (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
		&& (Npc_HasItems(hero, ItMi_Joint) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Tutaj masz 10 roslin bagiennych i 10 lodyg.", Info_Mod_Cipher_Hi_D);
		};
		if (Npc_HasItems(hero, ItMi_Joint) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Oto dziesiec lodyg ziól bagiennych.", Info_Mod_Cipher_Hi_B);
		};
		if (Npc_HasItems(hero, ItPl_SwampHerb) >= 10)
		{
			Info_AddChoice	(Info_Mod_Cipher_Hi, "Oto dziesiec roslin bagiennych.", Info_Mod_Cipher_Hi_A);
		};
	};
};

FUNC VOID Info_Mod_Cipher_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Cipher_Hi_C_32_00"); //Hej, bardzo dziekuje. Oto 200 zlota i piec rud.

	B_GivePlayerXP	(100);

	B_ShowGivenThings	("200 zlota i 5 rudy uzyskano");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 5);
	
	Info_ClearChoices	(Info_Mod_Cipher_Hi);
};

FUNC VOID Info_Mod_Cipher_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_D_15_00"); //Tutaj masz 10 roslin bagiennych i 10 lodyg.

	Npc_RemoveInvItems	(hero, ItMi_Joint, 10);
	Npc_RemoveInvItems	(hero, ItPl_SwampHerb, 10);

	B_ShowGivenThings	("10 ziól torfowiskowych i 10 lodyg dodanych ziól bagiennych");

	AI_Output(self, hero, "Info_Mod_Cipher_Hi_D_32_01"); //Hej, bardzo dziekuje. Oto 400 zlota i 10 rud.

	B_GivePlayerXP	(200);

	B_ShowGivenThings	("400 zlota i 10 konserwowanych rudy");

	CreateInvItems	(hero, ItMi_Gold, 400);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	
	Info_ClearChoices	(Info_Mod_Cipher_Hi);
};

FUNC VOID Info_Mod_Cipher_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_B_15_00"); //Oto dziesiec lodyg ziól bagiennych.

	B_GiveInvItems	(hero, self, ItMi_Joint, 10);
	
	Info_Mod_Cipher_Hi_C();
};

FUNC VOID Info_Mod_Cipher_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Hi_A_15_00"); //Oto dziesiec roslin bagiennych.

	B_GiveInvItems	(hero, self, ItPl_SwampHerb, 10);
	
	Info_Mod_Cipher_Hi_C();
};

INSTANCE Info_Mod_Cipher_Skinner (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Skinner_Condition;
	information	= Info_Mod_Cipher_Skinner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcesz nowicjuszy zieleni?";
};

FUNC INT Info_Mod_Cipher_Skinner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Skinner_Laufbursche2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Edgor_Skinner))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cipher_Skinner_Info()
{
	AI_Output(hero, self, "Info_Mod_Cipher_Skinner_15_00"); //Chcesz nowicjuszy zieleni?
	AI_Output(self, hero, "Info_Mod_Cipher_Skinner_32_01"); //To moze tylko zrobic mój biznes, wiec dostac to rzeczy tutaj.
	AI_Output(hero, self, "Info_Mod_Cipher_Skinner_15_02"); //Wez to tutaj.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, Npc_HasItems(hero, ItMi_Addon_Joint_01));

	AI_Output(self, hero, "Info_Mod_Cipher_Skinner_32_03"); //Oto Twoje zloto.

	B_GiveInvItems	(self, hero, ItMi_Gold, Npc_HasItems(self, ItMi_Addon_Joint_01)*30);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_BDT_SKINNER, "Tak wiec pozbylem sie wszystkich zielonych nowicjuszy w Cipher.");
};

INSTANCE Info_Mod_Cipher_Trade (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Trade_Condition;
	information	= Info_Mod_Cipher_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Cipher_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cipher_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cipher_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Cipher_Pickpocket (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_Pickpocket_Condition;
	information	= Info_Mod_Cipher_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Cipher_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Joint, 6);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

	Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_BACK, Info_Mod_Cipher_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cipher_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

		Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Cipher_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Cipher_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Cipher_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Cipher_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Cipher_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Cipher_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Cipher_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Cipher_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Cipher_EXIT (C_INFO)
{
	npc		= Mod_781_SLD_Cipher_MT;
	nr		= 1;
	condition	= Info_Mod_Cipher_EXIT_Condition;
	information	= Info_Mod_Cipher_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cipher_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cipher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
