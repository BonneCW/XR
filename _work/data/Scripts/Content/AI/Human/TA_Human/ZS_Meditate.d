/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/

func void ZS_Meditate()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self); 
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode (self,NPC_WALK);			// Walkmode für den Zustand 

	if !(Npc_IsOnFP(self,"MEDITATE"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	if (Wld_IsFPAvailable (self, "MEDITATE"))
	{
		AI_GotoFP (self,"MEDITATE");
		AI_AlignToFP( self );				//Richte Dich aus
	};
	
	if (Wld_DetectNpc   (self, -1, ZS_Preach_PSI, -1))
	{
		if (Npc_GetDistToNpc (self,other) <= PERC_DIST_INTERMEDIAT)
		{
			AI_TurnToNpc (self,other);
		};
	};
	
	AI_PlayAniBS(self,"T_STAND_2_PRAY2",BS_SIT);
};

func void ZS_Meditate_Loop()
{
	var int praytime;

	praytime = Hlp_Random (100);

	if (praytime <= 2)
	{
		AI_PlayAniBS (self, "T_PRAY2_RANDOM", BS_SIT);
	};
	if (praytime >= 98)
	{
		AI_Output(self, NULL, "ZS_Meditate_Om"); //Omm...
	};

	AI_Wait(self, 1);
};

func void ZS_Meditate_End ()
{
	B_StopLookAt(self);

	AI_PlayAniBS(self, "T_PRAY2_2_STAND", BS_STAND);
};