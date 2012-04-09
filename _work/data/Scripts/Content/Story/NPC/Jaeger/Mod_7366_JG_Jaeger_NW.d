instance Mod_7366_JG_Jaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_JAEGER; 
	guild 		= GIL_STRF;
	id 			= 7366;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7366;
};

FUNC VOID Rtn_Start_7366()
{	
	TA_RunToWP	(06,05,20,15,"NW_FOREST_PATH_80_1_MOVEMENT8_M3");
	TA_RunToWP	(20,15,06,05,"NW_FOREST_PATH_80_1_MOVEMENT8_M3"); 
};
