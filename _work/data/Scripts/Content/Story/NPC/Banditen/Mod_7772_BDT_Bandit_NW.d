INSTANCE Mod_7772_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "R�uber";
	guild 		= GIL_out;
	id 			= 7772;
	voice		= 6;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 
	
	B_SetAttitude (self, ATT_HOSTILE);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_BDT_M_01);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7772;
};

FUNC VOID Rtn_Start_7772 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_XARDAS_TOWER_WATERFALL_CAVE_RIGHT_06");
	TA_Stand_Guarding	(23,00,08,00,"NW_XARDAS_TOWER_WATERFALL_CAVE_RIGHT_06");
};