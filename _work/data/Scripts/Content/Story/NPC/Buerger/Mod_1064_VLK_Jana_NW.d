instance Mod_1064_VLK_Jana_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jana";	
	guild 		= GIL_PAL;
	id 			= 1064;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1064;
};

FUNC VOID Rtn_Start_1064 ()
{	
	TA_Smalltalk	(08,00,18,00,"NW_CITY_HABOUR_09");
	TA_Sleep	(18,00,08,00,"NW_CITY_HABOUR_HUT_06_BED_01");
};

FUNC VOID Rtn_Bernd_1064()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HABOUR_HUT_06_BED_02");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HABOUR_HUT_06_BED_02");
};

FUNC VOID Rtn_Einkauf_1064()
{
	TA_Stand_ArmsCrossed	(06,00,19,00,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_ArmsCrossed	(19,00,06,00,"NW_CITY_HABOUR_HUT_06_BED_01");
};