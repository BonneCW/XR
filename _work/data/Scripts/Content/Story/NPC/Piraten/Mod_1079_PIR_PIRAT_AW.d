INSTANCE Mod_1079_PIR_PIRAT_AW (Npc_Default)	
{
	// ------ NSC ------
	name 		= NAME_ADDON_PIRAT;
	guild 		= GIL_PIR;
	id 			= 1079;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 600;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hSword);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Fingers, BodyTex_N, ITAR_PIR_L_Addon);	
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1079;
};

FUNC VOID Rtn_Start_1079 ()
{	
	TA_Sit_Bench 		(07,07,16,07,"ADW_PIRATECAMP_BENCH_01");
	TA_Smalltalk_Piraten1	(16,07,20,03,"WP_PIR_01");
	TA_Sit_Campfire		(20,03,22,07,"WP_PIR_03");
	TA_Stand_Drinking	(20,07,23,07,"WP_PIR_03");
	TA_Pee				(23,07,23,12,"WP_PIR_03");
	TA_Sit_Campfire		(23,12,02,07,"WP_PIR_03");
	TA_Stand_Drinking	(02,07,03,07,"WP_PIR_03");
	TA_Sit_Campfire		(03,07,07,07,"WP_PIR_03");
};

FUNC VOID Rtn_Sammeln_1079 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_1079 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_1079 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

