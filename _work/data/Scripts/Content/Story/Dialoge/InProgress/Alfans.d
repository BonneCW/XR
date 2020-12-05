INSTANCE Info_Mod_Alfans_Hi (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Hi_Condition;
	information	= Info_Mod_Alfans_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_00"); //Witaj nieznajomego. Wyglada na to, ze przychodzi pan z daleka.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_01"); //Jesli szukasz jedzenia i ziól, nie bedziesz chcial niczego.
	AI_Output(self, hero, "Info_Mod_Alfans_Hi_03_02"); //Mam doskonaly wybór wszystkiego, co ozywia cialo i daje mu ulge w cierpieniu.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_EISGEBIET, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_EISGEBIET, "Alfans daje mi jedzenie i ziola.");

	Npc_SetRefuseTalk (self, 300);
};

INSTANCE Info_Mod_Alfans_Aufgabe (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Aufgabe_Condition;
	information	= Info_Mod_Alfans_Aufgabe_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alfans_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_00"); //Powitania, tam znów jestescie.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_01"); //Mam dla Panstwa troske i bylbym bardzo wdzieczny, gdybyscie mogli mi panstwo w tym pomóc.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_02"); //Oczywiscie, ja równiez wam zaplate.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_03"); //Jaki jest cel?
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_04"); //Cóz, zwrócilam sie do Ciebie, poniewaz przebyles dluga droge, udowadniajac, ze jestes doskonalym trackerem i mozesz przeciwstawic sie niebezpieczenstwom zwiazanym z dzika przyroda.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_05"); //Chodzi o pustelnika Halfmara. Do tej pory rzadko przyjezdzal, ale regularnie do naszej wioski i przynosil mi ziola i rosliny, które znalazl na pustyni.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_06"); //Ostatnia wizyta byla jednak znacznie dluzsza niz zwykle.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_07"); //I zaczynam sie martwic.... (odroczona) oczywiscie nie tylko z powodu moich towarów.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_08"); //Zyje daleko stad na poludniowym zachodzie. Bylbym bardzo wdzieczny, gdybyscie mogli to zobaczyc.
	AI_Output(hero, self, "Info_Mod_Alfans_Aufgabe_15_09"); //Zobacze, co moge zrobic.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_10"); //Doceniam to. Nie chce, aby to równiez bylo na Twoja niekorzysc.
	AI_Output(self, hero, "Info_Mod_Alfans_Aufgabe_03_11"); //Jesli idziesz sladami, to w pewnym momencie przechodzisz obok jego kabiny.

	Log_CreateTopic	(TOPIC_MOD_ALFANS_HALFMAR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ALFANS_HALFMAR, "Alfans poprosil mnie, abym szukal pustelnika Halfmara na poludniu. Zazwyczaj przynosi Alfansowi ziola i rosliny, które znajduje na pustyni. Jego ostatnia wizyta byla jednak juz dawno spózniona. Znajduje jego kabine na poludniowym zachodzie. Jesli podazam za utworami, nie moge ich pominac.");

	Mod_AlfansQuest_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Alfans_Halfmar (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Halfmar_Condition;
	information	= Info_Mod_Alfans_Halfmar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bylem u Halfmara.";
};

FUNC INT Info_Mod_Alfans_Halfmar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halfmar_HabKraeuter))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Halfmar_Info()
{
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_00"); //Bylem u Halfmara.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_01"); //No cóz, co z nim?
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_02"); //Byl chory, ale teraz jest na drodze do powrotu do zdrowia.
	AI_Output(hero, self, "Info_Mod_Alfans_Halfmar_15_03"); //Powinien cie odwiedzic w ciagu najblizszych kilku dni.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_04"); //Ahh, bardzo dobry. Dziekuje za dobra wiadomosc.
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_03_05"); //I tu obiecana nagroda. Wybierz eliksir.

	B_SetTopicStatus	(TOPIC_MOD_ALFANS_HALFMAR, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(300);

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);

	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(Eliksir Ducha Swietego)", Info_Mod_Alfans_Halfmar_C);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(pojadaj majatek)", Info_Mod_Alfans_Halfmar_B);
	Info_AddChoice	(Info_Mod_Alfans_Halfmar, "(ziarna skrobiowe)", Info_Mod_Alfans_Halfmar_A);
};

FUNC VOID Info_Mod_Alfans_Halfmar_Fertig()
{
	AI_Output(self, hero, "Info_Mod_Alfans_Halfmar_Fertig_03_00"); //To byla przyjemnosc. Mam nadzieje, ze wkrótce do pana dojdzie.

	Info_ClearChoices	(Info_Mod_Alfans_Halfmar);
};

FUNC VOID Info_Mod_Alfans_Halfmar_C()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Mana, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_B()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Dex, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

FUNC VOID Info_Mod_Alfans_Halfmar_A()
{
	B_GiveInvItems	(self, hero, ItPo_Perm_Str, 1);

	Info_Mod_Alfans_Halfmar_Fertig();
};

INSTANCE Info_Mod_Alfans_Trade (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Trade_Condition;
	information	= Info_Mod_Alfans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Alfans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alfans_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alfans_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Alfans_Pickpocket (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_Pickpocket_Condition;
	information	= Info_Mod_Alfans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Alfans_Pickpocket_Condition()
{
	C_Beklauen	(144, ItMi_Gold, 64);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_BACK, Info_Mod_Alfans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alfans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alfans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alfans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alfans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alfans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alfans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alfans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alfans_EXIT (C_INFO)
{
	npc		= Mod_7644_OUT_Alfans_EIS;
	nr		= 1;
	condition	= Info_Mod_Alfans_EXIT_Condition;
	information	= Info_Mod_Alfans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alfans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alfans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
