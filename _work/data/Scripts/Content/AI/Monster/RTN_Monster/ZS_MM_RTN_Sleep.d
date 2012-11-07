// ***************
// ZS_MM_Rtn_Sleep
// ***************

func void B_MM_AssessQuietSound_Sleep()		//wird nur hier (lokal) benutzt
{

	if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_HOSTILE)
	{
		B_MM_AssessEnemy();
	};
};


// ***************
// ZS_MM_Rtn_Sleep
// ***************

func void ZS_MM_Rtn_Sleep ()
{
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic); 			// selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_AssessDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_AssessOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMURDER, 	B_MM_AssessOthersDamage); 
	Npc_PercEnable		(self, PERC_ASSESSWARN,		B_MM_AssessWarn); 
	
	// ------ lokale Wahrnehmungen ------
	Npc_PercEnable		(self, PERC_ASSESSQUIETSOUND,	B_MM_AssessQuietSound_Sleep);
		
	
	// FUNC 
	
	AI_SetWalkmode 	(self, NPC_WALK);

	B_MM_DeSynchronize();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
			
	if (Wld_IsFPAvailable(self, "FP"))
	{																	
		AI_GotoFP (self, "FP");
	};

	if (LeisenLaufen_Perk == TRUE)
	{
		if (self.senses_range == PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			self.senses_range = (7 * PERC_DIST_MONSTER_ACTIVE_MAX) / 10;
		}
		else if (self.senses_range == PERC_DIST_ORC_ACTIVE_MAX)
		{
			self.senses_range = (7 * PERC_DIST_ORC_ACTIVE_MAX) / 10;
		};
	};
	
	AI_PlayAni			(self, "T_PERCEPTION");
	AI_PlayAniBS		(self, "T_STAND_2_SLEEP", BS_LIE);
};

func int ZS_MM_Rtn_Sleep_loop()
{
	if ((!Wld_IsTime (self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00)) && (self.aivar[AIV_MM_SleepStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Sleep_end()
{
	AI_PlayAniBS (self, "T_SLEEP_2_STAND", BS_STAND);
};
