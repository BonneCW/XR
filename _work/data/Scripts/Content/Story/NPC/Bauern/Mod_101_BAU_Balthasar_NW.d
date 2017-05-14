instance Mod_101_BAU_Balthasar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Balthasar";
	guild 		= GIL_NONE;
	id 			= 101;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_NormalBart01, BodyTex_P, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60
	
	senses_range = 100;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_101;
};

FUNC VOID Rtn_Start_101 ()
{	
	TA_Stand_Eating		(08,00,22,00,"NW_FARM4_BALTHASAR");
    TA_Stand_Eating			(22,00,08,00,"NW_FARM4_BALTHASAR");
};

FUNC VOID Rtn_Wolf_101()
{
	TA_Pee		(08,00,22,00,"NW_FARM4_BALTHASAR_PEE");
	TA_Pee		(22,00,08,00,"NW_FARM4_BALTHASAR_PEE");
};