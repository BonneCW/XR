/*************************************************************************
**	TA    															**
*************************************************************************/
func void ZS_Sleeper()	// Immobile
{
	Perception_Set_Monster_Rtn();
	
	B_UseHat (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_RUN);

	AI_GotoWP	(self, self.wp);

	AI_AlignToWP		(self);							// SN: Monster am Start am Wegpunkt ausrichten
};
func int ZS_Sleeper_loop()
{
	/*if (SLF_FIRE == TRUE)
	{
		AI_TurnToNpc(self,hero);
		
		if (Npc_GetStateTime(self) > 5)
		{
			Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL", self, hero, 2, 150, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
			Npc_SetStateTime(self,0);
		};
	};*/
	return 0;
};
func void ZS_Sleeper_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_Sleeper_end");
};
