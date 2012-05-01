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
	AI_Output(self, hero, "Info_Mod_Coragon_Hi_09_00"); //Willkommen in meiner Kneipe, Fremder. Was kann ich für dich tun?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Coragon ist Besitzer einer Kneipe in Khorinis. Er hat sicher was zu trinken für mich.");
};

INSTANCE Info_Mod_Coragon_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_MatteoLehrling1_Condition;
	information	= Info_Mod_Coragon_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich da unter deinem Stand gerade etwas bewegt? (Apfel platzieren)";
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
	description	= "Hey, wird der da drüben nicht gesucht? (Apfel platzieren)";
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
	description	= "Schöne Äpfel hast du da ... (Apfel platzieren)";
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
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_00"); //Ahh, wieder ein Gast. Dasselbe wie die anderen?
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_01"); //Wie?
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_02"); //Eine große Portion Fleisch und Bier ...
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch_15_03"); //Ähh, nein, ich wollte mich eigentlich nur über Ungewöhnliches erkundigen ...
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_04"); //Naja, in letzter Zeit essen alle Gäste Fleisch in rauen Mengen und trinken das Bier literweise ... als ob sie seit Tagen nichts gegessen hätten.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_05"); //Und so sehen sie auch aus… daran ändert sich aber merkwürdiger Weise auch nichts, egal, wie oft sie meine Gaststätte besuchen.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch_09_06"); //(zu sich selbst) Müssen wohl alle Bandwürmer haben.

	CreateInvItems	(self, ItFo_KWine, 5);

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Von Coragon erfuhr ich, dass seine Gäste Fleisch und Bier in rauen Mengen verschlingen, und trotzdem so aussehen, als würden sie am Hungertuch nagen.");
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
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_00"); //Hey, könntest du mir einen gefallen tun und ein Paket Pökelfleisch von Baltram auf dem Markt holen.
	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch2_09_01"); //(etwas leiser) Die gierige Meute müsste bald wieder vorbeikommen und nach mehr Fleisch gieren.
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch2_15_02"); //Klar, kein Problem.
};

INSTANCE Info_Mod_Coragon_Daemonisch3 (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Daemonisch3_Condition;
	information	= Info_Mod_Coragon_Daemonisch3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier das Paket.";
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
	AI_Output(hero, self, "Info_Mod_Coragon_Daemonisch3_15_00"); //Hier das Paket.

	B_GiveInvItems	(hero, self, ItMi_CoragonDaemonisch2, 1);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_01"); //Sehr gut ... hier 50 Goldmünzen für den Aufwand ...

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Coragon_Daemonisch3_09_02"); //Da kommen sie ja auch schon.

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
	description	= "Was ist mit dir los?";
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
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_00"); //Was ist mit dir los?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_01"); //(zynisch) Nichts, nur das ein mieser Dieb mir eine Lieferung von 40 Flaschen Wachholder gestohlen hat. Das ist los.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_02"); //Kann ich dir irgendwie helfen?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_03"); //Ja, das könntest du. Finde diesen miesen Dieb und mach ihn alle.
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_04"); //Was springt für mich dabei raus?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_05"); //(überlegt) Hmm ... wärst du mit 300 Goldstücken einverstanden?
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_06"); //Natürlich! Wo soll ich anfangen zu suchen?
	AI_Output(self, hero, "Info_Mod_Coragon_WhatHappened_09_07"); //Ich bin so ratlos wie du, aber am besten klapperst du mal das Hafenviertel ab und sprichst dort mit den Leuten!
	AI_Output(hero, self, "Info_Mod_Coragon_WhatHappened_15_08"); //Dann mach ich mich mal auf den Weg.

	CreateInvItems	(Mod_799_BAU_Thekla_NW, ItFo_Booze, 40);

	Log_CreateTopic	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CORAGON_WACHOLDER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Dem Wirt Coragon wurde eine Lieferung von 40 Flaschen Wacholder gestohlen. Er bat mich den Dieb zu suchen.");
};

INSTANCE Info_Mod_Coragon_Back (C_INFO)
{
	npc		= Mod_570_NONE_Coragon_NW;
	nr		= 1;
	condition	= Info_Mod_Coragon_Back_Condition;
	information	= Info_Mod_Coragon_Back_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Diebstahl aufgelöst.";
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
	AI_Output(hero, self, "Info_Mod_Coragon_Back_15_00"); //Ich hab den Diebstahl aufgelöst.
	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_01"); //Wer war es?

	if (Mod_KnowsRukharWacholder == 2)
	|| (Mod_KnowsRukharWacholder == 4)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_02"); //Es war Rukhar.
	}
	else if (Mod_KnowsRukharWacholder == 6)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_03"); //Kardif hat Rukhar mit dem Diebstahl beauftragt. Kardif sitzt jetzt im Gefängnis.
	};

	if (Npc_HasItems(hero, ItFo_Booze) > 39)
	{
		AI_Output(hero, self, "Info_Mod_Coragon_Back_15_05"); //Deinen Wacholder hab ich auch dabei.

		B_GiveInvItems	(hero, self, ItFo_Booze, 40);

		Mod_KnowsRukharWacholder = 7;
	};

	AI_Output(self, hero, "Info_Mod_Coragon_Back_09_06"); //Danke du bist ein außergewöhnlicher Kerl! Hier deine versprochene Belohnung.

	CreateInvItems	(self, ItMi_Gold, 300);
	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	if (Mod_KnowsRukharWacholder == 7)
	{
		AI_Output(self, hero, "Info_Mod_Coragon_Back_09_07"); //Und noch extra was weil du mir meinen Wachholder wieder gebracht hast.

		B_GiveInvItems	(self, hero, ItFo_CoragonsBeer, 3);
	};

	B_GivePlayerXP	(350);

	B_LogEntry	(TOPIC_MOD_CORAGON_WACHOLDER, "Ich habe Coragon Bericht erstattet und meine Belohnung erhalten.");
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
	description	= "Ich hab hier eine Lieferung Zauberwasser.";
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
	AI_Output(hero, self, "Info_Mod_Coragon_Zauberwasser_15_00"); //Ich hab hier eine Lieferung Zauberwasser.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser_MIS, 8);

	AI_Output(self, hero, "Info_Mod_Coragon_Zauberwasser_09_01"); //Wird auch langsam Zeit.
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
	Backup_Questitems();

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
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Coragon_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 100);
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

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
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