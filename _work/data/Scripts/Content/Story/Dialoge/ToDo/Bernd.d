INSTANCE Info_Mod_Bernd_Hi (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Hi_Condition;
	information	= Info_Mod_Bernd_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Niech mi sie zgadniecie, jestescie tutaj facetem. )";
};

FUNC INT Info_Mod_Bernd_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bernd_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Bernd_Hi_15_00"); //Niech mi sie zgadniecie, to wy jestescie facetem, który daje mi wszystko, czego potrzebuje dla mentalnosci.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_01"); //(ironiczne) Wiedzialem, ze stoisko jest zbyt widoczne.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_02"); //Ale masz racje, dam ci wszystko, czego potrzebujesz do zwiedzania Doliny Minentalnej.
	AI_Output(hero, self, "Info_Mod_Bernd_Hi_15_03"); //Was soll das heißen "jak wszystko"?
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_04"); //Byc moze jeszcze tego nie zauwazyliscie, ale nasza kopalnia nie jest jeszcze zbyt ekonomiczna i dlatego nie mam w ofercie zadnej broni rudnej.
	AI_Output(self, hero, "Info_Mod_Bernd_Hi_01_05"); //W przeciwnym razie moge miec wszystko, czego potrzebujesz.

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_KG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_KG, "Bernd zajmuje sie wszystkim rodzajem rzeczy.");
};

INSTANCE Info_Mod_Bernd_InGilde (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_InGilde_Condition;
	information	= Info_Mod_Bernd_InGilde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bernd_InGilde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bernd_Hi))
	&& (KG_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bernd_InGilde_Info()
{
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_00"); //Jestes z nami teraz! Dam ci wskazówke: bez wzgledu na bogactwa, które ci obiecuja, nie idz do kopalni.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_01"); //Tam czaja sie stworzenia, które raczej nie przeszkadzaly, a przez to nie mam na mysli kamiennych potworów.
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_02"); //Skad to wiesz, czy kiedykolwiek byles w mojej kopalni?
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_03"); //Oczywiscie, bylismy juz w srodku i mówie wam, nie bede mial jeszcze 20 kolejnych orków!
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_04"); //Co sie tam stalo?
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_05"); //Wtedy wlasnie odkrylismy wejscie do kopalni.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_06"); //Zastanawialismy sie, dlaczego tylko wejscie zostalo pochowane.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_07"); //A kiedy w koncu znalezlismy sie w kopalni, wygladalo to zupelnie inaczej niz stare mapy.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_08"); //Cóz, to nie bylo tak naprawde problemem, bylismy w stanie przenikac do kopalni i bylismy prawie pewni, ze nie ma juz tam zadnych potworów.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_09"); //Kiedy jednak weszlismy do nieco wiekszego pokoju, który byl jakby pozostaloscia po bylej kopalni, zblizyla sie do nas cala horda owych kamiennych potworów.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_10"); //Bylem wówczas jedynym ocalalym i tylko dlatego, ze wzialem nogi w reke.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_11"); //Nie chce teraz przyjmowac zadnych zalozen, ale dla mnie wygladalo to tak, jakby kamienne potwory równiez byly w biegu i bez wzgledu na to z czego uciekli, nie chce ich uderzac.
	AI_Output(hero, self, "Info_Mod_Bernd_InGilde_15_12"); //Zobaczymy, byc moze wkrótce znajdziemy wyjasnienie dla wszystkich tych wydarzen.
	AI_Output(self, hero, "Info_Mod_Bernd_InGilde_01_13"); //Jesli myslisz, ze gdybym byl Toba, trzymalbym rece z dala od niego.
};

INSTANCE Info_Mod_Bernd_Trade (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Trade_Condition;
	information	= Info_Mod_Bernd_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Bernd_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bernd_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bernd_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Bernd_Pickpocket (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_Pickpocket_Condition;
	information	= Info_Mod_Bernd_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Bernd_Pickpocket_Condition()
{
	C_Beklauen	(80, ItMi_Gold, 21);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

	Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_BACK, Info_Mod_Bernd_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bernd_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Bernd_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Bernd_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Bernd_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Bernd_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Bernd_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Bernd_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Bernd_EXIT (C_INFO)
{
	npc		= Mod_1012_KGD_Bernd_MT;
	nr		= 1;
	condition	= Info_Mod_Bernd_EXIT_Condition;
	information	= Info_Mod_Bernd_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bernd_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bernd_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
