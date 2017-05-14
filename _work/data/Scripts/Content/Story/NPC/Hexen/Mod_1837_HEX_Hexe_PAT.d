instance Mod_1837_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_hexe; //Coragons Frau / Magd / Bedienung
	guild 		= GIL_STRF;
	id 			= 1837;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_pat_hexe;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
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
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1837;
};

FUNC VOID Rtn_Start_1837 ()
{	
    TA_Stand_wp			(08,00,17,00,"WP_PAT_LAGER_06_19");
    TA_Stand_wp			(17,00,08,00,"WP_PAT_LAGER_06_19");
};
