func void ZS_PickRice () 
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

	self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
};

func void ZS_PickRice_Loop ()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_PickRice_Loop");
	
	if ((Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(2)))
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken mit Platzwechsel");
		if (Npc_IsOnFP(self,"PICKRICE_1")) && (Wld_IsFPAvailable (self, "PICKRICE_1"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 1");
			AI_GotoNextFP (self, "PICKRICE_1");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
		else if (Npc_IsOnFP(self,"PICKRICE_2")) && (Wld_IsFPAvailable (self, "PICKRICE_2"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 2");
			AI_GotoNextFP (self, "PICKRICE_2");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
		else if (Npc_IsOnFP(self,"PICKRICE_3")) && (Wld_IsFPAvailable (self, "PICKRICE_3"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"Platzwechsel auf Level 3");
			AI_GotoNextFP (self, "PICKRICE_3");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		}
	
		else if (Npc_IsOnFP(self,"PICKRICE"))
		{
		    PrintDebugNpc(PD_TA_DETAIL,"keinen freien FP gefunden!");
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);
	}	
	else if (Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
	    PrintDebugNpc(PD_TA_DETAIL,"PickRice Bücken");
		if (Npc_IsOnFP(self,"PICKRICE"))
		{
			AI_PlayAni (self,"T_PLUNDER");
			self.aivar[AIV_ITEMFREQ] = (Hlp_Random (5) + 5);
			Npc_SetStateTime (self,0);
		};
		AI_SetWalkmode (self,NPC_WALK);	
	};
	if (!Npc_IsOnFP(self,"PICKRICE") && Wld_IsFPAvailable (self, "PICKRICE"))
	{
	    AI_GotoFP (self, "PICKRICE");
	};
	AI_Wait(self,1);
};

func void ZS_PickRice_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_PickRice_End");
};