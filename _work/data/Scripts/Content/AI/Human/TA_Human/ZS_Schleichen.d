// ************************************
// ZS_Schleichen
// -----------
// Wird als TA für die Story verwendet, 
// wenn ein NSC fliehen soll
// ************************************

func void ZS_Schleichen ()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	
	AI_SetWalkmode 		(self, NPC_SNEAK);
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	
	AI_AlignToWP (self);
	AI_PlayAni (self,"T_STAND_2_HGUARD");
};

func int ZS_Schleichen_Loop ()
{	
	// ------ Wenn angekommen. Random-Ani ------
	if (Npc_GetStateTime(self) > 5)
	{
		var int random;	random = Hlp_Random(2);
		
		if (random == 0)
		{
			 AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
		};
		
		Npc_SetStateTime (self, 0);
	};

	return LOOP_CONTINUE;
};
	
func int ZS_Schleichen_End ()
{	
	
};


		
	
	
