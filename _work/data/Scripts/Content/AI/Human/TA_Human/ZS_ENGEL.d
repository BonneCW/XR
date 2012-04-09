// ****************
// ZS_Follow_Player
// ****************
func void engeltalk ()
{
	if (self.guild == GIL_OUT)
	{
		Wld_PlayEffect ("MFX_engel_HEAVENLIGHT2", self, self, 0, 0, 0, FALSE);
		B_RemoveNpc(self);
	}
	else
	{
		B_RemoveNpc(self);
	};
};

FUNC void B_Engelfollow ()
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
func void B_AssessFollowFightSound_Engel()
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
func void ZS_Engel ()
{
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range	= 2000;	
	
	B_UseHat (self);	
	
	Npc_SetPercTime	(self, 0.3);
	
	Perception_Set_Minimal();
	
	Npc_PercEnable (self, PERC_ASSESSPLAYER, B_Engelfollow); 
	Npc_PercEnable (self, PERC_ASSESSENEMY, B_AssessEnemy); 
	Npc_PercEnable (self,	PERC_ASSESSTALK, engelTalk);
	Npc_PercEnable (self, PERC_MOVEMOB, B_MoveMob); 
	
	//lokale Wahrnehmungen
	Npc_PercEnable (self, PERC_ASSESSFIGHTSOUND , B_AssessFollowFightSound_Engel);
	//Npc_PercEnable (self, PERC_MOVENPC, B_MoveFollowNpc);

	B_ResetAll (self);
	
	AI_StandUp (self);
	AI_SetWalkmode	(self,	NPC_RUN);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	// ------ init aivars ------
	if (self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;

		if (self.guild == GIL_OUT)
		{
			self.attribute[ATR_HITPOINTS_MAX] = 500 + 50;
			
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX]-50)
			{
				self.attribute[ATR_HITPOINTS] = 500 + 50;

				Wld_PlayEffect ("MFX_engel_HEAVENLIGHT", self, self, 0, 0, 0, FALSE);
			};
		}
		else
		{
			self.attribute[ATR_HITPOINTS_MAX] +=50;
			
			if (self.attribute[ATR_HITPOINTS]>=self.attribute[ATR_HITPOINTS_MAX]-50)
			{
				self.attribute[ATR_HITPOINTS]+=50;
				
			};

			AI_ReadyMeleeWeapon(self);
		};
	};
	
		
		
};

func int ZS_Engel_Loop ()
{	
	if (Npc_GetDistToNpc (self, hero) > self.aivar[AIV_FollowDist])
	{
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

			if (self.guild == GIL_OUT)
			{
				if (hero.attribute[ATR_MANA] > 0)
				{
					hero.attribute[ATR_MANA] -= 2;	
				}
				else
				{	
					Wld_PlayEffect ("MFX_engel_HEAVENLIGHT2", self, self, 0, 0, 0, FALSE);

					B_RemoveNpc(self);
				};	
			}
			else
			{
				if (Npc_IsInFightMode (self, FMODE_NONE))
				{					
					AI_ReadyMeleeWeapon	(self);
					
				};
			};
	
			Npc_SetStateTime (self, 0);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Engel_End ()
{

};