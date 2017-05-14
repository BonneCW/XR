instance Mod_7510_OUT_Raeuber_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber"; 
	guild 		= GIL_OUT;
	id 			= 7510;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_bdt_m_01);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7510;
};

FUNC VOID Rtn_Start_7510()
{
	TA_Smalltalk		(06,05,20,15,"REL_SURFACE_043");
	TA_Sit_Campfire		(20,15,06,05,"REL_SURFACE_124"); 	
};
