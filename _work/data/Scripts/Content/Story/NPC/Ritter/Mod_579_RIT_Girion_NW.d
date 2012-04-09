instance Mod_579_RIT_Girion_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Girion";
	guild 		= GIL_PAL;
	id 			= 579;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_Schwert_02);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Lefty, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_579;
};

FUNC VOID Rtn_Start_579 ()
{
    TA_Practice_Sword		(06,00,07,03,"NW_CITY_GIRION");	
    TA_Stand_ArmsCrossed	(07,03,19,00,"NW_CITY_GIRION");
    TA_Sit_Throne		(19,00,22,00,"NW_CITY_UPTOWN_HUT_03_SIT");
    TA_Sleep			(22,00,06,00,"NW_CITY_LEOMAR_BED_02");	
};

FUNC VOID Rtn_Sld_579 ()
{
	TA_Stand_Guarding		(07,55,21,55,"NW_BIGFARM_HOUSE_12");
	TA_Stand_Eating			(21,55,23,55,"NW_BIGFARM_HOUSE_UP2_06");
	TA_Sleep				(23,55,07,55,"NW_BIGFARM_HOUSE_UP2_02");
};

FUNC VOID Rtn_Pruegel_579 ()
{
	TA_Smalltalk_Plaudern	(07,00,19,00,"WP_RITTERSCENE_04");
	TA_Smalltalk_Plaudern	(19,00,07,00,"WP_RITTERSCENE_04");	
};