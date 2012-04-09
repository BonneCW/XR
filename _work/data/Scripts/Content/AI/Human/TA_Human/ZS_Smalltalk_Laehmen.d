// ************
// ZS_Smalltalk_Laehmen
// ************

const int Smalltalk_LaehmenFreq = 4;

func void ZS_Smalltalk_Laehmen () 
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

func int ZS_Smalltalk_Laehmen_Loop ()
{

	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Joe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Diego_HierKristall))
	&& (Mod_DiegoHoltKristall < Wld_GetDay())
	{
		Npc_ExchangeRoutine	(Mod_538_RDW_Diego_NW, "START");
		Npc_ExchangeRoutine	(Mod_588_WNOV_Joe_NW, "START");
	};

	if (Npc_IsOnFP (self, "SMALLTALK"))
	{	
		if (Npc_GetStateTime(self) >= (Smalltalk_LaehmenFreq * 2) )
		{
			Npc_PerceiveAll (self);
			
			if (Wld_DetectNpc(self, -1, ZS_Laehmen, -1)) //other = Nearest Npc (0=Spieler ignorieren!)
			{
				if (Npc_GetDistToNpc(self, other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime (other, Smalltalk_LaehmenFreq);
					                                       
					B_TurnToNpc (self,other);
					//B_Say_Smalltalk_Laehmen();
				};
			};
		
			Npc_SetStateTime (self, 0);
		};
	}
	else if (Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP 		(self, "SMALLTALK");
		AI_StandUp (self);
		AI_AlignToFP 	(self);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_Laehmen_End ()
{

};
