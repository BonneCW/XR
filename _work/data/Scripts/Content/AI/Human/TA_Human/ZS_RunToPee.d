// *********************
// NSC pinkelt an FP_RunToPee
// *********************

func void ZS_RunToPee ()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_RUN);
	 	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_RunToPee_loop ()
{
	if (Npc_IsOnFP (self, "PEE"))
 	{ 
 		AI_AlignToFP (self);
  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
 	} 
 	else if (Wld_IsFPAvailable(self,"PEE"))
 	{
 		AI_GotoFP   (self, "PEE");
  		AI_StandUp   (self);
  		AI_AlignToFP  (self);
  		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
 	}
 	else
 	{
  		AI_AlignToWP (self); 
  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK )
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};  
 	}; 
 		
	if ((self.aivar[AIV_TAPOSITION] == NOTINPOS)
	&& (Npc_IsOnFP (self, "PEE")))
	{
		AI_AlignToFP 	(self);
		AI_StandUp 		(self);
		AI_PlayAni (self,"T_STAND_2_RunToPee");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_RunToPee_end ()
{
	AI_PlayAni		(self, "T_RunToPee_2_STAND");
};








