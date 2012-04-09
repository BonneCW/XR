instance Mod_7363_VLK_LehmarWache_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lehmars Wache"; 
	guild 		= GIL_PAL;
	id 			= 7363;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7363;
};

FUNC VOID Rtn_Start_7363()
{	
	TA_Stand_Guarding	(02,00,22,00,"NW_CITY_HABOUR_HUT_08_IN");
	TA_Pee			(22,00,23,00,"NW_CITY_PATH_HABOUR_08");
	TA_Sit_Campfire		(23,00,02,00,"NW_CITY_HABOUR_SHIP_01");
};

FUNC VOID Rtn_Tot_7363()
{	
	TA_Stand_Guarding	(02,00,22,00,"TOT");
	TA_Sit_Campfire		(22,00,02,00,"TOT");
};