// *************************************
// NSC steht mit verschränkten Armen rum
// *************************************

func void ZS_Stand_WP()
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
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_WP_loop()
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

	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	
	if ((Npc_GetStateTime(self) > 5)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		var int random;	random = Hlp_Random(30);
		
		if (random == 0)
		{
			AI_PlayAni (self,"T_LGUARD_SCRATCH");
		}
		else if (random == 1)
		{
			AI_PlayAni (self,"T_LGUARD_STRETCH");
		}
		else if (random == 2)
		{
			AI_PlayAni (self,"T_LGUARD_CHANGELEG");
		}
		else if (random == 3)
		{
			AI_PlayAni (self,"R_LEGSHAKE");
		}
		else if (random == 4)
		{
			AI_PlayAni (self,"R_SCRATCHLSHOULDER");
		}
		else if (random == 5)
		{
			AI_PlayAni (self,"R_SCRATCHEGG");
		}
		else if (random == 6)
		{
			AI_PlayAni (self,"R_SCRATCHHEAD");
		}
		else if (random == 7)
		{
			AI_PlayAni (self,"R_SCRATCHRSHOULDER");
		}
		else if (random == 8)
		{
			AI_PlayAni (self,"T_ACHSEL");
		};
		
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_WP_end()
{
    AI_PlayAni (self,"T_LGUARD_2_STAND");
};	


