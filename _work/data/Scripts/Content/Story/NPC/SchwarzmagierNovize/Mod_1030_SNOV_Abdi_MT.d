INSTANCE Mod_1030_SNOV_Abdi_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Abdi";
	guild 		= GIL_KDF;
	id 			= 1030;
	voice 		= 31;
	flags       = FALSE;													
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Beliarschwert);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_NormalBart05, BodyTex_N, ITAR_NOV_DMB_01);	  
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1030;
};

FUNC VOID Rtn_Start_1030 ()
{	
	TA_Practice_Magic	(08,00,20,00,"PALTOBURGLINKSOBENTURM_13");
	TA_Practice_Magic 	(20,00,08,00,"PALTOBURGLINKSOBENTURM_13");
};

FUNC VOID Rtn_Aufstellung_1030 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_1030 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};