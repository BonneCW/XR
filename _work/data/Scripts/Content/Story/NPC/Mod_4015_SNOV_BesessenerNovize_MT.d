INSTANCE Mod_4015_SNOV_BesessenerNovize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Besessener schwarzer Novize";
	guild 		= GIL_OUT;
	id 			= 4015;
	voice 		= 11;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace); 																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4015;
};

FUNC VOID Rtn_Start_4015 ()
{	
	TA_Stand_WP 			(01,00,03,00,"PALTOBURG_5");
	TA_Stand_WP		(03,00,01,00,"TOT");
};

FUNC VOID Rtn_TurnDemon_4015 ()
{	
	TA_Turn_Demon 			(01,00,03,00,"PALTOBURG_5");
	TA_Turn_Demon		(03,00,01,00,"PALTOBURG_5");
};

FUNC VOID Rtn_TOT_4015 ()
{	
	TA_Stand_WP 			(01,00,03,00,"TOT");
	TA_Stand_WP		(03,00,01,00,"TOT");
};
