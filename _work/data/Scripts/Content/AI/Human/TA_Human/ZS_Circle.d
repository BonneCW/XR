// ************************************
// ZS_Circle für Auge Innos Beschwörung
// ************************************


func void ZS_Circle	() 	
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
	
	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW)))
	&& (Npc_GetDistToWP(self, self.wp) < 1000)
	{
		var C_Item Hexenruessi;
		HexenRuessi = Npc_GetEquippedArmor(self);

		if (Hlp_IsItem(HexenRuessi, ItAr_Hexe) == FALSE)
		{
			AI_UnequipArmor	(self);

			CreateInvItems	(self, ItAr_Hexe, 1);

			AI_EquipArmor	(self, ItAr_Hexe);
		};
	};
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	AI_AlignToWP	(self);
};

func int ZS_Circle_Loop ()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;
	
	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW)))
	&& (Npc_GetDistToWP(self, self.wp) < 1000)
	{
		var C_Item Hexenruessi;
		HexenRuessi = Npc_GetEquippedArmor(self);

		if (Hlp_IsItem(HexenRuessi, ItAr_Hexe) == FALSE)
		{
			AI_UnequipArmor	(self);

			CreateInvItems	(self, ItAr_Hexe, 1);

			AI_EquipArmor	(self, ItAr_Hexe);
		};
	};

	if (self.guild == GIL_DMT)
	{
		randy = Hlp_Random (3000);
	
		if (Npc_GetStateTime(self) > randy)
		{
				Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
				Npc_SetStateTime (self, 0);
				Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
				AI_PlayAni (self,"T_PRACTICEMAGIC5");	
		};	
	}
	else if (self.guild == GIL_KDW)//ADDON:  KDW 
	{
		randyKDW = Hlp_Random (2500);
		randyKDW_Lightstar= Hlp_Random (2);
			
		if (Npc_GetStateTime(self) > randyKDW)
			{
				AI_AlignToWP    (self);
				Npc_SetStateTime (self, 0);
				Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
				AI_PlayAni (self,"T_PRACTICEMAGIC5");	
				//Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
				Wld_PlayEffect("spellFX_RingRitual2",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
	
				if (randyKDW_Lightstar == 0)
				{ 
					Wld_PlayEffect("spellFX_RingRitual1",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
				}
				else if (randyKDW_Lightstar == 1)
				{
					Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  ItMi_AmbossEffekt_Addon, ItMi_AmbossEffekt_Addon, 0, 0, 0, FALSE );
				};
			};
	}
	else
	{
		randy = Hlp_Random (1000);

			if (Npc_GetStateTime(self) > randy)
				{
					Npc_SetStateTime (self, 0);
					Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
					AI_PlayAni (self,"T_PRACTICEMAGIC5");	
						
					if (self.guild == GIL_KDF)
					{
						Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
					}
					else if (self.guild == GIL_VLK)
					{
						Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
					}
					else if (self.guild == GIL_NOV)
					{
						Wld_PlayEffect("spellFX_INCOVATION_BLUE",  self, self, 0, 0, 0, FALSE );
					}
					else // Vatras 
					{
						Wld_PlayEffect("spellFX_INCOVATION_GREEN",  self, self, 0, 0, 0, FALSE );
					};
				};	
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Circle_End ()
{
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW))
	{
		var C_Item Hexenruessi;
		HexenRuessi = Npc_GetEquippedArmor(self);

		if (Hlp_IsItem(HexenRuessi, ItAr_Hexe) == TRUE)
		{
			AI_UnequipArmor	(self);

			Npc_RemoveInvItems	(self, ItAr_Hexe, Npc_HasItems(hero, ItAr_Hexe));

			AI_EquipBestArmor	(self);
		};
	};

};
