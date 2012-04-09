instance Mod_1027_SMK_Eduard_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Eduard";
	guild 		= GIL_KDF;
	id 			= 1027;
	voice 		= 11;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	//EquipItem			(self, ItMw_BeliarsRache);
	//EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Lee_ähnlich, BodyTex_N, ITAR_SMK_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1027;
};

FUNC VOID Rtn_Start_1027 ()
{	
	TA_Smith_Fire	(08,00,08,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(08,15,08,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(08,30,08,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(08,45,09,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(09,00,09,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(09,15,09,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(09,30,09,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(09,45,10,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(10,00,10,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(10,15,10,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(10,30,10,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(10,45,11,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(11,00,11,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(11,15,11,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(11,30,11,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(11,45,12,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(12,00,12,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(12,15,12,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(12,30,12,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(12,45,13,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(13,00,13,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(13,15,13,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(13,30,13,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(13,45,14,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(14,00,14,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(14,15,14,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(14,30,14,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(14,45,15,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(15,00,15,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(15,15,15,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(15,30,15,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(15,45,16,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(16,00,16,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(16,15,16,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(16,30,16,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(16,45,17,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(17,00,17,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(17,15,17,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(17,30,17,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(17,45,18,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(18,00,18,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(18,15,18,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(18,30,18,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(18,45,19,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(19,00,19,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(19,15,19,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(19,30,19,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(19,45,20,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(20,00,20,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(20,15,20,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(20,30,20,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(20,45,21,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(21,00,21,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(21,15,21,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(21,30,21,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(21,45,22,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(22,00,22,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(22,15,22,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(22,30,22,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(22,45,23,00,"PALTOBURGHOFF_3");

	TA_Sleep	(23,00,06,00,"PALTOBURGLINKSOBEN_48");

	TA_Smith_Fire	(06,00,06,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(06,15,06,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(06,30,06,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(06,45,07,00,"PALTOBURGHOFF_3");

	TA_Smith_Fire	(07,00,07,15,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(07,15,07,30,"PALTOBURGHOFF_3");
	TA_Smith_Fire	(07,30,07,45,"PALTOBURGHOFF_3");
	TA_Smith_Anvil	(07,45,08,00,"PALTOBURGHOFF_3");
};

FUNC VOID Rtn_Aufstellung_1027 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_1027 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};