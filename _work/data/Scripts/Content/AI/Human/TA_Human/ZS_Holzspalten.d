// *********************
// NSC benutzt Ore-Mobsi
// *********************

FUNC VOID ZS_Holzspalten ()
{
	B_ClearPerceptions	(self);
	
	B_UseHat (self);

	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
   	{
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Holzspalten_Loop ()
{
	// ------ Erz Picken ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"HOLZSPALTEN"))
	{
		AI_UseMob (self, "HOLZSPALTEN", 1);		
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Holzspalten_End ()
{
	AI_UseMob (self, "HOLZSPALTEN", -1);
};