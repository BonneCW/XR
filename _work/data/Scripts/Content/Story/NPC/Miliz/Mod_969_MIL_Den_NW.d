instance Mod_969_MIL_Den_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Den"; 
	guild 		= GIL_PAL;
	id 			= 969;
	voice		= 1;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Milizschwert);
	
	// ------ Inventory ------
	// ------ visuals ------																			
	
	if (Mod_DenVerpfiffen == 0)
	{
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Grim, BodyTex_N, ITAR_MIL_L);
	}
	else
	{
		B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Grim, BodyTex_N, ITAR_BAU_L);	
	};

	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_969;
};

FUNC VOID Rtn_Start_969 ()
{	
	TA_Stand_Guarding 	(08,00,10,00,"NW_CITY_HABOUR_HUT_07");
	TA_Stand_Guarding 	(10,00,12,00,"NW_CITY_MAINSTREET_08");
	TA_Stand_Guarding 	(12,00,13,00,"NW_CITY_HABOUR_HUT_07");
	TA_Smalltalk	 	(13,00,14,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding 	(14,00,16,00,"NW_CITY_MAINSTREET_08");
	TA_Stand_Guarding 	(16,00,18,00,"NW_CITY_HABOUR_HUT_07");
	TA_Stand_Guarding 	(18,00,19,00,"NW_CITY_MAINSTREET_08");
	TA_Smalltalk	 	(19,00,20,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding 	(20,00,22,00,"NW_CITY_HABOUR_HUT_07");
	TA_Stand_Guarding 	(22,00,24,00,"NW_CITY_MAINSTREET_08");
	TA_Stand_Guarding 	(00,00,02,00,"NW_CITY_HABOUR_HUT_07");
	TA_Smalltalk	 	(02,00,03,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding 	(03,00,04,00,"NW_CITY_MAINSTREET_08");
	TA_Stand_Guarding 	(04,00,06,00,"NW_CITY_HABOUR_HUT_07");
	TA_Stand_Guarding 	(06,00,07,00,"NW_CITY_MAINSTREET_08");
	TA_Smalltalk	 	(07,00,08,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
};

FUNC VOID Rtn_NoMiliz_969 ()
{	
	TA_Sit_Campfire 	(08,00,09,00,"NW_BIGFARM_HUT_01");
	TA_Sit_Campfire 	(09,00,08,00,"NW_BIGFARM_HUT_01");
};

FUNC VOID Rtn_Armbrust_969 ()
{	
	TA_Sit_Chair 	(08,00,09,00,"NW_CITY_HABOUR_KASERN_15_B");
	TA_Sit_Chair 	(09,00,08,00,"NW_CITY_HABOUR_KASERN_15_B");
};