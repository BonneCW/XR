// *******************
// NSC benutzt Blubber
// *******************

FUNC VOID ZS_Smoke_Waterpipe ()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Smoke_Waterpipe_Loop ()
{
	// ------ Wasserpfeife rauchen ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"SMOKE"))
	{
		AI_UseMob (self, "SMOKE", 1);
	};
	
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Smoke_Waterpipe_End ()
{
	AI_UseMob (self, "SMOKE", -1);
};






