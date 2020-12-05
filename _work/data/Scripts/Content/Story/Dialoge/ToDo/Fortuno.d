INSTANCE Info_Mod_Fortuno_Hi (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Hi_Condition;
	information	= Info_Mod_Fortuno_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fortuno_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fortuno_Hi_13_00"); //Witaj, jesli potrzebujesz czegos, mozesz odebrac to od mnie.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Fortuno sprzedaje wszelkiego rodzaju drobne rzeczy.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ladna historia.";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch_Condition()
{
	if (Mod_Fortuno_Sumpfmensch_Scene == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_00"); //Ladna historia.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_01"); //Mozna to powiedziec tylko przez kogos, kto jeszcze nie spotkal placzacego bagna.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_02"); //I go poznales?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_03"); //Gdyby tak bylo, to bym nie byl przed wami.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_04"); //Wiec nikt nigdy wczesniej nie widzial, ze placz mokradla?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_05"); //Tak, tak. Nowicjusz o nazwisku Regahn i od tego czasu drzy jak lisc osiki. A Regahn nie jest tylko pewnym slabym nowicjuszem, który sciaga swoje spodnie na widok szczura bagiennego.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_06"); //Gosc byl kiedys piratem, jadl rekiny bagienne na sniadanie!

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Najwyrazniej tylko Darrion widzial jeszcze czlowieka bagna. Powinienem z nim porozmawiac.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch2_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "O co wiesz o Darrionie?";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Sumpfmensch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_00"); //O co wiesz o Darrionie?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_01"); //Nikt nie wie o nim naprawde nic. Moze powinienes sprawdzic jego bylych pracodawców.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_02"); //Kogo rozumiesz?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_03"); //Oczywiscie piraci. Jedyne, co wiesz, to fakt, ze byl on wczesniej piratem. Moze jeden z nich cos o nim wie.

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Darrion byl kiedys piratem. Prawdopodobnie powinienem zatrzymac sie przy piratach, aby dowiedziec sie wiecej o nim.");
};

INSTANCE Info_Mod_Fortuno_Woher (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Woher_Condition;
	information	= Info_Mod_Fortuno_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dlaczego jestes w tym obozie?";
};

FUNC INT Info_Mod_Fortuno_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Woher_15_00"); //Dlaczego jestes w tym obozie?
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_01"); //Bagatnik jest wina za wszystko.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_02"); //Wszystko zaczelo sie w Geldern. Bylem tam praktykantem alchemika i po raz pierwszy zetknalem sie z bagnem.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_03"); //Wkrótce potem bylem uzalezniony i wrzucony do kolonii. Kiedy dowiedzialem sie, ze jest tu bagienne ziolo, od razu przyjechalem.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_04"); //Od tego czasu mieszkam w tym obozie i zarzadzam zaopatrzeniem.
};

INSTANCE Info_Mod_Fortuno_Trade (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Trade_Condition;
	information	= Info_Mod_Fortuno_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fortuno_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fortuno_Pickpocket (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Pickpocket_Condition;
	information	= Info_Mod_Fortuno_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Fortuno_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Addon_Joint_02, 5);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_BACK, Info_Mod_Fortuno_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fortuno_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fortuno_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fortuno_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fortuno_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fortuno_EXIT (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_EXIT_Condition;
	information	= Info_Mod_Fortuno_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
