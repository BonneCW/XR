instance Mod_7367_JG_Jaeger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_JAEGER; 
	guild 		= GIL_STRF;
	id 			= 7367;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
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
	B_SetFightSkills (self, 15); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7367;
};

FUNC VOID Rtn_Start_7367()
{	
	TA_Stand_Guarding	(06,05,20,15,"NW_FOREST_PATH_35_06");
	TA_Stand_Guarding	(20,15,06,05,"NW_FOREST_PATH_35_06"); 
};
