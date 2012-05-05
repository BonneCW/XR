INSTANCE Info_Mod_Fenia_Hi (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Hi_Condition;
	information	= Info_Mod_Fenia_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Hi_17_00"); //Hallo, ich bin Fenia. Brauchst du was zu essen?
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Fenia scheint mit Lebensmitteln zu handeln.");
};

INSTANCE Info_Mod_Fenia_MatteoLehrling1 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling1_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich da unter deinem Stand gerade etwas bewegt? (Apfel platzieren)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling1_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL01");

	AI_PlayAni	(self, "T_PLUNDER");

	B_Say	(hero, self, "$PLACEAPFEL02");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling2_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, wird der da drüben nicht gesucht? (Apfel platzieren)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling2_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL03");

	AI_PlayAni	(self, "T_SEARCH");

	B_Say	(hero, self, "$PLACEAPFEL04");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_MatteoLehrling3 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_MatteoLehrling3_Condition;
	information	= Info_Mod_Fenia_MatteoLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schöne Äpfel hast du da ... (Apfel platzieren)";
};

FUNC INT Info_Mod_Fenia_MatteoLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest2))
	&& (Mod_Fenia_Apfel == 0)
	&& (Npc_HasItems(hero, ItFo_Apple_Matteo_Schlecht) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_MatteoLehrling3_Info()
{
	B_Say	(hero, self, "$PLACEAPFEL05");

	Npc_RemoveInvItems	(hero, ItFo_Apple_Matteo_Schlecht, 1);

	Mod_Fenia_Apfel = 1;
};

INSTANCE Info_Mod_Fenia_Daemonisch (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Daemonisch_Condition;
	information	= Info_Mod_Fenia_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_Daemonisch_Condition()
{
	if (Mod_HQ_Daemonisch == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_Daemonisch_17_00"); //Mann, der ist aber schnell zum Südtor gerannt.
	
	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Das muss er sein. Zum Südtor, hinterher.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Fenia_Wanzen (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Wanzen_Condition;
	information	= Info_Mod_Fenia_Wanzen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn hier?";
};

FUNC INT Info_Mod_Fenia_Wanzen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Edda_WanzenBack))
	&& (Eddas_Wanzen_Back == 2)
	&& (Wld_IsTime(22,05,04,55))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Wanzen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_00"); //Was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_01"); //(fühlt sich erwischt) Äh ... gar nichts.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_02"); //Du hast nicht zufällig was mit den Wanzen in Eddas Hütte zu tun, oder?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_03"); //Äh ... ich?
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_04"); //Ja, du.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_05"); //Nun, äh ... es ist anders, also du denkst.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_06"); //Wie ist es denn?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_07"); //Edda hat es nicht anders verdient, weißt du? Sie hat versucht, sich an meinen Mann ranzumachen.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_08"); //Und deswegen setzt du Fleischwanzen in ihre Hütte? Sie wird sich freuen, wenn sie das erfährt.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_09"); //Bitte verrate mich nicht.
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_15_10"); //Wieso sollte ich das nicht tun?
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_17_11"); //Ich kann dich bezahlen. Ich bin Händlerin, ich hab Gold.

	B_StartOtherRoutine	(self, "START");

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "Na gut, ich werde Edda nichts sagen.", Info_Mod_Fenia_Wanzen_Fenia);
	Info_AddChoice	(Info_Mod_Fenia_Wanzen, "Nein, ich werde Edda alles erzählen.", Info_Mod_Fenia_Wanzen_Edda);
};

FUNC VOID Info_Mod_Fenia_Wanzen_Fenia()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Fenia_15_00"); //Na gut, ich werde Edda nichts sagen.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Fenia_17_01"); //Danke, Edda hätte mich umgebracht. Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(50);

	Eddas_Wanzen_Back = 4;

	B_Göttergefallen (2, 1);

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);

	B_LogEntry	(TOPIC_MOD_EDDASWANZENBACK, "Ich hab Fenias Angebot angenommen und werde sie nicht an Edda verraten.");

	B_SetTopicStatus	(TOPIC_MOD_EDDASWANZENBACK, LOG_SUCCESS);

	CurrentNQ += 1;
};

