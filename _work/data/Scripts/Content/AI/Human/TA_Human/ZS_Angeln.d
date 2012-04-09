func void ZS_Angeln ()
{	
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
	
func int ZS_Angeln_Loop ()
{
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"ANGEL"))
	{
		AI_UseMob (self, "ANGEL", 1);		
	};
	
	return LOOP_CONTINUE;

};

func void ZS_Angeln_End ()
{
	AI_UseMob (self, "ANGEL", -1);
};