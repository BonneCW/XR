instance Mod_595_MIL_Mario_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mario";
	guild 		= GIL_PAL;
	id 			= 595;
	voice		= 8;
	flags       = 0;	//Joly: NPC_FLAG_IMMORTAL	sonst Plottkiller Kapitel 5																//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	aivar[AIV_ToughGuy]		= TRUE;
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Milizschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Kirgo, BodyTex_B, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1.2);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 85); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_595;
};

FUNC VOID Rtn_Start_595 ()
{	
	TA_Stand_Drinking		(08,00,21,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
   	TA_Stand_Drinking		(21,00,08,00,"NW_CITY_HABOUR_TAVERN01_STAND_01");
};

FUNC VOID Rtn_Teutonica_595 ()
{	
	TA_Smalltalk_KM		(08,00,21,00,"NW_CITY_HABOUR_TAVERN01_01");
   	TA_Smalltalk_KM		(21,00,08,00,"NW_CITY_HABOUR_TAVERN01_01");
};

FUNC VOID Rtn_Guide_595 ()
{	
	TA_Guide_Player		(08,00,21,00,"WP_MARIOTOUR_04");
   	TA_Guide_Player		(21,00,08,00,"WP_MARIOTOUR_04");
};

FUNC VOID Rtn_GuideToGobbos_595 ()
{	
	TA_Guide_Player		(08,00,21,00,"NW_CITY_TO_FOREST_04_05");
   	TA_Guide_Player		(21,00,08,00,"NW_CITY_TO_FOREST_04_05");
};

FUNC VOID Rtn_Ritter_595 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"NW_CITY_UPTOWN_PATH_17");
   	TA_Stand_Guarding		(21,00,08,00,"NW_CITY_UPTOWN_PATH_17");
};

FUNC VOID Rtn_Kampf_595 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"NW_CITY_UPTOWNPARADE");
   	TA_Stand_Guarding		(21,00,08,00,"NW_CITY_UPTOWNPARADE");
};

FUNC VOID Rtn_Patrouille_595 ()
{
	TA_Stand_Guarding		(08,00,10,30,"NW_CITY_MAINSTREET_01_01");
   	TA_Stand_Guarding		(10,30,13,00,"NW_CITY_MAINSTREET_03");
   	TA_Stand_Guarding		(13,00,15,30,"NW_CITY_MERCHANT_PATH_06");
   	TA_Stand_Guarding		(15,30,18,00,"NW_CITY_MERCHANT_PATH_16");
   	TA_Stand_Guarding		(18,00,20,30,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	TA_Stand_Guarding		(20,30,23,00,"NW_CITY_MAINSTREET_01_01");
   	TA_Stand_Guarding		(23,00,01,30,"NW_CITY_MAINSTREET_03");
   	TA_Stand_Guarding		(01,30,04,00,"NW_CITY_MERCHANT_PATH_06");
   	TA_Stand_Guarding		(04,00,06,30,"NW_CITY_MERCHANT_PATH_16");
   	TA_Stand_Guarding		(06,30,08,00,"NW_CITY_MERCHANT_TAVERN01_FRONT");
};

FUNC VOID Rtn_Knast_595 ()
{	
	TA_RunToWP		(08,00,21,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
   	TA_RunToWP		(21,00,08,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
};

FUNC VOID Rtn_Flucht_595 ()
{	
	TA_RunToWP		(08,00,21,00,"MAUER_KHORINIS_04");
   	TA_RunToWP		(21,00,08,00,"MAUER_KHORINIS_04");
};

FUNC VOID Rtn_Tot_595 ()
{	
	TA_RunToWP		(08,00,21,00,"TOT");
   	TA_RunToWP		(21,00,08,00,"TOT");
};