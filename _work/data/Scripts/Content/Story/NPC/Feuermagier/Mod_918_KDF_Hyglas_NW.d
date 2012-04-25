INSTANCE Mod_918_KDF_Hyglas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hyglas";
	guild 		= GIL_VLK;
	id 			= 918;
	voice 		= 14;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																	
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief",Face_N_NormalBart09, BodyTex_N, ITAR_KDF_L_Feuer);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_918;
};

FUNC VOID Rtn_Start_918 ()
{	
	TA_Read_Bookstand	(08,00,23,00,"NW_MONASTERY_RUNEMAKER_08");
	TA_Read_Bookstand	(23,00,08,00,"NW_MONASTERY_RUNEMAKER_08");
};

FUNC VOID Rtn_AtPyrokar_918 ()
{	
	TA_Stand_WP	(08,00,23,00,"NW_MONASTERY_THRONE_01");
	TA_Stand_WP	(23,00,08,00,"NW_MONASTERY_THRONE_01");
};

FUNC VOID Rtn_Taverne_918 ()
{	
	TA_Stand_WP	(08,00,23,00,"NW_TAVERNE");
	TA_Stand_WP	(23,00,08,00,"NW_TAVERNE");
};

FUNC VOID Rtn_ZuSergio_918 ()
{	
	TA_Guide_Player	(08,00,23,00,"NW_LAKE__WATER_02");
	TA_Guide_Player	(23,00,08,00,"NW_LAKE__WATER_02");
};

FUNC VOID Rtn_ZuSekob_918 ()
{	
	TA_Guide_Player	(08,00,23,00,"WP_STEINKREIS_05");
	TA_Guide_Player	(23,00,08,00,"WP_STEINKREIS_05");
};

FUNC VOID Rtn_Eishoehle_918 ()
{	
	TA_Stand_WP	(08,00,23,00,"WP_EISHOEHLE_01");
	TA_Stand_WP	(23,00,08,00,"WP_EISHOEHLE_01");
};

FUNC VOID Rtn_Eishoehle2_918 ()
{	
	TA_Guide_Player	(08,00,23,00,"WP_EISHOEHLE_04");
	TA_Guide_Player	(23,00,08,00,"WP_EISHOEHLE_04");
};