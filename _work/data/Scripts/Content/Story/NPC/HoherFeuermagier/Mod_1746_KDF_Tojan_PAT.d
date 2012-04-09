INSTANCE Mod_1746_KDF_Tojan_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tojan";
	guild 		= GIL_VLK;
	id 			= 1746;
	voice 		= 15;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	B_SetAttitude (self, ATT_FRIENDLY);	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", 193, BodyTex_N, ITAR_Kdf_h);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1746;
};

FUNC VOID Rtn_Start_1746 ()
{	
	TA_Stand_WP 		(08,00,23,00,"WP_PAT_WEG_54"); 
    TA_Stand_WP		(23,00,08,00,"WP_PAT_WEG_54");
};

FUNC VOID Rtn_Mine_1746 ()
{	
	TA_Smalltalk_Laehmen 		(08,00,23,00,"WP_PAT_UNTERGRUND_06"); 
    TA_Smalltalk_Laehmen		(23,00,08,00,"WP_PAT_UNTERGRUND_06");
};

FUNC VOID Rtn_Falle_1746 ()
{	
	TA_Stand_WP 		(08,00,23,00,"WP_PAT_WEG_202"); 
    TA_Stand_WP		(23,00,08,00,"WP_PAT_WEG_202");
};