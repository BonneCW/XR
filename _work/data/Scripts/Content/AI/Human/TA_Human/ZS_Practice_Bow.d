// **********************
// NSC macht Schwert-Kata
// **********************

func void ZS_Practice_Bow ()
{
    Perception_Set_Normal();
	
	B_UseHat (self);
    
    B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode		(self,	NPC_WALK);	
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP		(self, self.wp);
		AI_AlignToWP	(self);
	};
			
	AI_EquipBestMeleeWeapon (self);
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Practice_Bow_Loop()
{	
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS) {
    		AI_ReadyRangedWeapon	(self);

		AI_PlayAni		(self,"t_BowWalk_2_BowAim");
		
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
        
	
	return LOOP_CONTINUE;
};

func void ZS_Practice_Bow_End ()
{
	AI_StandUp (self);
	AI_RemoveWeapon (self);
};