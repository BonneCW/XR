func void ZS_Preach_PSI()
{	
	Perception_Set_Normal();
	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); //sonst werden OUs abgebrochen - Grund: unbekannt 
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	
};

func int ZS_Preach_PSI_loop()
{
	if (Npc_IsOnFP (self, "STAND"))
	{
		AI_AlignToFP (self);
	}
	else if (Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP 		(self, "STAND");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
	}
	else
	{
		AI_AlignToWP (self);
	};

	if (Npc_GetStateTime(self) >= 13)
	{
		if (self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};
	
		B_Preach_PSI();
		
		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;		
	
		Npc_SetStateTime(self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Preach_PSI_end()
{

};	