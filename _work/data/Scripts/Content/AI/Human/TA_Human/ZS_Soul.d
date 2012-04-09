// ****************
// ZS_Follow_Player
// ****************
FUNC VOID B_Soultalk()
{
	/*hero.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + hero.attribute[ATR_HITPOINTS];

	if hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX]
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	hero.attribute[ATR_MANA] = self.attribute[ATR_MANA] + hero.attribute[ATR_MANA];

	if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
	{
		hero.attribute[ATR_MANA]=hero.attribute[ATR_MANA_MAX];
	};*/

	Seele_unterwegs = FALSE;

	Wld_PlayEffect("SPELLFX_SOULSPLIT_ORIGIN", self, self, 0, 0, 0, FALSE);

	self.aivar[AIV_FollowDist] = 0;

	B_RemoveNpc(self);
};

FUNC VOID B_Soulfollow ()
{
	
	
	if (Npc_GetDistToNpc(self, hero) < self.aivar[AIV_FollowDist])
	&& (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		Npc_ClearAIQueue (self);
		AI_StandUp (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	}
	else
	{	
		B_AssessPlayer ();
	};
};

// ---------------------------------
func void B_AssessFollowFightSound_soul()
{
	if (Npc_IsPlayer(other))
	|| (Npc_IsPlayer(victim))
	|| (other.aivar[AIV_PARTYMEMBER] == TRUE)
	|| (victim.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		B_AssessFightSound ();
	};
};

// ---------------------------------

// --------------------------
func void ZS_Soul ()
{
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range	= 2000;	
	
	B_UseHat (self);	
	
	Npc_SetPercTime	(self, 0.3);
	
	Perception_Set_Minimal();
	
	Npc_PercEnable (self, PERC_ASSESSPLAYER	, B_soulfollow); 
	Npc_PercEnable (self, PERC_ASSESSENEMY	, B_AssessEnemy); 
	Npc_PercEnable (self, PERC_ASSESSTALK	, B_SoulTalk); 
	Npc_PercEnable (self, PERC_MOVEMOB		, B_MoveMob); 
	
	//lokale Wahrnehmungen
	Npc_PercEnable (self, PERC_ASSESSFIGHTSOUND , B_AssessFollowFightSound_soul);
	//Npc_PercEnable (self, PERC_MOVENPC, B_MoveFollowNpc);

	B_ResetAll (self);
	
	AI_StandUp (self);
	AI_SetWalkmode	(self,	NPC_RUN);
	self.aivar[AIV_PARTYMEMBER]=TRUE;
	// ------ init aivars ------
	if (self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
		self.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX];
		self.attribute[ATR_MANA] = hero.attribute[ATR_MANA];
	};
	
		
		
};

func int ZS_soul_Loop ()
{
	if (self.attribute[ATR_MANA] < SPL_Cost_Concussionbolt)
	{
		B_SoulTalk();
	};
	
	if (Npc_GetDistToNpc (self, hero) > self.aivar[AIV_FollowDist])
	{
		// ------ Sonderfall: Diego ------
		
		
		// ------ normale Behandlung ------
		if (!C_BodyStateContains(self, BS_SWIM))
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		
		AI_GotoNpc (self, hero);

		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else
	{
		if (Npc_GetStateTime(self) > 1)
		{
			B_TurnToNpc (self, hero);
						
			Npc_SetStateTime (self, 0);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_soul_End ()
{

};