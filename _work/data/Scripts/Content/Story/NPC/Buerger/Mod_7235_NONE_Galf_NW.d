instance Mod_7235_NONE_Galf_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Galf"; 
	guild 		= GIL_PAL;
	id 			= 7235;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	//Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7235;
};

FUNC VOID Rtn_Start_7235 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HABOUR_PUFF_NADJA");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_PUFF_NADJA");
};

FUNC VOID Rtn_KO_7235 ()
{	
	TA_Drained	(08,00,22,00,"NW_CITY_HABOUR_PUFF_IN_07");
	TA_Drained	(22,00,08,00,"NW_CITY_HABOUR_PUFF_IN_07");
};

FUNC VOID Rtn_Knast_7235 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,22,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};