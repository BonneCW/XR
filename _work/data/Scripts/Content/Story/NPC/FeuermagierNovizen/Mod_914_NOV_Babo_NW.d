INSTANCE Mod_914_NOV_Babo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Babo";
	guild 		= GIL_VLK;
	id 			= 914;
	voice 		= 36;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 															
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItMw_1h_Nov_Mace,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal07, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_914;
};

FUNC VOID Rtn_Start_914 ()
{	
	TA_Stand_Sweeping	(08,00,14,00,"NW_MONASTERY_CORRIDOR_10");
	TA_Pray_Innos_FP	(14,00,15,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_Sweeping	(15,00,23,30,"NW_MONASTERY_CORRIDOR_10");
    TA_Sleep			(23,30,08,00,"NW_MONASTERY_NOVICE04_05");
};

FUNC VOID Rtn_Daemonisch_914 ()
{	
	TA_Stand_Drinking 	(08,00,22,00,"NW_TAVERNE_IN_01"); 
	TA_Stand_Drinking		(22,00,08,00,"NW_TAVERNE_IN_01");
};

FUNC VOID Rtn_Daemonisch2_914 ()
{	
	TA_Sit_Campfire 	(08,00,22,00,"NW_MONASTERY_GRASS_04"); 
	TA_Sit_Campfire	(22,00,08,00,"NW_MONASTERY_GRASS_04");
};

FUNC VOID Rtn_Daemonisch3_914 ()
{	
	TA_Sit_Chair 	(08,00,22,00,"NW_TAVERNE_IN_01"); 
	TA_Sit_Chair		(22,00,08,00,"NW_TAVERNE_IN_01");
};