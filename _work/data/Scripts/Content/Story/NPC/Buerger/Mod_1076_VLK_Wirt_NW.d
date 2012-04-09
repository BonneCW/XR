instance Mod_1076_VLK_Wirt_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wirt";
	guild 		= GIL_PAL;
	id 			= 1076;
	voice 		= 14;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------														
	//EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------															
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_BARKEEPER);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1076;
};

FUNC VOID Rtn_Start_1076 ()
{
	TA_Stand_Guarding		(04,35,21,00,"NW_CITY_BEER_02");
	TA_Pee					(21,00,21,05,"NW_CITY_KASERN_PLACE_01");
    TA_Stand_Drinking		(21,05,04,30,"NW_CITY_BEER_02");
    TA_Pee					(04,30,04,35,"NW_CITY_KASERN_PLACE_01");
};

FUNC VOID Rtn_Freibier_1076 ()
{
	TA_Smalltalk_Plaudern		(04,35,21,00,"NW_CITY_BEER_02");
	TA_Smalltalk_Plaudern		(21,00,04,35,"NW_CITY_BEER_02");
};

