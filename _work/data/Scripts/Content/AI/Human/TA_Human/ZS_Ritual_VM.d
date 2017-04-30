// ************************************
// ZS_Ritual für Auge Innos Beschwörung
// ************************************


func void ZS_Ritual_VM	() 	
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	// ------ PercTime überschreiben ------
	Npc_SetPercTime		(self, 0.3);
	
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP	(self);
};

func int ZS_Ritual_VM_Loop ()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;

	randyKDW = Hlp_Random (2500);
	randyKDW_Lightstar= Hlp_Random (2);
	
	if (!Npc_IsOnFP(self, "RITUAL"))
	&& (Wld_IsFPAvailable(self, "RITUAL"))
	{
		AI_GotoFP 		(self, "RITUAL");
		AI_StandUp (self);
		AI_AlignToFP 	(self);

		Npc_SetStateTime (self,0);
	};
			
	if (Npc_GetStateTime(self) > randyKDW)
	{
		AI_AlignToWP    (self);
		Npc_SetStateTime (self, 0);
		//Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		//AI_PlayAni (self,"T_PRACTICEMAGIC5");	
		//Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
	};
	
	
	return LOOP_CONTINUE;
};

func void ZS_Ritual_VM_End ()
{

};
