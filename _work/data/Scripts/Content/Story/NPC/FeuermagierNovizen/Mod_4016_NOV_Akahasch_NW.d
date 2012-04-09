INSTANCE Mod_4016_NOV_Akahasch_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Akahasch";
	guild 		= GIL_VLK;
	id 			= 4016;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItMi_Weinlieferung, 1);
	CreateInvItems	(self, ItWr_AkahaschNagur, 1);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4016;
};

FUNC VOID Rtn_Start_4016 ()
{	
	TA_Sit_Bench	(08,00,20,00,"NW_CITY_JAEGER_SIT");
	TA_Sit_Bench	(20,00,08,00,"NW_CITY_JAEGER_SIT");
};

FUNC VOID Rtn_Follow_4016 ()
{	
	TA_Follow_Player	(08,00,20,00,"NW_MONASTERY_ENTRY_01");
	TA_Follow_Player	(20,00,08,00,"NW_MONASTERY_ENTRY_01");    
};

FUNC VOID Rtn_Kloster_4016 ()
{	
	TA_Pick_FP	(06,00,21,00,"NW_MONSTERY_HERB_01");
	TA_Stomp_Herb	(21,00,03,00,"NW_MONASTERY_WINEMAKER_04");
	TA_Sleep	(03,00,06,00,"NW_MONASTERY_NOVICE03_06");    
};

FUNC VOID Rtn_Kloster2_4016 ()
{	
	TA_Sit_Campfire	(08,00,20,00,"NW_MONASTERY_CORRIDOR_02");
	TA_Sleep	(20,00,08,00,"NW_MONASTERY_NOVICE03_06");    
};

FUNC VOID Rtn_Tot_4016 ()
{	
	TA_Sleep	(08,00,20,00,"TOT");
	TA_Sleep	(20,00,08,00,"TOT");    
};