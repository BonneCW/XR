instance Mod_100_BAU_Wasili_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wasili";
	guild 		= GIL_NONE;
	id 			= 100;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart02, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_100;
};

FUNC VOID Rtn_Start_100 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_BIGFARM_HOUSE_16");
    TA_Sit_Chair			(22,00,08,00,"NW_BIGFARM_HOUSE_16");
};

FUNC VOID Rtn_Verbannt_100()
{
	TA_Stand_Drinking		(08,00,20,00,"NW_BIGFARM_FELDREUBER2");
	TA_Stand_Drinking		(20,00,08,00,"NW_BIGFARM_FELDREUBER2");
};