// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE Info_Mod_PAL_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= Info_Mod_PAL_13_EXIT_Condition;
	information	= Info_Mod_PAL_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Mod_PAL_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Info_Mod_PAL_13_EXIT_Info()
{	
	AI_Output(self, hero, "Info_Mod_PAL_13_EXIT_13_00"); //Für Innos!
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE Info_Mod_PAL_13_Trank(C_INFO)
{
	nr			= 3;
	condition	= Info_Mod_PAL_13_Trank_Condition;
	information	= Info_Mod_PAL_13_Trank_Info;
	permanent	= TRUE;
	description = "Hier hast du einen Trank.";
};                       

FUNC INT Info_Mod_PAL_13_Trank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tojan_Hi))
	&& (Npc_HasItems(hero, ItPo_Health_02) > 0)
	&& (self.aivar[AIV_TrankBekommen] == FALSE)
	&& (Mod_FM_TrankCounter_Health < 10)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_PAL_13_Trank_Info()
{	
	AI_Output (hero, self, "Info_Mod_PAL_13_Trank_15_00"); //Hier hast du einen Trank.

	B_GiveInvItems	(hero, self, ItPo_Health_02, 1);
	AI_UseItem	(self, ItPo_Health_02);

	Mod_FM_TrankCounter_Health += 1;

	AI_Output (self, hero, "Info_Mod_PAL_13_Trank_13_01"); //Danke.

	self.aivar[AIV_TrankBekommen] = TRUE;
};

INSTANCE Info_Mod_PAL_13_Pickpocket (C_INFO)
{
	nr		= 6;
	condition	= Info_Mod_PAL_13_Pickpocket_Condition;
	information	= Info_Mod_PAL_13_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_PAL_13_Pickpocket_Condition()
{
	C_Beklauen	(160, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);

	Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_BACK, Info_Mod_PAL_13_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_PAL_13_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_PAL_13_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);
};

FUNC VOID Info_Mod_PAL_13_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_PAL_13_Pickpocket);
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_13 (var c_NPC slf)
{
	Info_Mod_PAL_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_13_Trank.npc	= Hlp_GetInstanceID(slf);
	Info_Mod_PAL_13_Pickpocket.npc	= Hlp_GetInstanceID(slf);
};
