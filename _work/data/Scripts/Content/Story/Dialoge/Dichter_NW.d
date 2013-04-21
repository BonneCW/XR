INSTANCE Info_Mod_Dichter_NW_InKhorinis (C_INFO)
{
	npc		= Mod_7398_OUT_Dichter_NW;
	nr		= 1;
	condition	= Info_Mod_Dichter_NW_InKhorinis_Condition;
	information	= Info_Mod_Dichter_NW_InKhorinis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dichter_NW_InKhorinis_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dichter_NW_InKhorinis_Info()
{
	AI_Output(self, hero, "Info_Mod_Dichter_NW_InKhorinis_34_00"); //Wie du siehst, bin ich deinem Rat gefolgt.
	AI_Output(self, hero, "Info_Mod_Dichter_NW_InKhorinis_34_01"); //Ist echt spannend hier draußen, ich habe schon viel gelernt.
	AI_Output(self, hero, "Info_Mod_Dichter_NW_InKhorinis_34_02"); //Ich kann dir jetzt sogar zeigen, wie du dich an Tiere heranschleichst.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Der Dichter kann mir zeigen, wie ich mich an Tiere heranschleichen kann.");
};

INSTANCE Info_Mod_Dichter_NW_Lernen_Schleichen (C_INFO)
{
	npc		= Mod_7398_OUT_Dichter_NW;
	nr		= 1;
	condition	= Info_Mod_Dichter_NW_Lernen_Schleichen_Condition;
	information	= Info_Mod_Dichter_NW_Lernen_Schleichen_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Schleichen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1));
};

FUNC INT Info_Mod_Dichter_NW_Lernen_Schleichen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dichter_NW_InKhorinis))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dichter_NW_Lernen_Schleichen_Info()
{
	AI_Output(hero, self, "Info_Mod_Dichter_NW_Lernen_Schleichen_15_00"); //Bring mir das Schleichen bei.

	if (B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK))
	{
		AI_Output(self, hero, "Info_Mod_Dichter_NW_Lernen_Schleichen_34_01"); //Mit weichen Sohlen hast du eine größere Chance, dich deinen Gegnern zu nähern, ohne dass sie es merken.
	};
};