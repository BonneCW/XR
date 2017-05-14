instance Mod_967_BDT_Tom_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tom";
	guild 		= GIL_OUT;
	id 			= 967;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	
	// ------ Inventory ------
	
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_967;
};

FUNC VOID Rtn_Start_967 ()
{
    TA_Sit_Bench   (09,00,21,00,"NW_CITY_MERCHANT_PATH_30");
    TA_Sit_Bench   (21,00,09,00,"NW_CITY_MERCHANT_PATH_30");		
};

FUNC VOID Rtn_Gefangen_967()
{
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};