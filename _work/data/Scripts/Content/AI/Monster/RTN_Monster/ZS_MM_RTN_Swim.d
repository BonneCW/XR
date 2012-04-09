// ************** 
// ZS_MM_Rtn_Swim
// **************

func void ZS_MM_Rtn_Swim()  
{
	Perception_Set_Monster_Rtn();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
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
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Swim_Loop ()
{

	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if (Wld_IsFPAvailable(self,	"SWIM"))
		{
			AI_GotoFP (self, "SWIM");
		};
		
		if (Npc_IsOnFP(self, "SWIM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else //ISINPOS
	{
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Swim_End ()
{

};







