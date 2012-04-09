// ****************
// ZS_Follow_Player
// ****************

FUNC void B_AssessFollowPlayer ()
{

	//FUNC
	
	if (Npc_GetDistToNpc(self, hero) < self.aivar[AIV_FollowDist])
	&& (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		Npc_ClearAIQueue (self);
		AI_StandUp (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	}
	else
	{	
		B_AssessPlayer ();
	};
};

// ---------------------------------
func void B_AssessFollowFightSound()
{
	if (Npc_IsPlayer(other))
	|| (Npc_IsPlayer(victim))
	|| (other.aivar[AIV_PARTYMEMBER] == TRUE)
	|| (victim.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		B_AssessFightSound ();
	};
};

// ---------------------------------
func void B_MoveFollowNpc()
{
	//zuckelt nur
};

// --------------------------
func void ZS_Follow_Player ()
{
	self.senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range	= 2000;	
	
	B_UseHat (self);
	
	Npc_SetPercTime	(self, 0.3);
	
	Perception_Set_Minimal();

	B_SetSchwierigkeit();
	
	if (self.aivar[AIV_Schwierigkeitsgrad] < Mod_Schwierigkeit)
	|| (self.aivar[AIV_Schwierigkeitsgrad] > Mod_Schwierigkeit)
	{
		B_SetSchwierigkeit();
	};
	
	Npc_PercEnable (self, PERC_ASSESSPLAYER	, B_AssessFollowPlayer); 
	Npc_PercEnable (self, PERC_ASSESSENEMY	, B_AssessEnemy); 
	Npc_PercEnable (self, PERC_ASSESSTALK	, B_AssessTalk); 
	Npc_PercEnable (self, PERC_MOVEMOB		, B_MoveMob); 
	
	//lokale Wahrnehmungen
	Npc_PercEnable (self, PERC_ASSESSFIGHTSOUND , B_AssessFollowFightSound);
	//Npc_PercEnable (self, PERC_MOVENPC, B_MoveFollowNpc);

	B_ResetAll (self);
	
	AI_StandUp (self);
	AI_SetWalkmode	(self,	NPC_RUN);
	
	// ------ init aivars ------
	if (self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 200;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HeroBot_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HeroBot_REL))
	{
		Mdl_ApplyOverlayMDS	(self, "HUMANS_SPRINT.MDS");
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1082_BAU_Rufus_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1621_EBR_Velaya_MT))	
	{
		self.senses_range = 1000;
	};
};

func int ZS_Follow_Player_Loop ()
{
	if (Npc_GetDistToNpc (self, hero) > self.aivar[AIV_FollowDist])
	{
		// ------ normale Behandlung ------
		if (!C_BodyStateContains(self, BS_SWIM))
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Friend_NW))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
		{
			if (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_15") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_14") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_13") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_12") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_11") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_10") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_09") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_08") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_07") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_06") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_05") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_04") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_03") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_PATH_CITY_02") < 500)
			|| (Npc_GetDistToWP(hero, "NW_FARM1_CONNECT_CITY") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_01") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_02") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_03") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_04") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_05") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_06") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_07") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_08") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_09") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_10") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_11") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_12") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_13") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_14") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_15") < 500)
			|| (Npc_GetDistToWP(hero, "ARGEZ_WAY_TO_CITY_16") < 500)
			|| (Npc_GetDistToWP(hero, "WP_SEQUENZ_ARGEZ") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITYFOREST_01") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_STAIRS03") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_STAIRS02") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_STAIRS01") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_08") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_07") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_06") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_05") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_04") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_03") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_02") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_TO_FOREST_01") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_CONNECT_FOREST") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_ENTRANCE_BACK") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_PATH_29") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_PATH_29_B") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_01") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_02") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_03") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_04") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_05") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_06") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_07") < 500)
			|| (Npc_GetDistToWP(hero, "NW_CITY_DITCH_08") < 500)
			{
				AI_GotoNpc	(self, hero);
			}
			else
			{
				if (Npc_RefuseTalk(self) == FALSE)
				{
					AI_Output(self, hero, "Info_Mod_Argez_TooFar_01_00"); //Da sollten wir nicht langlaufen. Ich warte hier.

					Npc_SetRefuseTalk (self, 30);
				};
			};
		}
		else
		{
			AI_GotoNpc (self, hero);
		};

		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else
	{
		if (Npc_GetStateTime(self) > 1)
		{
			B_TurnToNpc (self, hero);
						
			Npc_SetStateTime (self, 0);
		};
	};
	
	return LOOP_CONTINUE;
};

func void ZS_Follow_Player_End ()
{

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HeroBot_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HeroBot_REL))
	{
		Mdl_RemoveOverlayMDS	(self, "HUMANS_SPRINT.MDS");
	};
};



