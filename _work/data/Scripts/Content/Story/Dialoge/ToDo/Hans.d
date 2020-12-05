INSTANCE Info_Mod_Hans_Hi (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Hi_Condition;
	information	= Info_Mod_Hans_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy handlujesz?";
};

FUNC INT Info_Mod_Hans_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_00"); //Czy handlujesz?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_01"); //Panie Jezu, dlaczego inaczej mialabym tu stanac nogi w górze mojej tylka?
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_02"); //Ale to niezbyt przyjazne dla klienta....
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_03"); //Sa lepsze miejsca pracy niz moje. O wiele bym raczej jezdzil po swiecie niz sprzedawal rzeczy zwiazane z przygoda.
	AI_Output(hero, self, "Info_Mod_Hans_Hi_15_04"); //Ale....
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_05"); //Dlaczego nie moge po prostu porzucic pracy?
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_06"); //Bo jestem kaleki, chlopiec, piekielny kaleki.
	AI_Output(self, hero, "Info_Mod_Hans_Hi_06_07"); //Nie widze dloni przed oczyma, po prostu nie rozmywam sie. (pauza) Czy chcesz cos kupic czy nie?

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KHORATA, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KHORATA, "Hans handluje bronia na rynku.");
};

INSTANCE Info_Mod_Hans_Nagelnachschub (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub_Condition;
	information	= Info_Mod_Hans_Nagelnachschub_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Zabiore ja na pól.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Mod_Verhandlungsgeschick > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 25)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub_15_00"); //Zabiore ja na pól.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_01"); //Ladunek.

		Npc_RemoveInvItems	(hero, ItMi_Gold, 25);

		CreateInvItems	(hero, ItMi_Nagelpaket, 1);

		B_ShowGivenThings	("25 Otrzymany zloto i opakowanie do paznokci");

		B_RaiseHandelsgeschick (2);

		Mod_REL_Nagelnachschub_Hans = 1;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub_06_02"); //Albo za 50 zlota, albo wcale.
	};
};

INSTANCE Info_Mod_Hans_Nagelnachschub2 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub2_Condition;
	information	= Info_Mod_Hans_Nagelnachschub2_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Oto zloto.";
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Buerger))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 50)
	&& (Mod_REL_Nagelnachschub_Hans == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Nagelnachschub2_15_00"); //Oto zloto.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub2_06_01"); //... Oto gwozdzie.

	B_GiveInvItems	(self, hero, ItMi_Nagelpaket, 1);

	Mod_REL_Nagelnachschub_Hans = 1;
};

INSTANCE Info_Mod_Hans_Nagelnachschub3 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Nagelnachschub3_Condition;
	information	= Info_Mod_Hans_Nagelnachschub3_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Nagelnachschub3_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Nagelnachschub3_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Nagelnachschub3_06_00"); //Jest nowy obywatel! Witamy w naszym domu.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 1);
};

INSTANCE Info_Mod_Hans_BuergerKhoratas (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_BuergerKhoratas_Condition;
	information	= Info_Mod_Hans_BuergerKhoratas_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ile stoisk posiada rynek?";
};                       

FUNC INT Info_Mod_Hans_BuergerKhoratas_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Mod_REL_Buerger == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_BuergerKhoratas_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_00"); //Ile stoisk posiada rynek?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_01"); //Czy zabrales zbyt duzo przyjemnosci dawca? Jaki sens ma pytanie?
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_02"); //Nie ja, ale Anselm.... Chce znac wlasciwy numer.
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_03"); //Wtedy jest to dla mnie jasne. Uzywa Cie, aby dowiedziec sie, czy Melvin próbuje oficjalnie pozbyc sie znowu skradzionej wlasnosci.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_04"); //Anselm mógl sie sam przekonac. W koncu mamy racje na jego progu.
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_05"); //To prawda. Moze po prostu chcial cie pozbyc.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_06"); //I ile straganów jest teraz?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas_06_07"); //Prosze pozwolic mi policzyc.... 1... 2... 3... 4. I ja. Zatem piec.
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas_15_08"); //Dziekuje bardzo.
};

INSTANCE Info_Mod_Hans_BuergerKhoratas2 (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_BuergerKhoratas2_Condition;
	information	= Info_Mod_Hans_BuergerKhoratas2_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Ile stoisk bylo na rynku?";
};                       

FUNC INT Info_Mod_Hans_BuergerKhoratas2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hans_BuergerKhoratas))
	&& (Mod_REL_Buerger == 0)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_BuergerKhoratas2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_BuergerKhoratas2_15_00"); //Ile stoisk bylo na rynku?
	AI_Output(self, hero, "Info_Mod_Hans_BuergerKhoratas2_06_01"); //Panie Jezu, nie jestes tak dobry z liczeniem, czy jestes? Powiedzialem piec stoisk.
};

INSTANCE Info_Mod_Hans_Buerger (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Buerger_Condition;
	information	= Info_Mod_Hans_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Szukam paznokci.";
};                       

