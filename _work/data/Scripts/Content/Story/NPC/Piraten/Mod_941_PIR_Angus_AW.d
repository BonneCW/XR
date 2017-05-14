INSTANCE Mod_941_PIR_Angus_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Angus";
	guild 		= GIL_NONE;
	id 			= 941;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR2hAxe);
	
	// ------ Inventory ------
	CreateInvItems (self, ItRi_Addon_MorgansRing_Mission, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart21, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Belagert_941;
};

FUNC VOID Rtn_Start_941 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"ADW_PIRATECAMP_TOWER_01");
	TA_Sleep	(20,00,05,00,"ADW_PIRATECAMP_TOWER_BED");
};

FUNC VOID Rtn_Belagert_941 ()
{	
	TA_Smalltalk_Piraten2	(08,00,20,00,"ADW_PIRATECAMP_CENTER");
	TA_Sit_Campfire 	(20,00,08,00,"WP_PIR_04");
};

FUNC VOID Rtn_Saw_941 ()
{	
	TA_Saw 	(05,00,20,00,"ADW_PIRATECAMP_BEACH_19");
	TA_Saw 	(20,00,05,00,"ADW_PIRATECAMP_BEACH_19");
};

FUNC VOID Rtn_Sammeln_941 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_941 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_941 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_941 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};