instance Mod_1892_NONE_Bandenmitglied1_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandenmitglied";	
	guild 		= GIL_OUT;
	id 			= 1892;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Vlk_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 188, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1892;
};

FUNC VOID Rtn_Start_1892()
{	
	TA_Stand_ArmsCrossed		(08,00,20,00,"NW_CITY_WATCH_FIGHT_02"); 	        	                  
    TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_WATCH_FIGHT_02");    	                                     
};  

FUNC VOID Rtn_Tot_1892()
{	
	TA_Stand_ArmsCrossed		(08,00,20,00,"TOT"); 	        	                  
    TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");    	                                     
};  
