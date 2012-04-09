instance Mod_903_BAU_Ehnim_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ehnim";
	guild 		= GIL_NONE;
	id 			= 903;
	voice 		= 12;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal03, BodyTex_P, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_903;
};

FUNC VOID Rtn_PreStart_903 ()
{	
    TA_Sit_Campfire	(05,00,21,00,"NW_FARM2_OUT_03");
    TA_Sit_Campfire	(21,00,05,00,"NW_FARM2_OUT_03");
};

FUNC VOID Rtn_Start_903 ()
{	
	TA_Rake_FP		(05,00,12,00,"NW_FARM2_FIELD_03");
    TA_Sit_Campfire	(12,00,14,00,"NW_FARM2_FIELD_03_B");
    TA_Rake_FP		(14,00,21,00,"NW_FARM2_FIELD_03");
    TA_Sit_Campfire	(21,00,05,00,"NW_FARM2_OUT_03");
};

FUNC VOID Rtn_Tot_903 ()
{	
	TA_Sit_Campfire		(05,00,21,00,"TOT");
	TA_Sit_Campfire		(21,00,05,00,"TOT");
};

FUNC VOID Rtn_Abgang_903 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_TO_FARM2_04");
};

FUNC VOID Rtn_City_903 ()
{	
	TA_Sit_Campfire		(05,00,21,00,"WP_FLUECHTLINGE");
	TA_Sit_Campfire		(21,00,05,00,"WP_FLUECHTLINGE");
};