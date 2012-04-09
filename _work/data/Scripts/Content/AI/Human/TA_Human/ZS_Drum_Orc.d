// *****************
// NSC benutzt Bench
// *****************

FUNC VOID ZS_Drum_Orc ()
{
	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	{
		AI_SetWalkmode 	(self, NPC_WALK);		
	
		if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    	{
			AI_GotoWP	(self, self.wp);
		};
	};	
};

FUNC int ZS_Drum_Orc_Loop ()
{
	// ------ Hinsetzen ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT))
	&& (Wld_IsMobAvailable(self,"DRUM"))
	{
		AI_UseMob (self, "DRUM", 1);
	};
	
	if ( Npc_GetBodyState(self) == BS_MOBINTERACT_INTERRUPT )
	{
		var int random;
		random = Hlp_Random( 15 );
		if ( random < 5 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_1", BS_MOBINTERACT_INTERRUPT );
		}
		else if ( random < 10 )
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_2", BS_MOBINTERACT_INTERRUPT );
		}
		else
		{
			AI_PlayAniBS( self, "T_ORCDRUM_RANDOM_3", BS_MOBINTERACT_INTERRUPT );
		};
	};
		
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Drum_Orc_End ()
{
	Npc_ClearAIQueue( self );

	//nicht mehr Trommeln
	AI_UseMob( self, "DRUM", -1 );	
};

