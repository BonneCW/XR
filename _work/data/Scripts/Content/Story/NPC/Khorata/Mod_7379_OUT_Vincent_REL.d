instance Mod_7379_OUT_Vincent_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vincent";
	guild 		= GIL_OUT;
	id 			= 7379;
	voice 		= 36;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	
	//--------Aivars-------------
	aivar[AIV_ToughGuy] = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);			
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	EquipItem			(self, ItMw_1H_quantarie_Fantasyschwert_01);
	EquipItem			(self, ItRw_Bow_L_03);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7379;
};

FUNC VOID Rtn_Start_7379 ()
{	
	TA_Sit_Campfire			(08,00,23,00,"REL_SURFACE_001");
	TA_Sit_Campfire			(23,00,08,00,"REL_SURFACE_001"); 
};