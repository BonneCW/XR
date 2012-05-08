instance Mod_7020_HS_Tuersteher_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Türsteher";	
	guild 		= GIL_OUT;
	id 			= 7020;
	voice 		= 29;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMw_Schwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Torlof, BodyTex_N, ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7020;
};

FUNC VOID Rtn_Start_7020()
{	
	TA_Stand_Guarding	(22,00,08,00,"REL_265"); 	        	                  
	TA_Stand_Guarding	(08,00,22,00,"REL_265");    	                                   
};  

FUNC VOID Rtn_DarfRein_7020()
{	
	TA_Sit_Campfire	(22,00,08,00,"REL_265"); 	        	                  
	TA_Sit_Campfire	(08,00,22,00,"REL_265");    	                                   
}; 
