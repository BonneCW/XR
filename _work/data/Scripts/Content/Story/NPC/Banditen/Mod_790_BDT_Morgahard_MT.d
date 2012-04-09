instance Mod_790_BDT_Morgahard_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morgahard"; 
	guild 		= GIL_OUT;
	id 			= 790;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	//aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG ;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Banditenschwert); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);								
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bartholo, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_790;
};

FUNC VOID Rtn_Start_790 ()
{	
	TA_Smalltalk	(16,00,22,00,"LOCATION_11_12"); 
	TA_Sit_Bench	(22,00,16,00,"LOCATION_11_12_07");
};

FUNC VOID Rtn_Hoehle_790()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Tot_790()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Oschust_790()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_790()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_790()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_790()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_790()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_AL_790()
{
	TA_RunToWP	(08,00,20,00,"OCR_OUTSIDE_HUT_1");
	TA_RunToWP	(20,00,08,00,"OCR_OUTSIDE_HUT_1");
};

FUNC VOID Rtn_Ablenkung_790()
{
	TA_RunToWP	(08,00,20,00,"OCC_BARONS_RIGHT_STAIRCASE");
	TA_RunToWP	(20,00,08,00,"OCC_BARONS_RIGHT_STAIRCASE");
};