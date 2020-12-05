INSTANCE Info_Mod_Coragon_Hi (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Hi_Condition;
	information	= Info_Mod_Coragon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Coragon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Hi_09_00"); //Witam w moim pubie, obcy. Co moge dla Ciebie zrobic?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Coragon jest wlascicielem pubu w Khorinis. Musi miec dla mnie cos do picia.");
};

INSTANCE Info_Mod_Coragon_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling1_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Czy cos sie po prostu poruszylo pod twoimi stopami? (miescic jablko)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling2_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hej, nie szukaja go tam? (miescic jablko)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling3_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mile jablka, które tam masz.... (miescic jablko)";
};

FUNC INT Info_Mod_Coragon_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Coragon_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Coragon_Apfel = 1;
};

INSTANCE Info_Mod_Coragon_Daemonisch (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch_Condition;
	information	= Info_Mod_Coragon_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_00"); //Ahhh, inny gosc. Tak samo jak inni?
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_01"); //Jak?
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_02"); //Duza ilosc miesa i piwa....
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_03"); //Uh, nie, chcialem po prostu dowiedziec sie o rzeczach niezwyklych....
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_04"); //Cóz, ostatnio wszyscy goscie jedza mieso w surowych ilosciach i pija piwo doslownie..... tak jak nie jadly w ciagu kilku dni.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_05"); //I tak one wygladaja.... ale dziwnie, bez wzgledu na to, jak czesto odwiedzaja moja restauracje.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_06"); //Mysle, ze kazdy musi miec tasiemce.

	CreateInvItems	(self, ItFo_KWine, 5);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Dowiedzialem sie od Coragona, ze jego goscie pozeraja mieso i piwo w surowych ilosciach, ale wciaz wygladaja tak, jakby jedli na chustce.");
};

INSTANCE Info_Mod_Coragon_Daemonisch2 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch2_Condition;
	information	= Info_Mod_Coragon_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Coragon_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch))
	&& (Mod_HQ_Daemonisch == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_00"); //Hej, czy moglabys mi przysluzyc sie i dostac na rynku paczke wyleczonego miesa Baltrama?
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_01"); //(nieco cichsze) Lakomny pakunek musialby wkrótce wrócic i chciwosc na wiecej miesa.
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch2_15_02"); //Oczywiscie, nie ma problemu.
};

INSTANCE Info_Mod_Coragon_Daemonisch3 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch3_Condition;
	information	= Info_Mod_Coragon_Daemonisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Oto pakiet.";
};

