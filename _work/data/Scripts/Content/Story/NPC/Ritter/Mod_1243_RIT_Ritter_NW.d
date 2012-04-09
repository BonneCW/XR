instance Mod_1243_RIT_Ritter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 1243;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Tough01, BodyTex_L, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1243;
};

FUNC VOID Rtn_Start_1243 ()
{
	TA_Smalltalk		(07,05,19,05,"NW_CITY_UPTOWN_PATH_05");
	TA_Read_Bookstand 	(19,05,22,00,"NW_CITY_UPTOWN_HUT_03_03");
	TA_Sleep		(22,00,07,05,"NW_CITY_LEOMAR_BED_05");	
};

FUNC VOID Rtn_Lich_1243 ()
{
	TA_Stand_ArmsCrossed	(07,00,19,00,"NW_CITY_TO_FOREST_03");
	TA_Stand_ArmsCrossed	(19,00,07,00,"NW_CITY_TO_FOREST_03");	
};
