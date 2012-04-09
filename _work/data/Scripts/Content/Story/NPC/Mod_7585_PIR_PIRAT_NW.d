INSTANCE Mod_7585_PIR_PIRAT_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_PIRAT;
	guild 		= GIL_OUT;
	id 			= 7585;
	voice 		= 7;
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
	daily_routine 		= Rtn_PreStart_7585;
};

FUNC VOID Rtn_PreStart_7585 ()
{
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_PIRATESCAMP_03");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_PIRATESCAMP_03");
};

FUNC VOID Rtn_Tot_7585 ()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};