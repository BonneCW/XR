instance Mod_1859_HEX_Hexenqueen_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hexenkönigin";	//Halvors Frau
	guild 		= GIL_out;
	id 			= 1859;
	voice		= 43;
	flags       = 0;																
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 180, BodyTex_N, ITAR_hexenqueen);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1859;
};

FUNC VOID Rtn_Start_1859 ()
{	
	TA_Circle	(04,55,22,05,"WP_PAT_TURM_21");
	TA_Circle	(22,05,04,55,"WP_PAT_TURM_21");
};