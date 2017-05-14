instance Mod_7040_RIT_Ritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_RITTER; 
	guild 		= GIL_PAL;
	id 			= 7040;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Schwert_03);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Tough_Torrez, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 75); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7040;
};

FUNC VOID Rtn_Start_7040 ()
{	
	TA_Stand_Guarding	(08,00,23,00,	"OW_SAWHUT_MOLERAT_MOVEMENT6");
	TA_Stand_Guarding	(23,00,08,00,	"OW_SAWHUT_MOLERAT_MOVEMENT6");
};

FUNC VOID Rtn_ToVM_7040 ()
{	
	TA_Follow_Player		(08,00,21,00,"OW_PATH_1_16");
	TA_Follow_Player		(21,00,08,00,"OW_PATH_1_16");
};

FUNC VOID Rtn_ToAustausch_7040 ()
{	
	TA_Follow_Player		(08,00,21,00,"WP_INTRO_FALL3");
	TA_Follow_Player		(21,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_AtAustausch_7040 ()
{	
	TA_Stand_ArmsCrossed		(08,00,21,00,"WP_INTRO_FALL3");
	TA_Stand_ArmsCrossed		(21,00,08,00,"WP_INTRO_FALL3");
};

