INSTANCE Mod_758_KDW_Cronos_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cronos";
	guild 		= GIL_NOV;
	id 			= 758;
	voice 		= 4; 
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDW_L_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 45); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_758;
};

func void Rtn_PreStart_758()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
};

FUNC VOID Rtn_Tot_758 ()
{
	TA_Stand_WP	(08,00,23,00,"TOT");
    TA_Stand_WP	(23,00,08,00,"TOT");
};

FUNC VOID Rtn_Sammeln_758 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_758 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_758 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};