instance Mod_1062_VLK_Bernd_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bernd"; 
	guild 		= GIL_PAL;
	id 			= 1062;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
 	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1062;
};

FUNC VOID Rtn_Start_1062()
{	
	TA_Cook_Cauldron	(05,05,12,05,"NW_CITY_PATH_HABOUR_13_C");
	TA_Smalltalk		(12,05,15,55,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Cook_Cauldron	(15,55,20,05,"NW_CITY_PATH_HABOUR_13_C");
	TA_Smalltalk		(20,05,23,00,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Sleep			(23,00,05,05,"NW_CITY_HABOUR_HUT_06_BED_02");    
};

FUNC VOID Rtn_Gekillt_1062()
{
	TA_Stand_WP	(08,00,20,00,"NW_CITY_HABOUR_HUT_06_BED_02");
	TA_Stand_WP	(20,00,08,00,"NW_CITY_HABOUR_HUT_06_BED_02");
};