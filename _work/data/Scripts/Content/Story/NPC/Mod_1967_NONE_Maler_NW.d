instance Mod_1967_NONE_Maler_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Maler";	
	guild 		= GIL_pal;
	id 			= 1967;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 186, BodyTex_N, ITAR_Maler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1967;
};

FUNC VOID Rtn_Start_1967()
{	
	TA_Smoke_Joint		(22,00,08,00,"NW_CITY_HABOUR_06"); 	        	                  
    TA_Malen	(08,00,22,00,"NW_CITY_HABOUR_06");    	                                   
};  
