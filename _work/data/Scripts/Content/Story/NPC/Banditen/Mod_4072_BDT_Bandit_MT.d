INSTANCE Mod_4072_BDT_Bandit_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Bandit;
	guild 		= GIL_out;
	id 			= 4072;
	voice 		= 8;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_BDT_M_01);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4072;
};

FUNC VOID Rtn_Start_4072 ()
{	
	TA_Pick_Ore	(08,00,23,00,"HOEHLE_11");
	TA_Pick_Ore	(23,00,08,00,"HOEHLE_11");
};

FUNC VOID Rtn_VM_4072()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_1_17");
	TA_RunToWP	(20,00,08,00,"OW_PATH_1_17");
};

FUNC VOID Rtn_INVM_4072()
{
	TA_RunToWP	(08,00,20,00,"OW_VM_ENTRANCE");
	TA_RunToWP	(20,00,08,00,"OW_VM_ENTRANCE");
};

FUNC VOID Rtn_ANGRIFF_4072()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_1_16_8");
	TA_RunToWP	(20,00,08,00,"OW_PATH_1_16_8");
};

FUNC VOID Rtn_Orkjagd_4072()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_188");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_188");
};

FUNC VOID Rtn_Hoehle_4072()
{
	TA_Follow_Player	(08,00,20,00,"OW_PATH_WOLF08_SPAWN01");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_WOLF08_SPAWN01");
};

FUNC VOID Rtn_Oschust_4072()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_184");
	TA_RunToWP	(20,00,08,00,"OW_PATH_184");
};

FUNC VOID Rtn_Rettung_4072()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_Tot_4072()
{
	TA_FleeToWP	(08,00,20,00,"TOT");
	TA_FleeToWP	(20,00,08,00,"TOT");
};