INSTANCE Info_Mod_Hilda_Hi (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_Hi_Condition;
	information	= Info_Mod_Hilda_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, schöne Frau.";
};

FUNC INT Info_Mod_Hilda_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hilda_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hilda_Hi_15_00"); //Hallo, schöne Frau.
	AI_Output(self, hero, "Info_Mod_Hilda_Hi_17_01"); //(misstrauisch) Was willst du?
	AI_Output(hero, self, "Info_Mod_Hilda_Hi_15_02"); //Warum so feindselig?
	AI_Output(self, hero, "Info_Mod_Hilda_Hi_17_03"); //(gelöst) Ach, in letzter Zeit kommen hier so viele Fremde vorbei, dass man gar nicht mehr weiß, woran man ist.
	AI_Output(self, hero, "Info_Mod_Hilda_Hi_17_04"); //Und nicht alle Begegnungen waren erfreulicher Natur.
};

INSTANCE Info_Mod_Hilda_Argez (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_Argez_Condition;
	information	= Info_Mod_Hilda_Argez_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer war denn hier?";
};

FUNC INT Info_Mod_Hilda_Argez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hilda_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hilda_Argez_Info()
{
	AI_Output(hero, self, "Info_Mod_Hilda_Argez_15_00"); //Wer war denn hier?
	AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_01"); //Das fing schon mit den Paladinen und Rittern an. Lauter Schmutzfinken sind das, ich habe noch keine aufrichtige Person unter ihnen erlebt.
	AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_02"); //Und seit dem Fall der Barriere kommen immer mal wieder ehemalige Sträflinge vorbei, verhalten sich aber ruhig, weil Lobart ein großes Herz hat.
	AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_03"); //Zu viel wurde es ihm dann erst bei dem Tätowierten. Der hat ihm richtig Angst gemacht.
	AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_04"); //Er hat zwar nur nach Arbeit gefragt, aber auf eine so komische Weise, als würde er im nächsten Moment durchdrehen.

	if (!Npc_KnowsInfo(hero, Info_Mod_Argez_NW_InCity))
	{
		AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_05"); //Ich habe ihm dann eine Suppe gegeben, damit er geht, aber da er wohl nicht in die Stadt eingelassen wurde, steht er noch immer auf dem Weg vor den Feldern.
		AI_Output(self, hero, "Info_Mod_Hilda_Argez_17_06"); //Wenn du dafür sorgst, dass er von dort verschwindet, könnten wir sicher besser schlafen.

		Log_CreateTopic	(TOPIC_MOD_HILDA_ARGEZ, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_HILDA_ARGEZ, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_HILDA_ARGEZ, "Auf dem Weg zum Stadttor soll sich ein merkwürdiger Fremder aufhalten, den die Bäuerin Hilda fürchtet. Es wäre ihr am liebsten, er würde von dort verschwinden.");

		Mod_Hilda_Argez = 1;
	};
};

INSTANCE Info_Mod_Hilda_Argez2 (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_Argez2_Condition;
	information	= Info_Mod_Hilda_Argez2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Fremde ist nun in der Stadt.";
};

