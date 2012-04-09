// *********************
// NSC benutzt Item Food
// *********************

func void ZS_Stand_Eating_Orc()
{
	Perception_Set_Monster_Rtn();
	
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

func int ZS_Stand_Eating_Orc_Loop ()
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
	
	B_Orc_ItemEat();
	var float pause;
	pause = intToFloat( Hlp_Random( 5 ) + 2 );
	AI_Wait( self, pause );
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Eating_Orc_End ()
{
	Npc_ClearAIQueue( self );
};
