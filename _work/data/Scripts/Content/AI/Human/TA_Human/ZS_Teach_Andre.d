// *********************
// Vatras predigt auf WP
// *********************

func void ZS_Teach_Andre()
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

func int ZS_Teach_Andre_loop()
{
	if (Npc_GetStateTime(self) >= 13)
	{
		if (self.aivar[AIV_TAPOSITION] > 6)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};
	
		B_Teach_Andre(self.aivar[AIV_TAPOSITION]);
		
		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;		
		
		Npc_SetStateTime(self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Teach_Andre_end()
{

};	


