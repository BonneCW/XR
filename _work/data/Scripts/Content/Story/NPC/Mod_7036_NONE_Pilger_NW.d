INSTANCE Mod_7036_NONE_Pilger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dunkler Pilger";
	guild 		= GIL_DMT;
	id 			= 7036;
	voice 		= 4;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, 0, ITAR_Dementor);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7036;
};

FUNC VOID Rtn_Start_7036 ()
{	
	TA_Stand_WP  	(08,00,20,00,"NW_XARDAS_TOWER_06");
	TA_Stand_WP 	(20,00,08,00,"NW_XARDAS_TOWER_06");
};

FUNC VOID Rtn_ToCavalorn_7036 ()
{	
	TA_RunToWP  	(08,00,20,00,"BIGFARM");
	TA_RunToWP 	(20,00,08,00,"BIGFARM");
};

FUNC VOID Rtn_Graveyard_7036 ()
{	
	TA_Stand_WP  	(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_Stand_WP 	(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Tot_7036 ()
{	
	TA_Stand_WP  	(08,00,20,00,"TOT");
	TA_Stand_WP 	(20,00,08,00,"TOT");
};

