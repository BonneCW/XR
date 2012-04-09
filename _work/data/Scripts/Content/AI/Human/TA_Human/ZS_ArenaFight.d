/****************************************************
*    NSC sucht ArenaFight-FP und beginnt anzubeten    *
****************************************************/

func void ZS_ArenaFight()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_ArenaFight");
	
	B_UseHat (self);
    
	Perception_Set_Normal();
	
	B_ResetAll (self); 
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode (self,NPC_WALK);			// Walkmode für den Zustand 
	
	Wld_DetectNpc   (self, -1, ZS_Preach_PSI, -1);
	if (Npc_GetDistToNpc (self,other) <= PERC_DIST_INTERMEDIAT)
	{
		AI_TurnToNpc (self,other);
		Npc_SetTarget (self, other);
		B_Attack	(self, other, AR_NONE, 0);
		
	};	
};

func void ZS_ArenaFight_Loop()
{	
	Wld_DetectNpc   (self, -1, ZS_ArenaFight, -1);

	if (Npc_GetDistToNpc (self,other) <= PERC_DIST_INTERMEDIAT)
	{
		AI_TurnToNpc (self,other);
		Npc_SetTarget (self, other);
		B_Attack	(self, other, AR_NONE, 0);
		
	};
};

func void ZS_ArenaFight_End ()
{
};

