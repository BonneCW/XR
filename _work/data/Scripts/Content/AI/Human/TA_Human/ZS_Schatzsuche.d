// *********************
// NSC benutzt Ore-Mobsi
// *********************

FUNC VOID ZS_Schatzsuche ()
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

	if (Npc_HasItems(hero, ItMw_2H_Axe_L_01) == 0)
	{
		CreateInvItems	(hero, ItMw_2H_Axe_L_01, 1);
	};
};

FUNC int ZS_Schatzsuche_Loop ()
{
	// ------ Erz Picken ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"TREASURE"))
	{
		AI_UseMob (self, "TREASURE", 1);		
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Schatzsuche_End ()
{
	AI_UseMob (self, "TREASURE", -1);
};