INSTANCE Info_Mod_Fortuno_Hi (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Hi_Condition;
	information	= Info_Mod_Fortuno_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fortuno_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Fortuno_Hi_13_00"); //Hallo, wenn du was brauchst, kannst du es bei mir bekommen.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_PSICAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_PSICAMP, "Fortuno handelt mit allerlei Kleinkram.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nette Geschichte.";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch_Condition()
{
	if (Mod_Fortuno_Sumpfmensch_Scene == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_00"); //Nette Geschichte.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_01"); //Das kann nur jemand behaupten, der dem heulenden Sumpfmenschen noch nicht begegnet ist.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_02"); //Und du bist ihm begegnet?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_03"); //Wenn dem  so wäre, würde ich wohl kaum vor dir stehen.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch_15_04"); //Also hat noch niemand diesen heulenden Sumpfmenschen gesehen?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_05"); //Doch. Ein Novize namens Regahn, und der zittert seitdem wie Espenlaub. Und Regahn ist nicht einfach irgendein schwächlicher Novize, der sich beim Anblick einer Sumpfratte in die Hose macht.
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch_13_06"); //Der Typ war früher Pirat, der verspeist Sumpfhaie zum Frühstück!

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Offenbar hat bisher nur Darrion den Sumpfmensch gesehen. Ich sollte mal mit ihm sprechen.");
};

INSTANCE Info_Mod_Fortuno_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Sumpfmensch2_Condition;
	information	= Info_Mod_Fortuno_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey, weißt du irgendwas über Darrion?";
};

FUNC INT Info_Mod_Fortuno_Sumpfmensch2_Condition()
{
	if (Npc_KnowsInfo(hero, Mod_2013_PSINOV_Joru_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Sumpfmensch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_00"); //Hey, weißt du irgendwas über Darrion?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_01"); //Niemand hier weiß wirklich etwas über ihn. Vielleicht solltest du mal bei seinen ehemaligen Arbeitsgebern vorbeischauen.
	AI_Output(hero, self, "Info_Mod_Fortuno_Sumpfmensch2_15_02"); //Wen meinst du?
	AI_Output(self, hero, "Info_Mod_Fortuno_Sumpfmensch2_13_03"); //Die Piraten natürlich. Das einzige, was man über ihn weiß, ist, dass er früher ein Pirat war. Vielleicht weiß einer von denen was über ihn.

	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Darrion war früher Pirat. Ich sollte wohl mal bei den Piraten vorbei schauen, um mehr Informationen über ihn zu erhalten.");
};

INSTANCE Info_Mod_Fortuno_Woher (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Woher_Condition;
	information	= Info_Mod_Fortuno_Woher_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wieso bist du in diesem Lager?";
};

FUNC INT Info_Mod_Fortuno_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Fortuno_Woher_15_00"); //Wieso bist du in diesem Lager?
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_01"); //Das Sumpfkraut ist an allem Schuld.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_02"); //Es begann alles in Geldern. Ich war dort Lehrling eines Alchemisten und kam dort erstmals in Kontakt mit Sumpfkraut.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_03"); //Kurz darauf war ich süchtig und wurde in die Kolonie geworfen. Als ich dann erfahren habe, dass es hier Sumpfkraut gibt, bin ich sofort hierher gekommen.
	AI_Output(self, hero, "Info_Mod_Fortuno_Woher_13_04"); //Seitdem lebe ich in diesem Lager und verwalte die Vorräte.
};

INSTANCE Info_Mod_Fortuno_Trade (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Trade_Condition;
	information	= Info_Mod_Fortuno_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Fortuno_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fortuno_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fortuno_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Fortuno_Pickpocket (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_Pickpocket_Condition;
	information	= Info_Mod_Fortuno_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Fortuno_Pickpocket_Condition()
{
	C_Beklauen	(70, ItMi_Addon_Joint_02, 5);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_BACK, Info_Mod_Fortuno_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fortuno_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fortuno_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fortuno_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fortuno_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fortuno_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fortuno_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fortuno_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fortuno_EXIT (C_INFO)
{
	npc		= Mod_951_PSINOV_Fortuno_MT;
	nr		= 1;
	condition	= Info_Mod_Fortuno_EXIT_Condition;
	information	= Info_Mod_Fortuno_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};