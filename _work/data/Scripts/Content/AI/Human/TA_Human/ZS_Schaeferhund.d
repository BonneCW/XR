// ************** 
// ZS_Schaeferhund
// **************

func void ZS_Schaeferhund()
{
	Perception_Set_Monster_Rtn();	
	
	B_UseHat (self);

	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	if (Npc_GetDistToWP(self, self.wp) < 1000)
	{
		AI_SetWalkmode 	(self, NPC_WALK);
	}
	else
	{
		AI_SetWalkmode	(self, NPC_RUN);
	};
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};	
	
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Schaeferhund_loop()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Pepe))
	&& (Npc_GetDistToNpc(self, Mod_793_BAU_Pepe_NW) > 500)
	{
		AI_SetWalkmode 	(self, NPC_RUN);
	
		AI_GotoNpc	(self, Mod_793_BAU_Pepe_NW);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Malak))
	&& (Npc_GetDistToNpc(self, Mod_767_BAU_Malak_NW) > 500)
	{
		AI_SetWalkmode 	(self, NPC_RUN);

		AI_GotoNpc	(self, Mod_767_BAU_Malak_NW);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Maleth))
	&& (Npc_GetDistToNpc(self, Mod_911_BAU_Maleth_NW) > 500)
	{
		AI_SetWalkmode 	(self, NPC_RUN);

		AI_GotoNpc	(self, Mod_911_BAU_Maleth_NW);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Balthasar))
	&& (Npc_GetDistToNpc(self, Mod_101_BAU_Balthasar_NW) > 500)
	{
		AI_SetWalkmode 	(self, NPC_RUN);

		AI_GotoNpc	(self, Mod_101_BAU_Balthasar_NW);
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schaeferhund_Lobart_01))
	&& (Npc_GetDistToNpc(self, Mod_910_BAU_Lobart_NW) > 500)
	{
		AI_SetWalkmode 	(self, NPC_RUN);

		AI_GotoNpc	(self, Mod_910_BAU_Lobart_NW);
	}
	else
	{
		AI_SetWalkmode 	(self, NPC_WALK);
	
		if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
		{
			var int wanderTime;
			wanderTime = Hlp_Random(5);
			Npc_SetStateTime (self, 0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	
		if (Npc_GetStateTime(self) > wanderTime)
		{
			if (Wld_IsNextFPAvailable(self,	"FP"))	//NEXT, sonst findet er seinen eigenen FP = besetzt!
			{											
				AI_GotoNextFP	(self,	"FP");
			};
			//sonst stehenbleiben
		
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		}
		else
		{
			if (Hlp_Random(1000) <= 5)
			{
				var int randomMove;
				randomMove = Hlp_Random(3);
				if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
				if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
				if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
			};
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Schaeferhund_end()
{

};
