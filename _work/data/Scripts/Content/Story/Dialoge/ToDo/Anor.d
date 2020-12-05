INSTANCE Info_Mod_Anor_Hi (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Hi_Condition;
	information	= Info_Mod_Anor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co Pan tutaj robi?";
};

FUNC INT Info_Mod_Anor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_15_00"); //Co Pan tutaj robi?
	AI_Output(self, hero, "Info_Mod_Anor_Hi_02_01"); //Jestem kupcem sprzedajacym eliksiry. Dlaczego chcesz wiedziec?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Anor zajmuje sie eliksirami.");

	Info_ClearChoices	(Info_Mod_Anor_Hi);

	Info_AddChoice	(Info_Mod_Anor_Hi, "Chce wiedziec, kto mnie zabije, gdybym wszystkich tu zabil.", Info_Mod_Anor_Hi_B);
	Info_AddChoice	(Info_Mod_Anor_Hi, "Chce wiedziec wiecej o Tobie przetwarzajacej magów.", Info_Mod_Anor_Hi_A);
};

FUNC VOID Info_Mod_Anor_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_B_15_00"); //Chce wiedziec, kto mnie zabije, gdybym wszystkich tu zabil.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_B_02_01"); //Przepraszam, ale nie jestem dostepny dla tego rodzaju rzeczy.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

FUNC VOID Info_Mod_Anor_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Hi_A_15_00"); //Chce wiedziec wiecej o Tobie przetwarzajacej magów.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_01"); //Nie wiem, czy moge wam zaufac.
	AI_Output(self, hero, "Info_Mod_Anor_Hi_A_02_02"); //Jesli chcesz kupic eliksiry, wróc, kiedy pokazesz, ze jestes naprawde zainteresowany nami.

	Info_ClearChoices	(Info_Mod_Anor_Hi);
};

INSTANCE Info_Mod_Anor_Abwimmeln (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Abwimmeln_Condition;
	information	= Info_Mod_Anor_Abwimmeln_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Anor_Abwimmeln_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Brad_Quest != 3)
	&& (Npc_KnowsInfo(hero, Info_Mod_Anor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Abwimmeln_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_Abwimmeln_02_00"); //Czego chcesz?
};

INSTANCE Info_Mod_Anor_Faice01 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice01_Condition;
	information	= Info_Mod_Anor_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy ostatnio czules cos dziwnego?";
};

FUNC INT Info_Mod_Anor_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice01_15_00"); //Czy ostatnio czules cos dziwnego?
	AI_Output(self, hero, "Info_Mod_Anor_Faice01_02_01"); //Nie, wlasciwie nie. Porozmawiaj z innymi.
};

INSTANCE Info_Mod_Anor_Faice02 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice02_Condition;
	information	= Info_Mod_Anor_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy slyszales cos o zatruciu roli Faice' a?";
};

FUNC INT Info_Mod_Anor_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice02_15_00"); //Czy slyszales cos o zatruciu roli Faice' a?
	AI_Output(self, hero, "Info_Mod_Anor_Faice02_02_01"); //Nie, przepraszam, panie posle.
};

INSTANCE Info_Mod_Anor_Faice03 (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Faice03_Condition;
	information	= Info_Mod_Anor_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy zauwazyles cos wiecej?";
};

FUNC INT Info_Mod_Anor_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Faice03_15_00"); //Czy zauwazyles cos wiecej?
	AI_Output(self, hero, "Info_Mod_Anor_Faice03_02_01"); //Co normalne, nic nie zauwazylem.
};

INSTANCE Info_Mod_Anor_Nick (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Nick_Condition;
	information	= Info_Mod_Anor_Nick_Info;
	permanent	= 0;
	important	= 0;
	description	= "Masz dla mnie prace?";
};

FUNC INT Info_Mod_Anor_Nick_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Turendil_Furt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Nick_Info()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_15_00"); //Masz dla mnie prace?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_01"); //Jest cos, co mozecie zrobic dla mnie i dla Kosciola, myslicie o sobie.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_02"); //Zauwazylem, ze w poblizu obozu bagiennego, gdzie kiedys znajdowaly sie kamienie ogniskowe, umiera coraz wiecej zwierzat.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_03"); //Móglbys dojsc do dna, bo nie moge juz teraz odejsc.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_02_04"); //Jesli którys z tych kultowych blystek jest za nim, moga doswiadczyc czegos naszego!

	Info_ClearChoices	(Info_Mod_Anor_Nick);

	Info_AddChoice	(Info_Mod_Anor_Nick, "Co to dla mnie jest?", Info_Mod_Anor_Nick_B);
	Info_AddChoice	(Info_Mod_Anor_Nick, "Jestem.", Info_Mod_Anor_Nick_A);
};

