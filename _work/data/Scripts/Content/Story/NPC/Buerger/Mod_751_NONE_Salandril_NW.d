instance Mod_751_NONE_Salandril_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Salandril"; 
	guild 		= GIL_NONE;
	id 			= 751;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_10);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_751;
};

FUNC VOID Rtn_Start_751 ()
{	
	TA_Stand_ArmsCrossed	(08,00,10,00,"NW_CITY_SALANDRIL");
	TA_Potion_Alchemy		(10,00,13,00,"NW_CITY_SALANDRIL");
	TA_Read_Bookstand 		(13,00,15,00,"NW_CITY_SHOP_SALANDRIL_03");
	
	TA_Stand_ArmsCrossed	(15,00,17,00,"NW_CITY_SALANDRIL");
	TA_Potion_Alchemy		(17,00,19,00,"NW_CITY_SALANDRIL");
	TA_Read_Bookstand 		(19,00,22,00,"NW_CITY_SHOP_SALANDRIL_03");
	
	TA_Sleep				(22,00,08,00,"NW_CITY_SHOP_SALANDRIL_BED");
};