INSTANCE Info_Mod_Hermy_Hi (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Hi_Condition;
	information	= Info_Mod_Hermy_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi. Jestem tu nowy.";
};

FUNC INT Info_Mod_Hermy_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_00"); //Hi. Jestem tu nowy.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_01"); //Powitanie mnie. Na koniec, nie jestem tu nowym facetem. (smiertelnicy)
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_02"); //Nazywam sie Hermann, ale wszyscy tutaj dzwonia z Hermym.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_03"); //Co Pan tutaj robi?
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_04"); //Zajmuje sie rolami transformacji. Moge wam zaproponowac kilka prostych ról, ale sprzedaje cenne powiedzenia tylko czlonkom.
	AI_Output(hero, self, "Info_Mod_Hermy_Hi_15_05"); //Wróce do tego.
	AI_Output(self, hero, "Info_Mod_Hermy_Hi_01_06"); //Ze mna zawsze jestes mile widziany.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_VM, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_VM, "Kólka samonastawne Hermy' ego do przestawiania sprzedazy.");
};

INSTANCE Info_Mod_Hermy_QuestHermy (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermy_Condition;
	information	= Info_Mod_Hermy_QuestHermy_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_QuestHermy_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faice_QuestHermy))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermy_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_01_00"); //Musisz byc nowym facetem. Jestem Hermannem, ale prosze zadzwon do mnie Hermy' ego.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_01_01"); //Wiara wysyla ci, prawda?

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Jestes bardzo madry.", Info_Mod_Hermy_QuestHermy_B);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Tak wlasnie jest.", Info_Mod_Hermy_QuestHermy_A);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_B_15_00"); //Jestes bardzo madry.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_B_01_01"); //Hej, moge powiedziec, czy mnie oszukujesz.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "A jak sie z tym czujesz?", Info_Mod_Hermy_QuestHermy_D);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Nie mialem zamiaru cie bac.", Info_Mod_Hermy_QuestHermy_C);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_E()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_01_00"); //Tak wiec tak jest w przypadku, jak wynika z badan, powinien byc tunel pod Stara Biblioteka, gdzie osiedlili sie ci smierdzacy orkowie.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_E_01_01"); //Dort sollen noch ein paar Spruchrollen "Harpie Transformacja Harpie" zu finden sein.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Co mam z tym zrobic?", Info_Mod_Hermy_QuestHermy_G);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "No i mam to sobie radzic?", Info_Mod_Hermy_QuestHermy_F);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_A_15_00"); //Tak wlasnie jest.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_00"); //A jak sie z tym czujesz?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_D_01_01"); //Nie oszukiwales mnie.
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_D_15_02"); //Prawo. Co jest teraz tak wazne?

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_C_15_00"); //Nie mialem zamiaru cie bac.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_C_01_01"); //Zauwazylem to.

	Info_Mod_Hermy_QuestHermy_E();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_H()
{
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_01_00"); //Byloby milo, gdybyscie udali sie tam dla nas.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_H_01_01"); //Poza tym, pomoze Ci to w rozwoju nagrywania.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);

	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Ale nie interesuje mnie.", Info_Mod_Hermy_QuestHermy_J);
	Info_AddChoice	(Info_Mod_Hermy_QuestHermy, "Dobrze, zrobie to.", Info_Mod_Hermy_QuestHermy_I);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_G()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_G_15_00"); //Co mam z tym zrobic?

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_F()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_F_15_00"); //No i mam to sobie radzic?
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_F_01_01"); //Prawo. Obecnie jestesmy bardzo zajeci.

	Info_Mod_Hermy_QuestHermy_H();
};

FUNC VOID Info_Mod_Hermy_QuestHermy_J()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_J_15_00"); //Ale nie interesuje mnie.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_J_01_01"); //To szkoda. Ale zawsze mozesz wrócic, jesli zdecydujesz inaczej.

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

FUNC VOID Info_Mod_Hermy_QuestHermy_I()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermy_I_15_00"); //Dobrze, zrobie to.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_01_01"); //Bardzo dobry. Idz do Starej Biblioteki i porozmawiaj z tymi smierdzacymi istotami.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermy_I_01_02"); //Mam nadzieje, ze beda mogli powiedziec wiecej niz nasze stare zwoje.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Mam za zadanie pójsc do skalnej twierdzy i zapytac orki o ewentualny tunel, poniewaz tam ma byc zaklecie transformacji do harfy.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");

	Info_ClearChoices	(Info_Mod_Hermy_QuestHermy);
};

INSTANCE Info_Mod_Hermy_QuestHermyDoch (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_QuestHermyDoch_Condition;
	information	= Info_Mod_Hermy_QuestHermyDoch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Pójde do Orków.";
};

FUNC INT Info_Mod_Hermy_QuestHermyDoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_QuestHermy))
	&& (Mod_Hermy_KnowsQuest == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_QuestHermyDoch_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_QuestHermyDoch_15_00"); //Pójde do Orków.
	AI_Output(self, hero, "Info_Mod_Hermy_QuestHermyDoch_01_01"); //To obrzek. Nastepnie udaj sie do twierdzy górskiej i porozmawiaj z orkami.

	B_LogEntry	(TOPIC_MOD_FAICE_HARPIE, "Mam za zadanie pójsc do skalnej twierdzy i zapytac orki o ewentualny tunel, poniewaz tam ma byc zaklecie transformacji do harfy.");

	Mod_Hermy_KnowsQuest = 1;

	Wld_SendTrigger	("EVT_OW_MOUNTAINRUIN_01");
};

