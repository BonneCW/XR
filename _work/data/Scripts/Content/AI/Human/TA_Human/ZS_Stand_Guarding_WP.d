// *********************************************
// NSC steht mit Armen in die Hüfte gestemmt rum
// *********************************************

func void ZS_Stand_Guarding_WP()
{	
	Perception_Set_Normal();
	
	B_UseHat (self);
	
	B_ResetAll (self);
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};

	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Guarding_WP_loop()
{
	if (Npc_GetDistToWP(hero, "LGR_EINGANG_01") < 200)
	&& (LAGERFLUG_GDG_SEEN == FALSE)
	{
		Wld_SendTrigger	("LAGERFLUG_GDG");
		LAGERFLUG_GDG_SEEN = TRUE;
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_PATH_03") < 200)
		{
			if (!Npc_IsInState(Mod_118_MIL_Rumbold_NW, ZS_MagicSleep))
			{
				B_Attack	(Mod_118_MIL_Rumbold_NW, hero, AR_Kill, 1);
			};
		};
	};

	AI_AlignToWP (self);
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
  	{
  		self.aivar[AIV_TAPOSITION] = NOTINPOS;
  	}; 
			
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};			

	
//*******************************************************
//	Hier dann die Random Anis
//*******************************************************		

	
	if ((Npc_GetStateTime(self) > 5)
	&& (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		var int random;	random = Hlp_Random(10);
		
		if (random == 0)
		{
			 AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
		}
		else if (random == 1)
		{
			AI_PlayAni (self,"T_LGUARD_STRETCH");
		};
		
		Npc_SetStateTime (self, 0);
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Stand_Guarding_WP_end()
{
    AI_PlayAni (self,"T_HGUARD_2_STAND");
};	


