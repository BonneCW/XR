instance Mod_1793_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_hexe;	
	guild 		= GIL_strf;
	id 			= 1793;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_pat_hexe;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Vlk_Dagger);	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_OldBrown, BodyTex_N, ITAR_hexe);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1793;
};

FUNC VOID Rtn_Start_1793 ()
{	
	TA_Stand_WP 			(05,00,22,00,"WP_PAT_LAGER_04_07");
    TA_Stand_WP			(22,00,05,00,"WP_PAT_LAGER_04_07");
};