FUNC VOID Info_Mod_Anor_Nick_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_A_15_00"); //Jestem.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_01"); //Ciesze sie, ze moge to uslyszec. Lepiej juz teraz wyjdzcie z tego miejsca.
	AI_Output(self, hero, "Info_Mod_Anor_Nick_A_02_02"); //Oto leczniczy eliksir, jesli cos sie stanie z Toba.

	B_GiveInvItems	(self, hero, ItPo_Health_01, 1);

	Log_CreateTopic	(TOPIC_MOD_ANOR_NICK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Anor chce, abym dotarl do dna dziwnego zwierzecia umierajacego w poblizu bagna. Mialem rozejrzec sie dookola, gdzie zaatakowal mnie wtedy nowicjusz.");

	Wld_InsertNpc	(Mod_7050_ZOM_Nick_MT, "OC2");
	
	Info_ClearChoices	(Info_Mod_Anor_Nick);
};

FUNC VOID Info_Mod_Anor_Nick_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_Nick_B_15_00"); //Co to dla mnie jest?
	AI_Output(self, hero, "Info_Mod_Anor_Nick_B_02_01"); //Pozwole sobie tylko powiedziec, ze to nie bedzie twoja szkoda.
	
	Info_Mod_Anor_Nick_A();
};

INSTANCE Info_Mod_Anor_NickTot (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_NickTot_Condition;
	information	= Info_Mod_Anor_NickTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Anor_NickTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nick_Kopf))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_NickTot_Info()
{
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_00"); //Co to sa wiadomosci?
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_15_01"); //Smierc zwierzat ustala. Odpowiedzialny byl bezglowy zombie, ale go uratowalem.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_02_02"); //Bardzo dobry. Oto Twoja nagroda.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_RemoveNpc	(Mod_7050_ZOM_Nick_MT);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "Musialem negocjowac z minotaurem....", Info_Mod_Anor_NickTot_B);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Dziekuje bardzo. Jestem teraz w drodze powrotnej.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_A()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_A_15_00"); //Dziekuje bardzo. Jestem teraz w drodze powrotnej.
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_A_02_01"); //Zobacze cie dookola.
	
	B_LogEntry	(TOPIC_MOD_ANOR_NICK, "Otrzymalem moja nagrode od Anora.");
	B_SetTopicStatus	(TOPIC_MOD_ANOR_NICK, LOG_SUCCESS);

	B_GivePlayerXP	(650);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);
};

FUNC VOID Info_Mod_Anor_NickTot_B()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_B_15_00"); //Musialem negocjowac z minotaurem....
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_B_02_01"); //Hmph. Oto troche dodatkowej gotówki.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Anor_NickTot);

	Info_AddChoice	(Info_Mod_Anor_NickTot, "Musialem zabic dwadziescia wilków i tuzin suwaka.....", Info_Mod_Anor_NickTot_C);
	Info_AddChoice	(Info_Mod_Anor_NickTot, "Dziekuje bardzo. Jestem teraz w drodze powrotnej.", Info_Mod_Anor_NickTot_A);
};

FUNC VOID Info_Mod_Anor_NickTot_C()
{
	AI_Output(hero, self, "Info_Mod_Anor_NickTot_C_15_00"); //Musialem zabic dwadziescia wilków i tuzin suwaka.....
	AI_Output(self, hero, "Info_Mod_Anor_NickTot_C_02_01"); //Okay, tutaj. Ale nie ma juz wiecej.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	Info_Mod_Anor_NickTot_A();
};

INSTANCE Info_Mod_Anor_Trade (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Trade_Condition;
	information	= Info_Mod_Anor_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Anor_Trade_Condition()
{
	if (Mod_VMG_Dabei) {
		return 1;
	};
};

FUNC VOID Info_Mod_Anor_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Anor_Pickpocket (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_Pickpocket_Condition;
	information	= Info_Mod_Anor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Anor_Pickpocket_Condition()
{
	C_Beklauen	(64, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_BACK, Info_Mod_Anor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Anor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Anor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
};

FUNC VOID Info_Mod_Anor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Anor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Anor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Anor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Anor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Anor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Anor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Anor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Anor_EXIT (C_INFO)
{
	npc		= Mod_1628_VMG_Anor_MT;
	nr		= 1;
	condition	= Info_Mod_Anor_EXIT_Condition;
	information	= Info_Mod_Anor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Anor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Anor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
