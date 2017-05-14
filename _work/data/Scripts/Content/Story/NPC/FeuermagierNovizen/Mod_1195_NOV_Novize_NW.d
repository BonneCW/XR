INSTANCE Mod_1195_NOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_VLK;
	id 			= 1195;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1195;
};
FUNC VOID Rtn_Start_1195 ()
{	
	TA_Stand_Sweeping	(08,00,15,00,"NW_MONASTERY_CELLAR_08");
    TA_Pray_Innos_FP	(15,00,16,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_Sweeping	(16,00,22,00,"NW_MONASTERY_CELLAR_08");
    TA_Sleep			(22,00,08,00,"NW_MONASTERY_NOVICE04_04");
    
};

FUNC VOID Rtn_Krank_1195 ()
{	
	TA_Sleep	(08,00,22,00,"NW_MONASTERY_NOVICE04_04");
	TA_Sleep	(22,00,08,00,"NW_MONASTERY_NOVICE04_04");    
};