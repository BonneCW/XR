func void ZS_Frieren()
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
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Frieren_loop()
{
	var C_Item itm;

	if (Npc_IsOnFP (self, "FRIEREN"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"FRIEREN"))
	{
		AI_GotoFP 		(self, "FRIEREN");
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
		AI_StandUp 		(self);
		AI_PlayAni (self,"T_FRIEREN_STAND_2_S0");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	if (self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		var int Randomizer;

		Randomizer = Hlp_Random(300);

		if (Randomizer == 1)
		{
			AI_PlayAni (self, "T_FRIEREN_S0_2_S1");
		}
		else if (Randomizer == 188)
		{
			AI_PlayAni (self, "T_NIESEN");
		}
		else if (Randomizer == 189)
		{
			AI_PlayAni (self, "T_NIESEN2");
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Frieren_end()
{
	AI_PlayAni (self,"T_FRIEREN_S0_2_STAND");	
};