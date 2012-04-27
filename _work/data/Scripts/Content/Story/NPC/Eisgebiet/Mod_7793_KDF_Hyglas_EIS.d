INSTANCE Mod_7793_KDF_Hyglas_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hyglas";
	guild 		= GIL_VLK;
	id 			= 7793;
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
	daily_routine 		= Rtn_Start_7793;
};

FUNC VOID Rtn_Start_7793 ()
{	
	TA_Sit_Chair		(08,00,23,00,"EINSIEDLER_1");
	TA_Sit_Chair		(23,00,08,00,"EINSIEDLER_1");
};

FUNC VOID Rtn_Follow_7793 ()
{	
	TA_Follow_Player	(08,00,23,00,"EIS_76");
	TA_Follow_Player	(23,00,08,00,"EIS_76");
};

FUNC VOID Rtn_AtThys_7793 ()
{	
	TA_Smalltalk	(08,00,23,00,"EIS_76");
	TA_Smalltalk	(23,00,08,00,"EIS_76");
};

FUNC VOID Rtn_Tot_7793 ()
{	
	TA_Stand_WP	(08,00,23,00,"TOT");
	TA_Stand_WP	(23,00,08,00,"TOT");
};