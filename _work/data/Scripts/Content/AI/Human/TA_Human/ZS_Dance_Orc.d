// ******************
// Tanzen auf WP
// ******************

func void ZS_Dance_Orc()
{
	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode		(self,	NPC_WALK);	
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP		(self, self.wp);
		AI_AlignToWP	(self);
	};
};

func int ZS_Dance_Orc_Loop()
{
	if (Npc_IsOnFP (self, "DANCE"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"DANCE"))
	{
		AI_GotoFP 		(self, "DANCE");
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

	if ( Hlp_Random( 10 ) < 5 )
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE" );
		AI_PlayAni( self, "T_DANCE" );
	}
	else
	{
		PrintDebugNpc( PD_ZS_FRAME,"ZS_Orc_Dance_Loop: T_DANCE_RANDOM_1" );
		AI_PlayAni( self, "T_DANCE_RANDOM_1" );
	};
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);
	
	return LOOP_CONTINUE;
};

func void ZS_Dance_Orc_End()
{
	Npc_ClearAIQueue( self );
	AI_StandUp( self );
};
