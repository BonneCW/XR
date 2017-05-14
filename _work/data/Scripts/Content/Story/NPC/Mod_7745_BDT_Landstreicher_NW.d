instance Mod_7745_BDT_Landstreicher_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Landstreicher"; 
	guild 		= GIL_OUT;
	id 			= 7745;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
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
	CreateInvItems	(self, ItMi_SilverCup, 1);
	CreateInvItems	(self, ItMi_GoldRing, 1);
	CreateInvItems	(self, ItMi_Gold, 89);
	CreateInvItems	(self, ItWr_LandstreicherSiegelring, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_bdt_m_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7745;
};

FUNC VOID Rtn_Start_7745 ()
{	
	TA_Sit_Campfire		(08,00,23,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02"); 
	TA_Sit_Campfire		(23,00,08,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
};

FUNC VOID Rtn_Bruecke_7745()
{
	TA_Stand_WP		(08,00,20,00,"NW_TROLLAREA_PATH_47");
	TA_Stand_WP		(20,00,08,00,"NW_TROLLAREA_PATH_47");
};

FUNC VOID Rtn_Weidenplateau_7745()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_BIGMILL_FARM3_05");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_BIGMILL_FARM3_05");
};

FUNC VOID Rtn_Erol_7745()
{
	TA_Stand_WP	(08,00,20,00,"NW_BIGFARM_LAKE_02");
	TA_Stand_WP	(20,00,08,00,"NW_BIGFARM_LAKE_02");
};

FUNC VOID Rtn_Kloster_7745()
{
	TA_Stand_WP	(08,00,20,00,"NW_PATH_TO_MONASTERY_03");
	TA_Stand_WP	(20,00,08,00,"NW_PATH_TO_MONASTERY_03");
};