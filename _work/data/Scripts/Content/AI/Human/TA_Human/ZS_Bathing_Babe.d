func void ZS_Bathing_Babe ()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    	{
		AI_GotoWP	(self, self.wp);
	};

	AI_UnequipArmor	(self);
};

func int ZS_Bathing_Babe_Loop ()
{
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"BATHTUB"))
	{
		AI_UseMob (self, "BATHTUB", 1);		
	};
	
	// ------ Random-Anis im Sitzen ------
	if (C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Npc_GetStateTime(self) > 5)
	{
		var int random;	random = Hlp_Random(10);
		
		if (random <= 0)	{	AI_PlayAniBS (self, "t_Bathtub_Random1",BS_MOBINTERACT_INTERRUPT);		};
		if (random <= 1)	{	AI_PlayAniBS (self, "t_Bathtub_Random2",BS_MOBINTERACT_INTERRUPT);		};
		
		Npc_SetStateTime(self, 0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Bathing_Babe_End ()
{
	AI_UseMob (self, "BATHTUB", -1);

	AI_EquipBestArmor	(self);
};