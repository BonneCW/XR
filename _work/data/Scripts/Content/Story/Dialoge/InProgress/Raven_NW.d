INSTANCE Info_Mod_Raven_Irdorath (C_INFO)
{
	npc		= Mod_510_DMR_Raven_NW;
	nr		= 1;
	condition	= Info_Mod_Raven_Irdorath_Condition;
	information	= Info_Mod_Raven_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss mit dem Schiff im Hafen zu einer Insel aufbrechen.";
};

FUNC INT Info_Mod_Raven_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_Irdorath_15_00"); //Ich muss mit dem Schiff im Hafen zu einer Insel aufbrechen.
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_01"); //Und?
	AI_Output(hero, self, "Info_Mod_Raven_Irdorath_15_02"); //Würdest du in meine Mannschaft kommen?
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_03"); //Was?! Warum sollte ich das bitte machen?!
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_04"); //Auf ein Schiff der Paladine und mir dann die ganze Seereise über die Seele aus dem Leib kotzen?!
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_05"); //Keine 10 Trolle kriegen mich da rauf.
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_06"); //Wie kommst du überhaupt auf den absurden Gedanken, ich könne mitkommen?
	AI_Output(hero, self, "Info_Mod_Raven_Irdorath_15_07"); //Tja, ähh, also Xardas meinte ...
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_08"); //Was?! (halblaut) Verdammt, eine Anweisung von Xardas.
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath_03_09"); //(widerwillig zum Helden) Also gut, wir sehen uns dann am Hafen.
	AI_Output(hero, self, "Info_Mod_Raven_Irdorath_15_10"); //Na, das war ein schneller Stimmungswandel.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Trotz gewissem Widerstreben konnte ich Raven für die Reise 'gewinnen'.");

	B_GivePlayerXP	(100);

	Mod_RavenDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Raven_Irdorath3 (C_INFO)
{
	npc		= Mod_510_DMR_Raven_NW;
	nr		= 1;
	condition	= Info_Mod_Raven_Irdorath3_Condition;
	information	= Info_Mod_Raven_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint, dass wir zu viele sind.";
};

FUNC INT Info_Mod_Raven_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raven_Irdorath))
	&& (Mod_Irdorath == 0)
	&& (Mod_RavenDabei == 1)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raven_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Raven_Irdorath3_15_00"); //Tut mir leid, aber es scheint, dass wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath3_03_01"); //Was?! Na dann nichts wie weg hier ...
	AI_Output(self, hero, "Info_Mod_Raven_Irdorath3_03_02"); //(halblaut) Nicht, dass er es sich noch anders überlegt.

	Mod_RavenDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "RAT");
};

INSTANCE Info_Mod_Raven_NW_EXIT (C_INFO)
{
	npc		= Mod_510_DMR_Raven_NW;
	nr		= 1;
	condition	= Info_Mod_Raven_NW_EXIT_Condition;
	information	= Info_Mod_Raven_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raven_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raven_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};