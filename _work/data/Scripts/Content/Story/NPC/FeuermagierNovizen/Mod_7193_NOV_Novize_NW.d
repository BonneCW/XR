INSTANCE Mod_7193_NOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_VLK;
	id 			= 7193;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7193;
};

FUNC VOID Rtn_Start_7193 ()
{	
	TA_Stand_WP	(16,00,22,00,"WP_BODEN_09");
    TA_Stand_WP	(16,00,22,00,"WP_BODEN_09");
    
};

FUNC VOID Rtn_Tot_7193 ()
{	
	TA_Stand_WP	(16,00,22,00,"TOT");
    TA_Stand_WP	(16,00,22,00,"TOT");
    
};