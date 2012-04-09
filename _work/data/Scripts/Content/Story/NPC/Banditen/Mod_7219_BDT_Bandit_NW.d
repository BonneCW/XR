INSTANCE Mod_7219_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber";
	guild 		= GIL_STRF;
	id 			= 7219;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert_Andre); 
	
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
	daily_routine 		= Rtn_Start_7219;
};

FUNC VOID Rtn_Start_7219 ()
{	
	TA_Sit_Campfire	(08,00,23,00,"NW_FOREST_CAVE1_IN_05");
    TA_Sit_Campfire			(23,00,08,00,"NW_FOREST_CAVE1_IN_05");
};