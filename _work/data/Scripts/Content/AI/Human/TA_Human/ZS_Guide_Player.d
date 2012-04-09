// ***************
// ZS_Guide_Player
// ***************
FUNC void B_AssessGuidePlayer ()
{

	if (Npc_GetDistToNpc(self, hero) > 800)
	{
		if (Npc_GetDistToWP (self, self.wp) < Npc_GetDistToWP (hero, self.wp))
		{		
			Npc_ClearAIQueue (self);
			AI_StandUp (self);
			B_TurnToNpc (self,hero);
		};
		
		// ------ Sonderfall: EnemyOverride fliegt weg, wenn SC dem Enemy nicht folgt! ------
		
		if (Npc_GetDistToNpc(self, hero) > 1200)
		&& (self.aivar [AIV_EnemyOverride] == TRUE)
		&& (Npc_GetAttitude(self, hero) == ATT_HOSTILE)
		{
			self.aivar [AIV_EnemyOverride] = FALSE;
		};
	}
	else
	{
		B_AssessPlayer ();
	};
};

func void B_AssessGuideFightSound()
{
	if (Npc_IsPlayer(other))
	|| (Npc_IsPlayer(victim))
	{
		B_AssessFightSound ();
	};
};


func void ZS_Guide_Player ()
{
	Perception_Set_Minimal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};
	
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;		//Sense_Smell erforderlich, da der Sc sonst nicht "gesehen wird)!!	
	self.senses_range	= 2000;									//Damit der SC nicht sofort aus dem Wahrnehmungskreis des NSCs verschwindet 
	Npc_SetPercTime		(self,	1);								//Damit er öfter reagiert!
	
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_AssessGuidePlayer			); //Player wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk //mustte ich noch mal aufröseln)
	Npc_PercEnable 		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack
	Npc_PercEnable	 	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	Npc_PercEnable		(self,  PERC_ASSESSFIGHTSOUND	, 	B_AssessGuideFightSound		);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1082_BAU_Rufus_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1621_EBR_Velaya_MT))	
	{
		self.senses_range = 1000;
	};
};

func int ZS_Guide_Player_Loop ()
{	
	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > 800)
	&& (Npc_GetDistToWP (self, self.wp) < Npc_GetDistToWP (hero, self.wp))
	{
		B_AssessGuidePlayer();
	}	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > 300)
	{
		if (!C_BodyStateContains(self, BS_SWIM))
		{
			AI_SetWalkmode (self, NPC_RUN);
		};

		AI_GotoWP (self, self.wp);
	}	
	//-------- Ziel erreicht ! --------
	else
	{
		B_TurnToNpc (self, hero);

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
		{
			Wld_PlayEffect("spellFX_ItemAusbuddeln", self, self, 0, 0, 0, FALSE );

			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			AI_StartState	(self, ZS_MM_Rtn_Summoned, 0, "");
			return LOOP_END;
		};
	};

	return LOOP_CONTINUE;
};
	
func int ZS_Guide_Player_End ()
{	
	
};

























