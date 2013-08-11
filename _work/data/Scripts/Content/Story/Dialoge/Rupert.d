INSTANCE Info_Mod_Rupert_Hi (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Hi_Condition;
	information	= Info_Mod_Rupert_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Handelst du?";
};

FUNC INT Info_Mod_Rupert_Hi_Condition()
{
	if (Mod_IstLehrling == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_15_00"); //Handelst du?
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_01"); //(druckst herum) Äh ... na ja ... heute eigentlich nicht.
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_15_02"); //Dir passt mein Gesicht wohl nicht?
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_03"); //Nein, nein, es ist nur ... (flüstert) Garond sieht es nicht gern, wenn ich euch Sträflingen was verkaufe.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_03_04"); //Und ich hab meine Handelslizenz noch nicht lange, verstehst du?

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	Info_AddChoice	(Info_Mod_Rupert_Hi, "Rück die Waren raus oder es setzt was!", Info_Mod_Rupert_Hi_C);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "Ich verstehe vollkommen. Du bist ein Feigling.", Info_Mod_Rupert_Hi_B);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "In Ordnung, dann nicht.", Info_Mod_Rupert_Hi_A);
};

FUNC VOID Info_Mod_Rupert_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_C_15_00"); //Rück die Waren raus oder es setzt was!
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_C_03_01"); //(nervös) Mach keinen Unfug!

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	Info_AddChoice	(Info_Mod_Rupert_Hi, "Du hast es so gewollt!", Info_Mod_Rupert_Hi_E);
	Info_AddChoice	(Info_Mod_Rupert_Hi, "Wir sprechen uns noch.", Info_Mod_Rupert_Hi_D);
};

FUNC VOID Info_Mod_Rupert_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_B_15_00"); //Ich verstehe vollkommen. Du bist ein Feigling.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_B_03_01"); //Bin ich nicht! Ich muss doch auch sehen, wo ich bleibe.
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_B_15_02"); //Du kannst bleiben, wo der Pfeffer wächst.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

FUNC VOID Info_Mod_Rupert_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_A_15_00"); //In Ordnung, dann nicht.
	AI_Output(self, hero, "Info_Mod_Rupert_Hi_A_03_01"); //Danke für dein Verständnis. Später vielleicht.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

FUNC VOID Info_Mod_Rupert_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_E_15_00"); //Du hast es so gewollt!

	Info_ClearChoices	(Info_Mod_Rupert_Hi);

	AI_StopProcessInfos	(hero);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Rupert_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Hi_D_15_00"); //Wir sprechen uns noch.

	Info_ClearChoices	(Info_Mod_Rupert_Hi);
};

INSTANCE Info_Mod_Rupert_Handelt (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Handelt_Condition;
	information	= Info_Mod_Rupert_Handelt_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Handelt_Condition()
{
	if (Mod_IstLehrling == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Handelt_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Handelt_03_00"); //Warte mal, ich würde jetzt mir dir handeln.

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);

	Info_AddChoice	(Info_Mod_Rupert_Handelt, "Vergiss es. Mein Gold kriegen andere Händler als du.", Info_Mod_Rupert_Handelt_B);
	Info_AddChoice	(Info_Mod_Rupert_Handelt, "Dann zeig mal her.", Info_Mod_Rupert_Handelt_A);
};

FUNC VOID Info_Mod_Rupert_Handelt_B()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Handelt_B_15_00"); //Vergiss es. Mein Gold kriegen andere Händler als du.

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);
};

FUNC VOID Info_Mod_Rupert_Handelt_A()
{
	AI_Output(hero, self, "Info_Mod_Rupert_Handelt_A_15_00"); //Dann zeig mal her.
	AI_Output(self, hero, "Info_Mod_Rupert_Handelt_A_03_01"); //Such dir was aus!

	Info_ClearChoices	(Info_Mod_Rupert_Handelt);

	Mod_RupertHandelt = 1;

	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Rupert handelt jetzt mit mir.");
};

