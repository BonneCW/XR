// *****************
// NSC benutzt Bench
// *****************

FUNC VOID ZS_Sit_Bench ()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_SetWalkmode 	(self, NPC_WALK);		
	
		if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    	{
			AI_GotoWP	(self, self.wp);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_798_SLD_Wolf_NW))
	&& (Npc_HasItems(self, ITAR_DJG_Crawler) == 1) {
		AI_UnequipArmor	(Mod_798_SLD_Wolf_NW);
		AI_EquipArmor	(Mod_798_SLD_Wolf_NW, ITAR_DJG_Crawler);
	};
};

FUNC int ZS_Sit_Bench_Loop ()
{
	// ------ Hinsetzen ------
	if (!C_BodyStateContains(self, BS_SIT))
	&& (Wld_IsMobAvailable(self,"BENCH"))
	{
		AI_UseMob (self, "BENCH", 1);
	};

	// ------ Random-Anis im Sitzen ------
	if (C_BodyStateContains(self, BS_SIT))
	&& (Npc_GetStateTime(self) > 5)
	{
		var int random;	random = Hlp_Random(8);
		
		if (random <= 0)	{	AI_PlayAniBS (self, "R_CHAIR_RANDOM_1",BS_SIT);		};
		if (random <= 1)	{	AI_PlayAniBS (self, "R_CHAIR_RANDOM_2",BS_SIT);		};
		if (random <= 2)	{	AI_PlayAniBS (self, "R_CHAIR_RANDOM_3",BS_SIT);		};
		if (random <= 3)	{	AI_PlayAniBS (self, "R_CHAIR_RANDOM_4",BS_SIT);		};
		
		Npc_SetStateTime(self, 0);
	};
		
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Sit_Bench_End ()
{
	AI_UseMob (self, "BENCH", -1);
};

