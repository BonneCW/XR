INSTANCE Info_Mod_Orakel_Hi (C_INFO)
{
	npc		= Mod_1774_KDF_Orakel_PAT;
	nr		= 1;
	condition	= Info_Mod_Orakel_Hi_Condition;
	information	= Info_Mod_Orakel_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Orakel_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Nagon_Gizar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orakel_Hi_Info()
{
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orakel_Nagon (C_INFO)
{
	npc		= Mod_1774_KDF_Orakel_PAT;
	nr		= 1;
	condition	= Info_Mod_Orakel_Nagon_Condition;
	information	= Info_Mod_Orakel_Nagon_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orakel_Nagon_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Nagon_Gizar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orakel_Nagon_Info()
{
	AI_Output(self, hero, "Info_Mod_Orakel_Nagon_07_00"); //Ich habe dich erwartet! Du suchst einen Weg die Foki zu erlangen.
	AI_Output(hero, self, "Info_Mod_Orakel_Nagon_15_01"); //Woher weißt du ...?
	AI_Output(self, hero, "Info_Mod_Orakel_Nagon_07_02"); //Ich bin das Orakel. Ich habe mein Wissen von Innos selbst erlangt.
	AI_Output(hero, self, "Info_Mod_Orakel_Nagon_15_03"); //Also wie komm ich jetzt an die Foki?
	AI_Output(self, hero, "Info_Mod_Orakel_Nagon_07_04"); //Du musst fünf Eigenschaften besitzen: Mut, List, Vernunft, Glaube und Ehrlichkeit.
	AI_Output(self, hero, "Info_Mod_Orakel_Nagon_07_05"); //Für jeden der Foki musst du eine dieser Eigenschaften nutzen, nur so kannst du alle erlangen.
	AI_Output(self, hero, "Info_Mod_Orakel_Nagon_07_06"); //Nun geh und erfülle deine Aufgabe!

	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Das Orakel hat gesagt, dass ich fünf Eigenschaften brauche, um die Foki zu erlangen: Mut, List, Vernunft, Glaube und Ehrlichkeit.");

	B_GivePlayerXP	(500);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orakel_EXIT (C_INFO)
{
	npc		= Mod_1774_KDF_Orakel_PAT;
	nr		= 1;
	condition	= Info_Mod_Orakel_EXIT_Condition;
	information	= Info_Mod_Orakel_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Orakel_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Orakel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};