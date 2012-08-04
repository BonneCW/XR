instance Mod_1768_KDF_Magier_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ordenspriester";
	guild 		= GIL_VLK;
	id 			= 1768;
	voice 		= 13;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	
	//--------Aivars-------------
	aivar[AIV_ToughGuy] = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;			
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Whistler, BodyTex_N, ITAR_KDF_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1768;
};

FUNC VOID Rtn_Start_1768 ()
{	
	TA_Stand_WP		(08,00,23,00,"WP_PAT_WEG_155");
	TA_Stand_WP		(23,00,08,00,"WP_PAT_WEG_155"); 
};

FUNC VOID Rtn_Flucht_1768 ()
{	
	TA_Stand_WP		(08,00,23,00,"TOT");
	TA_Stand_WP		(23,00,08,00,"TOT");
};

FUNC VOID Rtn_Mine_1768 ()
{	
	TA_Stand_WP		(08,00,23,00,"WP_PAT_UNTERGRUND_08");
	TA_Stand_WP		(23,00,08,00,"WP_PAT_UNTERGRUND_08");
};