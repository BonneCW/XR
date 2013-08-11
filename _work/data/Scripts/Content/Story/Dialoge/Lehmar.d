INSTANCE Info_Mod_Lehmar_Hi (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Hi_Condition;
	information	= Info_Mod_Lehmar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Lehmar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lehmar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Lehmar_Hi_09_01"); //Ich bin Lehmar, der Geldverleiher.
};

INSTANCE Info_Mod_Lehmar_Kleinod (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Kleinod_Condition;
	information	= Info_Mod_Lehmar_Kleinod_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Paket für dich.";
};

FUNC INT Info_Mod_Lehmar_Kleinod_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_KleinodPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Kleinod_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Kleinod_15_00"); //Ich hab hier ein Paket für dich.
	
	B_GiveInvItems	(hero, self, Mod_KleinodPaket, 1);

	AI_Output(self, hero, "Info_Mod_Lehmar_Kleinod_09_01"); //Wurde aber auch langsam Zeit.
	AI_Output(self, hero, "Info_Mod_Lehmar_Kleinod_09_02"); //Hier ist dein Gold.

	CreateInvItems	(self, ItMi_Gold, 500);
	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Lehmar_Statue (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Statue_Condition;
	information	= Info_Mod_Lehmar_Statue_Info;
	permanent	= 0;
	important	= 0;
	description	= "Thorben meinte du hättest seine Innos Statue.";
};

FUNC INT Info_Mod_Lehmar_Statue_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Lehrling))
	&& (Npc_KnowsInfo(hero, Info_Mod_Lehmar_Hi))
	&& (Npc_HasItems(self, ItMi_LostInnosStatue_Daron) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Statue_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Statue_15_00"); //Thorben meinte du hättest seine Innos Statue.
	AI_Output(self, hero, "Info_Mod_Lehmar_Statue_09_01"); //Wenn du die Statue meinst, die in der Truhe war die ich von ihm bekommen habe, dann hab ich sie.
};

INSTANCE Info_Mod_Lehmar_Statue2 (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Statue2_Condition;
	information	= Info_Mod_Lehmar_Statue2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibst du mir die Statue?";
};

FUNC INT Info_Mod_Lehmar_Statue2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lehmar_Statue))
	&& (Npc_HasItems(self, ItMi_LostInnosStatue_Daron) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Statue2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Statue2_15_00"); //Gibst du mir die Statue?
	AI_Output(self, hero, "Info_Mod_Lehmar_Statue2_09_01"); //Wenn du mir die 100 Goldmünzen bringst, die Thorben mir noch schuldet.
};

INSTANCE Info_Mod_Lehmar_Statue3 (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Statue3_Condition;
	information	= Info_Mod_Lehmar_Statue3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier ist das Gold.";
};

FUNC INT Info_Mod_Lehmar_Statue3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lehmar_Statue2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	&& (Npc_HasItems(self, ItMi_LostInnosStatue_Daron) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Statue3_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Statue3_15_00"); //Hier ist das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Lehmar_Statue3_09_01"); //Hier ist die Statue.

	B_GiveInvItems	(self, hero, ItMi_LostInnosStatue_Daron, 1);

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Lehmar_Leihen (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Leihen_Condition;
	information	= Info_Mod_Lehmar_Leihen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kannst du mir Geld leihen?";
};

FUNC INT Info_Mod_Lehmar_Leihen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lehmar_Hi))
	&& (Mod_Geliehen == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Leihen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Leihen_15_00"); //Kannst du mir Geld leihen?
	AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_09_01"); //Wieviel willst du?

	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);

	Info_AddChoice	(Info_Mod_Lehmar_Leihen, DIALOG_BACK, Info_Mod_Lehmar_Leihen_BACK);
	Info_AddChoice	(Info_Mod_Lehmar_Leihen, "1000 Gold", Info_Mod_Lehmar_Leihen_1000);
	Info_AddChoice	(Info_Mod_Lehmar_Leihen, "500 Gold", Info_Mod_Lehmar_Leihen_500);
	Info_AddChoice	(Info_Mod_Lehmar_Leihen, "200 Gold", Info_Mod_Lehmar_Leihen_200);
	Info_AddChoice	(Info_Mod_Lehmar_Leihen, "100 Gold", Info_Mod_Lehmar_Leihen_100);
};

FUNC VOID Info_Mod_Lehmar_Leihen_BACK()
{
	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);
};

FUNC VOID Info_Mod_Lehmar_Leihen_1000()
{
	if (Mod_HatGoldGeliehen < 3)
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_1000_09_00"); //TAUSEND GOLDMÜNZEN!!!
		AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_1000_09_01"); //Ich werde dir 200 Goldmünzen geben, mehr nicht. Und vergiss nicht es zurückzuzahlen.
	
		B_GiveInvItems	(self, hero, ItMi_Gold, 200);

		Mod_LeihBetrag = 220;
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_1000_09_02"); //Das ist verdammt viel Gold. Aber du mir mein Gold bisher immer wieder zurückgebracht, deshalb werde ich dir das Gold geben.
		AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_1000_09_03"); //Hier hast du 1000 Goldmünzen. Und vergiss nicht es zurückzuzahlen.
	
		B_GiveInvItems	(self, hero, ItMi_Gold, 1000);

		Mod_LeihBetrag = 1100;
	};

	Mod_Geliehen = TRUE;
	Mod_HatGoldGeliehen += 1;

	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);
};

