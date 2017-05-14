instance Mod_502_RIT_Keroloth_NW  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Keroloth";
	guild 		= GIL_PAL;
	id 			= 502;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Schwert_03);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal20, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_502;
};

FUNC VOID Rtn_Start_502 ()
{	
	  TA_Stand_Guarding			(08,00,19,00,"NW_CITY_UPTOWN_PATH_15_B");
 	  TA_Stand_Guarding			(08,00,19,00,"NW_CITY_UPTOWN_PATH_15_B");
};

FUNC VOID Rtn_Schiff_502 ()
{	
	  TA_Sit_Bench			(08,00,19,00,"SHIP_CREW_03");
 	  TA_Sit_Bench			(08,00,19,00,"SHIP_CREW_03");
};

FUNC VOID Rtn_Kampf_502 ()
{	
	  TA_Stand_Guarding			(08,00,19,00,"NW_CITY_UPTOWNPARADE_04");
 	  TA_Stand_Guarding			(08,00,19,00,"NW_CITY_UPTOWNPARADE_04");
};