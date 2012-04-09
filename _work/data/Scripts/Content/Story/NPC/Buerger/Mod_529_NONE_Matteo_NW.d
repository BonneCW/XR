INSTANCE Mod_529_NONE_Matteo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Matteo";
	guild 		= GIL_PAL;
	id 			= 529;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	// Händler
	

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Gomez , BodyTex_N, ITAR_VLK_H);
	Mdl_SetModelFatness	(self, 1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_529;
};

FUNC VOID Rtn_Start_529 ()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_MATTEO");
   	TA_Sleep		(22,00,08,00,"NW_CITY_BED_MATTEO");
};

FUNC VOID Rtn_TagPause_529 ()
{
	TA_Stand_ArmsCrossed	(08,00,10,00,"NW_CITY_MATTEO");
	TA_RunToWP		(10,00,10,30,"NW_CITY_MAINSTREET_05");
	TA_Stand_ArmsCrossed	(10,30,22,00,"NW_CITY_MATTEO");
   	TA_Sleep		(22,00,08,00,"NW_CITY_BED_MATTEO");
};