instance Mod_7713_DMR_Daemonenritter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenritter"; 
	guild 		= GIL_STRF;
	id 			= 7713;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_XRSchwert_04);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N, ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7713;
};

FUNC VOID Rtn_Start_7713()
{	
	TA_Stand_WP	(08,00,23,00,"NW_CASTLEMINE_TOWER_STAND_02");
	TA_Stand_WP 	(23,00,08,00,"NW_CASTLEMINE_TOWER_STAND_02");
};