FUNC INT Info_Mod_Hans_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lukas_Wettstreit))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Buerger_15_00"); //Szukam paznokci.
	AI_Output(self, hero, "Info_Mod_Hans_Buerger_06_01"); //Hmm, wciaz mam paczke. Koszt 50 zlota.
};

INSTANCE Info_Mod_Hans_Kissen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kissen_Condition;
	information	= Info_Mod_Hans_Kissen_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Masz cos innego niz bron?";
};                       

FUNC INT Info_Mod_Hans_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Malik_Aufgabe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kissen_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_00"); //Masz cos innego niz bron?
	AI_Output(self, hero, "Info_Mod_Hans_Kissen_06_01"); //Wlasciwie nie. Z wyjatkiem tluszczu trzonowego.
	AI_Output(hero, self, "Info_Mod_Hans_Kissen_15_02"); //Tluszcz molowy? Hmm..... Nie, czai sie. Pozegnanie pozegnania.
};

INSTANCE Info_Mod_Hans_Kimon (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Kimon_Condition;
	information	= Info_Mod_Hans_Kimon_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Jak sie czujesz?";
};                       

FUNC INT Info_Mod_Hans_Kimon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Penner_Kimon))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kimon))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Kimon_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_00"); //Jak sie czujesz?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_01"); //Zle jak zawsze.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_02"); //Wtedy nalezy pic dawce radosci.
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_03"); //Z Adanosem! Nienawidze tych rzeczy! Powoduje, ze ludzie sa tu szaleni. Ale nie ze mna.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_04"); //Czy wiesz, gdzie moge je dostac?
	AI_Output(self, hero, "Info_Mod_Hans_Kimon_06_05"); //Nie. I wyjdz z tego miejsca. Nie potrzebuje twojej rady.
	AI_Output(hero, self, "Info_Mod_Hans_Kimon_15_06"); //Prosze mi wybaczyc, przepraszam.
};

INSTANCE Info_Mod_Hans_Theodorus (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Theodorus_Condition;
	information	= Info_Mod_Hans_Theodorus_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Theodorus_Condition()
{
	if(Npc_KnowsInfo(hero, Info_Mod_Theodorus_Unruhen7))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Theodorus_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_00"); //Co uwazasz, ze robisz, wyznaczajac to schwafler, to bum jako gubernatora miasta?
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_01"); //Dlaczego pozwoliliscie sobie nawet na podjecie takiej decyzji?
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_02"); //Tak wiec decyzja nie zalezy od takich osób jak Ty.
	AI_Output(self, hero, "Info_Mod_Hans_Theodorus_06_03"); //Nie otwieraj ust do tej pory, slyszysz mnie? Dzieki Tobie i tym madrym facetom, jestesmy w glebokim gniewie!
	AI_Output(hero, self, "Info_Mod_Hans_Theodorus_15_04"); //Mysle, ze nie ma sensu dalej dyskutowac na ten temat.
};

INSTANCE Info_Mod_Hans_Unruhen (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Unruhen_Condition;
	information	= Info_Mod_Hans_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Hans_Unruhen_Condition()
{
	if (Mod_REL_Stadthalter == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_00"); //Och, tam jestescie. Chcialem pogratulowac pani decyzji.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_01"); //Znam lucasy od dawna, a on jest dobrym chlopcem. Nawiasem mówiac, jako wieloletni przyjaciel dostalem kilka przywilejów handlowych.
	AI_Output(hero, self, "Info_Mod_Hans_Unruhen_15_02"); //(ironiczne) Oczywiscie.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_03"); //Przywileje te maja nadrobic moje wady. Ze wzgledu na moje oczy.
	AI_Output(self, hero, "Info_Mod_Hans_Unruhen_06_04"); //Moglem uzupelnic oferte. Dobrze sie rozejrzyj.
};

INSTANCE Info_Mod_Hans_Freudenspender (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Freudenspender_Condition;
	information	= Info_Mod_Hans_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Chcesz cos dac Ci radosc w obliczu codziennosci?";
};                       

FUNC INT Info_Mod_Hans_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Hans_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Hans_Freudenspender_15_00"); //Chcesz cos dac Ci radosc w obliczu codziennosci?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_01"); //Chcesz mi sie dobrze bawic?
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_02"); //Nie biore niczego na siebie, poniewaz oszolomienie wycisnelo uziemienie padlinozercy.
	AI_Output(self, hero, "Info_Mod_Hans_Freudenspender_06_03"); //I hej, mozna sie bez niego obejsc.
};

INSTANCE Info_Mod_Hans_Trade (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Trade_Condition;
	information	= Info_Mod_Hans_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Hans_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hans_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hans_Theodorus))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hans_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Hans_Pickpocket (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_Pickpocket_Condition;
	information	= Info_Mod_Hans_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Hans_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Hans_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_BACK, Info_Mod_Hans_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hans_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hans_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
};

FUNC VOID Info_Mod_Hans_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hans_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hans_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hans_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hans_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hans_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hans_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hans_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hans_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hans_EXIT (C_INFO)
{
	npc		= Mod_7377_OUT_Hans_REL;
	nr		= 1;
	condition	= Info_Mod_Hans_EXIT_Condition;
	information	= Info_Mod_Hans_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hans_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hans_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
