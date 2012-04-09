instance Mod_1178_MIL_Jason_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jason";	
	guild 		= GIL_PAL;
	id 			= 1178;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1178;
};

FUNC VOID Rtn_Start_1178()
{	
	TA_Smalltalk			(21,00,23,59,"NW_CITY_BARRACK02_SMALLTALK_01");
    TA_Sleep				(23,59,06,30,"NW_CITY_BARRACK01_BED_02");
	
	TA_Stand_Guarding		(06,30,07,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding		(07,30,08,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding		(08,30,09,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding		(09,30,10,30,"NW_CITY_HABOUR_KASERN_08");
	
	TA_Stand_Guarding		(10,30,11,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding		(11,30,12,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding		(12,30,13,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding		(13,30,14,30,"NW_CITY_HABOUR_KASERN_08");
	
	TA_Stand_Guarding		(14,30,15,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding		(15,30,16,30,"NW_CITY_HABOUR_KASERN_12");
	TA_Stand_Guarding		(16,30,17,30,"NW_CITY_HABOUR_KASERN_10");
	TA_Stand_Guarding		(17,30,18,30,"NW_CITY_HABOUR_KASERN_08");
	
	TA_Stand_Guarding		(18,30,19,30,"NW_CITY_HABOUR_KASERN_14");
	TA_Stand_Guarding		(19,30,21,00,"NW_CITY_HABOUR_KASERN_12");	
	
};

FUNC VOID Rtn_Laterne_1178 ()
{
	TA_Stand_WP	(08,00,23,00,"NW_CITY_SONJA_BED");
    TA_Stand_WP	(23,00,08,00,"NW_CITY_SONJA_BED");	
};
