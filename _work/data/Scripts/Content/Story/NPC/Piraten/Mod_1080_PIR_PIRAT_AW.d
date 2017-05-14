INSTANCE Mod_1080_PIR_PIRAT_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Koch";
	guild 		= GIL_PIR;
	id 			= 1080;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 700;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hSword);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1080;
};

FUNC VOID Rtn_PreStart_1080 ()
{	
	TA_Roast_Scavenger 	(07,35,16,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking 	(16,35,17,35,"ADW_PIRATECAMP_BEACH_07");
	TA_Roast_Scavenger 	(17,35,20,35,"ADW_PIRATECAMP_SCAVENGER");
	TA_Stand_Drinking 	(20,35,07,35,"ADW_PIRATECAMP_BEACH_07");
};

FUNC VOID Rtn_Sammeln_1080 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_1080 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_1080 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};
