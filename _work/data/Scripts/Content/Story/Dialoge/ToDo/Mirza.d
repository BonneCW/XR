INSTANCE Info_Mod_Mirza_Hi (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Hi_Condition;
	information	= Info_Mod_Mirza_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mysle, ze jestes nastepnym szczeblem mojej drabiny dla nowicjusza.";
};

FUNC INT Info_Mod_Mirza_Hi_Condition()
{
	if (Mod_ASS_MahamadRaetsel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_00"); //Mysle, ze jestes nastepnym szczeblem mojej drabiny dla nowicjusza.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_01"); //To prawda. I to nie ostatni....
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_02"); //Zbyt zle. Co moge Ci dostac?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_03"); //Mam problem....
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_04"); //Z czym mam Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_05"); //Calkiem tak. Sprawa jest w pewnym sensie.... wrazliwy
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_06"); //Powiedz mi o tym.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_07"); //Zagubilem cenna rzecz, która powierzyla mi Wysoka Rada w celu zapewnienia bezpieczenstwa.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_08"); //O co to jest?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_09"); //Jest to rzadki amulet. Niedawno wyszedlem w nocy szukajac rzadkiego leczniczego budka. Musialo to byc wypadniecie z mojej torby.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_10"); //Gdzie byles na drodze?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_11"); //W drodze z latarni morskiej do duzego lasu. Nie podejrzewalem nic zlego, przyjezdza do mnie paczka Warge.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_12"); //Moglem zabic kilka osób, ale bylo ich zbyt wiele. Wtedy szukalem zbawienia w biegu. I od tego czasu to wszystko zniknelo.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_13"); //Ostroznie, mówisz? To sa niebezpieczne zwierzeta.
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_14"); //Mozna to powiedziec jeszcze raz. Myslisz, ze znajdziesz to dla mnie?
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_15"); //Moge spróbowac. Co bys zrobil, gdybys nie mial glosu do przebaczenia?
	AI_Output(self, hero, "Info_Mod_Mirza_Hi_12_16"); //Dobre pytanie. Nie wiem o tym. Ale otrzymuja panstwo mój glos. Obiecuje.
	AI_Output(hero, self, "Info_Mod_Mirza_Hi_15_17"); //Twoje slowo w uchu Beliara!

	Log_CreateTopic	(TOPIC_MOD_ASS_AMULETT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_AMULETT, "Mirza stracil amulet w ciemnym lesie. Mam ja znalezc. Pozwól mi zabrac glos. Najlepiej zaczac od latarni morskiej na górze.");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_33");

	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg,	"NW_FOREST_PATH_31_NAVIGATION2");
	Wld_InsertNpc	(Warg_Mirza,	"NW_FOREST_PATH_31_NAVIGATION2");
};

INSTANCE Info_Mod_Mirza_Amulett (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Amulett_Condition;
	information	= Info_Mod_Mirza_Amulett_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wracam. Z amuletem.";
};

FUNC INT Info_Mod_Mirza_Amulett_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mirza_Hi))
	&& (Npc_HasItems(hero, ItAm_Mirza) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Amulett_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_00"); //Wracam. Z amuletem.

	B_GiveInvItems	(hero, self, ItAm_Mirza, 1);

	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_01"); //Gdzie znalazles?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_02"); //W zoladku warg.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_03"); //Mielismy szczescie!
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_04"); //My? Ja powiedzialbym.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_05"); //Jednakze. Glosuje za Toba.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_06"); //Jaki to amulet.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_07"); //Tak naprawde nie wiem. To pogloski, wlozenie i zakladanie sprawia, ze jest to niewrazliwe. Ale nie moge w to uwierzyc.
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_08"); //Hmm. Ciekawe! Moze mozna sie o tym dowiedziec wiecej.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_09"); //Do kogo jeszcze moge sie udac?
	AI_Output(hero, self, "Info_Mod_Mirza_Amulett_15_10"); //Wypróbuj Aimana. Zawsze ma cos do delegowania.
	AI_Output(self, hero, "Info_Mod_Mirza_Amulett_12_11"); //Tak. Teraz nalezy zachowac ostroznosc.

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_ASS_AMULETT, LOG_SUCCESS);
	
	B_LogEntry	(TOPIC_MOD_ASS_MAGIER, "");
};

INSTANCE Info_Mod_Mirza_Blutkelch (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Blutkelch_Condition;
	information	= Info_Mod_Mirza_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Got ya! Czego chciales z pucharkami, mów!";
};

FUNC INT Info_Mod_Mirza_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mufid_Verrat))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mirza_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_00"); //Got ya! Czego chciales z pucharkami, mów!
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_01"); //Milosierdzie! Jestesmy w imieniu naszego lidera Noreka.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_02"); //Jakiego rodzaju zadanie?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_03"); //Dla niektórych naszych pracowników zakladamy biuro terenowe. To jest dla nich zbyt blisko w obozie.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_04"); //Jakie osoby?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_05"); //Cóz, my czarnoksieznik....
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_06"); //I do tego trzeba bylo zabic kupca?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_07"); //Mieszka w poblizu. Mógl nas dostrzec.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_08"); //I ja tez próbowales mnie zabic.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_09"); //Nie wiem, dlaczego Mufid cie zaatakowal.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_10"); //I filizanka?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_11"); //Nie wiem nic o filizance.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_12"); //Klamasz! Mówisz mi wszystko teraz lub nigdy nie bedziesz mial kolejnej szansy, aby cos powiedziec.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_13"); //Naprawde nie wiem, na czym polegaja kielichy. Bedziesz musial zwrócic sie do Rady.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_14"); //Co dalej?
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_15"); //Jak juz powiedzialem, Norek chce, zebysmy my upuscili magów. Nastepnie Zahit, który jest w miescie, ma dac paladynom wskazówke, ze wojownicy zabójcy sa blisko miasta.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_16"); //Norek wierzy, ze moze dac nam magów prawo do egzystencji na khorynach, abysmy mogli swobodnie poruszac sie po kraju i nie musieli juz tu sie ukrywac.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_17"); //Niewiarygodny! Chcesz zdradzic swoich braci.
	AI_Output(self, hero, "Info_Mod_Mirza_Blutkelch_12_18"); //To nie jest mój pomysl. Norek tego chce. I wiekszosc magów.
	AI_Output(hero, self, "Info_Mod_Mirza_Blutkelch_15_19"); //A ty, jak widac. Umrzesz za to, zdrajca!

	B_GivePlayerXP	(100);

	Log_CreateTopic	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERSCHWOERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_VERSCHWOERUNG, "Tocza sie tu konspiracje. Magicy chca sie oderwac, a nastepnie zdradzic wojowników na paladynów. Naprawde musze porozmawiac z Mustafa. Co najwazniejsze, slychac.");
};

INSTANCE Info_Mod_Mirza_Pickpocket (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_Pickpocket_Condition;
	information	= Info_Mod_Mirza_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Mirza_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_BACK, Info_Mod_Mirza_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mirza_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Mirza_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Mirza_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Mirza_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Mirza_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Mirza_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Mirza_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Mirza_EXIT (C_INFO)
{
	npc		= Mod_7156_ASS_Mirza_NW;
	nr		= 1;
	condition	= Info_Mod_Mirza_EXIT_Condition;
	information	= Info_Mod_Mirza_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mirza_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mirza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
