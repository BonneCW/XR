instance Mod_1730_MIL_Lawrence_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lawrence";	
	guild 		= GIL_out;
	id 			= 1730;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1730;
};

FUNC VOID Rtn_Start_1730()
{	
	TA_Stand_Guarding	(08,00,20,00,"NW_CITY_UPTOWN_HUT_04_ENTRY");
    TA_Stand_Guarding		(20,00,08,00,"NW_CITY_UPTOWN_HUT_04_ENTRY");
};

FUNC VOID Rtn_Larius_1730()
{	
	TA_Smalltalk	(08,00,20,00,"NW_CITYHALL_OFFICE_03");
    TA_Smalltalk		(20,00,08,00,"NW_CITYHALL_OFFICE_03");
};

FUNC VOID Rtn_Plaudern_1730()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_CITYHALL_OFFICE_03");
    TA_Smalltalk_Plaudern		(20,00,08,00,"NW_CITYHALL_OFFICE_03");
};

FUNC VOID Rtn_After_1730()
{	
	TA_Stand_WP	(08,00,20,00,"NW_CITY_CITYHALL_08");
    TA_Stand_WP		(20,00,08,00,"NW_CITY_CITYHALL_08");
};

FUNC VOID Rtn_Normal_1730()
{	
	TA_Stand_WP	(01,00,23,00,"NW_CITY_UPTOWNPARADE_11");
    TA_Stand_WP		(23,00,01,00,"NW_CITY_UPTOWNPARADE_11");
};

FUNC VOID Rtn_Angriff_1730()
{	
	TA_Stand_WP	(08,00,20,00,"WP_LAWRENCE");
    TA_Stand_WP		(20,00,08,00,"WP_LAWRENCE");
};