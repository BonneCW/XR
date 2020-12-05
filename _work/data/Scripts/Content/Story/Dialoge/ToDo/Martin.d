INSTANCE Info_Mod_Martin_Hi (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Hi_Condition;
	information	= Info_Mod_Martin_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kim jestes?";
};

FUNC INT Info_Mod_Martin_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Hi_15_00"); //Kim jestes?
	AI_Output(self, hero, "Info_Mod_Martin_Hi_07_01"); //Jestem Marcinem, burmistrzem milicji. Co moge dla Ciebie zrobic?
};

INSTANCE Info_Mod_Martin_Rasend (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Rasend_Condition;
	information	= Info_Mod_Martin_Rasend_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Martin_Rasend_Condition()
{
	if (Mod_WM_Rasend == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Rasend_Info()
{
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_00"); //Ciesze sie, ze przyszedles....
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_01"); //Z Beliarem.... Jaka byla tam masakra?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_02"); //Przykry demon jest odpowiedzialny.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_03"); //Co? Jeden demon zabil wszystkich paladynów i mieszkanców miast?
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_04"); //Jak dokladnie to wszystko sie stalo?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_05"); //Cóz, opowiem ci to, co do tej pory slyszalem. Wlasnie kupowalem na targowisku.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_06"); //Nagle uslyszelismy nieludzki ryk z portu, uslyszelismy krzyki i szumy.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_07"); //Podbieglem go szukac, ale zanim przyjechalem zobaczylem wznoszacego sie gigantycznego demona, lecacego nad wschodnia brama i znikajacego w oddali.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_08"); //Tak, to musialo byc naprawde potwór, sposób, w jaki tu szaleje.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_09"); //Czy sa jakies wskazówki, o co to wszystko chodzi, czy gdzie demon zniknal?
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_10"); //Nie, na razie nic. Nie tak dawno temu to wszystko sie wydarzylo....
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_11"); //Ale slyszalem, jak ktos powiedzial, ze magik ognia Daron wydawal sie bardzo zmartwiony i teleportowany......
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_12"); //(do samego siebie) Hmm, klasztor magów ognia znajduje sie na wschodzie.
	AI_Output(hero, self, "Info_Mod_Martin_Rasend_15_13"); //Okay, dziekuje za informacje. Bede wtedy ruszyl, aby dowiedziec sie wiecej o tym wszystkim.
	AI_Output(self, hero, "Info_Mod_Martin_Rasend_07_14"); //Dobrze, zadbaj o siebie.

	Log_CreateTopic	(TOPIC_MOD_ADANOS_RASEND, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ADANOS_RASEND, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Cos strasznego wydarzylo sie w porcie miejskim.");
	B_LogEntry	(TOPIC_MOD_ADANOS_RASEND, "Dowiedzialem sie od Martina, ze wielki demon zabil cala paladyne w porcie, a nastepnie zniknal na wschód. Czarodziej pozarny Daron bardzo sie wówczas martwil.");

	B_StartOtherRoutine	(Mod_523_KDF_Daron_NW, "LIFEKLOSTER");

	B_KillNpc	(Mod_1193_NOV_Novize_NW);
	B_KillNpc	(Mod_554_KDF_Parlan_NW);
};

INSTANCE Info_Mod_Martin_Flugblaetter (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Flugblaetter_Condition;
	information	= Info_Mod_Martin_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dla Ciebie ulotke.";
};

FUNC INT Info_Mod_Martin_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Flugblaetter_Info()
{
	AI_Output(hero, self, "Info_Mod_Martin_Flugblaetter_15_00"); //Mam dla Ciebie ulotke.

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_01"); //Dziekuje, dziekuje. Zobaczmy jak.....

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Martin_Flugblaetter_07_02"); //Ah tak. Moze zatrzymam sie przy Matteo' s.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Martin_Trade (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Trade_Condition;
	information	= Info_Mod_Martin_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Martin_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Martin_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Martin_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Martin_Pickpocket (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_Pickpocket_Condition;
	information	= Info_Mod_Martin_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Martin_Pickpocket_Condition()
{
	C_Beklauen	(61, ItSc_PalRepelEvil, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_BACK, Info_Mod_Martin_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Martin_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Martin_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
};

FUNC VOID Info_Mod_Martin_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Martin_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Martin_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Martin_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Martin_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Martin_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Martin_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Martin_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Martin_EXIT (C_INFO)
{
	npc		= Mod_596_MIL_Martin_NW;
	nr		= 1;
	condition	= Info_Mod_Martin_EXIT_Condition;
	information	= Info_Mod_Martin_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Martin_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Martin_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
