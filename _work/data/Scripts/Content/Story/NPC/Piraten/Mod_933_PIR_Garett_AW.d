INSTANCE Mod_933_PIR_Garett_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garett";
	guild 		= GIL_NONE;
	id 			= 933;
	voice		= 0;
	flags       = FALSE;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);
	
	// ------ Inventory ------
	// Händler
	CreateInvItems (self, ItBE_Addon_Prot_EdgPoi, 1); 
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart05, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_933;
};

FUNC VOID Rtn_Start_933 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_HUT1_01");
	TA_Stand_Drinking 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_10");
};

FUNC VOID Rtn_Sammeln_933 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_933 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_933 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Tot_933 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};