INSTANCE Info_Mod_Klinger_Lehrer (C_INFO)
{
	npc		= Mod_7555_JG_Klinger_JL;
	nr		= 1;
	condition	= Info_Mod_Klinger_Lehrer_Condition;
	information	= Info_Mod_Klinger_Lehrer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Klinger_Lehrer_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Klinger_Lehrer_Info()
{
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_00"); //Tritt näher, Freund. Hier steht Klinger, der Herr der tödlichen Klinge.
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_01"); //Der Rächer der Betrogenen und Enterbten. Der Held des mörderischen Kampfes.
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_02"); //Der König unter den Kriegern.
	AI_Output(hero, self, "Info_Mod_Klinger_Lehrer_15_03"); //Gut gebrüllt, Löwe!
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_04"); //Löwe?
	AI_Output(hero, self, "Info_Mod_Klinger_Lehrer_15_05"); //Ein Tier, das auf dem Festland vorkommt. Brüllt wie ein Troll und ist genau so gefährlich.
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_06"); //Kenne ich nicht. Ich komme aus dem hohen Norden.
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_07"); //Mein Vater war der Geachtetste im Clan, meine Mutter die Schönste unter den Weibern und ich der mutigste Jüngling unter der Sonne.
	AI_Output(hero, self, "Info_Mod_Klinger_Lehrer_15_08"); //Wie kommst du dann hier her?
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_09"); //Eine Intrige! Eine infame Verleumdung von einem niederträchtigen Nebenbuhler!
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_10"); //Die holde Maid war mir versprochen!
	AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_11"); //Eines Tages kamen die Schergen des Königs, verschleppten mich und warfen mich in die Barriere!
	AI_Output(hero, self, "Info_Mod_Klinger_Lehrer_15_12"); //Das tut mir aber leid.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(hero, self, "Info_Mod_Klinger_Lehrer_15_13"); //Sag, kannst du mir was beibringen?
		AI_Output(self, hero, "Info_Mod_Klinger_Lehrer_06_14"); //Welche Frage! Ich bin der beste Nahkämpfer, den es gibt. Was solls sein?

		Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_WALDIS, "Klinger kann mir den Umgang mit Einhänder beibringen.");
	};
};

INSTANCE Info_Mod_Klinger_Lernen (C_INFO)
{
	npc		= Mod_7555_JG_Klinger_JL;
	nr		= 1;
	condition	= Info_Mod_Klinger_Lernen_Condition;
	information	= Info_Mod_Klinger_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Klinger_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Klinger_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Klinger_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Klinger_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Klinger_Lernen);

	Info_AddChoice		(Info_Mod_Klinger_Lernen, DIALOG_BACK, Info_Mod_Klinger_Lernen_Zweihand_BACK);
	Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1h))		,Info_Mod_Klinger_Lernen_Zweihand_5);
	Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1h, 1))		,Info_Mod_Klinger_Lernen_Zweihand_1);
};

FUNC VOID Info_Mod_Klinger_Lernen_Zweihand_BACK()
{
	Info_ClearChoices	(Info_Mod_Klinger_Lernen);
};

FUNC VOID Info_Mod_Klinger_Lernen_Zweihand_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1h, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Klinger_Lernen);

		Info_AddChoice		(Info_Mod_Klinger_Lernen, DIALOG_BACK, Info_Mod_Klinger_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1h))		,Info_Mod_Klinger_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1h, 1))		,Info_Mod_Klinger_Lernen_Zweihand_1);
	};
};

FUNC VOID Info_Mod_Klinger_Lernen_Zweihand_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1h, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Klinger_Lernen);

		Info_AddChoice		(Info_Mod_Klinger_Lernen, DIALOG_BACK, Info_Mod_Klinger_Lernen_Zweihand_BACK);
		Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1h))		,Info_Mod_Klinger_Lernen_Zweihand_5);
		Info_AddChoice		(Info_Mod_Klinger_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1h, 1))		,Info_Mod_Klinger_Lernen_Zweihand_1);
	};
};

INSTANCE Info_Mod_Klinger_EXIT (C_INFO)
{
	npc		= Mod_7555_JG_Klinger_JL;
	nr		= 1;
	condition	= Info_Mod_Klinger_EXIT_Condition;
	information	= Info_Mod_Klinger_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Klinger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Klinger_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};