INSTANCE Mod_942_PIR_Hank_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hank";
	guild 		= GIL_NONE;
	id 			= 942;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Addon_PIR1hSword);
		
	// ------ Inventory ------
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Belagert_942;
};

FUNC VOID Rtn_Start_942 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"ADW_PIRATECAMP_2_TOWER_05");
	TA_Stand_Guarding	(20,00,05,00,"ADW_PIRATECAMP_2_TOWER_05");
};

FUNC VOID Rtn_Belagert_942 ()
{	
	TA_Smalltalk_Piraten2	(08,00,20,00,"ADW_PIRATECAMP_CENTER");
	TA_Sit_Campfire 	(20,00,08,00,"WP_PIR_04");
};

FUNC VOID Rtn_Saw_942 ()
{	
	TA_Saw 	(05,00,20,00,"ADW_PIRATECAMP_BEACH_19");
	TA_Saw 	(20,00,05,00,"ADW_PIRATECAMP_BEACH_19");
};

FUNC VOID Rtn_Sammeln_942 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_942 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_942 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_942 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};