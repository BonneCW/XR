// ***************
// ZS_MM_Rtn_Breed
// ***************

func void B_MM_AssessQuietSound_Breed()		//wird nur hier (lokal) benutzt
{

	if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_HOSTILE)
	{
		B_MM_AssessEnemy();
	};
};


// ***************
// ZS_MM_Rtn_Breed
// ***************

func void ZS_MM_Rtn_Breed ()
{
	Perception_Set_Monster_Rtn();
		
	
	// FUNC 
	
	AI_SetWalkmode 	(self, NPC_WALK);

	B_MM_DeSynchronize();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (LeisenLaufen_Perk == TRUE)
	{
		if (self.senses_range == PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			self.senses_range = (7*PERC_DIST_MONSTER_ACTIVE_MAX)/10;
		}
		else if (self.senses_range == PERC_DIST_ORC_ACTIVE_MAX)
		{
			self.senses_range = (7*PERC_DIST_ORC_ACTIVE_MAX)/10;
		};
	};
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Breed_loop()
{
	if (Npc_IsOnFP (self, "BREED"))
 	{ 
 		AI_AlignToFP (self);

  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
 	} 
 	else if (Wld_IsFPAvailable(self, "BREED"))
 	{
 		AI_GotoFP   (self, "BREED");
  		AI_StandUp   (self);
  		AI_AlignToFP  (self);
  		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
 	}
 	else
 	{
  		AI_AlignToWP (self); 

  		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK )
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};  
 	}; 
 		
	if ((self.aivar[AIV_TAPOSITION] == NOTINPOS)
	&& (Npc_IsOnFP (self, "BREED")))
	{
		AI_AlignToFP 	(self);

		AI_StandUp 		(self);

		AI_PlayAni (self, "T_STAND_2_BREED");

		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Breed_end()
{
	AI_PlayAniBS (self, "T_BREED_2_STAND", BS_STAND);
};
