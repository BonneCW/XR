instance Mod_958_BDT_Miguel_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miguel";
	guild 		= GIL_OUT;
	id 			= 958;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, Itpo_health_01, 20);
	CreateInvItems (self, Itpo_health_02, 8);
	CreateInvItems (self, Itpo_health_03, 5);
	CreateInvItems (self, Itpo_mana_01, 7);
		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_958;
};
FUNC VOID Rtn_Start_958()
{
	TA_Stand_ArmsCrossed	(06,00,18,00,"LOCATION_11_12_04");
	TA_Stand_ArmsCrossed	(18,00,06,00,"LOCATION_11_12_04");
};

FUNC VOID Rtn_Hoehle_958()
{
	TA_Stand_WP	(08,00,20,00,"LOCATION_11_11");
	TA_Stand_WP	(20,00,08,00,"LOCATION_11_11");
};

FUNC VOID Rtn_Tot_958()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Oschust_958()
{
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_BANDITEN_WERDEN_VON_OSCHUST_GEFANGEN_GENOMMEN");
};

FUNC VOID Rtn_Gefangen_958()
{
	TA_RunToWP	(08,00,20,00,"OC1");
	TA_RunToWP	(20,00,08,00,"OC1");
};

FUNC VOID Rtn_AtOrks_958()
{
	TA_Stand_WP	(08,00,20,00,"OW_ORC_BOSS4");
	TA_Stand_WP	(20,00,08,00,"OW_ORC_BOSS4");
};

FUNC VOID Rtn_Survivor_958()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};

FUNC VOID Rtn_Rettung_958()
{
	TA_RunToWP	(08,00,20,00,"LOCATION_11_12_09");
	TA_RunToWP	(20,00,08,00,"LOCATION_11_12_09");
};

FUNC VOID Rtn_AL_958()
{
	TA_RunToWP	(08,00,20,00,"OCR_OUTSIDE_HUT_1");
	TA_RunToWP	(20,00,08,00,"OCR_OUTSIDE_HUT_1");
};

FUNC VOID Rtn_Brauen_958()
{
	TA_Potion_Alchemy	(08,00,20,00,"HOEHLE_34");
	TA_Potion_Alchemy	(20,00,08,00,"HOEHLE_34");
};