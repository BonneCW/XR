INSTANCE Mod_518_SMK_Scar_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Scar";
	guild 		= GIL_KDF;
	id 			= 518;
	voice 		= 10;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, Scars_Schwert);

	
	// ------ Inventory ------
	//B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Scar, BodyTex_N, ITAR_SMK_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 90); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_518;
};

FUNC VOID Rtn_Start_518()
{
	TA_Stand_ArmsCrossed	(08,30,12,00,"PALTOBURG_3");
	TA_Stand_Eating		(12,00,12,30,"PALTOBURG_3");
	TA_Smoke_Joint		(12,30,13,00,"PALTOBURG_3");
	TA_Stand_ArmsCrossed	(13,00,18,00,"PALTOBURG_3");
	TA_Stand_Eating		(18,00,18,30,"PALTOBURG_3");
	TA_Sit_Chair		(18,30,08,00,"PALTOBURGRECHTS_1_2");
	TA_Stand_Eating		(08,00,08,30,"PALTOBURG_3");
};

FUNC VOID Rtn_Aufstellung_518 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_518 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};