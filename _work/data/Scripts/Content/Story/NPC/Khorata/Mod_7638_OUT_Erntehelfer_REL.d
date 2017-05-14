instance Mod_7638_OUT_Erntehelfer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Erntehelfer"; 
	guild 		= GIL_OUT;
	id 			= 7638;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B, ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7638;
};

FUNC VOID Rtn_Start_7638()
{																			           
	TA_Rake_FP	(06,35,08,00,"REL_SURFACE_109");  
	TA_Pick_FP	(08,00,11,00,"REL_SURFACE_109");  
	TA_Sit_Chair	(11,00,13,00,"REL_SURFACE_162");
	TA_Pick_FP	(13,00,16,00,"REL_SURFACE_109");
	TA_Rake_FP	(16,00,18,00,"REL_SURFACE_109");  
	TA_Stand_Eating	(18,00,20,00,"REL_SURFACE_160");  
	TA_Sleep	(20,00,06,35,"REL_SURFACE_213");
};
