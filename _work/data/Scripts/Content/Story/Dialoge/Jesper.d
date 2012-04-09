INSTANCE Info_Mod_Jesper_Dieb (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Dieb_Condition;
	information	= Info_Mod_Jesper_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Diebeszeichen zeigen)";
};

FUNC INT Info_Mod_Jesper_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Goldmuenzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_Dieb_Info()
{
	AI_PlayAni (hero, "T_YES");
	AI_Output(self, hero, "Info_Mod_Jesper_Dieb_09_00"); //Wie ich sehe, bist du einer von uns.
	AI_Output(self, hero, "Info_Mod_Jesper_Dieb_09_01"); //Ich kann dir beibringen zu Schleichen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Jesper kann mir beibringen zu Schleichen.");
};

INSTANCE Info_Mod_Jesper_AndreVermaechtnis (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_AndreVermaechtnis_Condition;
	information	= Info_Mod_Jesper_AndreVermaechtnis_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Jesper_AndreVermaechtnis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_AndreVermaechtnis_Info()
{
	AI_TurnToNpc	(self, Mod_598_MIL_Mika_NW);

	AI_Output(self, hero, "Info_Mod_Jesper_AndreVermaechtnis_09_00"); //Na schön, dann eben nur 40 Goldmünzen. Nimm, das scheiß Ding ... Halsabschneider. Aber ... wer zum Teufel ...

	AI_TurnToNpc	(self, hero);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jesper_Lernen (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Lernen_Condition;
	information	= Info_Mod_Jesper_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Schleichen lernen (5 LP)";
};

FUNC INT Info_Mod_Jesper_Lernen_Condition()
{
	Info_Mod_Jesper_Lernen.description = B_BuildLearnString("Schleichen lernen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Jesper_Dieb))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jesper_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Jesper_Lernen_15_00"); //Bring mir bei wie man schleicht.

	B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK);
};

INSTANCE Info_Mod_Jesper_Pickpocket (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_Pickpocket_Condition;
	information	= Info_Mod_Jesper_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Jesper_Pickpocket_Condition()
{
	C_Beklauen	(110, ItMi_Gold, 2100);
};

FUNC VOID Info_Mod_Jesper_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jesper_Pickpocket);

	Info_AddChoice	(Info_Mod_Jesper_Pickpocket, DIALOG_BACK, Info_Mod_Jesper_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jesper_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jesper_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jesper_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jesper_Pickpocket);
};

FUNC VOID Info_Mod_Jesper_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Jesper_Pickpocket);
};

INSTANCE Info_Mod_Jesper_EXIT (C_INFO)
{
	npc		= Mod_587_NONE_Jesper_NW;
	nr		= 1;
	condition	= Info_Mod_Jesper_EXIT_Condition;
	information	= Info_Mod_Jesper_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jesper_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jesper_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};