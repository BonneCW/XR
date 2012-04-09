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
    if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
    {
    	if (!Npc_HasEquippedMeleeWeapon (self))
		{
			CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			AI_EquipBestMeleeWeapon (self);
		};
		
		AI_ReadyRangedWeapon	(self);
		
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
        
	AI_PlayAni		(self,"t_BowWalk_2_BowAim");
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);
	
	return LOOP_CONTINUE;
};

func void ZS_Practice_Bow_End ()
{
	AI_StandUp (self);
	AI_RemoveWeapon (self);
};