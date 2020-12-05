INSTANCE Info_Mod_Graham_Hi (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Hi_Condition;
	information	= Info_Mod_Graham_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Graham_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_00"); //Nie widzialem cie wczesniej?
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_01"); //W kazdym razie dales mi jedna z kart jeden raz.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_02"); //Teraz wiem, kim znów jestes!
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_03"); //Byles dziwaczny, który przybyl do zapory kilka miesiecy temu i zwiazal sie z niemal kazdym wplywowym straznikiem.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_04"); //Czlowiek, Buddlerzy obstawiaja, kiedy Gomez staje sie zbyt kolorowy, a on zabije cie.
	AI_Output(self, hero, "Info_Mod_Graham_Hi_36_05"); //A teraz nagle wracasz.
	AI_Output(hero, self, "Info_Mod_Graham_Hi_15_06"); //Tak. To jest tym kim jestem.
};

INSTANCE Info_Mod_Graham_Haendler (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Haendler_Condition;
	information	= Info_Mod_Graham_Haendler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nadal sprzedaje karty?";
};

FUNC INT Info_Mod_Graham_Haendler_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Haendler_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Haendler_15_00"); //Nadal sprzedaje karty?
	AI_Output(self, hero, "Info_Mod_Graham_Haendler_36_01"); //Pewne. Nie robie juz wiecej, ale mam troche resztek. Mozna na nie spojrzec.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Graham sprzedaje bilety.");
};

INSTANCE Info_Mod_Graham_WasGibts (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_WasGibts_Condition;
	information	= Info_Mod_Graham_WasGibts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co nalezy zglosic na temat okresu przejsciowego?";
};

FUNC INT Info_Mod_Graham_WasGibts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_WasGibts_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_WasGibts_15_00"); //Co nalezy zglosic na temat okresu przejsciowego?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_01"); //Ach, mezczyzna, dokad zaczynam?
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_02"); //Poczatkowo wszystko trwalo normalnie, ale na krótko przed upadkiem zapory Gomez szalal i mordowal wszystkich magów ognia, a nastepnie zniknal bez sladu z Ravenem i Scar.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_03"); //Poza tym kopalnia rzekomo upadla, ale jesli wierzyc Ianowi, to jest to równiez watpliwe.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_04"); //To wszystko jest bardzo tajemnicze. W kazdym razie pieklo pekalo w obozie i byla czysta anarchia, az Thorus mógl zapewnic spokój i cisze.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_05"); //W miedzyczasie wszystko znów sie uspokoilo. Nieco za duzo, jesli mnie pan zapyta. Bez kopalni nie mamy nic do zrobienia przez caly dzien.
	AI_Output(self, hero, "Info_Mod_Graham_WasGibts_36_06"); //Wiekszosc ludzi wie, jak rozpraszac sie alkoholem, bagiennymi lodygami ziól lub walkami na arenie.
};

INSTANCE Info_Mod_Graham_Lagermusik (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Lagermusik_Condition;
	information	= Info_Mod_Graham_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy mozesz grac na instrumencie?";
};

FUNC INT Info_Mod_Graham_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_00"); //Czy mozesz grac na instrumencie?
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_01"); //No cóz, nie jestem wirtuozem ani niczym innym.... ale moge zrobic troche halasu.
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_02"); //Gravo szuka czlonków swojej grupy. Powinienes kiedys sie z nim zameldowac.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_03"); //Kocham. Ale dlaczego wlasnie z Gravo?
	AI_Output(hero, self, "Info_Mod_Graham_Lagermusik_15_04"); //Nie ugryzie sie.
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_05"); //Tak dlugo, jak dlugo pamieta o swoim dobrym wychowaniu.....
	AI_Output(self, hero, "Info_Mod_Graham_Lagermusik_36_06"); //Dobrze, zobacze, czy to cos dla mnie.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATGRAVO");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Graham_Trade (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Trade_Condition;
	information	= Info_Mod_Graham_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Graham_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Graham_Haendler))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Graham_Trade_Info()
{
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Graham_Pickpocket (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_Pickpocket_Condition;
	information	= Info_Mod_Graham_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Graham_Pickpocket_Condition()
{
	C_Beklauen	(30, ItMi_Gold, 13);
};

FUNC VOID Info_Mod_Graham_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_BACK, Info_Mod_Graham_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Graham_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Graham_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
};

FUNC VOID Info_Mod_Graham_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Graham_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Graham_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Graham_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Graham_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Graham_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Graham_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Graham_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Graham_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Graham_EXIT (C_INFO)
{
	npc		= Mod_1469_BUD_Graham_MT;
	nr		= 1;
	condition	= Info_Mod_Graham_EXIT_Condition;
	information	= Info_Mod_Graham_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Graham_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Graham_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
