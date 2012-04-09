INSTANCE Mod_1551_PIR_Morgan_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgan";
	guild 		= GIL_out;
	id 			= 1551;
	voice 		= 7;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Doppelaxt);
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough_Santino, BodyTex_L, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_START_1551;
};

FUNC VOID Rtn_START_1551 ()
{
	TA_Sleep 		(23,00,09,00,"WP_DI_MORGAN_SLEEP");
	TA_Sleep		(09,00,23,00,"WP_DI_MORGAN_SLEEP");
};