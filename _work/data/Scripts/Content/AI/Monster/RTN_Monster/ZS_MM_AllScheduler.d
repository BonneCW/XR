// ***********************************************************************************
// 										DAYCYCLE
// ***********************************************************************************

func void ZS_MM_AllScheduler()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	
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
		
	if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_BreedStart],00,self.aivar[AIV_MM_BreedEnd],00) || (self.aivar[AIV_MM_BreedStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Breed, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_OrcSitStart],00,self.aivar[AIV_MM_OrcSitEnd],00) || (self.aivar[AIV_MM_OrcSitStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_OrcSit, 1, "");
	}
	else
	{
		AI_StartState (self, ZS_MM_Rtn_Rest, 1, ""); //Default = Rest
	};
};
