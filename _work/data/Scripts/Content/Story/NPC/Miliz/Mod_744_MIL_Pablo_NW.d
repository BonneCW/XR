instance Mod_744_MIL_Pablo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pablo";	
	guild 		= GIL_PAL;
	id 			= 744;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_01,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_744;
};

FUNC VOID Rtn_Start_744()
{	
	TA_Stand_Guarding	(01,00,02,00,"NW_CITY_MAINSTREET_07");
	TA_Smalltalk	 	(02,00,03,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding	(03,00,05,00,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding	(05,00,07,00,"NW_CITY_MERCHANT_PATH_22");
	TA_Smalltalk	 	(07,00,08,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding	(08,00,09,00,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding	(09,00,11,00,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding	(11,00,13,00,"NW_CITY_MERCHANT_PATH_22");
	TA_Smalltalk	 	(13,00,14,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding	(14,00,15,00,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding	(15,00,17,00,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding	(17,00,19,00,"NW_CITY_MERCHANT_PATH_22");
	TA_Smalltalk	 	(19,00,20,00,"NW_CITY_MERCHANT_TOWER_03_FRONT");
	TA_Stand_Guarding	(20,00,21,00,"NW_CITY_MAINSTREET_07");
	TA_Stand_Guarding	(21,00,23,00,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	TA_Stand_Guarding	(23,00,01,00,"NW_CITY_MERCHANT_PATH_22");
};

FUNC VOID Rtn_Laterne_744 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_HABOUR_PUFF_IN_01");
	TA_Stand_Guarding	(23,00,08,00,"NW_CITY_HABOUR_PUFF_IN_01");	
};

FUNC VOID Rtn_Zimmer_744 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_SONJA_BED");
	TA_Stand_Guarding	(23,00,08,00,"NW_CITY_SONJA_BED");	
};

FUNC VOID Rtn_Nase_744()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis_744()
{	
	TA_Follow_Player	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Follow_Player	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis2_744()
{	
	TA_Pick_FP		(08,00,20,00,"WP_ASSASSINE_08");
   	TA_Pick_FP		(20,00,08,00,"WP_ASSASSINE_08");
};

FUNC VOID Rtn_Dieb_744 ()
{	
	TA_Stand_ArmsCrossed		(09,00,21,00,"NW_CITY_KANAL_25");
   	TA_Stand_ArmsCrossed		(21,00,09,00,"NW_CITY_KANAL_25");
};

FUNC VOID Rtn_Dieb2_744 ()
{	
	TA_RunToWP		(09,00,21,00,"NW_CITY_KANAL_ROOM_05_01");
   	TA_RunToWP		(21,00,09,00,"NW_CITY_KANAL_ROOM_05_01");
};