instance Mod_1054_VLK_Nimius_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nimius"; 
	guild 		= GIL_PAL;
	id 			= 1054;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Normal_Erpresser, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1054;
};

FUNC VOID Rtn_Start_1054()
{	
	TA_Stand_Eating				(08,00,22,00,"NW_CITY_HABOUR_FIREPLACE_01");
    TA_Sleep					(22,00,08,00,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};
