// **********************
// NSC macht Schwert-Kata
// **********************

func void ZS_Practice_Sword ()
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

func int ZS_Practice_Sword_Loop()
{	
    if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
    {
    	if (!Npc_HasEquippedMeleeWeapon (self))
		{
			CreateInvItems	(self, ItMw_1h_Bau_Mace, 1);
			AI_EquipBestMeleeWeapon (self);
		};
		
		AI_ReadyMeleeWeapon	(self);
		
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
        
    AI_PlayAni		(self,"T_1HSFREE");
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP    (self);
	
	return LOOP_CONTINUE;
};

func void ZS_Practice_Sword_End ()
{
	AI_StandUp (self);
	AI_RemoveWeapon (self);
};
