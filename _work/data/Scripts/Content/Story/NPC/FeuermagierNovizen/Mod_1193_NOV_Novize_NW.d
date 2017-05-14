INSTANCE Mod_1193_NOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_vlk;
	id 			= 1193;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_feuernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 24); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1193;
};

FUNC VOID Rtn_Start_1193 ()
{	
	TA_Pick_FP 			(08,00,13,00,"NW_MONASTERY_HERB_03");
	TA_Pray_Innos_FP	(13,00,14,00,"NW_MONASTERY_CHURCH_03");
	TA_Pick_FP 			(14,00,22,50,"NW_MONASTERY_HERB_03");   
    TA_Sleep			(22,50,08,00,"NW_MONASTERY_NOVICE04_06");
};
