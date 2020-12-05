INSTANCE Info_Mod_Brian_Hi (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Hi_Condition;
	information	= Info_Mod_Brian_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Praktyka Harada, przypuszczam, ze to uczen?";
};

FUNC INT Info_Mod_Brian_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_00"); //Praktyka Harada, przypuszczam, ze to uczen?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_01"); //Jeszcze przed chwila, tak!
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_02"); //Jeszcze przed chwila?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_03"); //Jesli najmniejszy szczegól, to juz od dluzszego czasu jestem jego praktykantem. Przykrec mu wiec.
	AI_Output(hero, self, "Info_Mod_Brian_Hi_15_04"); //Dlaczego jestes tak zly?
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_05"); //Poniewaz Harad Harad jest kompletny, tak.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_06"); //Placzac przez caly dzien bólem i bólami, krytykuje wszystko, co robie w tym samym oddechu.
	AI_Output(self, hero, "Info_Mod_Brian_Hi_27_07"); //Nie mozesz zadowolic egoisty!
};

INSTANCE Info_Mod_Brian_HaradLehrling (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_HaradLehrling_Condition;
	information	= Info_Mod_Brian_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcialbym byc kowalem praktykantem.";
};

FUNC INT Info_Mod_Brian_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_DeinLehrlingStattBrian))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_00"); //Chcialbym byc kowalem praktykantem.
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_15_01"); //Ale Harad mówi, ze chce uczyc tylko jednego ucznia na raz.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_02"); //Ha! Znam bardzo proste rozwiazanie!
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_03"); //Wolalbym raczej stac sie rybakiem niz pozwalac sie dluzej eksploatowac.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_27_04"); //Badzcie uczniami. Zycze Wam wszelkich sukcesów i mam nadzieje, ze dasz mu kilka z nich na szczece.

	Mod_Brian_KeinLehrling_Day = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);

	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Nie chcesz ponownie sie zastanawiac?", Info_Mod_Brian_HaradLehrling_B);
	Info_AddChoice	(Info_Mod_Brian_HaradLehrling, "Uh.... dziekuje.", Info_Mod_Brian_HaradLehrling_A);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_B()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_B_15_00"); //Nie chcesz ponownie sie zastanawiac?
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_01"); //Nie ma juz o czym myslec. Kazdego dnia zyczylam sobie, ze rozpoczalam inna nauke.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_02"); //A teraz dajesz mi szanse. Nie przepuszczam tego.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_B_27_03"); //Dzis wieczorem jestem wolnym czlowiekiem!

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

FUNC VOID Info_Mod_Brian_HaradLehrling_A()
{
	AI_Output(hero, self, "Info_Mod_Brian_HaradLehrling_A_15_00"); //Uh.... dziekuje.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_01"); //Nie musisz mi dziekowac.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_02"); //Gdybym naprawde chcial Ci pomóc, powstrzymywalbym Cie przed zostaniem uczniem Harada z moimi rekami i stopami.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_03"); //Ale nie obchodzi mnie tak naprawde. Albo jestes w stanie cierpiec, mozesz usiasc przeciwko niemu lub po krótkim czasie posluchac go bez nerwów.
	AI_Output(self, hero, "Info_Mod_Brian_HaradLehrling_A_27_04"); //Teraz koncze gonna.

	Info_ClearChoices	(Info_Mod_Brian_HaradLehrling);
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr01 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr01_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jak dziala?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr01_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr01_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr01_15_00"); //Jak dziala?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr01_27_01"); //Uwielbiam spokój wedkarstwa. Latwosc konserwacji i pozwalanie, aby twoje mysli wedrowaly.....
};

INSTANCE Info_Mod_Brian_KeinLehrlingMehr02 (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_KeinLehrlingMehr02_Condition;
	information	= Info_Mod_Brian_KeinLehrlingMehr02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ciagle handel?";
};

FUNC INT Info_Mod_Brian_KeinLehrlingMehr02_Condition()
{
	if (Mod_Brian_KeinLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_KeinLehrlingMehr02_Info()
{
	AI_Output(hero, self, "Info_Mod_Brian_KeinLehrlingMehr02_15_00"); //Ciagle handel?
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_27_01"); //Poniewaz Harad wykopal mnie po naszej rozmowie, wciaz mam przy sobie rzeczy z dawnych dni.
	AI_Output(self, hero, "Info_Mod_Brian_KeinLehrlingMehr02_27_02"); //Zapraszamy do zakupu.
};

INSTANCE Info_Mod_Brian_Daemonisch (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Daemonisch_Condition;
	information	= Info_Mod_Brian_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Brian_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_00"); //Co ty tu robisz? Nie jestes jednym z nich, czy jestes? Badzcie ostrzegani, bede walczyc do smierci.
	AI_Output(hero, self, "Info_Mod_Brian_Daemonisch_15_01"); //Spokój na razie. O czym Pan mówi?
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_02"); //Nie wydaje sie, zebys byl jednym z nich.
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_03"); //Czarne cienie.... musisz wiedziec, ze miasto....
	AI_Output(self, hero, "Info_Mod_Brian_Daemonisch_27_04"); //Rupert,.... Uwazaj na ciemnosc....

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1248_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1249_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1250_RIT_Ritter_NW, "DAEMONISCH");
};

var int Mod_Brian_Trader;

INSTANCE Info_Mod_Brian_Trade (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Trade_Condition;
	information	= Info_Mod_Brian_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Brian_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Brian_Trade_Info()
{
	if (!Mod_Brian_Trader) {
		Mod_Brian_Trader = TRUE;
		
		Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Brian moze mi sprzedac pewne towary.");
	};
	
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Brian_Pickpocket (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_Pickpocket_Condition;
	information	= Info_Mod_Brian_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Brian_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMiSwordRaw, 3);
};

FUNC VOID Info_Mod_Brian_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_BACK, Info_Mod_Brian_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Brian_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Brian_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
};

FUNC VOID Info_Mod_Brian_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Brian_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Brian_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Brian_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Brian_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Brian_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Brian_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Brian_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Brian_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Brian_EXIT (C_INFO)
{
	npc		= Mod_566_NONE_Brian_NW;
	nr		= 1;
	condition	= Info_Mod_Brian_EXIT_Condition;
	information	= Info_Mod_Brian_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Brian_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Brian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
