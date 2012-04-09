// ************
// ZS_Fight_Alrik
// ************

const int Fight_AlrikFreq = 4;

func void ZS_Fight_Alrik () 
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
};

func int ZS_Fight_Alrik_Loop ()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_547_NONE_Alrik_NW))
	&& (Mod_1051_VLK_Buerger_NW.attribute[ATR_HITPOINTS] > 1)
	{
		Npc_SetTarget(self, Mod_1051_VLK_Buerger_NW);
		B_Attack	(self, Mod_1051_VLK_Buerger_NW, AR_None, 0);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1051_VLK_Buerger_NW))
	&& (Mod_1051_VLK_Buerger_NW.attribute[ATR_HITPOINTS] > 1)
	{
		Npc_SetTarget(self, Mod_547_NONE_Alrik_NW);
		B_Attack	(self, Mod_547_NONE_Alrik_NW, AR_None, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Fight_Alrik_End ()
{

};
