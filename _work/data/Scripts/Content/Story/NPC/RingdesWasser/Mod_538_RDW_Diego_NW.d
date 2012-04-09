INSTANCE Mod_538_RDW_Diego_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Diego";
	guild 		= GIL_OUT;
	id 			= 538;
	voice 		= 11;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ aivar ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
	EquipItem	(self, ItMw_AdanosKurzschwert);																	
	EquipItem (self, ItRw_Bow_War_05);
	CreateInvItems	(self, ItRw_Arrow, 1000);  
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_L_Diego, BodyTex_L, ITAR_RANGER_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_538;
};

FUNC VOID Rtn_Start_538()
{	
	TA_Stand_Guarding   (08,00,20,00,"NW_CITY_HABOUR_02_B");
	TA_Stand_Guarding	(20,00,08,00,"NW_CITY_HABOUR_02_B");
};

FUNC VOID Rtn_AtMika_538()
{	
	TA_Stand_Guarding	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
	TA_Stand_Guarding	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Lighthouse_538()
{	
	TA_Guide_Player		(08,00,20,00,"WP_DIEGO_ERINNERUNG_03");
	TA_Guide_Player		(20,00,08,00,"WP_DIEGO_ERINNERUNG_03");
};

FUNC VOID Rtn_Treffen_538()
{	
	TA_Stand_Guarding 	(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");	
	TA_Stand_Guarding	(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING");
};

FUNC VOID Rtn_Kristall_538()
{	
	TA_Pick_FP 	(05,00,20,00,"NW_CITY_KANAL_ROOM_02_02");	
	TA_Pick_FP	(20,00,05,00,"NW_CITY_KANAL_ROOM_02_02");
};

FUNC VOID Rtn_Gerbrandt_538()
{	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_UPTOWN_PATH_23");	 
	TA_Stand_WP	(23,00,08,00,"NW_CITY_UPTOWN_PATH_23");
};

FUNC VOID Rtn_Sammeln_538 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_538 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_538 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};

FUNC VOID Rtn_Schiff_538()
{	
	TA_Sit_Bench	(08,00,20,00,"SHIP_DECK_25");
	TA_Sit_Bench	(20,00,08,00,"SHIP_DECK_25");
};

FUNC VOID Rtn_Rasend_538()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_TROLLAREA_RUINS_11");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_TROLLAREA_RUINS_11");
};

FUNC VOID Rtn_Daemonisch_538()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_CITY_HABOUR_TAVERN01_01");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_TAVERN01_01");
};

FUNC VOID Rtn_Daemonisch2_538()
{
	TA_RunToWP	(08,00,22,00,"NW_CITY_HABOUR_TAVERN01_ENTRY");
	TA_RunToWP	(22,00,08,00,"NW_CITY_HABOUR_TAVERN01_ENTRY");
};

FUNC VOID Rtn_Follow_538()
{	
	TA_Follow_Player	(08,00,20,00,"NW_CITY_HABOUR_02_B");
	TA_Follow_Player	(20,00,08,00,"NW_CITY_HABOUR_02_B");
};

FUNC VOID Rtn_AtXardas_538()
{
	TA_Smalltalk_Plaudern		(08,00,20,00,"NW_XARDAS_TOWER_IN1_25");
	TA_Smalltalk_Plaudern		(20,00,08,00,"NW_XARDAS_TOWER_IN1_25");
};