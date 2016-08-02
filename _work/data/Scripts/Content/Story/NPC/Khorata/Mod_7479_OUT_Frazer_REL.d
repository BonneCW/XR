instance Mod_7479_OUT_Frazer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frazer"; 
	guild 		= GIL_OUT;
	id 			= 7479;
	voice 		= 29;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal06, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7479;
};

FUNC VOID Rtn_Start_7479()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"RM_49");
	TA_Stand_ArmsCrossed 	(23,00,08,00,"RM_49");
};

FUNC VOID Rtn_Tot_7479()
{	
	TA_Pick_ore		(05,30,11,35,"TOT");
	TA_Pick_Ore	 	(11,35,05,30,"TOT");
};