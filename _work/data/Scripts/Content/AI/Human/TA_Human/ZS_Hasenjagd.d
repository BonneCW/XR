/****************************************************
*    NSC sucht Hasenjagd-FP und beginnt anzubeten    *
****************************************************/

func void ZS_Hasenjagd()
{	
	B_UseHat (self);
    
	Perception_Set_Normal();
	
	B_ResetAll (self); 
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode (self, NPC_RUN);			// Walkmode für den Zustand
};

func void ZS_Hasenjagd_Loop()
{	
	Npc_PerceiveAll	(self);
	Wld_DetectNpc   (self, Rabbit_Gomez, NOFUNC, -1);

	if (Npc_GetDistToNpc (self, other) <= PERC_DIST_INTERMEDIAT)
	{
		AI_TurnToNpc (self, other);
		Npc_SetTarget (self, other);
		B_Attack	(self, other, AR_NONE, 0);
		
	} else {
		var string randomFP; randomFP = ConcatStrings("FP_ROAM_RABBITS_GOMEZ_0", IntToString(r_MinMax(1, 9)));
		AI_GotoFP 		(self, "RITUAL");
	};
};

func void ZS_Hasenjagd_End ()
{
};