instance Mod_1072_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buergerin;
	guild 		= GIL_PAL;
	id 			= 1072;
	voice		= 43;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_OldBrown, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1072;
};

FUNC VOID Rtn_PreStart_1072 ()
{	
	TA_Smalltalk			(06,00,07,00,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking		(07,00,08,00,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Listen_Monty			(08,00,20,00,"WP_MONTY_BLUBBER_02");
	TA_Smalltalk			(20,00,21,45,"NW_CITY_UPTOWN_PATH_15");	
	TA_Cook_Stove			(21,45,00,00,"NW_CITY_UPTOWN_HUT_04_COOK");
	TA_Sleep			(00,00,04,30,"NW_CITY_LUTERO_BED_WEIB");
	TA_Sweep_FP			(04,30,06,00,"NW_CITY_UPTOWN_HUT_04_01");
	
};

FUNC VOID Rtn_Start_1072 ()
{	
    TA_Smalltalk			(06,00,07,00,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking		(07,00,08,00,"NW_CITY_MERCHANT_PATH_28_D");
    TA_Smalltalk			(08,00,10,00,"NW_CITY_MERCHANT_PATH_28_D");
    TA_Stand_Drinking		(10,00,11,00,"NW_CITY_MERCHANT_PATH_28_D");
    TA_Smalltalk			(11,00,13,00,"NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_Drinking		(13,00,14,00,"NW_CITY_MERCHANT_PATH_28_D");
    TA_Smalltalk			(14,00,16,00,"NW_CITY_MERCHANT_PATH_28_D");
    //TA_Stand_Drinking		(16,00,18,00,"NW_CITY_MERCHANT_PATH_28_D");
	
	TA_Cook_Stove			(16,00,17,00,"NW_CITY_UPTOWN_HUT_04_COOK");
	TA_Smalltalk			(17,00,21,45,"NW_CITY_UPTOWN_PATH_15");	
    TA_Cook_Stove			(21,45,00,00,"NW_CITY_UPTOWN_HUT_04_COOK");
    TA_Sleep				(00,00,04,30,"NW_CITY_LUTERO_BED_WEIB");
	TA_Sweep_FP				(04,30,06,00,"NW_CITY_UPTOWN_HUT_04_01");
	
};
