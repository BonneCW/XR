instance Mod_1852_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_hexe;	//Carls Frau
	guild 		= GIL_strf;
	id 			= 1852;
	voice		= 0;
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
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_hexe);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1852;
};

FUNC VOID Rtn_Start_1852 ()
{	
	TA_Stand_WP		(05,05,22,05,"WP_PAT_LAGER_06_05");
    TA_Stand_WP		(22,05,05,05,"WP_PAT_LAGER_06_05");
};
