instance Mod_1056_VLK_Buergerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Buergerin;	
	guild 		= GIL_PAL;
	id 			= 1056;
	voice		= 0;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", 226, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1056;
};

FUNC VOID Rtn_Start_1056 ()
{	
	TA_Smalltalk	(05,00,12,35,"NW_CITY_HABOUR_JACK");
    TA_Smalltalk	(12,35,18,00,"NW_CITY_HABOUR_POOR_AREA_01");
    TA_Sweep_FP		(18,00,22,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_01");
    TA_Sleep		(22,00,05,00,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
};

FUNC VOID Rtn_Surprise_1056 ()
{	
	TA_Smalltalk	(08,00,20,00,"NW_CITY_LARIUS_BED");
	TA_Smalltalk	(20,00,08,00,"NW_CITY_LARIUS_BED");
};
