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
	&& (riddle6	==	TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Riddler_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_00"); //Was ist passiert? Ich kann mich nicht mehr genau erinnern.
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_01"); //Schatten, Tod und eine ungeheure Macht.
	AI_Output(self, hero, "Info_Mod_Riddler_Hi_09_02"); //Hat Chromanin mich verlassen?
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
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_05"); //Nun, ich war zwar sehr mächtig, aber nicht unsterblich. Als ich eines Tages hier im Nebelturm war um ihn ein wenig zu untersuchen, kamen ganze Horden von Skeletten.
	AI_Output(self, hero, "Info_Mod_Riddler_Chromanin_09_06"); //Ich war völlig unvorbereitet und sie haben es geschafft mir mein Schwert zu nehmen und mich dann zu töten. Ich konnte zwar ein paar von ihnen mit in den Tod nehmen, aber leider nicht genug.

	Wld_InsertNpc	(Skeleton_Anführer, "OW_FOGDUNGEON_42");

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Riddler hat etwas über ein Schwert gesagt, dass er zusammen mit Chromanin empfangen hat. Doch es wurde ihm von einem Skelett gestohlen.");
};

INSTANCE Info_Mod_Riddler_Schwert (C_INFO)
{
	npc		= BAU_989_Riddler;
	nr		= 1;
	condition	= Info_Mod_Riddler_Schwert_Condition;
	information	= Info_Mod_Riddler_Schwert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was haben die Skelette mit dem Schwert gemacht?";
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
	AI_Output(hero, self, "Info_Mod_Riddler_Schwert_15_00"); //Was haben die Skelette mit dem Schwert gemacht?
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_01"); //Nachdem sie es an sich genommen haben, hat eines von ihnen das Schwert weggebracht. Wahrscheinlich liegt es noch irgendwo hier unten.
	AI_Output(self, hero, "Info_Mod_Riddler_Schwert_09_02"); //Da du mein Rätsel gelöst hast steht dir ein Teil von Chromanin zur Verfügung. Du kannst das Schwert behalten wenn du es findest.

	B_LogEntry	(TOPIC_MOD_ERSTEWAFFE, "Riddler vermutet, dass sich das Schwert noch im Nebelturm befindet.");
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