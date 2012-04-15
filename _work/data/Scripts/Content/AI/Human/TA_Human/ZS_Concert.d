func void ZS_Concert ()
{	
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self,NPC_WALK);
		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
	{
		AI_GotoWP	(self, self.wp);
	};

	if (Npc_IsOnFP (self, "SWEEP"))
	{	
		AI_AlignToFP (self);
	}	
	else if (Wld_IsFPAvailable(self,"SWEEP"))
	{
		AI_GotoFP 		(self, "SWEEP");
		AI_StandUp 		(self);
		AI_AlignToFP 	(self);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};
	
func int ZS_Concert_Loop ()
{
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
	
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1394_Addon_InExtremo_YellowPfeiffer))
		{
			AI_UseItemToState 	(self, ItMi_IEDudelGelb, 1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
		{
			AI_UseItemToState 	(self,ItMi_IEHarfe,1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1427_BUD_Guy_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
		{
			AI_UseItemToState 	(self,ItMi_iedrum,1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1392_Addon_InExtremo_ThomasTheForger))
		{
			AI_UseItemToState 	(self,ItMi_IECello,1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1469_BUD_Graham_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1430_BUD_Gravo_MT))
		{
			AI_UseItemToState 	(self,ItMi_IELaute,1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
		{
			AI_UseItemToState 	(self,ItMi_IEDrumscheit,1);
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1396_Addon_InExtremo_Flex))
		{
			AI_UseItemToState 	(self,ItMi_IEDudelBlau,1);
		}
		else
		{
			 //Tanzende Piraten?
		};
			
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_Concert_End ()
{
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1394_Addon_InExtremo_YellowPfeiffer))
	{
		AI_UseItemToState 	(self,ItMi_IEDudelGelb,-1);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
	{
		AI_UseItemToState 	(self,ItMi_IEHarfe,-1);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1427_BUD_Guy_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
	{
		AI_UseItemToState 	(self,ItMi_iedrum,-1);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1392_Addon_InExtremo_ThomasTheForger))
	{
		AI_UseItemToState 	(self,ItMi_IECello,-1);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1469_BUD_Graham_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1430_BUD_Gravo_MT))
	{
		AI_UseItemToState 	(self,ItMi_IELaute,-1);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
	{
		AI_UseItemToState 	(self,ItMi_IEDrumscheit,-1);
	}
	else 
	{
		 //AI_UseItemToState 	(self,fehlt,1); andere
	};
};