FUNC INT Info_Mod_Coragon_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Daemonisch2))
	&& (Npc_HasItems(hero, ItMi_CoragonDaemonisch2) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Daemonisch3_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch3_15_00"); //Oto pakiet.

	B_GiveInvItems	(hero, self, ItMi_CoragonDaemonisch2, 1);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_01"); //Bardzo dobry.... tu 50 zlotych monet dla....

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_02"); //Tutaj juz przychodza.

	AI_StopProcessInfos	(self);

	AI_Teleport	(Mod_1251_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1252_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1253_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1254_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1259_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1261_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1175_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1176_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1177_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1044_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1045_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");

	B_StartOtherRoutine	(Mod_1251_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1252_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1253_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1254_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1259_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1261_RIT_Ritter_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1044_VLK_Buerger_NW, "DAEMONISCH");
	B_StartOtherRoutine	(Mod_1045_VLK_Buerger_NW, "DAEMONISCH");

	AI_Teleport	(Mod_1251_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1252_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1253_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1254_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1259_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1261_RIT_Ritter_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1175_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1176_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1177_MIL_Miliz_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1044_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");
	AI_Teleport	(Mod_1045_VLK_Buerger_NW, "NW_CITY_MERCHANT_PATH_14");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Coragon_WhatHappened (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_WhatHappened_Condition;
	information	= Info_Mod_Coragon_WhatHappened_Info;
	permanent	= 0;
	important	= 0;
	description	= "Co jest z Toba?";
};

FUNC INT Info_Mod_Coragon_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Kapitel > 2)
	&& (!Npc_IsDead(Mod_590_NONE_Kardif_NW))
	&& (!Npc_IsDead(Mod_1076_VLK_Wirt_NW))
	&& (!Npc_IsDead(Mod_777_NONE_Rukhar_NW))
	&& (!Npc_IsDead(Mod_597_NONE_Meldor_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_WhatHappened_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_00"); //Co jest z Toba?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_01"); //Nic, z wyjatkiem zalosnego zlodzieja ukradl przesylke 40 butelek jalowca. To wlasnie sie dzieje.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_02"); //Czy moge Ci pomóc?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_03"); //Tak, mozna bylo. Znajdz tego zarlocznego zlodzieja i zabij go.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_04"); //Co to dla mnie jest?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_05"); //(przemyslane) Hmm..... Czy móglbys byc w porzadku z 300 kawalkami zlota?
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_06"); //Oczywiscie! Gdzie chcesz, abym zaczal szukac?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_07"); //Jestem tak samo bezradny jak Ty, ale najlepiej jest krecic sie po dzielnicy portowej i rozmawiac z ludzmi!
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_08"); //Bede wiec w drodze.

	CreateInvItems	(Mod_799_BAU_Thekla_NW, ItFo_Booze, 40);

	Log_CreateTopic	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Z gospodarzem Coragona skradziono przesylke 40 butelek jalowca. Poprosil mnie o znalezienie zlodzieja.");
};

INSTANCE Info_Mod_Coragon_Back (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Back_Condition;
	information	= Info_Mod_Coragon_Back_Info;
	permanent	= 0;
	important	= 0;
	description	= "Rozstrzygnalem sprawe kradziezy.";
};

FUNC INT Info_Mod_Coragon_Back_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kardif_KnowsRukhar))
	&& ((Mod_KnowsRukharWacholder == 6)
	|| (Mod_KnowsRukharWacholder == 2)
	|| (Mod_KnowsRukharWacholder == 4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Back_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Back_15_00"); //Rozstrzygnalem sprawe kradziezy.
	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_01"); //Kim to bylo?

	if (Mod_KnowsRukharWacholder == 2)
	|| (Mod_KnowsRukharWacholder == 4)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_02"); //To byl Rukhar.
	}
	else if (Mod_KnowsRukharWacholder == 6)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_03"); //Kardif powierzyl Rukharowi kradziez. Karta znajduje sie obecnie w wiezieniu.
	};

	if (Npc_HasItems(hero, ItFo_Booze) > 39)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_05"); //Przynioslem równiez waszego jalowca.

		B_GiveInvItems	(hero, self, ItFo_Booze, 40);

		Mod_KnowsRukharWacholder = 7;
	};

	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_06"); //Dziekujemy za niezwykly facet! Oto Twoja obiecana nagroda.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	if (Mod_KnowsRukharWacholder == 7)
	{
		AI_Output(self, hero, "Info_Mod_Coragon_Back_09_07"); //A ekstra, bo przywiózles mnie z powrotem do jalowca.

		B_GiveInvItems	(self, hero, ItFo_CoragonsBeer, 3);
	};

	B_GivePlayerXP	(350);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Zglosilem sie do Coragon i otrzymalem nagrode.");
	B_SetTopicStatus	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Coragon_Zauberwasser (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Zauberwasser_Condition;
	information	= Info_Mod_Coragon_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mam dostawe magicznej wody.";
};

FUNC INT Info_Mod_Coragon_Zauberwasser_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Constantino_Zauberwasser))
	&& (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Coragon_Zauberwasser_15_00"); //Mam dostawe magicznej wody.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Coragon_Zauberwasser_09_01"); //Najwyzszy czas.
};

INSTANCE Info_Mod_Coragon_Trade (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Trade_Condition;
	information	= Info_Mod_Coragon_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Coragon_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Coragon_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Coragon_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Coragon_Pickpocket (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Pickpocket_Condition;
	information	= Info_Mod_Coragon_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Coragon_Pickpocket_Condition()
{
	C_Beklauen	(75, ItFo_CoragonsBeer, 3);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

	Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_BACK, Info_Mod_Coragon_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Coragon_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Coragon_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Coragon_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Coragon_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Coragon_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Coragon_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Coragon_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Coragon_EXIT (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_EXIT_Condition;
	information	= Info_Mod_Coragon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Coragon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Coragon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
