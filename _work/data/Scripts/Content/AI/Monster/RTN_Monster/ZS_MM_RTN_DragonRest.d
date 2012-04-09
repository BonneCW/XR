// ****************************** REST ********************************

func void ZS_MM_Rtn_DragonRest()  
{
	Npc_SetPercTime	(self,	1);
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

	

	Perception_Set_Monster_Rtn();

	///////////
	//Joly:		Dragon talk Testmodell
	//////////
/*	if Hlp_GetInstanceID (self) != Hlp_GetInstanceID (Dragon_Testmodell)	
	{
		Perception_Set_Monster_Rtn();
		Npc_PercEnable	(self, 	PERC_ASSESSPLAYER		,	B_MM_AssessPlayer);
	};
*/
	Npc_PercEnable	(self, 	PERC_ASSESSTALK			,	B_AssessTalk);
	
	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	if (Wld_IsFPAvailable(self,	"FP_ROAM"))	
	{
		AI_GotoFP (self, "FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
	
	self.aivar[AIV_TAPOSITION] = 0; //für Regeneration;
};

func int ZS_MM_Rtn_DragonRest_Loop ()
{

	if ((!Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00)) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
		return LOOP_END;
	};

	if (Mod_NL_HasKamm >= 3)
	{
		self.flags = 0;
	};
	
	if (Hlp_Random(1000) <= 5)
	{
		var int randomMove;
		randomMove = Hlp_Random(3);
		AI_StandUp (self);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_DragonRest_End ()
{
	AI_PlayAni			(self,	"T_REST_2_STAND");
};
