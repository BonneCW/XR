INSTANCE Info_Mod_Gerbrandt_Hi (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Hi_Condition;
	information	= Info_Mod_Gerbrandt_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gerbrandt_Hi_Condition()
{
	return 1;
};

FUNC VoID Info_Mod_Gerbrandt_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Hi_10_01"); //Stör mich nicht.
};

INSTANCE Info_Mod_Gerbrandt_Person (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Person_Condition;
	information	= Info_Mod_Gerbrandt_Person_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört du vermisst jemanden.";
};

FUNC INT Info_Mod_Gerbrandt_Person_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Person))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_Person_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Person_15_00"); //Ich hab gehört du vermisst jemanden.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Person_10_01"); //Das stimmt. Vor etwa zwei Wochen war ein Freund bei mir. Er ist erst spät abends nach Hause gegangen.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Person_10_02"); //Als ich am nächsten Tag zu ihm wollte war er nicht da. Ich habe sofort die Miliz benachrichtigt, doch sie haben nichts gefunden.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Person_10_03"); //Danach kamen der Wassermagier Vatras und ein paar seiner Anhänger zu mir und befragten mich über meinen Freund.
};

INSTANCE Info_Mod_Gerbrandt_Infos (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Infos_Condition;
	information	= Info_Mod_Gerbrandt_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du Vatras erzählt?";
};

FUNC INT Info_Mod_Gerbrandt_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Person))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Infos_15_00"); //Was hast du Vatras erzählt?
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Infos_10_01"); //Er hat mir viele Fragen gestellt.
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Infos_15_02"); //Was für Fragen?
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Infos_10_03"); //Zuerst hat er gefragt wie mein Freund heißt und ich hab ihm gesagt, dass er Fred heißt.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Infos_10_04"); //Dann wollte er wissen um wieviel Uhr er gegangen sei. Ich hab die Uhrzeit nicht genau gewusst, weil wir schon einiges an Wein getrunken hatten, aber es war um etwa 23 Uhr.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Infos_10_05"); //Am Schluss hat er noch gefragt wo Fred gewohnt hat. Dann hab ich ihn zu dem Haus geführt.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Infos_10_06"); //Das war alles.

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Gerbrandt hat mir erzählt, dass sein Freund Fred heißt und er gegen 23 Uhr das Haus von Gerbrandt verlassen hat.");
};

INSTANCE Info_Mod_Gerbrandt_Wo (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Wo_Condition;
	information	= Info_Mod_Gerbrandt_Wo_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich auch zu dem Haus bringen?";
};

FUNC INT Info_Mod_Gerbrandt_Wo_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Infos))
	{
		return 1;
	};
};

FUNC VOId Info_Mod_Gerbrandt_Wo_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Wo_15_00"); //Kannst du mich auch zu dem Haus bringen?
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Wo_10_01"); //Klar, sag bescheid wenn wir losgehen können.
};

INSTANCE Info_Mod_Gerbrandt_Los (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Los_Condition;
	information	= Info_Mod_Gerbrandt_Los_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns gehen.";
};

FUNC INT Info_Mod_Gerbrandt_Los_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Wo))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_Los_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Los_15_00"); //Lass uns gehen.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Los_10_01"); //Ok, folge mir.

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "GUIDETOFRED");
};

INSTANCE Info_Mod_Gerbrandt_Da (C_INFO)
{
	npc		= Mod_578_NOnE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Da_Condition;
	information	= Info_Mod_Gerbrandt_Da_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gerbrandt_Da_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Los))
	&& (Hlp_StrCmp	(Npc_GetNearestWP(self), "NW_CITY_PATH_HABOUR_13"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_Da_Info()
{
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Da_10_00"); //Da sind wir.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Da_10_01"); //Schau dich ruhig um, ich gehe wieder zurück. Wenn du noch Hilfe brauchst, du weißt ja wo du mich findest.

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Gerbrandt hat mich zu dem Haus von Fred gebracht. Mal sehen ob ich hier etwas finde was auf sein verschwinden hindeuten könnte.");

	Wld_InsertItem	(Mod_Sklavenliste_DMR,	"FP_SPAWN_VERMISSTENLISTE");

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "START");
};

INSTANCE Info_Mod_Gerbrandt_Cornelius (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Cornelius_Condition;
	information	= Info_Mod_Gerbrandt_Cornelius_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss mit dir sprechen.";
};

FUNC INT Info_Mod_Gerbrandt_Cornelius_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cornelius_AtMarkt))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_Cornelius_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Cornelius_15_00"); //Du gehörst zu den Kerlen, die Cornelius umbringen liesen und wegen denen Morgahard festgenommen wurde.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Cornelius_10_01"); //Kannst du das auch beweisen?
	AI_Output(hero, self, "Info_Mod_Gerbrandt_Cornelius_15_02"); //Nein.
	AI_Output(self, hero, "Info_Mod_Gerbrandt_Cornelius_10_03"); //Dann verschwende nicht meine Zeit mit deinen Anschuldigungen oder ich rufe die Miliz.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_AL_MORGAHARD, "Ich habe Gerbrandt darauf angesprochen, konnte ihm aber nichts nachweisen. Ich sollte mich nochmal mit Esteban unterhalten.");
};

INSTANCE Info_Mod_Gerbrandt_SonjaFreier (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_SonjaFreier_Condition;
	information	= Info_Mod_Gerbrandt_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du häufig Kunde bei Sonja gewesen?";
};

FUNC INT Info_Mod_Gerbrandt_SonjaFreier_Condition()
{
	if (Mod_Sonja_Freier == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gerbrandt_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Gerbrandt_SonjaFreier_15_00"); //Bist du häufig Kunde bei Sonja gewesen?
	AI_Output(self, hero, "Info_Mod_Gerbrandt_SonjaFreier_10_01"); //Was für eine Frage! Natürlich nicht!
};

INSTANCE Info_Mod_Gerbrandt_Pickpocket (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_Pickpocket_Condition;
	information	= Info_Mod_Gerbrandt_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Gerbrandt_Pickpocket_Condition()
{
	C_Beklauen	(48, ItMi_Gold, 15);
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);

	Info_AddChoice	(Info_Mod_Gerbrandt_Pickpocket, DIALOG_BACK, Info_Mod_Gerbrandt_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gerbrandt_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gerbrandt_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);

		Info_AddChoice	(Info_Mod_Gerbrandt_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gerbrandt_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gerbrandt_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gerbrandt_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gerbrandt_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gerbrandt_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gerbrandt_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gerbrandt_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gerbrandt_EXIT (C_INFO)
{
	npc		= Mod_578_NONE_Gerbrandt_NW;
	nr		= 1;
	condition	= Info_Mod_Gerbrandt_EXIT_Condition;
	information	= Info_Mod_Gerbrandt_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gerbrandt_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gerbrandt_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};