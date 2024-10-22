INSTANCE Info_Mod_Paladin01_Hi (C_INFO)
{
	npc		= Mod_1769_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Paladin01_Hi_Condition;
	information	= Info_Mod_Paladin01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Paladin01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Paladin01_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Paladin01_Hi_06_01"); //Ich bin einer der Paladine.
};

INSTANCE Info_Mod_Paladin01_MangelQuest (C_INFO)
{
	npc		= Mod_1769_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Paladin01_MangelQuest_Condition;
	information	= Info_Mod_Paladin01_MangelQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie wäre es zur Abwechslung deine geistigen Kräfte bei einem Gebet in der Kirche zu stärken.";
};

FUNC INT Info_Mod_Paladin01_MangelQuest_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nagon_MangelQuest2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Paladin01_MangelQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Paladin01_MangelQuest_15_00"); //Wie wäre es zur Abwechslung deine geistigen Kräfte bei einem Gebet in der Kirche zu stärken.
	AI_Output(hero, self, "Info_Mod_Paladin01_MangelQuest_15_01"); //Denn ein wahrer Krieger nutzt im Kampf sowohl die Stärke seines Körpers, als auch die seines Geistes.
	AI_Output(self, hero, "Info_Mod_Paladin01_MangelQuest_06_02"); //Ja, Meister ... ihr habt natürlich Recht. Was wären wir Paladine denn ohne die von Innos verliehene Magie.
	AI_Output(self, hero, "Info_Mod_Paladin01_MangelQuest_06_03"); //In der letzten Zeit des Blutvergießens hatte ich begonnen mich zu sehr rein nach dem Schwert zu richten.
	AI_Output(self, hero, "Info_Mod_Paladin01_MangelQuest_06_04"); //Habt Dank, für eure weisen Worte. Ich werde mich sofort zur Kirche begeben.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KIRCHE");

	B_GivePlayerXP	(100);

	Mod_Pat_Beter += 1;

	if (Mod_Pat_Beter == 3)
	{
		B_LogEntry	(TOPIC_MOD_FM_MANGEL, "So, ich denke ich haben genügend Jünger Innos’ zum Gebet bewegen können und sollte in der Kirche bei Nagon vorbeischauen.");
	};
};

INSTANCE Info_Mod_Paladin01_Fake (C_INFO)
{
	npc		= Mod_1769_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Paladin01_Fake_Condition;
	information	= Info_Mod_Paladin01_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir hier jemand besonderes aufgefallen?";
};

FUNC INT Info_Mod_Paladin01_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Paladin01_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alchemist01_Fake))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Paladin01_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Paladin01_Fake_15_00"); //Ist dir hier jemand besonderes aufgefallen?
	AI_Output(self, hero, "Info_Mod_Paladin01_Fake_06_01"); //Vielleicht einer der Magier, der es scheinbar ziemlich eilig hatte. Ich glaube er wollte in den Kräutergarten.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Ein Paladin meint, dass der Magier in den Kräutergarten gegangen wäre.");
};

INSTANCE Info_Mod_Paladin01_EXIT (C_INFO)
{
	npc		= Mod_1769_PAL_Paladin_PAT;
	nr		= 1;
	condition	= Info_Mod_Paladin01_EXIT_Condition;
	information	= Info_Mod_Paladin01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Paladin01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Paladin01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};