FUNC INT Info_Mod_Hilda_Argez2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Argez_NW_InCity))
	&& (Mod_Hilda_Argez == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hilda_Argez2_Info()
{
	AI_Output(hero, self, "Info_Mod_Hilda_Argez2_15_00"); //Der Fremde ist nun in der Stadt.
	AI_Output(self, hero, "Info_Mod_Hilda_Argez2_17_01"); //Mir fällt ein Stein vom Herzen. Hier, nimm du auch eine warme Suppe.

	B_GiveInvItems	(self, hero, ItFo_Fleischeintopf, 1);

	B_GivePlayerXP	(50);

	CurrentNQ += 1;

	B_SetTopicStatus	(TOPIC_MOD_HILDA_ARGEZ, LOG_SUCCESS);
};

INSTANCE Info_Mod_Hilda_Wein (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_Wein_Condition;
	information	= Info_Mod_Hilda_Wein_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hilda_Wein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hilda_Hi))
	&& (Kapitel > 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hilda_Wein_Info()
{
	AI_Output(self, hero, "Info_Mod_Hilda_Wein_17_00"); //Du kommst mir gerade recht!
	AI_Output(hero, self, "Info_Mod_Hilda_Wein_15_01"); //Was gibt’s?
	AI_Output(self, hero, "Info_Mod_Hilda_Wein_17_02"); //Wir wollen unsere Arbeiter mir etwas Wein belohnen, da sie arg schuften. Bitte besorge mir doch welchen. 6 Flaschen sollten reichen!

	Info_ClearChoices	(Info_Mod_Hilda_Wein);

	Info_AddChoice	(Info_Mod_Hilda_Wein, "Such dir jemand anderen.", Info_Mod_Hilda_Wein_B);
	Info_AddChoice	(Info_Mod_Hilda_Wein, "Kein Problem.", Info_Mod_Hilda_Wein_A);
};

FUNC VOID Info_Mod_Hilda_Wein_B()
{
	AI_Output(hero, self, "Info_Mod_Hilda_Wein_B_15_00"); //Such dir jemand anderen.
	AI_Output(self, hero, "Info_Mod_Hilda_Wein_B_17_01"); //Dann verzieh dich!

	Info_ClearChoices	(Info_Mod_Hilda_Wein);

	AI_StopProcessInfos	(self);

	B_Göttergefallen(3, 1);
};

FUNC VOID Info_Mod_Hilda_Wein_A()
{
	AI_Output(hero, self, "Info_Mod_Hilda_Wein_A_15_00"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Hilda_Wein_A_17_01"); //Gut, und beeil dich bitte.

	Info_ClearChoices	(Info_Mod_Hilda_Wein);

	Log_CreateTopic	(TOPIC_MOD_HILDA_WEIN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HILDA_WEIN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HILDA_WEIN, "Hilda möchte, dass ich sechs Flaschen Wein für ihre Arbeiter besorge.");

	Mod_HildaWeinQuest = TRUE;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Hilda_HabWein (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_HabWein_Condition;
	information	= Info_Mod_Hilda_HabWein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Wein.";
};

FUNC INT Info_Mod_Hilda_HabWein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hilda_Wein))
	&& (Mod_HildaWeinQuest == TRUE)
	&& (Npc_HasItems(hero, ItFo_Wine) > 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hilda_HabWein_Info()
{
	AI_Output(hero, self, "Info_Mod_Hilda_HabWein_15_00"); //Ich hab den Wein.
	AI_Output(self, hero, "Info_Mod_Hilda_HabWein_17_01"); //Danke sehr.
	AI_Output(hero, self, "Info_Mod_Hilda_HabWein_15_01"); //Kein Problem.
	AI_Output(self, hero, "Info_Mod_Hilda_HabWein_17_02"); //Hier, für deine Mühen.

	CreateInvItems	(self, ItMi_Gold, 50);
	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	B_Göttergefallen(1, 1);

	B_LogEntry	(TOPIC_MOD_HILDA_WEIN, "Ich habe Hilda den Wein gebracht.");
	B_SetTopicStatus	(TOPIC_MOD_HILDA_WEIN, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Hilda_Pickpocket (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_Pickpocket_Condition;
	information	= Info_Mod_Hilda_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Hilda_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Hilda_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hilda_Pickpocket);

	Info_AddChoice	(Info_Mod_Hilda_Pickpocket, DIALOG_BACK, Info_Mod_Hilda_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hilda_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hilda_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hilda_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hilda_Pickpocket);
};

FUNC VOID Info_Mod_Hilda_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Hilda_Pickpocket);
};

INSTANCE Info_Mod_Hilda_EXIT (C_INFO)
{
	npc		= Mod_909_BAU_Hilda_NW;
	nr		= 1;
	condition	= Info_Mod_Hilda_EXIT_Condition;
	information	= Info_Mod_Hilda_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hilda_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hilda_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};