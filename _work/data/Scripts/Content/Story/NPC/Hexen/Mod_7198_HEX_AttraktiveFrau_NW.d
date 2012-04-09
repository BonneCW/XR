instance Mod_7198_HEX_AttraktiveFrau_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Attraktive Frau";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7198;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7198;
};

FUNC VOID Rtn_Start_7198 ()
{	
	TA_Sit_Chair (00,00,12,00, "NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair (12,00,00,00, "NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Zimmer_7198 ()
{	
	TA_Stand_WP	(00,00,12,00, "WP_TAVERNE_ZIMMER_07");
	TA_Stand_WP	(12,00,00,00, "WP_TAVERNE_ZIMMER_07");
};

FUNC VOID Rtn_Tot_7198 ()
{	
	TA_Stand_WP	(00,00,12,00, "TOT");
	TA_Stand_WP	(12,00,00,00, "TOT");
};