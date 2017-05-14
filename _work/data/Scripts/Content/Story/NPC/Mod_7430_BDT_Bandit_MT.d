instance Mod_7430_BDT_Bandit_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber"; 
	guild 		= GIL_STRF;
	id 			= 7430;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MT_BANDIT;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;															
		
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
	daily_routine 		= Rtn_Start_7430;
};

FUNC VOID Rtn_Start_7430 ()
{
	TA_Stand_WP	(08,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Stand_WP	(20,00,08,00,"WP_MT_JAEGERLAGER_04");
};