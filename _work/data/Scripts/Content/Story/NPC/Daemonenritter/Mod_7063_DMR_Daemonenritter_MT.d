instance Mod_7063_DMR_Daemonenritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenritter"; 
	guild 		= GIL_KDF;
	id 			= 7063;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N,ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7063;
};

FUNC VOID Rtn_Start_7063()
{	
	TA_Stand_WP	(08,00,23,00,"WP_INTRO_FALL3");
    TA_Stand_WP 	(23,00,08,00,"WP_INTRO_FALL3");
};
