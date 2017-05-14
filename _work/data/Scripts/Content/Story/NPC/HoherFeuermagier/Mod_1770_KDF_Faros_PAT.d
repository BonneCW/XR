INSTANCE Mod_1770_KDF_Faros_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Faros";
	guild 		= GIL_VLK;
	id 			= 1770;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																				
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	
	// ------ Inventory ------
	// Händler
	

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Gomez , BodyTex_N, ITAR_KDF_H);
	Mdl_SetModelFatness	(self, 1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1770;
};
FUNC VOID Rtn_Start_1770 ()
{	
	TA_Pick_FP	(08,00,22,00,"WP_PAT_UNTERGRUND_17");
   	TA_Pick_FP		(22,00,08,00,"WP_PAT_UNTERGRUND_17");
};