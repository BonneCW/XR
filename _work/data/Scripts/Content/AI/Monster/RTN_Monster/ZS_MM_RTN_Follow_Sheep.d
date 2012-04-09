// **********************
// ZS_MM_Rtn_Follow_Sheep
// **********************

func void ZS_MM_Rtn_Follow_Sheep()
{
	Npc_SetPercTime	(self,	1);
	
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

	Npc_PercEnable	(self, 	PERC_ASSESSPLAYER		,	B_MM_AssessPlayer);
	Npc_PercEnable	(self, 	PERC_ASSESSTALK			,	B_AssessTalk);
	
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC		,	B_AssessMagic);
	
	//ACHTUNG - AIV_TAPOSITION wird benutzt bei Abgabe im Kloster!!!
};

func int ZS_MM_Rtn_Follow_Sheep_Loop ()
{

	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (Npc_GetDistToNpc (self, hero) > 500)
		{
			if	!C_BodyStateContains(self, BS_SWIM)
			{	
				AI_SetWalkmode	(self,	NPC_RUN);
			};
		
			AI_GotoNpc (self, hero);
		}
		else
		{
			AI_TurnToNpc (self, hero);
			self.wp = Npc_GetNearestWP (self); 
		};
	}
	else
	{
		var int randomMove;
		randomMove = Hlp_Random(3);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Follow_Sheep_End ()
{

};


// ********************************************
// ZS_MM_Rtn_Follow_Sheep_Balthasar
// ********************************************

func void ZS_MM_Rtn_Follow_Sheep_Balthasar()
{
	Npc_SetPercTime	(self,	1);
	
	Npc_PercEnable	(self, 	PERC_ASSESSPLAYER		,	B_MM_AssessPlayer);
};

func int ZS_MM_Rtn_Follow_Sheep_Balthasar_Loop ()
{
	
	
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Follow_Sheep_Balthasar_End ()
{

};
















