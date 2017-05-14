instance Mod_795_SLD_Rod_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rod";
	guild 		= GIL_MIL;
	id 			= 795;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_GrobesKurzschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ToughBart01, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_795;
};

FUNC VOID Rtn_Start_795 ()
{
	TA_Smalltalk	(07,55,22,55,"NC_TAVERN_SIDE02");
    TA_Sleep		(22,55,07,55,"NC_HUT03_IN");
};

FUNC VOID Rtn_OGY_795 ()
{
	TA_Stand_ArmsCrossed	(07,55,22,55,"OW_PATH_198_ORCGRAVEYARD8");
	TA_Stand_Armscrossed	(22,55,07,55,"OW_PATH_198_ORCGRAVEYARD8");
};

FUNC VOID Rtn_Tot_795 ()
{
	TA_Stand_ArmsCrossed	(07,55,22,55,"TOT");
	TA_Stand_ArmsCrossed	(22,55,07,55,"TOT");
};