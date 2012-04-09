// ****************
// ZS_Sit_Orc
// ****************

func void ZS_Sit_Orc() 
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);

	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Sit_Orc_loop()
{
	if (Npc_IsOnFP (self, "SIT"))
	{	
		AI_AlignToFP (self);
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  		{
  			self.aivar[AIV_TAPOSITION] = NOTINPOS;
  		};
	}	
	else if (Wld_IsFPAvailable(self,"SIT"))
	{
		AI_GotoFP 		(self, "SIT");
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
		AI_PlayAniBS (self,	"T_STAND_2_GUARDSLEEP", BS_SIT);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Sit_Orc_end()
{
	AI_PlayAniBS		(self,	"T_GUARDSLEEP_2_STAND", BS_STAND);
};
