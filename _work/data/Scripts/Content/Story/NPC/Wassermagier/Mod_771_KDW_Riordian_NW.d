INSTANCE Mod_771_KDW_Riordian_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Riordian";
	guild 		= GIL_NOV; 
	id 			= 771;
	voice		= 0;
	flags       = 2;																	
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_KDW_L_ADDON);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_771;
};

FUNC VOID Rtn_Start_771 ()
{	
	TA_Stand_Guarding 	(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_34"); 
	TA_Stand_Guarding	(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_34");

};

FUNC VOID Rtn_Tot_771 ()
{
	TA_Stand_WP	(08,00,23,00,"TOT");
    TA_Stand_WP	(23,00,08,00,"TOT");
};

FUNC VOID Rtn_VorTempel_771 ()
{
	TA_Stand_WP	(08,00,23,00,"NW_TROLLAREA_PORTALTEMPEL_01");
    TA_Stand_WP	(23,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_01");
};

FUNC VOID Rtn_AtTempel_771 ()
{
	TA_Stand_WP	(08,00,23,00,"NW_TROLLAREA_PORTALTEMPEL_03");
    TA_Stand_WP	(23,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_03");
};