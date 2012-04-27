// *********************
// NSC benutzt Ore-Mobsi
// *********************

FUNC VOID ZS_Make_Rune ()
{
	B_ClearPerceptions	(self);
	
	B_UseHat (self);

	Perception_Set_Normal();
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
   	{
		AI_GotoWP	(self, self.wp);
	};

	if (Npc_HasItems(hero, ItMi_Runeblank) == 0)
	{
		CreateInvItems	(hero, ItMi_Runeblank, 1);
	};
};

FUNC int ZS_Make_Rune_Loop ()
{
	// ------ Erz Picken ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"RMAKER"))
	{
		AI_UseMob (self, "RMAKER", 1);		
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Make_Rune_End ()
{
	AI_UseMob (self, "RMAKER", -1);
};