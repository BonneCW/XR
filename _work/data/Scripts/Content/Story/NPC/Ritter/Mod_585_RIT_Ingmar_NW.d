instance Mod_585_RIT_Ingmar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ingmar";
	guild 		= GIL_PAL;
	id 			= 585;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_ToughBart01, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_585;
};

FUNC VOID Rtn_Start_585 ()
{	
	TA_Stand_WP	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_02");
	TA_Stand_WP	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_02");
};

FUNC VOID Rtn_HagenKO_585 ()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_02");
	TA_Smalltalk_Plaudern	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_02");
};