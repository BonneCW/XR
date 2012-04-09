// ****************************** EAT GROUND **************************************

func void ZS_MM_Rtn_EatGround()  
{
	Perception_Set_Monster_Rtn();
	
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

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	if (Wld_IsFPAvailable(self,	"FP_ROAM"))	
	{
		AI_GotoFP (self, "FP_ROAM");
	};
	AI_PlayAni			(self, "T_STAND_2_EAT");
	
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM1");
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM2");
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM3");
	Mdl_ApplyRandomAniFreq	(self,	"S_EAT",	8.0);
};

func int ZS_MM_Rtn_EatGround_Loop ()
{

	if ((!Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00)) && (self.aivar[AIV_MM_EatGroundStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_EatGround_End ()
{
	AI_PlayAni			(self,	"T_EAT_2_STAND");
};
