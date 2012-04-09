instance Mod_1184_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	
	guild 		= GIL_pal;
	id 			= 1184;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1184;
};

FUNC VOID Rtn_Start_1184()
{	
	TA_Stand_Guarding	(06,45,21,05,"NW_CITY_HABOUR_KASERN_OFFICE");
    TA_Smalltalk		(21,05,23,59,"NW_CITY_HABOUR_KASERN_BARRACK02_IN");
    TA_Sleep			(23,59,06,45,"NW_CITY_BARRACK02_BED_WULFGAR");
};
