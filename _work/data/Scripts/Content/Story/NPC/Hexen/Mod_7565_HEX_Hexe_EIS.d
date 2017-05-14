instance Mod_7565_HEX_Hexe_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hexe";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7565;
	voice		= 0;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_Hexe);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7565;
};

FUNC VOID Rtn_Start_7565 ()
{	
	TA_Stand_WP (00,00,12,00, "EIS_325");
	TA_Stand_WP (12,00,00,00, "EIS_325");
};

FUNC VOID Rtn_Nah_7565 ()
{	
	TA_Stand_WP	(00,00,12,00, "EIS_326");
	TA_Stand_WP	(12,00,00,00, "EIS_326");
};