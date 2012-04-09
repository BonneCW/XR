/*******************************************
*              NSC wird besoffen           *
*******************************************/

func void ZS_Betrunken ()

{
	Mdl_StartFaceAni(self, "S_NEUTRAL", 1, -1); // falls er durch irgendwas noch dumm guckt von BJKnockout
	
	B_UseHat (self);

	Perception_Set_Betrunken(); // nimmt kaum noch was wahr

	AI_StandUp (self);
	AI_SetWalkmode(self, NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP (self, self.wp);	// Gehe zum Tagesablaufstart

	MDL_APPLYOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS" );
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func void ZS_Betrunken_Loop ()
{
	//DP_SayRandom("$Drunk", 13); // ab und zu nen Spruch ablassen

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
	else if (Npc_IsOnFP (self, "GUARD"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"GUARD"))
	{
		AI_GotoFP 		(self, "GUARD");
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

	AI_Wait(self, 1);
};

func void ZS_Betrunken_End ()
{
	MDL_REMOVEOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS");
};