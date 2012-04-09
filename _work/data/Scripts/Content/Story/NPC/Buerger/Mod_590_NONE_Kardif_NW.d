instance Mod_590_NONE_Kardif_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kardif"; 
	guild 		= GIL_PAL;
	id 			= 590;
	voice 		= 14;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	
	
	// ------ Inventory ------
	// Händler
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart04, BodyTex_N,ITAR_Smith );	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_590;
};

FUNC VOID Rtn_Start_590 ()
{	
	TA_Stand_Sweeping		(08,00,11,00,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01"); 
	TA_Stand_ArmsCrossed	(11,00,13,00,"NW_CITY_KARDIF"); 
	TA_Stand_Sweeping		(13,00,16,00,"NW_CITY_HABOUR_TAVERN01_SMALLTALK_01"); 
	TA_Stand_ArmsCrossed	(16,00,08,00,"NW_CITY_KARDIF"); 
    
};

FUNC VOID Rtn_Gefangen_590 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_CITY_HABOUR_KASERN_RENGARU");
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU");
};

FUNC VOID Rtn_Teutonica_590 ()
{	
	TA_Smalltalk_KM		(08,00,21,00,"NW_CITY_HABOUR_TAVERN01_01");
   	TA_Smalltalk_KM		(21,00,08,00,"NW_CITY_HABOUR_TAVERN01_01");
};