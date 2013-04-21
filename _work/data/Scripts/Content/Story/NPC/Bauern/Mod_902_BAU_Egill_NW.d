instance Mod_902_BAU_Egill_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Egill";
	guild 		= GIL_NONE;
	id 			= 902;
	voice 		= 37;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItPo_Health_02, 1);							
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_Normal03, BodyTex_P, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_902;
};

FUNC VOID Rtn_PreStart_902 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"WP_EGILL_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"WP_EGILL_04");
};

FUNC VOID Rtn_Ehnim_902 ()
{	
    TA_Sit_Campfire	(05,00,21,00,"NW_FARM2_OUT_03");
    TA_Sit_Campfire	(21,00,05,00,"NW_FARM2_OUT_03");
};

FUNC VOID Rtn_Bridge_902 ()
{	
    TA_FleeToWP	(05,00,21,00,"WP_EGILL_SELBSTMORD_NEWVERSION");
    TA_FleeToWP	(21,00,05,00,"WP_EGILL_SELBSTMORD_NEWVERSION");
};

FUNC VOID Rtn_Selbstmord_902 ()
{	
    TA_FleeToWP	(05,00,21,00,"WP_EGILL_SELBSTMORD_NEWVERSION");
    TA_FleeToWP	(21,00,05,00,"WP_EGILL_SELBSTMORD_NEWVERSION");
};

FUNC VOID Rtn_Start_902 ()
{	
	TA_Pick_FP			(05,00,21,00,"NW_FARM2_FIELD_02");
    TA_Stand_Drinking	(21,00,00,02,"NW_FARM2_OUT_10");
    TA_Sit_Bench		(00,02,05,00,"NW_FARM2_OUT_06");
};

FUNC VOID Rtn_Abgang_902 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_TO_FARM2_04");
};

FUNC VOID Rtn_City_902 ()
{	
	TA_Sit_Campfire		(05,00,21,00,"WP_FLUECHTLINGE");
	TA_Sit_Campfire		(21,00,05,00,"WP_FLUECHTLINGE");
};