INSTANCE Info_Mod_Hermy_Harpie (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Harpie_Condition;
	information	= Info_Mod_Hermy_Harpie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hermy_Harpie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Grubuz_Emerin))
	&& (Mod_Hermy_KnowsQuest == 9)
	&& (Npc_HasItems(hero, ItSc_TrfHarpie) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Harpie_Info()
{
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_01_00"); //A co? Jak wyglada? Czy masz zaklecie?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_15_01"); //Oczywiscie oczywiscie.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_01_02"); //Czy moge go zobaczyc? Zabiore go do domu Faice.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Tutaj ja masz.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "I wziac cala chwale? Nie, dziekuje, pójde samemu.", Info_Mod_Hermy_Harpie_A);
};

FUNC VOID Info_Mod_Hermy_Harpie_B()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_B_15_00"); //Tutaj ja masz.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_B_01_01"); //Dzieki, ze mozesz sie udac.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Dobrze, widzisz dookola.", Info_Mod_Hermy_Harpie_D);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "To byla dosc trudna przygoda.....", Info_Mod_Hermy_Harpie_E);
};

FUNC VOID Info_Mod_Hermy_Harpie_E()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_00"); //To byla dosc trudna przygoda.....
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_01_01"); //Oto 500 zlotych monet. To wszystko, co jest.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_E_15_02"); //Dziekuje bardzo.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_E_01_03"); //Dbaj o siebie.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_A()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_A_15_00"); //I wziac cala chwale? Nie, dziekuje, pójde samemu.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_A_01_01"); //Nie chodzi tu o chwale. Teraz badzcie rozsadni i powiedzcie mi role czaru.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Tutaj ja masz.", Info_Mod_Hermy_Harpie_B);
	Info_AddChoice	(Info_Mod_Hermy_Harpie, "Nie mysle nawet o tym.", Info_Mod_Hermy_Harpie_C);
};

FUNC VOID Info_Mod_Hermy_Harpie_D()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_D_15_00"); //Dobrze, widzisz dookola.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_D_01_01"); //Dbaj o siebie.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

FUNC VOID Info_Mod_Hermy_Harpie_C()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_00"); //Nie mysle nawet o tym.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_01"); //Badz rozsadny. Chcesz zlota?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_02"); //Lepsze niz nic.
	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_03"); //Oto 500 zlotych monet. To wszystko, co jest.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_04"); //Czy teraz dostaje zaklecie?
	AI_Output(hero, self, "Info_Mod_Hermy_Harpie_C_15_05"); //Tutaj ja masz.

	B_GiveInvItems	(hero, self, ItSc_TrfHarpie, 1);

	AI_Output(self, hero, "Info_Mod_Hermy_Harpie_C_01_06"); //Dzieki. Mozesz przejsc teraz.

	Info_ClearChoices	(Info_Mod_Hermy_Harpie);

	B_SetTopicStatus	(TOPIC_MOD_FAICE_HARPIE, LOG_SUCCESS);

	B_GivePlayerXP	(750);

	Mod_Hermy_KnowsQuest = 10;
};

INSTANCE Info_Mod_Hermy_Faice01 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice01_Condition;
	information	= Info_Mod_Hermy_Faice01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy ostatnio widziales cos podejrzanego?";
};

FUNC INT Info_Mod_Hermy_Faice01_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice01_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice01_15_00"); //Czy ostatnio widziales cos podejrzanego?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice01_01_01"); //Hm, teraz to mówisz. Ostatnio Furt gral troche dziwacznie.
};

INSTANCE Info_Mod_Hermy_Faice02 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice02_Condition;
	information	= Info_Mod_Hermy_Faice02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy wiesz o zatruciu roli Fa?";
};

FUNC INT Info_Mod_Hermy_Faice02_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice02_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice02_15_00"); //Czy wiesz o zatruciu roli Fa?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice02_01_01"); //Wydaje mi sie, ze nie wiecej niz ty.
};

INSTANCE Info_Mod_Hermy_Faice03 (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Faice03_Condition;
	information	= Info_Mod_Hermy_Faice03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy zauwazyles cos o kims?";
};

FUNC INT Info_Mod_Hermy_Faice03_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Furt_Faice02))
	&& (Mod_VMG_FaiceGifty_Gift == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Faice03_Info()
{
	AI_Output(hero, self, "Info_Mod_Hermy_Faice03_15_00"); //Czy zauwazyles cos o kims?
	AI_Output(self, hero, "Info_Mod_Hermy_Faice03_01_01"); //Porozmawiaj z Furtem. Moze wiedziec wiecej.
};

INSTANCE Info_Mod_Hermy_Trade (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Trade_Condition;
	information	= Info_Mod_Hermy_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hermy_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hermy_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hermy_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hermy_Pickpocket (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_Pickpocket_Condition;
	information	= Info_Mod_Hermy_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Hermy_Pickpocket_Condition()
{
	C_Beklauen	(87, ItSc_TrfHarpie, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_BACK, Info_Mod_Hermy_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hermy_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hermy_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hermy_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hermy_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hermy_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hermy_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hermy_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hermy_EXIT (C_INFO)
{
	npc		= Mod_4020_VMG_Hermy_MT;
	nr		= 1;
	condition	= Info_Mod_Hermy_EXIT_Condition;
	information	= Info_Mod_Hermy_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hermy_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hermy_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
