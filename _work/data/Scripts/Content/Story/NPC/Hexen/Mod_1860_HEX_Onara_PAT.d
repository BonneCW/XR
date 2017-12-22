instance Mod_1860_HEX_Onara_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Onara";	//Halvors Frau
	guild 		= GIL_out;
	id 			= 1860;
	voice		= 43;
	flags       = NPC_FLAG_GHOST;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_hexenqueen);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1860;
};

FUNC VOID Rtn_Start_1860 ()
{	
	TA_Stand_WP		(04,55,22,05,"WP_PAT_TURM_23");
    TA_Stand_WP	 			(22,05,04,55,"WP_PAT_TURM_23");
};