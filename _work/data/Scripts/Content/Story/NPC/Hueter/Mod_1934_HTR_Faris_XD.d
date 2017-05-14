instance Mod_1934_HTR_Faris_XD (Npc_Default)
{
	// ------ NSC ------
	name 		= "Faris";	
	guild 		= GIL_nov;
	id 			= 1934;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMw_Kilgorin);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Torlof, BodyTex_N, ITAR_Hueter);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1934;
};

FUNC VOID Rtn_Start_1934()
{	
	TA_Sit_Throne		(22,00,08,00,"WP_XD_89"); 	        	                  
    TA_Sit_Throne	(08,00,22,00,"WP_XD_89");    	                                   
};  
