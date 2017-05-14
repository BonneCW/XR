instance Mod_904_SLD_Engardo_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Engardo"; 
	guild 		= GIL_MIL;
	id 			= 904;
	voice		= 0;
	flags       = 0;						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	//--------Aivars-----------------------
	aivar[AIV_EnemyOverride] = TRUE;  
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_GrobesKurzschwert);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal_Erpresser, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_904;
};

FUNC VOID Rtn_Start_904 ()
{	
	TA_Sit_Bench		(08,00,22,00,"NC_PLACE03_MOVEMENT");
    TA_Sleep		(22,00,08,00,"NC_HUT07_IN");
};

FUNC VOID Rtn_WaitForPlayer_904 ()
{	
	TA_RunToWP		(08,00,22,00,"OW_PATH_07_21");
    	TA_RunToWP		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_SmallCave_904 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_24_IN");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_SmokePause_904 ()
{	
	TA_Smoke_Joint		(08,00,22,00,"LOCATION_24_IN");
    	TA_Smoke_Joint		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_GreatCave_904 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_Waiting_904 ()
{	
	TA_Stand_WP		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Stand_WP		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_PotionPause_904 ()
{	
	TA_Sit_Bench		(08,00,22,00,"LOCATION_23_CAVE_1_02");
    	TA_Sit_Bench		(22,00,08,00,"LOCATION_23_CAVE_1_02");
};

FUNC VOID Rtn_FollowToCamp_904 ()
{	
	TA_Follow_Player		(08,00,22,00,"OW_PATH_07_21");
    	TA_Follow_Player		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_FleeToCamp_904 ()
{	
	TA_FleeToWP		(08,00,22,00,"OW_PATH_07_21");
    	TA_FleeToWP		(22,00,08,00,"OW_PATH_07_21");
};