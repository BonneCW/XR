instance Mod_797_SLD_Sylvio_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sylvio";
	guild 		= GIL_MIL;
	id 			= 797;
	voice 		= 9;
	flags       = 0;	//Joly:Drachenjägeranführer. Muß leben																//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Orkschlaechter);
	EquipItem			(self, ItRw_Sld_Bow);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Scar, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_797;
};

FUNC VOID Rtn_Start_797 ()
{
	TA_Sit_Bench				(08,00,22,00,"NC_HUT02_OUT");
    TA_Sleep				(22,00,08,00,"NC_HUT02_IN");		
};

FUNC VOID Rtn_Wettstreit_797 ()
{
	TA_Stand_WP 	(08,00,22,00,"LOCATION_05_02_STONEHENGE4");
    TA_Stand_WP		(22,00,08,00,"LOCATION_05_02_STONEHENGE4");		
};