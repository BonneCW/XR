// ************
// ZS_Listen_Monty
// ************

func void ZS_Listen_Monty () 
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_RUN);
	 	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};

	self.aivar[AIV_TAPOSITION] = 0;
};

func int ZS_Listen_Monty_Loop ()
{
	if (Npc_IsOnFP (self, "LISTEN"))
	{	
		if (self.aivar[AIV_TAPOSITION] == 0)
		{
			AI_TurnToNpc	(self, Mod_741_NONE_Monty_NW);

			self.aivar[AIV_TAPOSITION] = 1;
		};
	}
	else if (Wld_IsFPAvailable(self,"LISTEN"))
	{
		AI_GotoFP 		(self, "LISTEN");
		AI_StandUp (self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Listen_Monty_End ()
{

};
