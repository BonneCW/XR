instance Mod_7030_OUT_Entfuehrer_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Entführer"; 
	guild 		= GIL_OUT;
	id 			= 7030;
	voice		= 5;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7030;
};

FUNC VOID Rtn_Start_7030()
{	
	TA_Stand_Guarding	(05,15,06,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(06,00,06,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(06,15,07,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(07,00,07,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(07,15,08,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(08,00,08,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(08,15,09,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(09,00,09,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(09,15,10,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(10,00,10,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(10,15,11,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(11,00,11,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(11,15,12,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(12,00,12,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(12,15,13,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(13,00,13,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(13,15,14,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(14,00,14,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(14,15,15,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(15,00,15,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(15,15,16,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(16,00,16,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(16,15,17,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(17,00,17,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(17,15,18,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(18,00,18,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(18,15,19,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(19,00,19,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(19,15,20,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(20,00,20,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(20,15,21,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(21,00,21,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(21,15,22,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(22,00,22,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(22,15,23,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(23,00,23,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(23,15,24,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(24,00,00,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(00,15,01,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(01,00,01,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(01,15,02,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(02,00,02,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(02,15,03,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(03,00,03,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(03,15,04,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(04,00,04,15,"WP_PINKELPAUSE");
	TA_Stand_Guarding	(04,15,05,00,"NW_CITY_JAEGER_13");
	TA_RunToPee 		(05,00,05,15,"WP_PINKELPAUSE");
};

FUNC VOID Rtn_Flucht_7030()
{
	TA_RunToWP	(08,00,20,00,"TOT");
	TA_RunToWP	(20,00,08,00,"TOT");
};
