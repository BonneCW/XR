INSTANCE Info_Mod_Abdi_Hi (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_Hi_Condition;
	information	= Info_Mod_Abdi_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Abdi_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Abdi_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Abdi_Hi_09_01"); //Ich bin Abdi.
};

INSTANCE Info_Mod_Abdi_WieLang (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_WieLang_Condition;
	information	= Info_Mod_Abdi_WieLang_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie lange bist du schon dabei?";
};

FUNC INT Info_Mod_Abdi_WieLang_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abdi_WieLang_Info()
{
	AI_Output(hero, self, "Info_Mod_Abdi_WieLang_15_00"); //Wie lange bist du schon dabei?
	AI_Output(self, hero, "Info_Mod_Abdi_WieLang_09_01"); //Beliar hat mich erwählt, Großes zu leisten. Entsprechend früh hat er mich der Gemeinschaft zugeführt.
};

INSTANCE Info_Mod_Abdi_Eltern (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_Eltern_Condition;
	information	= Info_Mod_Abdi_Eltern_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was haben deine Eltern dazu gesagt?";
};

FUNC INT Info_Mod_Abdi_Eltern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_WieLang))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abdi_Eltern_Info()
{
	AI_Output(hero, self, "Info_Mod_Abdi_Eltern_15_00"); //Was haben deine Eltern dazu gesagt?
	AI_Output(self, hero, "Info_Mod_Abdi_Eltern_09_01"); //Ich kann mich nicht an meine Eltern erinnern.
	AI_Output(self, hero, "Info_Mod_Abdi_Eltern_09_02"); //Aufgewachsen bin ich in dieser stinkenden Innosschule, wo sie mich triezten und quälten.
	AI_Output(self, hero, "Info_Mod_Abdi_Eltern_09_03"); //Als sie uns zum Pflanzensammeln schickten, lief ich davon.
	AI_Output(self, hero, "Info_Mod_Abdi_Eltern_09_04"); //Eduard fand mich damals und brachte mich hierher. Erst hier habe ich mein Zuhause gefunden.
};

INSTANCE Info_Mod_Abdi_DontTalk (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_DontTalk_Condition;
	information	= Info_Mod_Abdi_DontTalk_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Abdi_DontTalk_Condition()
{
	if ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_VLK))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abdi_DontTalk_Info()
{
	AI_Output(self, hero, "Info_Mod_Abdi_DontTalk_09_00"); //Mit euch Gesindel geb ich mich nicht ab!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Abdi_Belagerung (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_Belagerung_Condition;
	information	= Info_Mod_Abdi_Belagerung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Brauchst du Hilfe?";
};

FUNC INT Info_Mod_Abdi_Belagerung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Abdi_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Raven_Belagerung))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abdi_Belagerung_Info()
{
	AI_Output(hero, self, "Info_Mod_Abdi_Belagerung_15_00"); //Brauchst du Hilfe?
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_01"); //Ja, sogar sehr!

	B_Say	(hero, self, "$WASISTZUTUN");

	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_02"); //In den letzten zwei Nächten wurde jeweils einer unser Novizen tot aufgefunden.
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_03"); //Beide wurden grausam zugerichtet.
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_04"); //Allerdings ist in der Nähe des Lagers niemand gesichtet worden, der dafür verantwortlich sein könnte.
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_05"); //Wir befürchten also, dass wir einen Verräter in unseren Reihen haben.
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_06"); //Wir müssen den Mörder ausfindig machen, um Schlimmeres zu verhindern.

	B_Say	(hero, self, "$WIESOLLICHVORGEHEN");

	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_07"); //Befrage unsere Leute, um an Informationen zu kommen. Töte den Mörder!
	AI_Output(hero, self, "Info_Mod_Abdi_Belagerung_15_08"); //Ich werde mein Bestes geben!
	AI_Output(self, hero, "Info_Mod_Abdi_Belagerung_09_09"); //Versage bitte nicht!

	Log_CreateTopic	(TOPIC_MOD_BEL_DAEMON, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_DAEMON, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_DAEMON, "In den letzten Nächten wurden einige Novizen getötet. Abdi hat mich gebeten den Mörder zu finden und zu töten. Dazu soll ich die anderen befragen.");
};

INSTANCE Info_Mod_Abdi_DaemonTot (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_DaemonTot_Condition;
	information	= Info_Mod_Abdi_DaemonTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Dämon ist tot!";
};

FUNC INT Info_Mod_Abdi_DaemonTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_BesessenerNovize_Hi))
	&& (Npc_IsDead(Demon_Novize))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Abdi_DaemonTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Abdi_DaemonTot_15_00"); //Der Dämon ist tot!
	AI_Output(self, hero, "Info_Mod_Abdi_DaemonTot_09_01"); //Danke, damit hast du uns einen großen Dienst erwiesen. Hier, nimm diese Heilrune.

	CreateInvItems	(self, ItRu_LightHeal, 1);
	B_GiveInvItems	(self, hero, ItRu_LightHeal, 1);

	B_GivePlayerXP	(1000);

	B_LogEntry_More	(TOPIC_MOD_BEL_DAEMON, TOPIC_MOD_BEL_BELAGERUNG, "Der Dämon ist tot. Als Dank hab ich von Abdi eine leichte Wundheilung bekommen.", "Abdis Dämonenproblem ist gelöst.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_DAEMON, LOG_SUCCESS);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Abdi_Pickpocket (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_Pickpocket_Condition;
	information	= Info_Mod_Abdi_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Abdi_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Abdi_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);

	Info_AddChoice	(Info_Mod_Abdi_Pickpocket, DIALOG_BACK, Info_Mod_Abdi_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Abdi_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Abdi_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Abdi_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);
};

FUNC VOID Info_Mod_Abdi_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);

		Info_AddChoice	(Info_Mod_Abdi_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Abdi_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Abdi_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Abdi_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Abdi_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Abdi_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Abdi_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Abdi_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Abdi_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Abdi_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Abdi_EXIT (C_INFO)
{
	npc		= Mod_1030_SNOV_Abdi_MT;
	nr		= 1;
	condition	= Info_Mod_Abdi_EXIT_Condition;
	information	= Info_Mod_Abdi_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Abdi_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Abdi_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};