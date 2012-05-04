INSTANCE Info_Mod_Riddler_Hi (C_INFO)
{
	npc		= BAU_989_Riddler;
	nr		= 1;
	condition	= Info_Mod_Riddler_Hi_Condition;
	information	= Info_Mod_Riddler_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Riddler_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_Felsenfestung))
	&& (riddle6 == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riddler_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_00"); //Was ist passiert? Ich kann mich nicht mehr genau erinnern.
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_01"); //Schatten, Tod und eine ungeheure Macht.
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_02"); //Hat Chromanin mich verlassen?

	B_SetTopicStatus	(TOPIC_MOD_THERIDDLE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Riddler_Chromanin (C_INFO)
{
	npc		= BAU_989_Riddler;
	nr		= 1;
	condition	= Info_Mod_Riddler_Chromanin_Condition;
	information	= Info_Mod_Riddler_Chromanin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist Chromanin?";
};

FUNC INT Info_Mod_Riddler_Chromanin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riddler_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riddler_Chromanin_Info()
{
	AI_Output(hero, self, "Info_Mod_Riddler_Chromanin_15_00"); //Was ist Chromanin?
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_01"); //Chromanin ist eine unvorstellbare Macht. Ich habe sie vor langer Zeit empfangen.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_02"); //Es scheint mir als hätte ich diese Macht von einem der Götter. Ich habe ebenfalls ein Schwert empfangen.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_03"); //Es ist sehr mächtig. Durch dieses Schwert habe ich viele Kämpfe gewonnen.
	AI_Output(hero, self, "Info_Mod_Riddler_Chromanin_15_04"); //Wie konnte es dann passieren das du stirbst?
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_05"); //Nein, ich war keineswegs tot. Aber die dunklen Mächte, mit denen ich mich einließ, übermannten mich und warfen mich in eine magische Zwischenwelt.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_06"); //Dort war ich gefangen und konnte nur auf magischem Wege mit dem Diesseits kommunizieren.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_07"); //So füllte ich die magischen Bücher mit Hinweisen, die zu meiner Befreiung führen konnten.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_08"); //Jedoch haben die finsteren Kräfte versucht ihren Sinn in Rätseln zu verschleiern und viele andere Hindernisse geschaffen ...

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Riddler hat etwas über ein Schwert gesagt, dass er zusammen mit Chromanin empfangen hat.");
};

INSTANCE Info_Mod_Riddler_Schwert (C_INFO)
{
	npc		= BAU_989_Riddler;
	nr		= 1;
	condition	= Info_Mod_Riddler_Schwert_Condition;
	information	= Info_Mod_Riddler_Schwert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit dem Schwert geschehen?";
};

FUNC INT Info_Mod_Riddler_Schwert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riddler_Chromanin))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riddler_Schwert_Info()
{
	AI_Output(hero, self, "Info_Mod_Riddler_Schwert_15_00"); //Was ist mit dem Schwert geschehen?
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_01"); //Die dunkle Magie manifestierte sich zu finsteren Wesen, welche es an sich nahmen. Eines von ihnen hat das Schwert weggebracht. Wahrscheinlich liegt es noch irgendwo hier unten.
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_02"); //Da du bei deiner Suche allen Hindernissen trotztest, hast du dich als würdig erwiesen. Du sollst das Schwert behalten, wenn du es findest.
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_03"); //Ich war nicht derjenige, für den es bestimmt war und werde mich in Zukunft vor Mächten hüten, denen ich nicht gewachsen bin.
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_04"); //Daher kann ich dir bei deiner Suche mit nicht viel helfen, außer einem Teil meiner Macht.

	Info_ClearChoices	(Info_Mod_Riddler_Schwert);

	Info_AddChoice	(Info_Mod_Riddler_Schwert, "2 Stärke", Info_Mod_Riddler_Schwert_C);
	Info_AddChoice	(Info_Mod_Riddler_Schwert, "2 Geschick", Info_Mod_Riddler_Schwert_B);
	Info_AddChoice	(Info_Mod_Riddler_Schwert, "3 Mana", Info_Mod_Riddler_Schwert_A);

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Riddler vermutet, dass sich das Schwert noch im Nebelturm befindet.");

	Wld_InsertNpc	(Skeleton_Anführer, "OW_FOGDUNGEON_42");
};

FUNC VOID Info_Mod_Riddler_Schwert_D()
{
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_D_09_00"); //Viel Erfolg auf deinem weiteren Weg. Er wird die Geschicke von Menschen und Göttern bestimmen.

	Info_ClearChoices	(Info_Mod_Riddler_Schwert);

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Riddler vermutet, dass sich das Schwert noch im Nebelturm befindet. Eines der Skelette hat es damals mitgenommen ...");

	Wld_InsertNpc	(Skeleton_Anführer, "OW_FOGDUNGEON_42");
};

FUNC VOID Info_Mod_Riddler_Schwert_C()
{
	B_BlessAttribute	(hero, ATR_STRENGTH, 2);

	Info_Mod_Riddler_Schwert_D();
};

FUNC VOID Info_Mod_Riddler_Schwert_B()
{
	B_BlessAttribute	(hero, ATR_DEXTERITY, 2);

	Info_Mod_Riddler_Schwert_D();
};

FUNC VOID Info_Mod_Riddler_Schwert_A()
{
	B_BlessAttribute	(hero, ATR_MANA_MAX, 3);

	Info_Mod_Riddler_Schwert_D();
};

INSTANCE Info_Mod_Riddler_EXIT (C_INFO)
{
	npc		= BAU_989_Riddler;
	nr		= 1;
	condition	= Info_Mod_Riddler_EXIT_Condition;
	information	= Info_Mod_Riddler_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Riddler_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Riddler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};