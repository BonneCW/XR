INSTANCE Info_Orkjagd_11_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Orkjagd_11 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Orkjagd_11_EXIT_Condition;
	information	= Info_Orkjagd_11_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Orkjagd_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Orkjagd_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

INSTANCE Info_Orkjagd_11_Orkjaeger_Orkjagd(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Orkjagd_11_Orkjaeger_Orkjagd_Condition;
	information	= Info_Orkjagd_11_Orkjaeger_Orkjagd_Info;
	permanent	= 1;
	description = "Ok, es kann losgehen.";
};                       

FUNC INT Info_Orkjagd_11_Orkjaeger_Orkjagd_Condition()
{
	if (Mod_BDT_Orkjagd == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWp(self), self.wp) == TRUE)
	&& (Banditen_Dabei == TRUE)
	&& (Npc_GetDistToWP(self, "OW_PATH_198_ORCGRAVEYARD8") > 2000)
	&& (CurrentLevel == MINENTAL_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Orkjagd_11_Orkjaeger_Orkjagd_Info()
{
	AI_Output(hero,self,"Info_Orkjagd_11_Orkjaeger_Orkjagd_15_00"); //Ok, es kann losgehen.

	if (Mod_Orchunter_Counter > 1)
	{
		AI_Output(self,hero,"Info_Orkjagd_11_Orkjaeger_Orkjagd_11_01"); //Wir wissen bereits wo die Höhle liegt und laufen direkt dorthin. Folge uns.

		if (Npc_GetDistToWP(Mod_1268_SLD_Soeldner_MT, "OW_PATH_264") < 500)
		{
			B_StartOtherRoutine	(Mod_1268_SLD_Soeldner_MT, "ATORKS");
			Mod_1268_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = TRUE;
		};
		if (Npc_GetDistToWP(Mod_1271_SLD_Soeldner_MT, "OW_PATH_264") < 500)
		{
			B_StartOtherRoutine	(Mod_1271_SLD_Soeldner_MT, "ATORKS");
			Mod_1271_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = TRUE;
		};
		if (Npc_GetDistToWP(Mod_1276_SLD_Soeldner_MT, "OW_PATH_264") < 500)
		{
			B_StartOtherRoutine	(Mod_1276_SLD_Soeldner_MT, "ATORKS");
			Mod_1276_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = TRUE;
		};

		Mod_BDT_Orkjagd = TRUE;
	}
	else
	{
		AI_Output(self,hero,"Info_Orkjagd_11_Orkjaeger_Orkjagd_11_02"); //Ich hatte gesagt mindestens noch einen weiteren Mann.
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish_Condition;
	information	= Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish_Info;
	important	= 1;
};                       

FUNC INT Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish_Condition()
{
	if (Mod_BDT_Orkjagd == TRUE)
	&& (Hlp_StrCmp(Npc_GetNearestWp(self), self.wp) == TRUE)
	&& (Npc_IsDead(Mod_10012_ORC_Scout_MT))
	&& (Npc_IsDead(Mod_10013_ORC_Scout_MT))
	&& (Npc_IsDead(Mod_10014_ORC_Elite_MT))
	&& (Npc_IsDead(Mod_10015_ORC_Elite_MT))
	&& (Banditen_Dabei == TRUE)
	&& (Npc_GetDistToWP(self, "OW_PATH_198_ORCGRAVEYARD8") > 2000)
	&& (CurrentLevel == MINENTAL_ZEN)
	{
		return 1;
	};
};

FUNC VOID Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish_Info()
{
	AI_Output(self,hero,"Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish_11_00"); //Ok, die Arbeit ist getan. Zurück zum Lager.

	AI_StopProcessInfos	(self);

	if (Npc_GetDistToWP(Mod_1268_SLD_Soeldner_MT, "SPAWN_OW_SNAPPER_WOOD05_05") < 500)
	{
		B_StartOtherRoutine	(Mod_1268_SLD_Soeldner_MT, "START");
		Mod_1268_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = FALSE;
		Mod_1268_SLD_Soeldner_MT.npctype = NPCTYPE_MT_SOELDNER;
	};
	if (Npc_GetDistToWP(Mod_1271_SLD_Soeldner_MT, "SPAWN_OW_SNAPPER_WOOD05_05") < 500)
	{
		B_StartOtherRoutine	(Mod_1271_SLD_Soeldner_MT, "START");
		Mod_1271_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = FALSE;
		Mod_1271_SLD_Soeldner_MT.npctype = NPCTYPE_MT_SOELDNER;
	};
	if (Npc_GetDistToWP(Mod_1276_SLD_Soeldner_MT, "SPAWN_OW_SNAPPER_WOOD05_05") < 500)
	{
		B_StartOtherRoutine	(Mod_1276_SLD_Soeldner_MT, "START");
		Mod_1276_SLD_Soeldner_MT.aivar[AIV_PARTYMEMBER] = FALSE;
		Mod_1276_SLD_Soeldner_MT.npctype = NPCTYPE_MT_SOELDNER;
	};

	Mod_BDT_Orkjagd = FALSE;
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Orkjagd_11(var c_NPC slf)
{
	Info_Orkjagd_11_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Orkjagd_11_Orkjaeger_Orkjagd.npc				= Hlp_GetInstanceID(slf);
	Info_Orkjagd_11_Orkjaeger_Orkjagd_Finish.npc				= Hlp_GetInstanceID(slf);
};
