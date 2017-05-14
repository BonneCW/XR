instance Mod_957_BDT_Logan_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Logan";
	guild 		= GIL_OUT;
	id 			= 957;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//aivars
	aivar[AIV_NewsOverride] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	EquipItem (self, ItRw_Bow_M_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Cipher_neu, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_957;
};
FUNC VOID Rtn_Start_957 ()
{
	TA_Smalltalk	(12,30,18,00,"LOCATION_11_07"); 
	TA_Sit_Campfire	(18,00,12,30,"LOCATION_11_12_03");			
};

FUNC VOID Rtn_Hoehle_957()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Tot_957()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Oschust_957()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_957()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_957()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_957()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_957()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_AL_957()
{
	TA_RunToWP	(08,00,20,00,"OCR_OUTSIDE_HUT_1");
	TA_RunToWP	(20,00,08,00,"OCR_OUTSIDE_HUT_1");
};

FUNC VOID Rtn_Ablenkung_957()
{
	TA_RunToWP	(08,00,20,00,"OCC_BARONS_RIGHT_STAIRCASE");
	TA_RunToWP	(20,00,08,00,"OCC_BARONS_RIGHT_STAIRCASE");
};