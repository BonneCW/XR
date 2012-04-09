INSTANCE Info_Mod_Buster_Hi (C_INFO)
{
	npc		= Mod_780_SLD_Buster_MT;
	nr		= 1;
	condition	= Info_Mod_Buster_Hi_Condition;
	information	= Info_Mod_Buster_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Buster_Hi_Condition()
{
	if (Npc_GetTalentSkill (hero, NPC_TALENT_ACROBAT) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buster_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Buster_Hi_13_00"); //Hey, du siehst aber wieder ziemlich ungelenkig aus, als hättest du deine Gliedmaßen lange nicht ausgestreckt.
	AI_Output(hero, self, "Info_Mod_Buster_Hi_15_01"); //Ja, so ein paar Wochen unter Steinen ...
	AI_Output(self, hero, "Info_Mod_Buster_Hi_13_02"); //Ich könnte dir helfen, deine Beweglichkeit wieder auf Vordermann zu bringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER, "Buster kann mir beibringen, mich besser zu bewegen.");
};

INSTANCE Info_Mod_Buster_Lernen (C_INFO)
{
	npc		= Mod_780_SLD_Buster_MT;
	nr		= 1;
	condition	= Info_Mod_Buster_Lernen_Condition;
	information	= Info_Mod_Buster_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Akrobatik lernen (5 LP)";
};

FUNC INT Info_Mod_Buster_Lernen_Condition()
{
	Info_Mod_Buster_Lernen.description = B_BuildLearnString("Akrobatik lernen", B_GetLearnCostTalent(hero, NPC_TALENT_ACROBAT, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Buster_Hi))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_ACROBAT) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Buster_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Buster_Lernen_15_00"); //Bring mir Akrobatik bei.

	if (B_TeachThiefTalent (self, hero, NPC_TALENT_ACROBAT))
	{
		AI_Output(self, hero, "Info_Mod_Buster_Lernen_13_01"); //Wenn du deinen Körper beherrschst, bist du in der Lage viel weiter zu springen.
		AI_Output(self, hero, "Info_Mod_Buster_Lernen_13_02"); //Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
		AI_Output(self, hero, "Info_Mod_Buster_Lernen_13_03"); //Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell verändern. Viel Glück!
	};
};

INSTANCE Info_Mod_Buster_Pickpocket (C_INFO)
{
	npc		= Mod_780_SLD_Buster_MT;
	nr		= 1;
	condition	= Info_Mod_Buster_Pickpocket_Condition;
	information	= Info_Mod_Buster_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Buster_Pickpocket_Condition()
{
	C_Beklauen	(53, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Buster_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Buster_Pickpocket);

	Info_AddChoice	(Info_Mod_Buster_Pickpocket, DIALOG_BACK, Info_Mod_Buster_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Buster_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Buster_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Buster_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Buster_Pickpocket);
};

FUNC VOID Info_Mod_Buster_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Buster_Pickpocket);
};

INSTANCE Info_Mod_Buster_EXIT (C_INFO)
{
	npc		= Mod_780_SLD_Buster_MT;
	nr		= 1;
	condition	= Info_Mod_Buster_EXIT_Condition;
	information	= Info_Mod_Buster_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Buster_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};