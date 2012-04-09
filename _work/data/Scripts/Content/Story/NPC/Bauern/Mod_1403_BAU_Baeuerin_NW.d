instance Mod_1403_BAU_Baeuerin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_MAGD;
	guild 		= GIL_DMT;
	id 			= 1403;
	voice 		= 16;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_nw_bauer;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItKe_Elena, 1);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_BauBabe_L);			//ITAR_BauBabe_L
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1403;
};

FUNC VOID Rtn_Start_1403 ()
{	
	TA_Cook_Stove		(07,00,20,00,"NW_BIGFARM_HOUSE_UP1_COOK");
    TA_Stand_Eating			(20,00,07,00,"NW_BIGFARM_STABLE_05");
};

FUNC VOID Rtn_AtAkil_1403 ()
{	
	TA_Cook_Stove		(05,00,10,00,"NW_FARM2_HOUSE_IN_04");
    TA_Sit_Bench		(10,00,12,00,"NW_FARM2_BENCH_02");
   	TA_Cook_Stove		(12,00,20,55,"NW_FARM2_HOUSE_IN_04");
    TA_Roast_Scavenger 	(20,55,23,59,"NW_FARM2_BBQ");
    TA_Sleep			(23,59,05,00,"NW_FARM2_HOUSE_IN_02");
};

FUNC VOID Rtn_Abgang_1403 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_CITY_TO_FARM2_04");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_CITY_TO_FARM2_04");
};

FUNC VOID Rtn_Hexe_1403 ()
{	
	TA_Cook_Stove		(07,00,20,00,"NW_BIGFARM_HOUSE_UP1_COOK");
    TA_Circle			(20,00,07,00,"WP_NW_HEXENRITUAL_MAGD");
};

FUNC VOID Rtn_Transform_1403 ()
{	
	TA_Transform_Wolf 	(07,30,20,30,"WP_NW_HEXENRITUAL_MAGD");
	TA_Transform_Wolf	(20,30,07,30,"WP_NW_HEXENRITUAL_MAGD");
};

FUNC VOID Rtn_ToPepe_1403 ()
{	
	TA_Guide_Player		(07,30,20,30,"NW_BIGFARM_FOREST_03_NAVIGATION3");
	TA_Guide_Player		(20,30,07,30,"NW_BIGFARM_FOREST_03_NAVIGATION3");
};

FUNC VOID Rtn_WaitingforWolf_1403 ()
{	
	TA_Stand_ArmsCrossed		(05,00,21,00,"NW_BIGFARM_FOREST_03_NAVIGATION3");
	TA_Stand_ArmsCrossed		(21,00,05,00,"NW_BIGFARM_FOREST_03_NAVIGATION3");
};

FUNC VOID Rtn_Wolf_1403()
{
	TA_Stand_WP	(08,00,20,00,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_WP	(20,00,08,00,"NW_BIGFARM_SHEEP2_02");
};

FUNC VOID Rtn_Tot_1403 ()
{	
	TA_Stand_WP		(07,00,20,00,"TOT");
	TA_Stand_WP		(20,00,07,00,"TOT");
};

