instance Mod_1051_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_BUERGER; 
	guild 		= GIL_PAL;
	id 			= 1051;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1051;
};

FUNC VOID Rtn_PreStart_1051()
{	
	TA_Smalltalk		(05,35,10,55,"NW_CITY_HABOUR_05");
	TA_Fight_Alrik 	(10,55,19,15,"NW_CITY_PATH_HABOUR_16_01");
	TA_Stand_Drinking	(19,15,23,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep			(23,30,05,35,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_02");
};

FUNC VOID Rtn_Start_1051()
{	
	TA_Smalltalk		(05,35,10,55,"NW_CITY_HABOUR_05");
	TA_Stand_ArmsCrossed 	(10,55,19,15,"NW_CITY_WATCH_FIGHT_02");
	TA_Stand_Drinking	(19,15,23,30,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Sleep		(23,30,05,35,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_02");
};
