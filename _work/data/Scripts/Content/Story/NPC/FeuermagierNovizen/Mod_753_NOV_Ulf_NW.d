INSTANCE Mod_753_NOV_Ulf_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ulf";
	guild 		= GIL_VLK;
	id 			= 753;
	voice 		= 28;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
																
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak05, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_753;
};

FUNC VOID Rtn_Start_753()
{	
	TA_Stand_Drinking	(08,00,20,00,"NW_CITY_BEER_04");
   	TA_Stand_Drinking	(20,00,08,00,"NW_CITY_BEER_04");
};

FUNC VOID Rtn_Daemonisch_753()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HABOUR_TAVERN01_IN");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HABOUR_TAVERN01_IN");
};

FUNC VOID Rtn_Daemonisch2_753()
{	
	TA_FleeToWP	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_FleeToWP	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Daemonisch3_753()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Freibier_753()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_CITY_BEER_04");
   	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_CITY_BEER_04");
};