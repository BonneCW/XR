INSTANCE Mod_4074_BDT_Bandit_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Bandit;
	guild 		= GIL_out;
	id 			= 4074;
	voice 		= 03;
	flags       = 0;																	
	npctype		= NPCTYPE_mt_bandit;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal08, BodyTex_N, ITAR_bdt_m_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4074;
};

FUNC VOID Rtn_Start_4074 ()
{	
	TA_Pick_Ore		(08,00,20,00,"HOEHLE_12");
    	TA_Pick_Ore		(20,00,08,00,"HOEHLE_12");
};

FUNC VOID Rtn_VM_4074()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_17");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_17");
};

FUNC VOID Rtn_INVM_4074()
{
	TA_RunToWP	(08,00,20,00,"WP_INTRO_FALL3");
	TA_RunToWP	(20,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_ANGRIFF_4074()
{
	TA_Stand_WP	(08,00,20,00,"WP_INTRO_FALL3");
	TA_Stand_WP	(20,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_Orkjagd_4074()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_188");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_188");
};

FUNC VOID Rtn_Hoehle_4074()
{
	TA_Follow_Player	(08,00,20,00,"OW_PATH_WOLF08_SPAWN01");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_WOLF08_SPAWN01");
};

FUNC VOID Rtn_Tot_4074()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Oschust_4074()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_4074()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_4074()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_4074()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_4074()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};