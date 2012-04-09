// ************** 
// ZS_Swim
// **************

func void ZS_Swim()
{
	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);

	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};	
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Swim_loop()
{
	if (Npc_IsOnFP (self, "SWIM"))
	{	
		AI_AlignToFP (self);

		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"SWIM"))
	{
		AI_GotoFP 		(self, "SWIM");
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
		var int wanderTime;
		wanderTime = Hlp_Random(5);
		Npc_SetStateTime (self, 0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	if (Npc_GetStateTime(self) > wanderTime)
	{
		if (Wld_IsNextFPAvailable(self,	"SWIM"))	//NEXT, sonst findet er seinen eigenen FP = besetzt!
		{											
			AI_GotoNextFP	(self,	"SWIM");
		};
		//sonst stehenbleiben
		
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	}
	else
	{
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Swim_end()
{

};
