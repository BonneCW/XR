INSTANCE Mod_913_NOV_Agon_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_VLK;
	id 			= 913;
	voice 		= 7;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_feuernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal01, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_913;
};

FUNC VOID Rtn_Start_913()
{	
	TA_Rake_FP 			(08,00,09,00,"NW_MONASTERY_HERB_05");
    TA_Pray_Innos_FP	(09,00,10,00,"NW_MONASTERY_CHURCH_03");
    TA_Rake_FP 			(10,00,22,10,"NW_MONASTERY_HERB_05");
    TA_Sleep			(22,10,08,00,"NW_MONASTERY_NOVICE03_07");
	
	
};

FUNC VOID Rtn_Krank_913 ()
{	
	TA_Sleep	(08,00,22,00,"NW_MONASTERY_NOVICE03_07");
	TA_Sleep	(22,00,08,00,"NW_MONASTERY_NOVICE03_07");    
};