instance Mod_1958_VMG_Albert_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Albert";
	guild 		= GIL_out;
	id 			= 1958;
	voice 		= 32;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 235, BodyTex_L, ITAR_DRUIDEWALDMAGIER);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1958;
};

FUNC VOID Rtn_Start_1958 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"OW_PATH_176_TEMPELFOCUS4");
    TA_Stand_Guarding		(23,00,08,00,"OW_PATH_176_TEMPELFOCUS4");
};

FUNC VOID Rtn_TransformToBloodfly_1958 ()
{	
	TA_Transform_Albert_Bloodfly		(08,00,23,00,"OW_PATH_176_TEMPELFOCUS4");
    TA_Transform_Albert_Bloodfly		(23,00,08,00,"OW_PATH_176_TEMPELFOCUS4");
};

FUNC VOID Rtn_AtOrks_1958 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"WP_MINENTAL_START_ORCCITY");
    TA_Stand_Guarding		(23,00,08,00,"WP_MINENTAL_START_ORCCITY");
};

FUNC VOID Rtn_Tot_1958 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"TOT");
    TA_Stand_Guarding		(23,00,08,00,"TOT");
};

FUNC VOID Rtn_Survivor_1958()
{
	TA_Stand_WP	(08,00,20,00,"OW_PATH_1_5_B");
	TA_Stand_WP	(20,00,08,00,"OW_PATH_1_5_B");
};