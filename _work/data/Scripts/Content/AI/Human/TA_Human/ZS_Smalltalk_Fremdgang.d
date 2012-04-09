// ************
// ZS_Smalltalk_Fremdgang
// ************

const int Smalltalk_FremdgangFreq = 4;

func void ZS_Smalltalk_Fremdgang () 
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
};

func int ZS_Smalltalk_Fremdgang_Loop ()
{

	if (Npc_IsOnFP (self, "SMALLTALK"))
	{	
		if (Npc_GetStateTime(self) >= (Smalltalk_FremdgangFreq * 2) )
		{
			Npc_PerceiveAll (self);
			
			if (Wld_DetectNpc(self, -1, ZS_Smalltalk_Fremdgang, -1)) //other = Nearest Npc (0=Spieler ignorieren!)
			{
				if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime (other, Smalltalk_FremdgangFreq);
					                                       
					B_TurnToNpc (self, other);
					B_Say_Smalltalk_Fremdgang();
				};
			};
		
			Npc_SetStateTime (self, 0);
		};
	}
	else if (Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP 		(self, "SMALLTALK");
		AI_StandUp (self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_Fremdgang_End ()
{

};
