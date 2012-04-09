// *********************************************
// NSC steht mit Armen in die Hüfte gestemmt rum
// *********************************************

func void ZS_Stand_Armbrust()
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
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Armbrust_loop()
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
	else if (Npc_IsOnFP (self, "GUARD"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"GUARD"))
	{
		AI_GotoFP 		(self, "GUARD");
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
		if (!Npc_IsInFightMode(self, FMODE_NONE))			//irgendeine ANDERE Waffe gezogen
		&& (!Npc_IsInFightMode(self, FMODE_FAR))
		{
			AI_RemoveWeapon (self);
			AI_ReadyRangedWeapon	(self);
		};
			
		AI_ReadyRangedWeapon (self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

	
//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Armbrust_end()
{
	AI_RemoveWeapon (self);
};	


