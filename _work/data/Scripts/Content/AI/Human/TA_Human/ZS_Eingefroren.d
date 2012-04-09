func void ZS_Eingefroren () 
{	
	B_UseHat (self);

	AI_PlayAniBS 	(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
};

func void ZS_Eingefroren_Loop ()
{
	Wld_PlayEffect	("spellFX_Freeze", self, self, 0, 0, 0, FALSE);
		
	AI_Wait			(self,	1);
};

func void ZS_Eingefroren_End ()
{
};


		
		
		
		
		
		
		