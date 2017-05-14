instance Mod_200_NONE_Alvares_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alvares"; 
	guild 		= GIL_NONE;
	id 			= 200;
	voice		= 0;
	flags       = 0;						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	//--------Aivars-----------------------
	aivar[AIV_EnemyOverride] = TRUE;  
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Zweihaender);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Tough_Silas, BodyTex_B, ITAR_VLK_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_200;
};

FUNC VOID Rtn_PreStart_200 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_CITY_HABOUR_KASERN_RENGARU");
	TA_Stand_ArmsCrossed		(22,00,08,00,"NW_CITY_HABOUR_KASERN_RENGARU");
};

FUNC VOID Rtn_FollowToHof_200 ()
{	
	TA_Follow_Player		(08,00,22,00,"NW_BIGFARM_PATH_03");
    TA_Follow_Player		(22,00,08,00,"NW_BIGFARM_PATH_03");
};

FUNC VOID Rtn_AtHof_200 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"NW_BIGFARM_PATH_03");
    TA_Stand_ArmsCrossed		(22,00,08,00,"NW_BIGFARM_PATH_03");
};