func void ZS_Hunt ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Hunt" );
	Perception_Set_Normal();
	
	B_UseHat (self);

	B_ResetAll (self);   
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);				//Richte Dich aus
};

func void ZS_Hunt_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_Hunt_Loop" );
    
	if (Wld_DetectNpc   	(self, -1, ZS_MM_Rtn_Roam, -1))
	{
		Npc_SetTarget 	(self,other);
		
		Npc_GetTarget	( self);
		AI_StartState 	(self,ZS_Attack, 0,"");	// SN: der korrekte Zustand, um Monster zu erkennen ist 'ZS_AssessMonster' -> ich habe das korrigiert! (wenn gelesen, dann Kommentar löschen)
	};
	
	AI_Wait(self,1);
};

func void ZS_Hunt_End ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Hunt_End" );
};
