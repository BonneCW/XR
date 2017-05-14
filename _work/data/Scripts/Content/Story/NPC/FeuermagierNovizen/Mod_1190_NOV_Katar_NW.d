INSTANCE Mod_1190_NOV_Katar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Katar";
	guild 		= GIL_vlk;
	id 			= 1190;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal08, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1190;
};

FUNC VOID Rtn_Start_1190 ()
{	
	TA_Stomp_Herb		(08,00,11,00,"NW_MONASTERY_WINEMAKER_04");
	TA_Pray_Innos_FP	(11,00,12,00,"NW_MONASTERY_CHURCH_03");
    TA_Stomp_Herb		(12,00,22,30,"NW_MONASTERY_WINEMAKER_04");
    TA_Sleep			(22,30,08,00,"NW_MONASTERY_NOVICE03_04");
};

FUNC VOID Rtn_City_1190()
{
	TA_Smalltalk		(08,00,20,00,"NW_CITY_MERCHANT_PATH_36");
	TA_Smalltalk	(20,00,08,00,"NW_CITY_MERCHANT_PATH_36");
};

FUNC VOID Rtn_Bridge_1190()
{
	TA_Sit_Bench		(08,00,20,00,"NW_TAVERN_TO_FOREST_03");
	TA_Sit_Bench	(20,00,08,00,"NW_TAVERN_TO_FOREST_03");
};