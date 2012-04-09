// ************************************
// ZS_Circle für Auge Innos Beschwörung
// ************************************
var int DurchlaufAnzahl;

func void ZS_Circle_Ghost	() 	
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

func int ZS_Circle_Ghost_Loop ()
{
	var int randy;
	var int randyKDW_Lightstar;

	randyKDW_Lightstar= Hlp_Random (2);
	
	if (Npc_IsOnFP (self, "CIRCLE"))
	{		
		if (Durchlaufanzahl == 0)
		{
			AI_AlignToWP    (self);
			Npc_SetStateTime (self, 0);
			Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
			AI_PlayAni (self,"T_PRACTICEMAGIC5");	
			Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
	
			Durchlaufanzahl = 1;
	
			Wld_InsertNpc	(Mod_1553_PIR_GEISTERPIRAT_DI, "WP_DI_HOEHLE_RITUAL");
		};
	}
	else if (Wld_IsFPAvailable(self,"CIRCLE"))
	{
		AI_GotoFP 		(self, "CIRCLE");
		AI_StandUp (self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Circle_Ghost_End ()
{

};
