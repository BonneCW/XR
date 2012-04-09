// ************************************
// ZS_Circle für Auge Innos Beschwörung
// ************************************
func void ZS_Ritual_Saturas	() 	
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

func int ZS_Ritual_Saturas_Loop ()
{
	if (Ritual_Angefangen < 3)
	&& (Ritual_Angefangen > 0)
	{		
		if (Npc_GetStateTime(Mod_843_DMB_Xardas_GDG) == 0)
		{
			Ritual_Angefangen = 2;

			Wld_SendTrigger	("URIZIELRITUAL");

			Snd_Play	("URIZIELRITUAL");

			Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
			AI_PlayAni (self,"T_PRACTICEMAGIC5");	
			Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
		};

		if (Npc_GetStateTime(Mod_843_DMB_Xardas_GDG) == 15)
		{
			CreateInvItems	(self, ItMw_Adanos_Stab_Magieteil, 1);
			AI_UnequipWeapons	(self);

			AI_EquipBestMeleeWeapon	(self);

			AI_ReadyMeleeWeapon	(self);
		};

		if (Npc_GetStateTime(Mod_843_DMB_Xardas_GDG) > 40)
		{
			AI_UnequipWeapons	(self);
		};

		if (Npc_GetStateTime(Mod_843_DMB_Xardas_GDG) > 94)
		{
		};
	}
	else if (Wld_IsFPAvailable(self,"RITUAL"))
	&& (Ritual_Angefangen < 1)
	{
		AI_GotoFP 		(self, "RITUAL");
		AI_StandUp (self);
		AI_AlignToFP 	(self);

		if (Ritual_Angefangen == FALSE)
		{
			Npc_SetStateTime (self,0);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Ritual_Saturas_End ()
{

};
