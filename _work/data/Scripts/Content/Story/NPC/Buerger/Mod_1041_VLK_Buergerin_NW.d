instance Mod_1041_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	//Frau vom 'Säger' 453
	guild 		= GIL_PAL;
	id 			= 1041;
	voice		= 21;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1041;
};

FUNC VOID Rtn_Start_1041 ()
{	
	TA_Smalltalk		(05,07,12,07,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Cook_Stove		(12,07,16,00,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
	TA_Smalltalk		(16,07,19,07,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	TA_Sweep_FP 		(19,07,22,07,"NW_CITY_HABOUR_POOR_AREA_HUT_04_IN_B");
	TA_Smalltalk		(22,07,00,07,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
    TA_Sleep	 		(00,07,05,07,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
};

FUNC VOID Rtn_LobartAlwin_1041 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_ALWIN_SEQUENZ");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_ALWIN_SEQUENZ");
};
