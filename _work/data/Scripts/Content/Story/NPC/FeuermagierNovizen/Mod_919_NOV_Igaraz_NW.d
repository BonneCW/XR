INSTANCE Mod_919_NOV_Igaraz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Igaraz";
	guild 		= GIL_VLK;
	id 			= 919;
	voice 		= 13;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Nov_Mace); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_IgarazChest_mis, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Normal_Stone, BodyTex_N, ITAR_NOV_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_919;
};

FUNC VOID Rtn_Start_919()
{	
	TA_Smalltalk		(09,00,22,04,"NW_MONASTERY_GRASS_01");
    TA_Sleep			(22,04,08,00,"NW_MONASTERY_NOVICE02_05");
    TA_Pray_Innos_FP	(08,00,09,00,"NW_MONASTERY_CHURCH_03");
};

FUNC VOID Rtn_Krank_919 ()
{	
	TA_Sleep	(08,00,22,00,"NW_MONASTERY_NOVICE02_05");
	TA_Sleep	(22,00,08,00,"NW_MONASTERY_NOVICE02_05");    
};