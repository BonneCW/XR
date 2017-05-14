instance Mod_777_NONE_Rukhar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rukhar";
	guild 		= GIL_NONE;
	id 			= 777;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_L_NormalBart02, BodyTex_L, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_777;
};

FUNC VOID Rtn_Start_777 ()
{	
	TA_Stand_Drinking		(08,00,22,00,"NW_TAVERNE_RUKHAR"); 
    TA_Sit_Bench 			(22,00,08,00,"NW_TAVERNE_OUT_01");
};

FUNC VOID Rtn_Tot_777 ()
{	
	TA_Stand_Drinking		(08,00,22,00,"TOT"); 
    TA_Sit_Bench 			(22,00,08,00,"TOT");
};