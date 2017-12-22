instance Mod_1065_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_PAL;
	id 			= 1065;
	voice		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_BuergerinNew_01);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1065;
};

FUNC VOID Rtn_PreStart_1065 ()
{	
	TA_Sit_Bench			(05,10,08,00,"NW_CITY_HABOUR_BENCH_02");
	TA_Listen_Monty			(08,00,20,00,"WP_MONTY_BLUBBER_03");
	TA_Sit_Bench			(20,00,22,55,"NW_CITY_HABOUR_BENCH_02");
	TA_Sleep			(22,55,05,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

FUNC VOID Rtn_Start_1065 ()
{	
	TA_Sit_Bench			(05,10,10,10,"NW_CITY_HABOUR_BENCH_02");
	TA_Stand_Sweeping		(10,10,12,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_IN");
	TA_Stomp_Herb 			(12,10,16,05,"NW_CITY_HABOUR_POOR_AREA_PATH_06_B");
	TA_Smalltalk			(16,05,19,05,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
    TA_Sit_Bench			(19,05,22,55,"NW_CITY_HABOUR_BENCH_02");
    TA_Sleep				(22,55,05,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};
