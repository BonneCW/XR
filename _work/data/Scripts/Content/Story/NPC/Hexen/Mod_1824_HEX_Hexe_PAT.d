instance Mod_1824_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_hexe;
	guild 		= GIL_strf;
	id 			= 1824;
	voice		= 43;
	flags       = 0;																	
	npctype		= NPCTYPE_pat_hexe;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1h_Vlk_Dagger);	
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_hexe);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1824;
};

FUNC VOID Rtn_Start_1824 ()
{	
	TA_Stand_WP	(05,00,22,00,"WP_PAT_LAGER_01_08");
    TA_Stand_WP		(22,00,05,00,"WP_PAT_LAGER_01_08");
};
