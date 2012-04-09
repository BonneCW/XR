// ******************
// ZS_MM_Rtn_Summoned
// ******************

func void B_SummonedAssessTalk()
{
	Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
};

func void ZS_MM_Rtn_Summoned ()
{
	Npc_SetPercTime	(self,	1);
	Npc_PercEnable	(self,	PERC_ASSESSPLAYER,		B_MM_AssessPlayer);
	Npc_PercEnable	(self,	PERC_ASSESSENEMY,		B_MM_AssessEnemy);

	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,  		B_AssessMagic);
	Npc_PercEnable	(self,	PERC_ASSESSDAMAGE,		B_MM_AssessDamage);
	Npc_PercEnable	(self,  PERC_ASSESSFIGHTSOUND, 	B_MM_AssessOthersDamage);
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Begleiterwolf))
	{
		Npc_PercEnable 	(self,	PERC_ASSESSTALK, 	B_AssessTalk);
	}
	else
	{
		Npc_PercEnable 	(self,	PERC_ASSESSTALK, 	B_SummonedAssessTalk);
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

	// FUNC
	
	B_SetAttitude (self, ATT_FRIENDLY);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_StandUp (self);
	AI_SetWalkmode	(self, NPC_RUN);
};

func int ZS_MM_Rtn_Summoned_Loop()
{
	var int bonustime;
	bonustime = 0;

	if (Mod_SphericRing)
	{
		bonustime = 120;
	};

	// ------ beim Spieler bleiben ------
	B_MM_WispDetect ();
	if (Npc_GetDistToNpc (self, hero) > 500)
	{
		AI_GotoNpc (self, hero);
	}
	else //<= 500
	{
		if (Npc_GetStateTime(self) >= 1)
		{
			// ------ zum Spieler drehen ------
			if (!Npc_CanSeeNpc(self, hero))
			{
				AI_TurnToNpc (self, hero);
			};
			
			// ------ Summon Time -------
			if (Mod_Circle	<	6)
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Helper))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Begleiterwolf))
			&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Summoned_Harpie))
			{
				self.aivar[AIV_SummonTime] += Npc_GetStateTime(self);
				
				if (Mod_Circle	==	1)
				|| (Mod_Circle	==	0)
				{
					if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_1+bonustime)
					{
						 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
					};
				}
				else if (Mod_Circle	==	2)
				{
					if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_2+bonustime)
					{
						 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
					};
				}
				else if (Mod_Circle	==	3)
				{
					if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_3+bonustime)
					{
						 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
					};
				}
				else if (Mod_Circle	==	4)
				{
					if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_4+bonustime)
					{
						 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
					};
				}
				else if (Mod_Circle	==	5)
				{
					if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_5+bonustime)
					{
						 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
					};
				};

				Npc_SetStateTime (self, 0);
			}
			else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Harpie))
			{
				self.aivar[AIV_SummonTime] += Npc_GetStateTime(self);

				if (self.aivar[AIV_SummonTime] >= 120)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};

				Npc_SetStateTime (self, 0);
			};
		};

	};
	
	self.wp = Npc_GetNearestWP (self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{

};