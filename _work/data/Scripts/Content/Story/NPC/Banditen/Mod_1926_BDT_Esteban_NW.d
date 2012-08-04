instance Mod_1926_BDT_Esteban_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Esteban";
	guild 		= GIL_OUT;
	id 			= 1926;
	voice 		= 7;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//------- AIVAR -------
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Bastardschwert);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ITMI_Addon_Stone_01,5);//MISSIONITEMS!
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1926;
};

FUNC VOID Rtn_Start_1926 ()
{	
   	TA_Smalltalk	(08,30,12,00,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Sit_Bench	(12,00,16,00,"NW_CITY_MERCHANT_SHOP03_FRONT_02_B");
	TA_Smalltalk	(16,00,22,00,"NW_CITY_MERCHANT_PATH_28_B");
	TA_Stand_Drinking	(22,00,08,30,"MARKT");
};

FUNC VOID Rtn_Castlemine_1926 ()
{	
   	TA_Smalltalk		(08,30,12,00,"NW_CASTLEMINE_TOWER_NAVIGATION2");
	TA_Sit_Bench		(12,00,16,00,"NW_CASTLEMINE_HUT_BENCH_CAVE");
	TA_Smalltalk		(16,00,22,00,"NW_CASTLEMINE_TOWER_NAVIGATION2");
	TA_Stand_Drinking	(22,00,08,30,"NW_CASTLEMINE_TOWER_01");
};

FUNC VOID Rtn_Tot_1926()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};