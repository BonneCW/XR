INSTANCE Mod_934_PIR_Henry_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Henry";
	guild 		= GIL_NONE;
	id 			= 934;
	voice		= 0;
	flags       = FALSE;												
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Krummschwert); 
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal01, BodyTex_P, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_934;
};

FUNC VOID Rtn_Start_934 ()
{	
	TA_Guard_Passage	(05,00,20,00,"ADW_PIRATECAMP_WAY_04");
	TA_Guard_Passage	(20,00,05,00,"ADW_PIRATECAMP_WAY_04");
};

FUNC VOID Rtn_Belagert_934 ()
{	
	TA_Stand_WP		(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 		(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Sammeln_934 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_934 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_934 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_934 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};