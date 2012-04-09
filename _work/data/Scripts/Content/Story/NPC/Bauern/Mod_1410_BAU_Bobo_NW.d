instance Mod_1410_BAU_Bobo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bobo";
	guild 		= GIL_out;
	id 			= 1410;
	voice 		= 13;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Dusty, BodyTex_N, ITAR_BAU_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1410;
};

FUNC VOID Rtn_Start_1410 ()
{	
	TA_Smalltalk		(07,55,19,55,"NW_BIGFARM_STABLE_OUT_01"); 
	TA_Smalltalk		(19,55,21,55,"NW_BIGFARM_PATH_04_1");	//Joly: Partnerwechsel
    TA_Smalltalk		(21,55,07,55,"NW_BIGFARM_STABLE_01");
};

FUNC VOID Rtn_AtAkil_1410 ()
{	
	TA_Rake_FP (00,00,12,00,"NW_FARM2_FIELD_TANOK");
	TA_Rake_FP (12,00,00,00,"NW_FARM2_FIELD_TANOK");
};

FUNC VOID Rtn_Abgang_1410 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_TO_FARM2_04");
};
