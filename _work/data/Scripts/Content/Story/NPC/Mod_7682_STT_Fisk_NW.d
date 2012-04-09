instance Mod_7682_STT_Fisk_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fisk";
	guild 		= GIL_OUT;
	id 			= 7682;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_main;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B, STT_ARMOR_H);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_7682;
};

FUNC VOID Rtn_PreStart_7682 ()
{
	TA_Stand_ArmsCrossed	(06,00,18,00,"NW_BIGMILL_FARM3_07");
	TA_Stand_ArmsCrossed	(18,00,06,00,"NW_BIGMILL_FARM3_07");
};

FUNC VOID Rtn_start_7682 ()
{
	TA_Smalltalk	(06,00,18,00,"NW_CITY_MERCHANT_PATH_36_B");
	TA_Smalltalk	(18,00,06,00,"NW_CITY_MERCHANT_PATH_36_B");
};