FUNC VOID Info_Mod_Lehmar_Leihen_500()
{
	AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_500_09_00"); //500 Goldmünzen. Ich glaube kaum das du das jemals zurückzahlen kannst, aber ich gebe dir das Geld.
	AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_500_09_01"); //Und vergiss nicht es zurückzuzahlen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	Mod_LeihBetrag = 550;
	Mod_Geliehen = TRUE;
	Mod_HatGoldGeliehen += 1;

	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);
};

FUNC VOID Info_Mod_Lehmar_Leihen_200()
{
	AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_200_09_00"); //200 Goldmünzen sind nicht viel. Und vergiss nicht es zurückzuzahlen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);
	
	Mod_LeihBetrag = 220;
	Mod_Geliehen = TRUE;
	Mod_HatGoldGeliehen += 1;

	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);
};

FUNC VOID Info_Mod_Lehmar_Leihen_100()
{
	AI_Output(self, hero, "Info_Mod_Lehmar_Leihen_100_09_00"); //100 Goldmünzen sind nicht grad viel. Vergiss nicht es zurückzuzahlen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Mod_LeihBetrag = 110;
	Mod_Geliehen = TRUE;
	Mod_HatGoldGeliehen += 1;

	Info_ClearChoices	(Info_Mod_Lehmar_Leihen);
};

INSTANCE Info_Mod_Lehmar_Zurueckzahlen (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Zurueckzahlen_Condition;
	information	= Info_Mod_Lehmar_Zurueckzahlen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will dir dein Gold zurückzahlen.";
};

FUNC INT Info_Mod_Lehmar_Zurueckzahlen_Condition()
{
	if (Mod_Geliehen == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lehmar_Zurueckzahlen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Zurueckzahlen_15_00"); //Ich will dir dein Gold zurückzahlen.
	AI_Output(hero, self, "Info_Mod_Lehmar_Zurueckzahlen_15_01"); //Wieviel muss ich dir zahlen?.

	if (Mod_Leihbetrag == 1100)
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_09_02"); //1100 Goldmünzen.
	}
	else if (Mod_Leihbetrag == 550)
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_09_03"); //550 Goldmünzen.
	}
	else if (Mod_Leihbetrag == 220)
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_09_04"); //220 Goldmünzen.
	}
	else if (Mod_Leihbetrag == 110)
	{
		AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_09_05"); //110 Goldmünzen.
	};

	Info_ClearChoices	(Info_Mod_Lehmar_Zurueckzahlen);

	Info_AddChoice	(Info_Mod_Lehmar_Zurueckzahlen, "Ich hab nicht genug Gold.", Info_Mod_Lehmar_Zurueckzahlen_Nein);

	if (Npc_HasItems(hero, ItMi_Gold) >= Mod_Leihbetrag)
	{
		Info_AddChoice	(Info_Mod_Lehmar_Zurueckzahlen, "Hier hast du dein Gold.", Info_Mod_Lehmar_Zurueckzahlen_Ja);
	};
};

FUNC VOID Info_Mod_Lehmar_Zurueckzahlen_Nein()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Zurueckzahlen_Nein_15_00"); //Ich hab nicht genug Gold.
	AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_Nein_09_01"); //Dann besorg es und belästige mich nicht.

	Info_ClearChoices	(Info_Mod_Lehmar_Zurueckzahlen);
};

FUNC VOID Info_Mod_Lehmar_Zurueckzahlen_Ja()
{
	AI_Output(hero, self, "Info_Mod_Lehmar_Zurueckzahlen_Ja_15_00"); //Hier hast du dein Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, Mod_Leihbetrag);
	Npc_RemoveInvItems	(self, ItMi_Gold, Mod_Leihbetrag);

	AI_Output(self, hero, "Info_Mod_Lehmar_Zurueckzahlen_Ja_09_01"); //Gut, wenn du wieder Gold brauchst, dann komm zu mir.

	Mod_Geliehen = FALSE;

	Mod_Leihbetrag = 0;

	Info_ClearChoices	(Info_Mod_Lehmar_Zurueckzahlen);
};

INSTANCE Info_Mod_Lehmar_Pickpocket (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_Pickpocket_Condition;
	information	= Info_Mod_Lehmar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_210;
};

FUNC INT Info_Mod_Lehmar_Pickpocket_Condition()
{
	C_Beklauen	(200, ItMi_Gold, 166);
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);

	Info_AddChoice	(Info_Mod_Lehmar_Pickpocket, DIALOG_BACK, Info_Mod_Lehmar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lehmar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lehmar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);

		Info_AddChoice	(Info_Mod_Lehmar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lehmar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lehmar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lehmar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lehmar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lehmar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lehmar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lehmar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lehmar_EXIT (C_INFO)
{
	npc		= Mod_537_NONE_Lehmar_NW;
	nr		= 1;
	condition	= Info_Mod_Lehmar_EXIT_Condition;
	information	= Info_Mod_Lehmar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lehmar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};