INSTANCE Info_Mod_Jerry_Hi (C_INFO)
{
	npc		= Mod_7536_KG_Jerry_MT;
	nr		= 1;
	condition	= Info_Mod_Jerry_Hi_Condition;
	information	= Info_Mod_Jerry_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Jerry_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jerry_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Jerry_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Jerry_Hi_04_01"); //Hey.
	AI_Output(hero, self, "Info_Mod_Jerry_Hi_15_02"); //Du scheinst ja noch eine menge Arbeit vor dir zu haben.
	AI_Output(self, hero, "Info_Mod_Jerry_Hi_04_03"); //Genau diese Art von Arbeit bekommt man hier als neuer Soldat.
	AI_Output(self, hero, "Info_Mod_Jerry_Hi_04_04"); //Die bei der Miliz wollten mich nicht, aber der Oberbefehlshaber der Miliz meinte, es gäbe auch für mich eine Möglichkeit, das Militär zu unterstützen.
	AI_Output(self, hero, "Info_Mod_Jerry_Hi_04_05"); //Und jetzt schau dir an, wo ich gelandet bin, an der Front und darf das Lager ausbessern.
	AI_Output(hero, self, "Info_Mod_Jerry_Hi_15_06"); //Das Gefühl an der Front zu sein hab ich auch öfters ...
};

INSTANCE Info_Mod_Jerry_Lehrer (C_INFO)
{
	npc		= Mod_7536_KG_Jerry_MT;
	nr		= 1;
	condition	= Info_Mod_Jerry_Lehrer_Condition;
	information	= Info_Mod_Jerry_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich Trainieren?";
};

FUNC INT Info_Mod_Jerry_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jerry_Hi))
	&& (KG_Dabei == 1)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jerry_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Jerry_Lehrer_15_00"); //Kannst du mich Trainieren?
	AI_Output(self, hero, "Info_Mod_Jerry_Lehrer_04_01"); //Na klar, wir Neuen sollten doch zusammen halt.
	AI_Output(self, hero, "Info_Mod_Jerry_Lehrer_04_02"); //Wenn du willst kann ich dir ein paar Sachen im Einhandkampf zeigen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KG, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KG, "Jerry kann mir den Umgang mit Einhändern beibringen.");
};

INSTANCE Info_Mod_Jerry_Lernen (C_INFO)
{
	npc		= Mod_7536_KG_Jerry_MT;
	nr		= 1;
	condition	= Info_Mod_Jerry_Lernen_Condition;
	information	= Info_Mod_Jerry_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Jerry_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jerry_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jerry_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Jerry_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Jerry_Lernen);

	Info_AddChoice	(Info_Mod_Jerry_Lernen, DIALOG_BACK, Info_Mod_Jerry_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Jerry_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Jerry_Lernen_1H_1);
};

FUNC VOID Info_Mod_Jerry_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Jerry_Lernen);
};

FUNC VOID Info_Mod_Jerry_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices	(Info_Mod_Jerry_Lernen);

		Info_AddChoice	(Info_Mod_Jerry_Lernen, DIALOG_BACK, Info_Mod_Jerry_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Jerry_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Jerry_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Jerry_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices	(Info_Mod_Jerry_Lernen);

		Info_AddChoice	(Info_Mod_Jerry_Lernen, DIALOG_BACK, Info_Mod_Jerry_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Jerry_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Jerry_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Jerry_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Jerry_Pickpocket (C_INFO)
{
	npc		= Mod_7536_KG_Jerry_MT;
	nr		= 1;
	condition	= Info_Mod_Jerry_Pickpocket_Condition;
	information	= Info_Mod_Jerry_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Jerry_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Jerry_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jerry_Pickpocket);

	Info_AddChoice	(Info_Mod_Jerry_Pickpocket, DIALOG_BACK, Info_Mod_Jerry_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jerry_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jerry_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jerry_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jerry_Pickpocket);
};

FUNC VOID Info_Mod_Jerry_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jerry_Pickpocket);
};

INSTANCE Info_Mod_Jerry_EXIT (C_INFO)
{
	npc		= Mod_7536_KG_Jerry_MT;
	nr		= 1;
	condition	= Info_Mod_Jerry_EXIT_Condition;
	information	= Info_Mod_Jerry_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jerry_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jerry_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};