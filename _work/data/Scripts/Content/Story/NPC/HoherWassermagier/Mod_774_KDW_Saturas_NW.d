INSTANCE Mod_774_KDW_Saturas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Saturas";
	guild 		= GIL_DMT; 
	id 			= 774;
	voice 		= 14;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab03);
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Saturas, BodyTex_B, ITAR_KDW_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	 
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_774;
};

FUNC VOID Rtn_Start_774 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");

};

FUNC VOID Rtn_Rat_774()
{
	TA_Sit_Throne		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_SATURAS");
	TA_Sit_Throne		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_SATURAS");
};

FUNC VOID Rtn_Tot_774()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_GEFANGEN_774()
{
	TA_Stand_WP	(08,00,22,00,"NW_TROLLAREA_PORTAL_07");
	TA_Stand_WP	(22,00,08,00,"NW_TROLLAREA_PORTAL_07");
};

FUNC VOID Rtn_PORTAL_774()
{
	TA_Stand_WP	(08,00,22,00,"NW_TROLLAREA_PORTAL_07");
	TA_Stand_WP	(22,00,08,00,"NW_TROLLAREA_PORTAL_07");
};

FUNC VOID Rtn_Unheil_774 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_08"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_08");

};

FUNC VOID Rtn_Rasend_774()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_TROLLAREA_RUINS_11");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_TROLLAREA_RUINS_11");
};

FUNC VOID Rtn_TalkWithArgez_774()
{	
	TA_Smalltalk_Plaudern	(10,55,18,50,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Smalltalk_Plaudern	(18,50,10,55,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};

FUNC VOID Rtn_Smalltalk_774()
{	
	TA_Smalltalk	(10,55,18,50,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
	TA_Smalltalk	(18,50,10,55,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01");
};