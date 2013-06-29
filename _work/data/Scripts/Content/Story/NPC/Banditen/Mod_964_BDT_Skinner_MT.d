instance Mod_964_BDT_Skinner_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skinner";
	guild 		= GIL_OUT;
	id 			= 964;
	voice 		= 24;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	//Aivars
	aivar[AIV_StoryBandit] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_964;
};
FUNC VOID Rtn_Start_964 ()
{
	TA_Sleep (09,00,21,00,"LOCATION_11_11");
	TA_Sleep  (21,00,09,00,"LOCATION_11_11");		
};
FUNC VOID Rtn_WantToTellMore_964 ()
{
	TA_Stand_WP (09,00,21,00,"LOCATION_11_11");
	TA_Stand_WP  (21,00,09,00,"LOCATION_11_11");		
};

FUNC VOID Rtn_Hoehle_964()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Lager_964()
{
	TA_RunToWP	(08,00,20,00,"OW_PATH_188");
	TA_RunToWP	(20,00,08,00,"OW_PATH_188");
};

FUNC VOID Rtn_Orkjagd_964()
{
	TA_Follow_Player	(08,00,20,00,"OW_PATH_WOLF08_SPAWN01");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_WOLF08_SPAWN01");
};

FUNC VOID Rtn_Tot_964()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Oschust_964()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_964()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_964()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_964()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_964()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};