// ************************************
// ZS_Circle für Auge Innos Beschwörung
// ************************************
func void ZS_Ritual_Xardas	() 	
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

func int ZS_Ritual_Xardas_Loop ()
{
	if (Npc_IsOnFP(self, "RITUAL"))
	&& (Npc_IsOnFP(Mod_6002_KDF_Pyrokar_GDG, "RITUAL"))
	&& (Npc_IsOnFP(Mod_6003_KDW_Saturas_GDG, "RITUAL"))
	&& (Ritual_Angefangen == 0)
	{
		Ritual_Angefangen = 1;
	};

	if (Ritual_Angefangen < 3)
	&& (Ritual_Angefangen > 0)
	{		
		if (Ritual_Angefangen == 1)
		{
			Npc_SetStateTime (self,0);
		};

		if (Npc_GetStateTime(self) == 10)
		{
			Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
			AI_PlayAni (self,"T_PRACTICEMAGIC5");	
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
		};

		if (Npc_GetStateTime(self) == 25)
		{
			CreateInvItems	(self, ItMw_BeliarWeapon_2H_01, 1);
			AI_UnequipWeapons	(self);

			AI_EquipBestMeleeWeapon	(self);

			AI_ReadyMeleeWeapon	(self);
		};

		if (Npc_GetStateTime(self) == 40)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",  self, self, 0, 0, 0, FALSE );

			AI_RemoveWeapon	(self);

			AI_UnequipWeapons	(self);

			Npc_RemoveInvItems	(self, ItMw_BeliarWeapon_2H_01, 10);

			AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");

			Wld_PlayEffect("spellFX_INNOSRAGE",  Mod_6002_KDF_Pyrokar_GDG, Mod_6002_KDF_Pyrokar_GDG, 0, 0, 0, FALSE );

			AI_RemoveWeapon	(Mod_6002_KDF_Pyrokar_GDG);

			AI_UnequipWeapons	(Mod_6002_KDF_Pyrokar_GDG);

			Npc_RemoveInvItems	(Mod_6002_KDF_Pyrokar_GDG, Holy_Hammer_MIS, 10);

			AI_PlayAni  (Mod_6002_KDF_Pyrokar_GDG,"T_MAGRUN_2_HEASHOOT");

			Wld_PlayEffect("spellFX_ADANOSRAGE",  Mod_6003_KDW_Saturas_GDG, Mod_6003_KDW_Saturas_GDG, 0, 0, 0, FALSE );

			AI_RemoveWeapon	(Mod_6003_KDW_Saturas_GDG);

			AI_UnequipWeapons	(Mod_6003_KDW_Saturas_GDG);

			Npc_RemoveInvItems	(Mod_6003_KDW_Saturas_GDG, ItMw_Adanos_Stab_Magieteil, 10);

			AI_PlayAni  (Mod_6003_KDW_Saturas_GDG,"T_MAGRUN_2_HEASHOOT");

			Goetterwaffen_Jetzt_Weg = 1;
		};

		if (Npc_GetStateTime(self) == 55)
		{
			AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
			AI_PlayAni  (Mod_6002_KDF_Pyrokar_GDG,"T_HEASHOOT_2_STAND");
			AI_PlayAni  (Mod_6003_KDW_Saturas_GDG,"T_HEASHOOT_2_STAND");
		};

		if (Npc_GetStateTime(self) == 59)
		{
			Wld_SendTrigger	("URIZIEL");

			Ritual_Angefangen = 3;

			if (Mod_Gilde == 3)
			|| (Mod_Gilde == 5)
			|| (Mod_Gilde == 16)
			|| (Mod_Gilde == 18)
			|| (Mod_Gilde == 0)
			{
				if (hero.aivar[REAL_TALENT_2H] > hero.aivar[REAL_TALENT_1H])
				{
					Wld_InsertItem	(Uriziel_2H, "FP_GDG_RITUAL_URIZIEL");
				}
				else
				{
					Wld_InsertItem	(Uriziel_1H, "FP_GDG_RITUAL_URIZIEL");
				};
			}
			else if (Mod_Gilde == 8)
			|| (Mod_Gilde == 11)
			|| (Mod_Gilde == 14)
			{
				Wld_InsertItem	(ItRu_MassDeath, "FP_GDG_RITUAL_URIZIEL");
			};

			AI_RemoveWeapon	(Mod_6002_KDF_Pyrokar_GDG);

			AI_UnequipWeapons	(Mod_6002_KDF_Pyrokar_GDG);

			Npc_RemoveInvItems	(Mod_6002_KDF_Pyrokar_GDG, Holy_Hammer_MIS, 10);

			AI_RemoveWeapon	(Mod_6003_KDW_Saturas_GDG);

			AI_UnequipWeapons	(Mod_6003_KDW_Saturas_GDG);

			Npc_RemoveInvItems	(Mod_6003_KDW_Saturas_GDG, ItMw_Adanos_Stab_Magieteil, 10);

			AI_RemoveWeapon	(self);

			AI_UnequipWeapons	(self);

			Npc_RemoveInvItems	(self, ItMw_BeliarWeapon_2H_01, 10);

			Npc_ExchangeRoutine	(self, "WAITFORRITUAL");
			Npc_ExchangeRoutine	(Mod_6002_KDF_Pyrokar_GDG, "WAITFORRITUAL");
			Npc_ExchangeRoutine	(Mod_6003_KDW_Saturas_GDG, "WAITFORRITUAL");
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

func void ZS_Ritual_Xardas_End ()
{

};
