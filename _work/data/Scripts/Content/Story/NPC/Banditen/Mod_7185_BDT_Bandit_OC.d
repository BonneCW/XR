instance Mod_7185_BDT_Bandit_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Bandit; 
	guild 		= GIL_OUT;
	id 			= 7185;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MT_BANDIT;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------															
	EquipItem	(self, ItMw_Banditenschwert); 																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_bdt_m_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7185;
};

FUNC VOID Rtn_Start_7185 ()
{	
	TA_Follow_Player	(08,00,23,00,"WP_OCC_258"); 
	TA_Follow_Player	(23,00,08,00,"WP_OCC_258");
};

FUNC VOID Rtn_Tot_7185()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};