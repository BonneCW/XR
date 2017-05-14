instance Mod_7806_BDT_Dexter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dexter"; 
	guild 		= GIL_OUT;
	id 			= 7806;
	voice		= 0;
	flags       = 2;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Fantasyschwert_01);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	daily_routine = Rtn_Start_7806;
};
 
// ------ TA ------
FUNC VOID RTn_Start_7806()
{
	TA_Stand_WP	(08,00,20,00,"NW_CASTLEMINE_PATH_02");
	TA_Stand_WP	(20,00,08,00,"NW_CASTLEMINE_PATH_02");
};

FUNC VOID Rtn_Sessel_7806()
{
	TA_Sit_Throne	(08,00,20,00,"NW_CASTLEMINE_HUT_10");
	TA_Sit_Throne	(20,00,08,00,"NW_CASTLEMINE_HUT_10");
};