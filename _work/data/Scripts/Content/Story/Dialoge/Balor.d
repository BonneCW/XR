INSTANCE Info_Mod_Balor_Hi (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Hi_Condition;
	information	= Info_Mod_Balor_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Balor_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balor_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Balor_Hi_01_01"); //Ich bin Balor, Novize der Bruderschaft. Meine Aufgabe ist es hier im Sumpf Sumpfkraut zu sammeln.
	AI_Output(self, hero, "Info_Mod_Balor_Hi_01_02"); //Das wird dann im Lager zu Stängeln verarbeitet und dann rauchen wir es oder verkaufen es weiter.
};

INSTANCE Info_Mod_Balor_Duenger (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Duenger_Condition;
	information	= Info_Mod_Balor_Duenger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib schickt mich.";
};

FUNC INT Info_Mod_Balor_Duenger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_WarBeiLester))
	&& (Npc_HasItems(hero, ItMi_DuengerPaket) == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Balor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_Duenger_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_Duenger_15_00"); //Baal Namib schickt mich, ich soll dir dieses Paket bringen.
	AI_Output(self, hero, "Info_Mod_Balor_Duenger_01_01"); //Ah, endlich. Der Dünger ist gekommen. Verteile ihn doch bitte auf dem Feld.
	AI_Output(hero, self, "Info_Mod_Balor_Duenger_15_02"); //Ich soll es auf dem Feld verteilen?
	AI_Output(self, hero, "Info_Mod_Balor_Duenger_01_03"); //Ja. Hier nimm diese Spitzhacke.

	B_GiveInvItems	(self, hero, ItMw_2H_Axe_L_01, 1);

	AI_Output(self, hero, "Info_Mod_Balor_Duenger_01_04"); //Ich habe den Ort, an dem du düngen musst, mit einem roten X gekennzeichnet. Grab einfach dort und dünge dann.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Balor will, dass ich den Dünger auf dem Feld verteile. Er hat die Stelle mit einem roten X gekennzeichnet.");

	Wld_SendTrigger	("EVT_MT_DUENGER");
};

INSTANCE Info_Mod_Balor_DuengerVerteilt (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_DuengerVerteilt_Condition;
	information	= Info_Mod_Balor_DuengerVerteilt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Dünger verteilt.";
};

FUNC INT Info_Mod_Balor_DuengerVerteilt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Duenger))
	&& (Npc_HasItems(hero, ItMi_DuengerPaket) == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_DuengerVerteilt_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_DuengerVerteilt_15_00"); //Ich hab den Dünger verteilt.
	AI_Output(self, hero, "Info_Mod_Balor_DuengerVerteilt_01_01"); //Gut, dann wird das Sumpfkraut nur so sprießen.
	AI_Output(self, hero, "Info_Mod_Balor_DuengerVerteilt_01_02"); //Hier hast du ein paar Stängel.

	CreateInvItems	(self, ItMi_Joint, 6);

	B_GiveInvItems	(self, hero, ItMi_Joint, 5);

	AI_Output(self, hero, "Info_Mod_Balor_DuengerVerteilt_01_04"); //Ich zieh mir auch erst mal einen rein.

	B_UseItem	(self, ItMi_Joint);

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab den Dünger verteilt und mit Balor gesprochen. Jetzt sollte ich wieder zu Baal Namib gehen.");

	B_GivePlayerXP	(50);

	Wld_SendTrigger	("EVT_MT_DUENGER");
};

INSTANCE Info_Mod_Balor_Sumpfmensch (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Sumpfmensch_Condition;
	information	= Info_Mod_Balor_Sumpfmensch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Balor_Sumpfmensch_Condition()
{
	if (Guru_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_Sumpfmensch_Info()
{
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_00"); //Ahhhhhhh!!!
	AI_Output(hero, self, "Info_Mod_Balor_Sumpfmensch_15_01"); //Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_02"); //Meine Güte, jag' mir doch nicht solche Angst ein! Kurz habe ich gedacht, du bist der ... der ... (schluckt)
	AI_Output(hero, self, "Info_Mod_Balor_Sumpfmensch_15_03"); //Der was? Spuck's schon aus!
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_04"); //Der ... (nuschelt unverständlich)
	AI_Output(hero, self, "Info_Mod_Balor_Sumpfmensch_15_05"); //Der WAS?
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_06"); //Der HEULENDE SUMPFMENSCH!!!

	// ToDo: Chor ergänzen

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_07"); //Tut mir Leid, falscher Alarm!
	AI_Output(hero, self, "Info_Mod_Balor_Sumpfmensch_15_08"); //Was hat es mit diesem heulenden Sumpfmenschen ... (schreiender Chor im Hintergrund) ... auf sich?
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_09"); //Wenn du mehr wissen willst, folge nachts vom Lagereingang dem rechten Steg bis du zu einem Lagerfeuer kommst.
	AI_Output(self, hero, "Info_Mod_Balor_Sumpfmensch_01_10"); //Der Novize Fortuno gibt die Geschichte zum Besten. Und bring lieber Unterwäsche zum Wechseln mit.

	Log_CreateTopic	(TOPIC_MOD_SL_SUMPFMENSCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SL_SUMPFMENSCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Ich sollte nachts  vom Lagereingang dem rechten Steg folgen, bis ich an ein Lagerfeuer komme. Der Novize Fortuno erzählt dort anscheinend die Geschichte des 'heulenden Sumpfmenschen'.");

	B_StartOtherRoutine	(Mod_951_PSINOV_Fortuno_MT, "SUMPFMENSCH");
	B_StartOtherRoutine	(Mod_1339_PSINOV_Novize_MT, "SUMPFMENSCH");
	B_StartOtherRoutine	(Mod_2008_PSINOV_Ghorim_MT, "SUMPFMENSCH");
	B_StartOtherRoutine	(Mod_1337_PSINOV_Novize_MT, "SUMPFMENSCH");
	B_StartOtherRoutine	(Mod_1336_PSINOV_Novize_MT, "SUMPFMENSCH");
	B_StartOtherRoutine	(Mod_1338_PSINOV_Novize_MT, "SUMPFMENSCH");
};

INSTANCE Info_Mod_Balor_Woher (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Woher_Condition;
	information	= Info_Mod_Balor_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du hier im Sumpflager?";
};

FUNC INT Info_Mod_Balor_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Balor_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Balor_Woher_15_00"); //Wieso bist du hier im Sumpflager?
	AI_Output(self, hero, "Info_Mod_Balor_Woher_01_01"); //Nachdem man mich bei einem Raubzug in Khorinis erwischt hat, haben sie mich in die Kolonie geworfen.
	AI_Output(self, hero, "Info_Mod_Balor_Woher_01_02"); //Das Sumpflager erschien mir als das sicherste und angenehmste Lager, deswegen bin ich hierher gekommen.
};

INSTANCE Info_Mod_Balor_Pickpocket (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_Pickpocket_Condition;
	information	= Info_Mod_Balor_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_30;
};

FUNC INT Info_Mod_Balor_Pickpocket_Condition()
{
	C_Beklauen	(15, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Balor_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

	Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_BACK, Info_Mod_Balor_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Balor_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Balor_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);
};

FUNC VOID Info_Mod_Balor_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Balor_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

		Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Balor_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Balor_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Balor_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Balor_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Balor_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Balor_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Balor_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Balor_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Balor_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Balor_EXIT (C_INFO)
{
	npc		= Mod_3001_PSINOV_Balor_MT;
	nr		= 1;
	condition	= Info_Mod_Balor_EXIT_Condition;
	information	= Info_Mod_Balor_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Balor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Balor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};