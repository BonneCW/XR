instance Mod_597_NONE_Meldor_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Meldor";
	guild 		= GIL_PAL;
	id 			= 597;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivar ------
	aivar [AIV_ToughGuy] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_NormalBald, BodyTex_P, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 35); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_597;
};


FUNC VOID Rtn_Start_597 ()
{	
	TA_Smoke_Joint 			(05,05,23,55,"WP_CITY_MELDOR");
    TA_Sleep				(23,55,05,05,"NW_CITY_HABOUR_HUT_04_BED_02");
};

FUNC VOID Rtn_Gefangen_597 ()
{	
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};

FUNC VOID Rtn_LobartAlwin_597 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_ALWIN_SEQUENZ");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_ALWIN_SEQUENZ");
};