FUNC VOID Info_Mod_Fenia_Wanzen_Edda()
{
	AI_Output(hero, self, "Info_Mod_Fenia_Wanzen_Edda_15_00"); //Nein, ich werde Edda alles erzählen.
	AI_Output(self, hero, "Info_Mod_Fenia_Wanzen_Edda_17_01"); //Oh nein, sie wird mich umbringen.

	Eddas_Wanzen_Back = 3;

	Info_ClearChoices	(Info_Mod_Fenia_Wanzen);
};

INSTANCE Info_Mod_Fenia_AllesKlar (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_AllesKlar_Condition;
	information	= Info_Mod_Fenia_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Alles in Ordnung bei dir?";
};

FUNC INT Info_Mod_Fenia_AllesKlar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_00"); //Alles in Ordnung bei dir?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_17_01"); //Sehe ich etwa so bedrückt aus? Das wäre schlecht fürs Geschäft.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_02"); //Was belastet dich denn?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_17_03"); //Ich erwische meinen Mann Halvor immer wieder dabei, dass er fremden Frauen nachschaut.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_17_04"); //Aber ich habe auch das Gefühl, dass alle Weiber versuchen, mir meinen Halvor abspenstig zu machen.
	AI_Output(hero, self, "Info_Mod_Fenia_AllesKlar_15_05"); //Hast du ihn mal darauf angesprochen?
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_17_06"); //Mal? Ich stelle ihn immer zur Rede, aber er streitet alles vehement ab und redet sich mit Verkaufsgesprächen und so weiter heraus.
	AI_Output(self, hero, "Info_Mod_Fenia_AllesKlar_17_07"); //Ich werde ihn schon noch auf frischer Tat ertappen ...
};

INSTANCE Info_Mod_Fenia_BH (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH_Condition;
	information	= Info_Mod_Fenia_BH_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH_Condition()
{
	if (Mod_Garvell_Fenia == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH_17_00"); //Du schmieriger Lump! Wirst du wohl die Finger von meinem ... meinem ... lassen!
	AI_Output(hero, self, "Info_Mod_Fenia_BH_15_01"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Fenia_BH_17_02"); //Zu dieser Aktion fällt dir jetzt wohl auch noch eine Ausrede ein, was?!
	AI_Output(self, hero, "Info_Mod_Fenia_BH_17_03"); //Halt bloß den Mund und bleib mir fern!

	B_LogEntry	(TOPIC_MOD_GARVELL_FENIA, "Da hat mich jemand kräftig reingelegt ...");
};

INSTANCE Info_Mod_Fenia_BH2 (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_BH2_Condition;
	information	= Info_Mod_Fenia_BH2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fenia_BH2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garvell_Fenia3))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_BH2_Info()
{
	AI_Output(self, hero, "Info_Mod_Fenia_BH2_17_00"); //Vergessen wir die Sache mit meinem ... meinem ..., ja?
	AI_Output(hero, self, "Info_Mod_Fenia_BH2_15_01"); //Wird nicht wieder vorkommen.
};

INSTANCE Info_Mod_Fenia_Trade (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Trade_Condition;
	information	= Info_Mod_Fenia_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fenia_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fenia_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fenia_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fenia_Pickpocket (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_Pickpocket_Condition;
	information	= Info_Mod_Fenia_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Fenia_Pickpocket_Condition()
{
	C_Beklauen	(40, ItMi_Gold, 70);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_BACK, Info_Mod_Fenia_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fenia_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fenia_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fenia_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fenia_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fenia_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fenia_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fenia_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fenia_EXIT (C_INFO)
{
	npc		= Mod_575_NONE_Fenia_NW;
	nr		= 1;
	condition	= Info_Mod_Fenia_EXIT_Condition;
	information	= Info_Mod_Fenia_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fenia_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fenia_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};