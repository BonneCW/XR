INSTANCE Mod_940_PIR_Samuel_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Samuel";
	guild 		= GIL_OUT;
	id 			= 940;
	voice		= 0;
	flags       = FALSE;											
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_Mace_L_03);
	
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBAld", Face_B_Saturas, BodyTex_B, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_940;
};

FUNC VOID Rtn_Start_940 ()
{	
	TA_Potion_Alchemy	(06,00,08,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(08,00,10,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(10,00,12,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(12,00,14,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(14,00,16,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(16,00,18,00,"ADW_PIRATECAMP_CAVE1_02");
	TA_Potion_Alchemy	(18,00,20,00,"ADW_PIRATECAMP_CAVE1_04");
	TA_Stand_Drinking	(20,00,22,00,"ADW_PIRATECAMP_CAVE1_02");

	TA_Sleep	(22,00,06,00,"ADW_PIRATECAMP_CAVE_BED");
};

FUNC VOID Rtn_Enter_940 ()
{	
	TA_Sleep	(08,00,22,00,"ADW_PIRATECAMP_TOWER_BED");
	TA_Sleep	(22,00,08,00,"ADW_PIRATECAMP_TOWER_BED");
};

FUNC VOID Rtn_Sammeln_940 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_940 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_940 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_940 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};