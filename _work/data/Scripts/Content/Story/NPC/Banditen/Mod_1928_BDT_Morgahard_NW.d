instance Mod_1928_BDT_Morgahard_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgahard"; 
	guild 		= GIL_OUT;
	id 			= 1928;
	voice 		= 31;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Banditenschwert); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);								
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1928;
};

FUNC VOID Rtn_Start_1928 ()
{	
	TA_Smalltalk	(08,00,23,00,"NW_BIGFARM_HOUSE_OUT_05"); 
	TA_Smalltalk	(23,00,08,00,"NW_BIGFARM_HOUSE_OUT_05");
};

FUNC VOID Rtn_Stadt_1928()
{
	TA_Stand_WP	(08,00,20,00,"NW_CITY_MERCHANT_PATH_32");
	TA_Stand_WP	(20,00,08,00,"NW_CITY_MERCHANT_PATH_32");
};

FUNC VOID Rtn_AtLagerhaus_1928()
{
	TA_Stand_Drinking	(08,00,20,00,"NW_CITY_PATH_HABOUR_15");
	TA_Stand_Drinking	(20,00,08,00,"NW_CITY_PATH_HABOUR_15");
};

FUNC VOID Rtn_GuideToLagerhaus_1928()
{
	TA_Guide_Player	(08,00,20,00,"NW_CITY_HABOUR_KASERN_01");
	TA_Guide_Player	(20,00,08,00,"NW_CITY_HABOUR_KASERN_01");
};

FUNC VOID Rtn_Tot_1928()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Castlemine_1928 ()
{	
   	TA_Smalltalk		(08,30,12,00,"NW_CASTLEMINE_TOWER_NAVIGATION2");
	TA_Saw			(12,00,16,00,"NW_CASTLEMINE_PATH_HUT_02");
	TA_Smalltalk		(16,00,22,00,"NW_CASTLEMINE_TOWER_NAVIGATION2");
	TA_Sit_Campfire		(22,00,08,30,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
};