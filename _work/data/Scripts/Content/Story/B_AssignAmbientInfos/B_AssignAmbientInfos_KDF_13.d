// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE Info_Mod_KDF_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_Mod_KDF_13_EXIT_Condition;
	information	= Info_Mod_KDF_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Mod_KDF_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Info_Mod_KDF_13_EXIT_Info()
{	
	AI_Output(self, hero, "Info_Mod_KDF_13_EXIT_13_00"); //Magie zu ehren!
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE Info_Mod_KDF_13_Trank(C_INFO)
{
	nr			= 3;
	condition	= Info_Mod_KDF_13_Trank_Condition;
	information	= Info_Mod_KDF_13_Trank_Info;
	permanent	= TRUE;
	description = "Hier hast du einen Trank.";
};                       

FUNC INT Info_Mod_KDF_13_Trank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (Npc_HasItems(hero, ItPo_Mana_02) > 0)
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Mana < 9)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_Trank_Info()
{	
	AI_Output (hero, self, "Info_Mod_KDF_13_Trank_15_00"); //Hier hast du einen Trank.

	B_GiveInvItems	(hero, self, ItPo_Mana_02, 1);
	AI_UseItem	(self, ItPo_Mana_02);

	Mod_FM_TrankCounter_Mana += 1;

	AI_Output (self, hero, "Info_Mod_KDF_13_Trank_13_01"); //Danke.

	self.aivar[AIV_TrankBekommen] = TRUE;
};

INSTANCE Info_Mod_KDF_13_Fake(C_INFO)
{
	nr			= 4;
	condition	= Info_Mod_KDF_13_Fake_Condition;
	information	= Info_Mod_KDF_13_Fake_Info;
	permanent	= 0;
	description = "Hast du gesehen wohin der Magier vom Podest verschwunden ist?";
};                       

FUNC INT Info_Mod_KDF_13_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Trank))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_Fake_Info()
{	
	AI_Output (hero, self, "Info_Mod_KDF_13_Fake_15_00"); //Hast du gesehen wohin der Magier vom Podest verschwunden ist?
	AI_Output (self, hero, "Info_Mod_KDF_13_Fake_13_01"); //Ja, ich glaube er ist zu den Alchemielaboren gelaufen.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Es scheint als wäre der Spion in die Alchemielabors geflohen.");
};

INSTANCE Info_Mod_KDF_13_TrankLeer(C_INFO)
{
	nr			= 5;
	condition	= Info_Mod_KDF_13_TrankLeer_Condition;
	information	= Info_Mod_KDF_13_TrankLeer_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_KDF_13_TrankLeer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Mana == 9)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_KDF_13_TrankLeer_Info()
{	
	AI_Output(self, hero, "Info_Mod_KDF_13_TrankLeer_13_00"); //Hast du auch einen Trank für mich?
	AI_Output(hero, self, "Info_Mod_KDF_13_TrankLeer_15_01"); //Ähm… Nein. Da stimmt irgendetwas nicht.

	B_StartOtherRoutine	(Mod_1768_KDF_Magier_PAT, "FLUCHT");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_KDF_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_KDF_13_Pickpocket_Condition;
	information	= Info_Mod_KDF_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_KDF_13_Pickpocket_Condition()
{
	C_Beklauen	(160, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);

	Info_AddChoice	(Info_Mod_KDF_13_Pickpocket, DIALOG_BACK, Info_Mod_KDF_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_KDF_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_KDF_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);
};

FUNC VOID Info_Mod_KDF_13_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_KDF_13_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_KDF_13 (var c_NPC slf)
{
	Info_Mod_KDF_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Trank.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Fake.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_TrankLeer.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_KDF_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
