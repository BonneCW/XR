instance Mod_948_BDT_Esteban_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Esteban";
	guild 		= GIL_OUT;
	id 			= 948;
	voice 		= 7;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//------- AIVAR -------
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Bastardschwert);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_948;
};
FUNC VOID Rtn_Start_948 ()
{	
   	TA_Smalltalk	(08,30,12,00,"LOCATION_11_13");
	TA_Sit_Bench	(12,00,16,00,"LOCATION_11_12_08");
	TA_Smalltalk	(16,00,22,00,"LOCATION_11_12");
	TA_Sit_Campfire	(22,00,08,30,"LOCATION_11_12_05");
};

FUNC VOID Rtn_VM_948()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_17");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_17");
};

FUNC VOID Rtn_INVM_948()
{
	TA_Stand_WP	(08,00,20,00,"OW_VM_ENTRANCE");
	TA_Stand_WP	(20,00,08,00,"OW_VM_ENTRANCE");
};

FUNC VOID Rtn_ANGRIFF_948()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_1_16_8");
	TA_RunToWP	(20,00,08,00,"OW_PATH_1_16_8");
};

FUNC VOID Rtn_Hoehle_948()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Tot_948()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_OrkAttack_948()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_12_09");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_Oschust_948()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_AtPlayer_948()
{
	TA_Follow_Player	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Follow_Player	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_948()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_948()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_948()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_948()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};