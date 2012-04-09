// *********************
// Richter_Anna verkündet auf WP
// *********************

func void ZS_Announce_Richter_Anna()
{	
	Perception_Set_Normal();
	
	B_UseHat (self);

	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); //sonst werden OUs abgebrochen - Grund: unbekannt 

	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	AI_GotoWP		(self, self.wp);
	AI_AlignToWP	(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Announce_Richter_Anna_loop()
{
	if (Npc_GetStateTime(self) >= 6)
	{
		B_Announce_Richter_Anna (self.aivar[AIV_TAPOSITION]);
		
		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;		
		
		Npc_SetStateTime(self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Announce_Richter_Anna_end()
{

};	