instance Mod_1797_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_hexe;	
	guild 		= GIL_strf;
	id 			= 1797;
	voice		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_pat_hexe;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1h_Vlk_Dagger);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_hexe);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1797;
};

FUNC VOID Rtn_Start_1797 ()
{	
	TA_Stand_WP	(05,00,22,00,"WP_PAT_LAGER_04_06");
    TA_Stand_WP		(22,00,05,00,"WP_PAT_LAGER_04_06");
};
