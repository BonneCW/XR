INSTANCE Mod_1077_PIR_PIRAT_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_PIRAT;
	guild 		= GIL_PIR;
	id 			= 1077;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_Ratford, BodyTex_L, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1077;
};

FUNC VOID Rtn_PreStart_1077 ()
{	
	TA_Repair_Hut 	 	(06,10,16,07,"ADW_PIRATECAMP_ENTRANCE_REPAIR");
	TA_Smalltalk_Piraten1	 	(16,07,20,03,"WP_PIR_01");
	TA_Sit_Campfire	 	(20,03,20,10,"WP_PIR_06");
	TA_Stand_Drinking 	(20,10,21,10,"WP_PIR_06");
	TA_Sit_Campfire 	(21,10,23,10,"WP_PIR_06");
	TA_Pee 			(23,10,03,20,"WP_PIR_06");
	TA_Sleep 		(23,20,06,10,"WP_PIR_11");
};

FUNC VOID Rtn_Belagert_1077 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"WP_PIR_04");
	TA_Sit_Campfire 	(20,00,08,00,"WP_PIR_04");
};

FUNC VOID Rtn_Sammeln_1077 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_1077 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_1077 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};
