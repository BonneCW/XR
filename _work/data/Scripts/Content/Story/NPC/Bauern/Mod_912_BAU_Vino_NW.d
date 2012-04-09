instance Mod_912_BAU_Vino_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vino";
	guild 		= GIL_OUT;
	id 			= 912;
	voice 		= 5;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_N_Weak_Herek, BodyTex_N, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 10); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_912;
};
//Joly: NIE AUF EINE BANK ODER THRON SETZEN

FUNC VOID Rtn_Start_912 ()
{	
	TA_Rake_FP	(08,00,12,00,"NW_FARM1_FIELD_04");
	TA_Rake_FP	(12,00,15,00,"NW_FARM1_FIELD_05");
	TA_Rake_FP	(15,00,18,00,"NW_FARM1_FIELD_04");
	TA_Rake_FP	(18,00,22,00,"NW_FARM1_FIELD_05");
	TA_Sleep	(22,00,08,00,"NW_FARM1_INSTABLE_BED");
};

FUNC VOID Rtn_DemonWalker_912 ()
{
	TA_Read_Bookstand	(08,00,20,00,"NW_FARM1_INHOUSE_03");
	TA_Read_Bookstand	(20,00,08,00,"NW_FARM1_INHOUSE_03");
};

FUNC VOID Rtn_Brennerei_912 ()
{
	TA_Sit_Campfire	(08,00,20,00,"WP_NANDOR_TENT_01");
	TA_Sit_Campfire	(20,00,08,00,"WP_NANDOR_TENT_01");
};

FUNC VOID Rtn_Teleport_912 ()
{
	TA_RunToWP	(08,00,20,00,"WP_VINO_BRENNEREI_TELEPORT");
	TA_RunToWP	(20,00,08,00,"WP_VINO_BRENNEREI_TELEPORT");
};