instance Mod_7744_OUT_Dieb_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dieb"; 
	guild 		= GIL_STRF;
	id 			= 7744;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 50);
	CreateInvItems (self, ItMi_GoldKompass, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ToughBart01, BodyTex_N,ITAR_Vlk_02);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7744;
};

FUNC VOID Rtn_Start_7744()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"NW_FOREST_CAVE1_IN_05");
	TA_Stand_Drinking 	(20,15,05,15,"NW_FOREST_CAVE1_IN_05"); 
};

FUNC VOID Rtn_Bruecke_7744()
{	
	TA_Sit_Bench		(05,15,20,15,"NW_TAVERN_TO_FOREST_03");
	TA_Sit_Bench	 	(20,15,05,15,"NW_TAVERN_TO_FOREST_03"); 
};

FUNC VOID Rtn_Orlan_7744 ()
{	
	TA_RunToWP	(08,00,22,00,"NW_FARM2_TAVERNCAVE1_02");
	TA_RunToWP	(22,00,08,00,"NW_FARM2_TAVERNCAVE1_02");
};

FUNC VOID Rtn_Sumpf_7744 ()
{	
	TA_RunToWP	(08,00,22,00,"NW_FOREST_PATH_34_02");
	TA_RunToWP	(22,00,08,00,"NW_FOREST_PATH_34_02");
};

FUNC VOID Rtn_See_7744 ()
{	
	TA_RunToWP	(08,00,22,00,"NW_BIGFARM_LAKE_CAVE_03");
	TA_RunToWP	(22,00,08,00,"NW_BIGFARM_LAKE_CAVE_03");
};