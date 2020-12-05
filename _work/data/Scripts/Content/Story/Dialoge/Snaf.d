INSTANCE Info_Mod_Snaf_Hi (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Hi_Condition;
	information	= Info_Mod_Snaf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Snaf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_Hi_Info()
{
	if (Mod_Import_Snaf == LOG_SUCCESS)
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_00"); //Hej, znam cie. Przyniesliscie mi raz skladniki na mój ragout z pluskwy.
		AI_Output(hero, self, "Info_Mod_Snaf_Hi_15_01"); //Tak.....
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_02"); //Musze jeszcze raz za to podziekowac. Dobrze utrzymywalem sie z pierozka miesnego.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_03"); //W zamian sprzedam Ci czesc mojego nowego towaru. Oczywiscie mam tez ragout na pluskwy miesne.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_04"); //Hej, nowy facet. Jesli jestes glodny, mozesz upuscic sie za moim miejscem, mam dla ciebie kilka prawdziwych specjalów.
		AI_Output(self, hero, "Info_Mod_Snaf_Hi_06_05"); //Miedzy innymi mój slynny ragout z pluskwy.
	};

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_OLDCAMP, "Snaf sprzedaje mi rózne artykuly spozywcze. I oczywiscie równiez ragout z pluskwy miesnej.");
};

INSTANCE Info_Mod_Snaf_WoherZutaten (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_WoherZutaten_Condition;
	information	= Info_Mod_Snaf_WoherZutaten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Skad pochodza wszystkie skladniki?";
};

FUNC INT Info_Mod_Snaf_WoherZutaten_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_WoherZutaten_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_WoherZutaten_15_00"); //Skad pochodza wszystkie skladniki?
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_06_01"); //Zawsze jest mnóstwo robaków miesnych. Ponadto mysliwi dostarczaja wystarczajaca ilosc zielonki z polowan.
	AI_Output(self, hero, "Info_Mod_Snaf_WoherZutaten_06_02"); //I inaczej..... co mozna znalezc. Czasami lepiej nie myslec za duzo o tym, co jest w srodku.
};

INSTANCE Info_Mod_Snaf_Lagermusik (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Lagermusik_Condition;
	information	= Info_Mod_Snaf_Lagermusik_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co sadzisz o muzyce obozowej?";
};

FUNC INT Info_Mod_Snaf_Lagermusik_Condition()
{
	if (Mod_Gravo_Schatz == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Lagermusik_Info()
{
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_00"); //Co sadzisz o muzyce obozowej?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_01"); //O, nie wiesz, jak mi tesknie za takim czyms.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_02"); //Jeden z nich bije smyczki, jeden beben, a kazdy spiewa cos melancholijnego o pogodnym zyciu na dworze króla.
	AI_Output(hero, self, "Info_Mod_Snaf_Lagermusik_15_03"); //Gravo chce zbudowac cala grupe. Chcesz wziac udzial?
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_04"); //Chce wlasciwie dzialac? Nah, nie mam na to czasu. Nie moge pominac mojego garnka do gotowania.
	AI_Output(self, hero, "Info_Mod_Snaf_Lagermusik_06_05"); //Ale moze byc pewien, kto bedzie pierwszym gosciem jego wystepów!
};

INSTANCE Info_Mod_Snaf_Trade (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Trade_Condition;
	information	= Info_Mod_Snaf_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Snaf_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Snaf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Snaf_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Snaf_Pickpocket (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_Pickpocket_Condition;
	information	= Info_Mod_Snaf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Snaf_Pickpocket_Condition()
{
	C_Beklauen	(45, ItFo_Fleischwanzenragout, 3);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_BACK, Info_Mod_Snaf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Snaf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Snaf_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Snaf_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Snaf_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Snaf_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Snaf_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Snaf_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Snaf_EXIT (C_INFO)
{
	npc		= Mod_965_STT_Snaf_MT;
	nr		= 1;
	condition	= Info_Mod_Snaf_EXIT_Condition;
	information	= Info_Mod_Snaf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Snaf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Snaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
