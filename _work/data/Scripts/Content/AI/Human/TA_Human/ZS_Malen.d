// *************************
// NSC benutzt Alchemietisch
// *************************

FUNC VOID ZS_Malen ()
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
	if (Npc_HasItems (self,ItMi_Pinsel) == 0)
	{
		CreateInvItem (self,ItMi_Pinsel);				
	};
	if (Npc_HasItems (self,ItMi_Palette) == 0)
	{
		CreateInvItem (self,ItMi_Palette);				
	};
};

FUNC int ZS_Malen_Loop ()
{
	// ------ SK: Sollte schon für das neue Mobsi funzen ------
	// ------ Alchemie-Tisch benutzen ------

	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"MALEN"))
	{
		AI_UseMob (self, "MALEN", 1);		
	};
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Malen_End ()
{
	AI_UseMob (self, "MALEN", -1);
};