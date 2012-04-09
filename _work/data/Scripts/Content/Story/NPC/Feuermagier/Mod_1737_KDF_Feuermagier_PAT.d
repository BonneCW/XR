instance Mod_1737_KDF_Feuermagier_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_firemage;	
	guild 		= GIL_vlk;
	id 			= 1737;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_pat_feuermagier;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Torlof, BodyTex_N, ITAR_KDF_L_Feuer);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1737;
};

FUNC VOID Rtn_Start_1737()
{	
	TA_Sit_Throne		(22,00,08,00,"WP_PAT_WEG_75"); 	        	                  
    TA_Read_Bookstand	(08,00,22,00,"WP_PAT_WEG_69");    	                                   
};  
