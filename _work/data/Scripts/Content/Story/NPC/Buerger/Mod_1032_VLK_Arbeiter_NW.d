instance Mod_1032_VLK_Arbeiter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Arbeiter; 
	guild 		= GIL_PAL;
	id 			= 1032;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B,ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1032;
};

FUNC VOID Rtn_Start_1032()
{																			           
	TA_Stand_Sweeping	(06,35,08,00,"NW_CITY_UPTOWN_PATH_11");  
    TA_Stand_Sweeping	(08,00,10,00,"NW_CITY_UPTOWN_PATH_12");  
	TA_Stand_Sweeping	(10,00,12,00,"NW_CITY_SMALLTALK_04");          	
	
	TA_Sit_Bench		(12,00,15,00,"NW_CITY_UPTOWN_PATH_24"); 
	
	TA_Stand_Sweeping	(15,00,17,00,"NW_CITY_UPTOWN_PATH_11");  
    TA_Stand_Sweeping	(17,00,19,00,"NW_CITY_UPTOWN_PATH_12");  
	TA_Stand_Sweeping	(19,00,21,00,"NW_CITY_SMALLTALK_04");
	          	
	TA_Sit_Bench		(21,00,00,05,"NW_CITY_UPTOWN_PATH_24"); 
	TA_Sit_Campfire 	(00,05,06,35,"NW_CITY_UPTOWN_PATH_20_B"); 
};
