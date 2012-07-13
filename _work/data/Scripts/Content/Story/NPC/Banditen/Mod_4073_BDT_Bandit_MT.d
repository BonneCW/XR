INSTANCE Mod_4073_BDT_Bandit_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Bandit;
	guild 		= GIL_out;
	id 			= 4073;
	voice 		= 08;
	flags       = 0;																	
	npctype		= NPCTYPE_mt_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_bdt_m_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4073;
};

FUNC VOID Rtn_Start_4073 ()
{	
	TA_Pick_Ore	(08,00,20,00,"HOEHLE_10");
	TA_Pick_Ore	(20,00,08,00,"HOEHLE_10");
};

FUNC VOID Rtn_VM_4073()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_17");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_17");
};

FUNC VOID Rtn_INVM_4073()
{
	TA_RunToWP	(08,00,20,00,"WP_INTRO_FALL3");
	TA_RunToWP	(20,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_ANGRIFF_4073()
{
	TA_RunToWP	(08,00,20,00,"WP_INTRO_FALL3");
	TA_RunToWP	(20,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_Orkjagd_4073()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_188");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_188");
};

FUNC VOID Rtn_Hoehle_4073()
{
	TA_Follow_Player	(08,00,20,00,"OW_PATH_WOLF08_SPAWN01");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_WOLF08_SPAWN01");
};

FUNC VOID Rtn_Rettung_4073()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_Tot_4073()
{
	TA_FleeToWP	(08,00,20,00,"TOT");
	TA_FleeToWP	(20,00,08,00,"TOT");
};