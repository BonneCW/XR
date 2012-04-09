instance Mod_7649_OUT_Urs_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Urs";
	guild 		= GIL_OUT;
	id 			= 7649;
	voice 		= 12;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	// Händler
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart20, BodyTex_N, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7649;
};

FUNC VOID Rtn_Start_7649 ()
{	
	TA_Stand_ArmsCrossed	(20,00,08,00,"OW_PATH_1_5");
	TA_Stand_ArmsCrossed	(08,00,20,00,"OW_PATH_1_5");
};

FUNC VOID Rtn_Wald_7649 ()
{	
	TA_Stand_ArmsCrossed	(20,00,08,00,"OC_ROUND_8");
	TA_Stand_ArmsCrossed	(08,00,20,00,"OC_ROUND_8");
};

FUNC VOID Rtn_ZuSteinkreis_7649 ()
{	
	TA_Guide_Player		(20,00,08,00,"OW_FOREST_EAST_UMWEG_02");
	TA_Guide_Player		(08,00,20,00,"OW_FOREST_EAST_UMWEG_02");
};

FUNC VOID Rtn_AtSteinkreis_7649 ()
{	
	TA_Smalltalk_Plaudern	(20,00,08,00,"OW_FOREST_EAST_UMWEG_02");
	TA_Smalltalk_Plaudern	(08,00,20,00,"OW_FOREST_EAST_UMWEG_02");
};

FUNC VOID Rtn_Bergfestung_7649 ()
{	
	TA_Stand_ArmsCrossed	(20,00,08,00,"LOCATION_19_03_PATH_RUIN7");
	TA_Stand_ArmsCrossed	(08,00,20,00,"LOCATION_19_03_PATH_RUIN7");
};

FUNC VOID Rtn_Tot_7649 ()
{	
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
};