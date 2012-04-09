instance Mod_1244_RIT_Ritter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 1244;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_paladin;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough02, BodyTex_L, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1244;
};

FUNC VOID Rtn_Start_1244 ()
{
	TA_Practice_Sword	(07,08,19,01,"NW_CITY_TRAIN_01");
	TA_Smalltalk		(19,01,22,00,"NW_CITY_UPTOWN_HUT_03_01");
	TA_Sleep		(22,00,07,08,"NW_CITY_LEOMAR_BED_03");	
};

FUNC VOID Rtn_Lich_1244 ()
{
	TA_Stand_ArmsCrossed	(07,00,19,00,"NW_CITY_TO_FOREST_03");
	TA_Stand_ArmsCrossed	(19,00,07,00,"NW_CITY_TO_FOREST_03");	
};

FUNC VOID Rtn_Rasend_1244 ()
{
	TA_Stand_ArmsCrossed	(07,00,19,00,"NW_CITY_HABOUR_PUFF_02_01");
	TA_Stand_ArmsCrossed	(19,00,07,00,"NW_CITY_HABOUR_PUFF_02_01");	
};

FUNC VOID Rtn_Pruegel_1244 ()
{
	TA_Smalltalk_Plaudern	(07,00,19,00,"WP_RITTERSCENE_03");
	TA_Smalltalk_Plaudern	(19,00,07,00,"WP_RITTERSCENE_03");	
};