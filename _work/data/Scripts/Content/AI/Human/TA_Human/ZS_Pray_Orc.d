func void ZS_Pray_Orc ()
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
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};	
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Pray_Orc_Loop ()
{
	if (Npc_IsOnFP (self, "PREY"))
	{	
		AI_AlignToFP (self);

		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"PREY"))
	{
		AI_GotoFP 		(self, "PREY");
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
		if ( Npc_GetBodyState( self ) != BS_SIT )
   		{
   			AI_PlayAniBS( self, "T_STAND_2_PRAY", BS_SIT );
   		}
   		else
   		{
   			AI_PlayAniBS( self, "T_PRAY_RANDOM", BS_SIT );
   		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Pray_Orc_End ()
{
	Npc_ClearAIQueue( self );
	AI_PlayAniBS( self, "T_PRAY_2_STAND", BS_STAND );
};