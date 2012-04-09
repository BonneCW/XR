instance Mod_1197_VLK_Valentine_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Valentine";	
	guild 		= GIL_pal;
	id 			= 1197;
	voice 		= 16;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);	

	aivar[AIV_IGNORE_Murder]		= TRUE;														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ITAR_Buergerinkleid8);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1197;
};

FUNC VOID Rtn_Start_1197 ()
{	
	TA_Sleep			(21,45,06,30,"NW_CITY_REICH03_BED_02");
	TA_Stand_Sweeping	(06,30,08,00,"NW_CITY_UPTOWN_HUT_02_ENTRY");
	TA_Cook_Stove		(08,00,10,00,"NW_CITY_REICH03_COOK");
	TA_Smalltalk		(10,00,14,00,"NW_CITY_UPTOWN_PATH_15_B");
	TA_Sweep_FP			(14,00,15,30,"NW_CITY_UPTOWN_HUT_02_IN");
	TA_Cook_Stove		(15,30,17,00,"NW_CITY_REICH03_COOK");
	TA_Smalltalk		(17,00,21,45,"NW_CITY_UPTOWN_PATH_15_B");
};

FUNC VOID Rtn_Valentino_1197 ()
{
	TA_Guide_Player	(08,00,20,00,"NW_CITY_TO_LIGHTHOUSE_04");
	TA_Guide_Player	(20,00,08,00,"NW_CITY_TO_LIGHTHOUSE_04");
};

FUNC VOID Rtn_FirstGangster_1197 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_TO_LIGHTHOUSE_04");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_TO_LIGHTHOUSE_04");
};

FUNC VOID Rtn_ToZelt_1197 ()
{
	TA_Guide_Player	(08,00,20,00,"NW_CITY_JAEGER_08");
	TA_Guide_Player	(20,00,08,00,"NW_CITY_JAEGER_08");
};

FUNC VOID Rtn_AtZelt_1197 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_JAEGER_08");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_JAEGER_08");
};

FUNC VOID Rtn_InZelt_1197 ()
{
	TA_RunToWP	(08,00,20,00,"NW_CITY_JAEGER_17");
	TA_RunToWP	(20,00,08,00,"NW_CITY_JAEGER_17");
};