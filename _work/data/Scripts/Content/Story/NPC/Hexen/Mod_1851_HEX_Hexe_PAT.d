instance Mod_1851_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_hexe;	
	guild 		= GIL_strf;
	id 			= 1851;
	voice		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_pat_hexe;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRoNG;	
	
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
	daily_routine 		= Rtn_Start_1851;
};

FUNC VOID Rtn_Start_1851 ()
{	
	TA_Stand_WP		(12,00,20,00,"WP_PAT_LAGER_06_04");
    TA_Stand_WP		(20,00,12,00,"WP_PAT_LAGER_06_04");
};
