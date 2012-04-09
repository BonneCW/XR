// ***************
// ZS_Guide_Prisoner
// ***************
FUNC void B_AssessGuidePrisoner ()
{

	if (Npc_GetDistToNpc(self, hero) > 800)
	{
		B_Attack	(self, hero, AR_GuildEnemy, 0);
	}
	else
	{
		//B_AssessPrisoner ();
	};
};


func void ZS_Guide_Prisoner ()
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
	
	Npc_PercEnable		(self, 	PERC_ASSESSPLAYER		,	B_AssessGuidePrisoner			); //Prisoner wird VOR Enemy erfasst! - Geht in ZS_Attack, ZS_ReactToWeapon, B_AssessEnterRoom oder B_AssessTalk //mustte ich noch mal aufröseln)
	Npc_PercEnable 		(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				); //geht in ZS_Attack
	Npc_PercEnable	 	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				); //geht in ZS_Talk
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob					); //öffnet Türen, die auf dem Weg liegen
	Npc_PercEnable		(self,  PERC_ASSESSFIGHTSOUND	, 	B_AssessGuideFightSound		);
};

func int ZS_Guide_Prisoner_Loop ()
{	
	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > 800)
	{
		B_Attack	(self, hero, AR_GuildEnemy, 0);
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > 300)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode (self, NPC_RUN);
		};
		AI_GotoWP (self, self.wp);
	}
	
	//-------- Ziel erreicht ! --------
	else
	{
		B_TurnToNpc (self, hero);
	};

	return LOOP_CONTINUE;
};
	
func int ZS_Guide_Prisoner_End ()
{	
	
};

























