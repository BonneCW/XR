INSTANCE Mod_7218_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber";
	guild 		= GIL_STRF;
	id 			= 7218;
	voice 		= 08;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert_Andre); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	B_SetAttitude (self, ATT_HOSTILE);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_bdt_m_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7218;
};

FUNC VOID Rtn_Start_7218 ()
{	
	TA_Sit_Campfire		(08,00,20,00,"NW_FOREST_CAVE1_IN_05");
	TA_Sit_Campfire	(20,00,08,00,"NW_FOREST_CAVE1_IN_05");
};