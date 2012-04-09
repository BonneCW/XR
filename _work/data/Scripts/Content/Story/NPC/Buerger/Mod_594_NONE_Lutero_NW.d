instance Mod_594_NONE_Lutero_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lutero"; 
	guild 		= GIL_PAL;
	id 			= 594;
	voice 		= 13;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self,ItMw_1H_Eminem_AchillesSchwert_01);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal02, BodyTex_P, ITAR_Governor);	
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_594;
};
FUNC VOID Rtn_Start_594 ()
{	
	TA_Smalltalk		(08,00,12,00,"NW_CITY_LUTERO");
	TA_Sit_Bench 		(12,00,15,00,"NW_CITY_UPTOWN_PATH_27");
 	TA_Smalltalk		(15,00,18,00,"NW_CITY_LUTERO");
	TA_Sit_Bench 		(18,00,20,00,"NW_CITY_UPTOWN_PATH_27");
	TA_Sit_Bench 		(20,00,00,00,"NW_CITY_UPTOWN_PATH_27");
	TA_Sleep			(00,00,08,00,"NW_CITY_UPTOWN_HUT_05_IN");

};

FUNC VOID Rtn_Brief_594()
{	
	TA_Stand_WP	(08,00,20,00,"NW_CITY_CITYHALL_08");
    TA_Stand_WP		(20,00,08,00,"NW_CITY_CITYHALL_08");
};

FUNC VOID Rtn_Flucht_594()
{	
	TA_FleeToWP	(08,00,20,00,"NW_LIGHTHOUSE_IN_16");
    TA_FleeToWP		(20,00,08,00,"NW_LIGHTHOUSE_IN_16");
};

FUNC VOID Rtn_Angriff_594()
{	
	TA_Stand_WP	(08,00,20,00,"WP_LUTERO");
    TA_Stand_WP		(20,00,08,00,"WP_LUTERO");
};