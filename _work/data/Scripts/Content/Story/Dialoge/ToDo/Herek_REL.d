INSTANCE Info_Mod_Herek_REL_Hi (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Hi_Condition;
	information	= Info_Mod_Herek_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Hi_Condition()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_00"); //Hejdz, odczekaj minute.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_01"); //Wyglada na to, ze ktos, kto nie pozwolilby, aby dobra okazja przeslizgnela sie mu przez palce.
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_15_02"); //Czego chcesz?
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_01_03"); //Cóz, móglbym powiedziec wam - powiedzmy to po prostu dla 100 zlotych monet - gdzie mozna znalezc skarb.

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Zapomnij o tym. Zachowuje zloto.", Info_Mod_Herek_REL_Hi_B);
	Info_AddChoice	(Info_Mod_Herek_REL_Hi, "Okay, tutaj. Idz na to.", Info_Mod_Herek_REL_Hi_A);
};

FUNC VOID Info_Mod_Herek_REL_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_B_15_00"); //Zapomnij o tym. Zachowuje zloto.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_B_01_01"); //Dobrze, tracisz na zlocie.... Ale inni poszukiwacze przygód z pewnoscia nie przegapia tej szansy.
};

FUNC VOID Info_Mod_Herek_REL_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_Hi_A_15_00"); //Okay, tutaj. Idz na to.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_01"); //Cóz, potem sluchaj. W jednym z zniszczonych budynków przed torfowiskiem znajduje sie martwy poszukiwacz przygód.
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_02"); //Jak juz zauwazylem, przed smiercia znalazl wiele zlota i cennych artefaktów... Wiecej
	AI_Output(self, hero, "Info_Mod_Herek_REL_Hi_A_01_03"); //Wciaz musi miec go przy sobie. Czy to zrobiles?

	Info_ClearChoices	(Info_Mod_Herek_REL_Hi);

	Log_CreateTopic	(TOPIC_MOD_HEREK_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Na 100 monetach dowiedzialem sie od Hereka, ze umierajacy poszukiwacz przygód wedruje po zniszczonych budynkach przed wrzosowiskiem jako nieumarly, który musi nadal nosic z soba zloto i skarb.");

	Wld_InsertNpc	(Zombie_Herek,	"FP_ROAM_ZOMBIE_HEREK");
};

INSTANCE Info_Mod_Herek_REL_AtZombie (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie_Condition;
	information	= Info_Mod_Herek_REL_AtZombie_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_AtZombie_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Harlok_HerekZombie))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_00"); //Huh, teraz moge bez zaklócen kopac. Co ty!
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_15_01"); //Tak, ja! Masz szczescie, ze mnie ustawiles.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_01_02"); //Co wiec teraz robisz?

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Powtórzcie mi moje zloto.", Info_Mod_Herek_REL_AtZombie_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie, "Zdobadz zloto z powrotem.", Info_Mod_Herek_REL_AtZombie_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_C()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_C_01_00"); //Tak! Dlaczego nie spróbowac?

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_NONE, 0);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_B_15_00"); //Powtórzcie mi moje zloto.

	Info_Mod_Herek_REL_AtZombie_C();
};

FUNC VOID Info_Mod_Herek_REL_AtZombie_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_00"); //Zdobadz zloto z powrotem.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_01"); //Och, za chwile bede plakal.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_02"); //Jesli dajesz sie oszukiwac, to twoja wlasna wina. Kazdy musi placic wlasne czesne.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie_A_01_03"); //Powinniscie byc wdzieczni za te lekcje.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie_A_15_04"); //Mysle, ze musze nauczyc Cie lekcji.

	Info_Mod_Herek_REL_AtZombie_C();
};

INSTANCE Info_Mod_Herek_REL_Umgehauen (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Umgehauen_Condition;
	information	= Info_Mod_Herek_REL_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Herek_REL_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie))
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Umgehauen_Info()
{
	AI_Output(self, hero, "Info_Mod_Herek_REL_Umgehauen_04_00"); //Jestes synem suki, kosci moich.
							
	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;

	CreateInvItems	(self, ItPo_Health_Addon_04, 1);

	B_UseItem	(self, ItPo_Health_Addon_04);
};

INSTANCE Info_Mod_Herek_REL_AtZombie2 (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_AtZombie2_Condition;
	information	= Info_Mod_Herek_REL_AtZombie2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gdzie jest reszta mojego zlota?";
};

FUNC INT Info_Mod_Herek_REL_AtZombie2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_Umgehauen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_Info()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_15_00"); //Gdzie jest reszta mojego zlota?
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_01_01"); //Huh, chcialbys wiedziec. Ale nic nie powiem!

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Wtedy bede musial poluzowac Twój jezyk z kolejnym pobiciem.", Info_Mod_Herek_REL_AtZombie2_B);
	Info_AddChoice	(Info_Mod_Herek_REL_AtZombie2, "Potem wyjmij pieklo z niego.", Info_Mod_Herek_REL_AtZombie2_A);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_B()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_00"); //Wtedy bede musial poluzowac Twój jezyk z kolejnym pobiciem.

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_01"); //Ahh, moje kosci.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_02"); //Przeszlismy przez to juz wczesniej.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_03"); //(obnizenie) Okay. Pokaze Ci, gdzie sie swieci. (impulsywne) Tutaj!

	AI_PlayAni	(hero, "T_FISTATTACKMOVE");

	AI_TurnToNpc	(hero, self);
	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_04"); //(grozy) Ahhh..... Nie moge juz tego robic.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_05"); //Jestesmy szczesliwi, ze mozemy kontynuowac gre.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_06"); //Tak, tak, tak..... Mialem dosc.
	AI_Output(self, hero, "Info_Mod_Herek_REL_AtZombie2_B_01_07"); //Zloto znajduje sie na dachu zniszczonej chaty, najdalej oddalonej od bagna.
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_B_15_08"); //Dobrze, sprawdze.... Nie osmielisz sie klamac.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_LogEntry	(TOPIC_MOD_HEREK_GOLD, "Trzeba bylo troche perswazji, ale w koncu Herek wyskoczyl, gdzie ukryl reszte mojego zlota.... przynajmniej mam taka nadzieje. Znajduje sie on na dachu rozpadajacej sie chaty, najdalej oddalonej od torfowiska.");
	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

FUNC VOID Info_Mod_Herek_REL_AtZombie2_A()
{
	AI_Output(hero, self, "Info_Mod_Herek_REL_AtZombie2_A_15_00"); //Potem wyjmij pieklo z niego.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Herek_REL_AtZombie2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_SetTopicStatus	(TOPIC_MOD_HEREK_GOLD, LOG_FAILED);

	Wld_InsertItem	(ItMi_HerekBeutel,	"FP_ITEM_HEREKBEUTEL");

	B_Göttergefallen (1, 1);
};

INSTANCE Info_Mod_Herek_REL_Trade (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Trade_Condition;
	information	= Info_Mod_Herek_REL_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Herek_REL_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Herek_REL_AtZombie2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Herek_REL_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Herek_REL_Pickpocket (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_Pickpocket_Condition;
	information	= Info_Mod_Herek_REL_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Herek_REL_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_GoldCup, 2);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_BACK, Info_Mod_Herek_REL_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Herek_REL_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Herek_REL_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Herek_REL_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Herek_REL_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Herek_REL_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Herek_REL_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Herek_REL_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Herek_REL_EXIT (C_INFO)
{
	npc		= Mod_7670_STT_Herek_REL;
	nr		= 1;
	condition	= Info_Mod_Herek_REL_EXIT_Condition;
	information	= Info_Mod_Herek_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Herek_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Herek_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
