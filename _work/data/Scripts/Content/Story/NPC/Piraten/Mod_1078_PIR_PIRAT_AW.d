INSTANCE Mod_1078_PIR_PIRAT_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_ADDON_PIRAT;
	guild 		= GIL_PIR;
	id 			= 1078;
	voice 		= 9;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Addon_PIR2hAxe);  
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_ToughBart01, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1078;
};

FUNC VOID Rtn_PreStart_1078 ()
{	
	TA_Saw 				(06,15,19,15,"ADW_PIRATECAMP_ENTRANCE_SAW");
	TA_Sit_Campfire		(19,15,21,15,"WP_PIR_02");
	TA_Stand_Drinking	(21,15,22,15,"WP_PIR_02");
	TA_Pee				(22,15,22,20,"WP_PIR_02");
	TA_Sit_Campfire		(22,20,23,15,"WP_PIR_02");
	TA_Sleep	(23,15,06,15,"WP_PIR_12");
};

FUNC VOID Rtn_Belagert_1078 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"WP_PIR_04");
	TA_Sit_Campfire 	(20,00,08,00,"WP_PIR_04");
};

FUNC VOID Rtn_Sammeln_1078 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_1078 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_1078 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};
