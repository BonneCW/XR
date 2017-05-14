instance Mod_1532_HTR_Ethan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ethan";	
	guild 		= GIL_nov;
	id 			= 1532;
	voice		= 0;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	aivar[AIV_ToughGuy]		= TRUE;
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Kilgorin);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 196, BodyTex_P, ITAR_Hueter);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1532;
};

FUNC VOID Rtn_Start_1532 ()
{	
	TA_Smalltalk	(08,00,20,00,"PORTAL");
	TA_Smalltalk	(20,00,08,00,"PORTAL");
};

FUNC VOID Rtn_Gefangen_1532 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
	TA_Sit_Campfire	(23,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
};

FUNC VOID Rtn_AtDungeon_1532 ()
{
	TA_Smalltalk		(00,00,20,00,"PORTAL");
	TA_Stand_ArmsCrossed	(20,00,24,00,"NW_TROLLAREA_RUINS_39");
};

FUNC VOID Rtn_InDungeon_1532 ()
{
	TA_Smalltalk		(00,00,20,00,"PORTAL");
	TA_Drained	(20,00,24,00,"NW_TROLLAREA_RUINS_CAVE_01");
};

FUNC VOID Rtn_Sammeln_1532 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1532 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1532 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};

FUNC VOID Rtn_Schiff_1532 ()
{
	TA_Sit_Chair	(08,00,23,00,"SHIP_IN_01");
	TA_Sit_Chair	(23,00,08,00,"SHIP_IN_01");
};