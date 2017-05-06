func void ZS_Practice_CrossBow() {
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit) {
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) {
		AI_GotoWP	(self, self.wp);
	};
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
};

func int ZS_Practice_CrossBow_loop() {
	if (self.aivar[AIV_TAPOSITION] != ISINPOS) {
		if (Npc_IsOnFP (self, "PRACTICEBOW")) {	
			AI_AlignToFP (self);
						
			if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK) {
  				self.aivar[AIV_TAPOSITION] = NOTINPOS;
	  		};
		} else if (Wld_IsFPAvailable(self, "PRACTICEBOW")) {
			AI_GotoFP 		(self, "PRACTICEBOW");
			AI_StandUp 		(self);
			AI_AlignToFP 	(self);
			
			self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
		} else {
			AI_AlignToWP (self);
			
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
			
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS) {
			if (NPC_HasReadiedRangedWeapon (self) == FALSE) {
				AI_ReadyRangedWeapon (self);
			};
					
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		   
	    CreateInvItems (self, ItRw_Bolt, 5);
		
		return LOOP_CONTINUE;
	};
	        
	AI_ReadyRangedWeapon (self);
	AI_Wait(self,3.0);
	AI_PlayAni		(self,"T_CBOWAIM_2_CBOWSHOOT");
	AI_PlayAni		(self,"T_CBOWRELOAD");
	AI_Wait(self,3.0);
	AI_PlayAni		(self,"T_CBOWAIM_2_CBOWSHOOT");
	AI_PlayAni		(self,"T_CBOWRELOAD");
	AI_Wait(self,3.0);
	AI_PlayAni		(self,"T_CBOWAIM_2_CBOWSHOOT");
	AI_PlayAni		(self,"T_CBOWRELOAD");
	AI_Wait(self,3.0);
	AI_PlayAni		(self,"T_CBOWAIM_2_CBOWSHOOT");
	AI_PlayAni		(self,"T_CBOWRELOAD");
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);
	AI_ReadyRangedWeapon (self);
	AI_Wait(self,3.0);
	AI_PlayAni		(self,"T_1HSINSPECT");
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);
	AI_RemoveWeapon (self);
	AI_Wait(self,3.0);
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);

	return LOOP_CONTINUE;
};

func void ZS_Practice_CrossBow_end() {
	AI_StandUp (self);
	AI_RemoveWeapon (self); 
};
