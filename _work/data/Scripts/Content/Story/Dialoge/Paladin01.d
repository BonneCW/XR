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