INSTANCE Info_Mod_Rupert_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling1_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich da unter deinem Stand gerade etwas bewegt? (Apfel platzieren)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling2_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, wird der da drüben nicht gesucht? (Apfel platzieren)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_MatteoLehrling3_Condition;
	information	= Info_Mod_Rupert_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schöne Äpfel hast du da ... (Apfel platzieren)";
};

FUNC INT Info_Mod_Rupert_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Rupert_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Rupert_Apfel = 1;
};

INSTANCE Info_Mod_Rupert_Daemonisch (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch_Condition;
	information	= Info_Mod_Rupert_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brian_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_00"); //(leise) Hey, du bewegst dich doch viel in der Umgebung und kennst dich aus.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch_15_01"); //Ja, wieso?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_02"); //(leise) Psst, nicht so laut. Ich weiß nicht, ob man uns vielleicht belauscht ...
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_03"); //Ich habe abends merkwürdige Dinge vor der Stadt gesehen und bin mir nicht sicher, was ich davon halten soll.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_04"); //Im Moment weiß ich nicht so recht, wem ich aus der Stadt trauen kann ...
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch_15_05"); //(leise) Was ist denn vorgefallen?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch_03_06"); //(leise) Komm am späten Abend einfach hierher. Dann werde ich dir zeigen, wovon ich spreche.

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Rupert will sich am späten Abend mit mir am Südtor treffen, um mir etwas zu zeigen. Er war sehr vorsichtig, als müsse er befürchten, belauscht zu werden.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DAEMONISCH2");
};

INSTANCE Info_Mod_Rupert_Daemonisch2 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch2_Condition;
	information	= Info_Mod_Rupert_Daemonisch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rupert_Daemonisch))
	&& (Wld_IsTime(21,00,05,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch2_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch2_03_00"); //Da bist du ja. Begleite mich unauffällig ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DAEMONISCHER");
};

INSTANCE Info_Mod_Rupert_Daemonisch3 (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Daemonisch3_Condition;
	information	= Info_Mod_Rupert_Daemonisch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rupert_Daemonisch3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rupert_Daemonisch2))
	&& (Npc_GetDistToWP(self, "NW_FARM1_CITYWALL_02_B") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Daemonisch3_Info()
{
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_00"); //So, hier sind wir.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch3_15_01"); //Aber ... hier ist doch gar nichts.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_02"); //Noch nicht.
	AI_Output(hero, self, "Info_Mod_Rupert_Daemonisch3_15_03"); //Hey, was soll das?
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_04"); //Ich bereite nur alles vor.
	AI_Output(self, hero, "Info_Mod_Rupert_Daemonisch3_03_05"); //Nun bereite dich darauf vor uns beizutreten ... oder zu sterben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
	AI_Teleport	(self, "TOT");

	Wld_InsertNpc	(Mod_13017_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
	Wld_InsertNpc	(Mod_13018_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
	Wld_InsertNpc	(Mod_13019_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
	Wld_InsertNpc	(Mod_13020_SP_Seelenpeiniger_NW, "NW_FARM1_CITYWALL_02_B");
	Wld_InsertNpc	(Zombie_Rupert, "NW_FARM1_CITYWALL_02_B");

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Eine Falle! Ich bin mitten im Wald von Lauter schwarzer Schatten umgeben.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Rupert_Trade (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Trade_Condition;
	information	= Info_Mod_Rupert_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Rupert_Trade_Condition()
{
	if (Mod_RupertHandelt == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rupert_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Rupert_Pickpocket (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_Pickpocket_Condition;
	information	= Info_Mod_Rupert_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Rupert_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 17);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

	Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_BACK, Info_Mod_Rupert_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rupert_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rupert_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rupert_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rupert_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rupert_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rupert_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rupert_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rupert_EXIT (C_INFO)
{
	npc		= Mod_750_NONE_Rupert_NW;
	nr		= 1;
	condition	= Info_Mod_Rupert_EXIT_Condition;
	information	= Info_Mod_Rupert_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rupert_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rupert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};