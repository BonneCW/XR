instance Mod_105_BAU_Sekob_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sekob";
	guild 		= GIL_NONE;
	id 			= 105;
	voice		= 0;
	flags       = 0; 															//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_P_OldMan_Gravo, BodyTex_P, ITAR_Vlk_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_105;
};

FUNC VOID Rtn_Start_105 ()
{	
	TA_Sit_Throne 	(08,00,22,00,"NW_FARM4_SEKOB"); 
    TA_Sleep		(22,00,08,00,"NW_FARM4_IN_BED");
};

FUNC VOID Rtn_Daemonisch_105 ()
{	
	TA_Stand_Drinking 	(08,00,22,00,"NW_TAVERNE_IN_01"); 
	TA_Stand_Drinking		(22,00,08,00,"NW_TAVERNE_IN_01");
};