instance Mod_1241_RIT_Torwache_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 1241;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_paladin;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	

		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1241;
};

FUNC VOID Rtn_Start_1241 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_CITYHALL_ENTRY_01");
    TA_Stand_Guarding	(23,00,08,00,"NW_CITY_CITYHALL_ENTRY_01");	
};

FUNC VOID Rtn_HagenKO_1241 ()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_02");
	TA_Smalltalk_Plaudern	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_02");
};
