// **********************
// NSC benutzt Item Booze
// **********************
 
func void ZS_Stand_Drinking_Orc ()
{
 	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
 	
 	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode  (self,NPC_WALK);
  
 	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
 	{
 	 	AI_GotoWP (self, self.wp);
 	};
 	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
 
func int ZS_Stand_Drinking_Orc_loop ()
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
 		AI_GotoFP   (self, "STAND");
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

	B_Orc_ItemPotion();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
 
	return LOOP_CONTINUE;
};
 

func void ZS_Stand_Drinking_Orc_end ()
{
	Npc_ClearAIQueue( self );
};
 





