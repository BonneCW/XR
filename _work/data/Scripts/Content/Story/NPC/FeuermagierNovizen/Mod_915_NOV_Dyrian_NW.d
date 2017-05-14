INSTANCE Mod_915_NOV_Dyrian_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Feuernovize";
	guild 		= GIL_VLK;
	id 			= 915;
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
	CreateInvItems (self,ItSc_Sleep,1);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Tough_Torrez, BodyTex_P, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
		
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_915;
};

FUNC VOID Rtn_Start_915()
{	
	TA_Stand_WP			(08,00,10,00,"NW_MONASTERY_GRASS_04");
	TA_Pray_Innos_FP	(10,00,11,00,"NW_MONASTERY_CHURCH_03");
    TA_Stand_WP			(11,00,23,30,"NW_MONASTERY_GRASS_04");
    TA_Sleep			(23,30,08,00,"NW_MONASTERY_NOVICE01_04");
};

FUNC VOID Rtn_Krank_915 ()
{	
	TA_Sleep	(08,00,22,00,"NW_MONASTERY_NOVICE01_04");
	TA_Sleep	(22,00,08,00,"NW_MONASTERY_NOVICE01_04");    
};

FUNC VOID Rtn_Tot_915 ()
{	
	TA_Sit_Campfire 	(08,00,22,00,"TOT"); 
	TA_Sit_Campfire	(22,00,08,00,"TOT");
};