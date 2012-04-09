INSTANCE Mod_768_KDW_Merdarion_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Merdarion";
	guild 		= GIL_NOV; 
	id 			= 768;
	voice 		= 6;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------															
	EquipItem	(self, ItMW_Addon_Stab03);																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_KDW_L_ADDON);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_768;
};

func void Rtn_PreStart_768 ()
{	
	TA_Smalltalk		(08,00,20,00,"NW_TROLLAREA_PORTAL_03"); 
	TA_Smalltalk		(20,00,08,00,"NW_TROLLAREA_PORTAL_03");
};

FUNC VOID Rtn_Tot_768 ()
{
	TA_Stand_WP	(08,00,23,00,"TOT");
    TA_Stand_WP	(23,00,08,00,"TOT");
};