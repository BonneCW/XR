// ************
// ZS_Smalltalk_Assassine4
// ************

const int Smalltalk_Assassine4Freq = 4;

func void ZS_Smalltalk_Assassine4 () 
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

func int ZS_Smalltalk_Assassine4_Loop ()
{

	if (Npc_IsOnFP (self, "SMALLTALK"))
	{	
		if (Npc_GetStateTime(self) >= (Smalltalk_Assassine4Freq * 2) )
		{
			Npc_PerceiveAll (self);
			
			if (Wld_DetectNpc(self, -1, ZS_Smalltalk_Assassine4, -1)) //other = Nearest Npc (0=Spieler ignorieren!)
			{
				if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime (other, Smalltalk_Assassine4Freq);
					                                       
					B_TurnToNpc (self, other);
					B_Say_Smalltalk_Assassine4();
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

func void ZS_Smalltalk_Assassine4_End ()
{

};
