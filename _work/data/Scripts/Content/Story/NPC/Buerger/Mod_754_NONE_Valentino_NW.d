instance Mod_754_NONE_Valentino_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Valentino"; 
	guild 		= GIL_PAL;
	id 			= 754;
	voice 		= 3;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
	aivar[AIV_IGNORE_Murder]		= TRUE;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1H_Eminem_AchillesSchwert_01); 
		
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 200);
	CreateInvItems 	(self,ItKe_Valentino,1);
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald.", Face_N_Normal03, BodyTex_N, ITAR_BuergerNew_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_754;
};

FUNC VOID Rtn_Start_754 ()
{	
	TA_Stand_ArmsCrossed 	(10,00,20,00,"NW_CITY_MERCHANT_PATH_16");
	TA_Sit_Chair			(20,00,04,00,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	TA_Sleep				(04,00,10,00,"NW_CITY_REICH03_BED_01");
};

FUNC VOID Rtn_Gefangen_754()
{
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};

FUNC VOID Rtn_Kidnapped_754()
{
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_JAEGER_17");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_JAEGER_17");
};

FUNC VOID Rtn_Daemonisch_754()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HABOUR_TAVERN01_IN");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HABOUR_TAVERN01_IN");
};

FUNC VOID Rtn_Tot_754()
{
	TA_Sit_Campfire	(08,00,20,00,"TOT");
	TA_Sit_Campfire	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Daemonisch2_754()
{	
	TA_FleeToWP	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_FleeToWP	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Daemonisch3_754()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Spuk_754 ()
{	
	TA_Stand_ArmsCrossed 	(10,00,20,00,"NW_CITY_MERCHANT_PATH_16");
	TA_Sit_Chair		(20,00,22,00,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	TA_Smalltalk		(22,00,07,45,"NW_CITY_UPTOWN_HUT_03_04");
	TA_Sleep		(07,45,10,00,"NW_CITY_REICH03_BED_01");
};