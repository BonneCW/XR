instance Mod_7031_OUT_Entfuehrer_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Entführer"; 
	guild 		= GIL_OUT;
	id 			= 7031;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart22, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7031;
};

FUNC VOID Rtn_Start_7031()
{	
	TA_Stand_Guarding 	(05,00,06,00,"NW_CITY_JAEGER_12");
	TA_Stand_Guarding 	(06,00,07,00,"NW_CITY_JAEGER_14");
	TA_Stand_Guarding 	(07,00,08,00,"NW_CITY_JAEGER_15");
	TA_Stand_Guarding 	(08,00,09,00,"NW_CITY_JAEGER_16");
	TA_Stand_Guarding 	(09,00,10,00,"NW_CITY_JAEGER_19");
	TA_Stand_Guarding 	(10,00,11,00,"NW_CITY_JAEGER_20");
	TA_Stand_Guarding 	(11,00,12,00,"NW_CITY_JAEGER_12");
	TA_Stand_Guarding 	(12,00,13,00,"NW_CITY_JAEGER_14");
	TA_Stand_Guarding 	(13,00,14,00,"NW_CITY_JAEGER_15");
	TA_Stand_Guarding 	(14,00,15,00,"NW_CITY_JAEGER_16");
	TA_Stand_Guarding 	(15,00,16,00,"NW_CITY_JAEGER_19");
	TA_Stand_Guarding 	(16,00,17,00,"NW_CITY_JAEGER_20");
	TA_Stand_Guarding 	(17,00,18,00,"NW_CITY_JAEGER_12");
	TA_Stand_Guarding 	(18,00,19,00,"NW_CITY_JAEGER_14");
	TA_Stand_Guarding 	(19,00,20,00,"NW_CITY_JAEGER_15");
	TA_Stand_Guarding 	(20,00,21,00,"NW_CITY_JAEGER_16");
	TA_Stand_Guarding 	(21,00,22,00,"NW_CITY_JAEGER_19");
	TA_Stand_Guarding 	(22,00,23,00,"NW_CITY_JAEGER_20");
	TA_Stand_Guarding 	(23,00,24,00,"NW_CITY_JAEGER_12");
	TA_Stand_Guarding 	(24,00,01,00,"NW_CITY_JAEGER_14");
	TA_Stand_Guarding 	(01,00,02,00,"NW_CITY_JAEGER_15");
	TA_Stand_Guarding 	(02,00,03,00,"NW_CITY_JAEGER_16");
	TA_Stand_Guarding 	(03,00,04,00,"NW_CITY_JAEGER_19");
	TA_Stand_Guarding 	(04,00,05,00,"NW_CITY_JAEGER_20");
};

FUNC VOID Rtn_Killer_7031()
{
	TA_RunToWp	(08,00,20,00,"NW_CITY_JAEGER_08");
	TA_RunToWP	(20,00,08,00,"NW_CITY_JAEGER_08");
};
