instance Mod_773_NONE_Sagitta_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sagitta";
	guild 		= GIL_NONE;
	id 			= 773;
	voice 		= 43;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);


		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_PinkHair, BodyTexBabe_N, ITAR_BauBabe_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_773;
};

FUNC VOID Rtn_Start_773 ()
{	
	TA_Sit_Throne	(08,00,23,00,"NW_SAGITTA_CAVE_IN_02");	 
    TA_Potion_Alchemy	(23,00,08,00,"NW_SAGITTA_CAVE_IN_03");
};

FUNC VOID Rtn_Schiff_773 ()
{	
	TA_Potion_Alchemy	(08,00,23,00,"SHIP_IN_22");	 
	TA_Potion_Alchemy	(23,00,08,00,"SHIP_IN_22");
};