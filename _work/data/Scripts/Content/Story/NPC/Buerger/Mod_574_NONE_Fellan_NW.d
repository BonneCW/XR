instance Mod_574_NONE_Fellan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fellan"; 
	guild 		= GIL_OUT;
	id 			= 574;
	voice		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_574;
};

FUNC VOID Rtn_Start_574()
{	
	TA_Sit_Bench		(04,30,08,00,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sit_Bench		(08,00,12,00,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sit_Bench		(12,00,16,00,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sit_Bench		(16,00,20,00,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sit_Bench		(20,00,21,30,"NW_CITY_HABOUR_REPAIR_03");
	TA_Sleep			(21,30,04,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

FUNC VOID Rtn_Repair_574()
{	
	TA_Repair_Hut		(04,30,08,00,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut		(08,00,12,00,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut		(12,00,16,00,"NW_CITY_PATH_HABOUR_09");
	TA_Repair_Hut		(16,00,20,00,"NW_CITY_HABOUR_REPAIR_04");
	TA_Repair_Hut		(20,00,21,30,"NW_CITY_PATH_HABOUR_09");
	TA_Sleep			(21,30,04,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

FUNC VOID Rtn_AtWilfried_574()
{
        TA_Sleep	(22,00,07,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
	TA_Sit_Chair	(07,00,22,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_02");
};

FUNC VOID Rtn_AtWilfried2_574()
{
        TA_Sleep	(22,00,07,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
	TA_Repair_Hut	(07,00,22,00,"NW_CITY_HABOUR_BENCH_01");
};