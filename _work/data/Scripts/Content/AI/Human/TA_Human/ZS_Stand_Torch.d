func void ZS_Stand_Torch ()
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

	Mdl_ApplyOverlayMds (self, "Humans_Torch.mds");

	if (Npc_HasItems (self, Itlstorch) == 0)
	{
		CreateInvItem (self,Itlstorch);
	};	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
	
func int ZS_Stand_Torch_Loop ()
{
	if (Npc_IsOnFP (self, "STAND"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};	
	}	
	else if (Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP 		(self, "STAND");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	};
	
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_UseItem 	(self, Itlstorch);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};


	return LOOP_CONTINUE;
};

func void ZS_Stand_Torch_End ()
{
	AI_UseItemToState (self, Itlstorch, -1);
};
