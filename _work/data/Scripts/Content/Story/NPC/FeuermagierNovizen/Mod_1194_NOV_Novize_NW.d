INSTANCE Mod_1194_NOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_vlk;
	id 			= 1194;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_feuernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1194;
};

FUNC VOID Rtn_Start_1194 ()
{	
	TA_Pray_Innos_FP	(08,00,09,00,"NW_MONASTERY_CHURCH_03");
    TA_Smalltalk		(09,00,23,05,"NW_MONASTERY_GRASS_01");
    TA_Sleep			(23,05,08,00,"NW_MONASTERY_NOVICE02_04");
};

FUNC VOID Rtn_Krank_1194 ()
{	
	TA_Sleep	(08,00,22,00,"NW_MONASTERY_NOVICE02_04");
	TA_Sleep	(22,00,08,00,"NW_MONASTERY_NOVICE02_04");    
};