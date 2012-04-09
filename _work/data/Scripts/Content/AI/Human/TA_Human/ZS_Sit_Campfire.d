// *******************************************
// NSC setzt sich an Campfire-FP auf den Boden
// *******************************************

func void ZS_Sit_Campfire()
{
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_SetWalkmode 	(self,NPC_WALK);
		
		if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    	{
			AI_GotoWP	(self, self.wp);
		};
	};

	var C_Item SabiArmi;
	SabiArmi = Npc_GetEquippedArmor(self);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7024_OUT_Sabitsch_MT))
	&& (Hlp_IsItem(SabiArmi, ItAr_VLK_M) == TRUE)
	{
		AI_UnequipArmor	(self);
		AI_EquipArmor	(self, ItAr_DJG_H);
	};
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7505_BDT_Melvin_REL))
	&& (Npc_KnowsInfo(hero, Info_Mod_Elvira_Frauenkleider))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Melvin_Frauenkleider2))
	{
		var C_Item Melvinruessi;
		MelvinRuessi = Npc_GetEquippedArmor(self);

		if (Hlp_IsItem(MelvinRuessi, ItAr_VLKBabe_M) == FALSE)
		{
			AI_UnequipArmor	(self);

			CreateInvItems	(self, ItAr_VLKBabe_M, 1);

			AI_EquipArmor	(self, ItAr_VLKBabe_M);
		};
	};
};

func int ZS_Sit_Campfire_loop()
{
	if ((Npc_IsOnFP (self, "CAMPFIRE"))
	&& (!C_BodyStateContains(self, BS_SIT)))
	{	
		AI_AlignToFP 	(self);
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	}
	else if ((Wld_IsFPAvailable(self,"CAMPFIRE"))
		 && (!C_BodyStateContains(self, BS_SIT)))
	{
		AI_GotoFP 		(self, "CAMPFIRE");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Sit_Campfire_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);	
};

