instance Mod_784_SLD_Fester_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fester";
	guild 		= GIL_MIL;
	id 			= 784;
	voice 		= 5;
	flags       = 2;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND; //weil sonst FK-Waffe zu "Steck die Waffe weg" führt, wenn Fester mit dir losgeht (kein Partymember!)
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItMw_GrobesKurzschwert);
	EquipItem (self, ItRw_Sld_Bow);
	CreateInvItems (self, itrw_arrow, 10);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart05, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	// guter Bogenkämpfer
	B_AddFightSkill (self, NPC_TALENT_BOW, 30); //ADD!!!
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_784;
};

FUNC VOID Rtn_Start_784 ()
{
	TA_Stand_Eating 	(05,00,20,00,"NC_P03_TO_P01_01");		
	TA_Sleep 		(20,00,05,00,"NC_HUT19_IN");
};

FUNC VOID Rtn_Strafe_784 ()
{
	TA_Pick_FP 		(06,00,14,00,"NC_PATH80");
	TA_Practice_Sword	(14,00,22,00,"NC_WATERFALL_TOP02");		
	TA_Sleep 		(22,00,06,00,"NC_HUT19_IN");
};

FUNC VOID Rtn_WaitForPlayer_784 ()
{	
	TA_Guide_Player		(08,00,22,00,"OW_PATH_07_21");
    	TA_Guide_Player		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_SmallCave_784 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_24_IN");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_SmokePause_784 ()
{	
	TA_Smoke_Joint		(08,00,22,00,"LOCATION_24_IN");
    	TA_Smoke_Joint		(22,00,08,00,"LOCATION_24_IN");
};

FUNC VOID Rtn_GreatCave_784 ()
{	
	TA_Guide_Player		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Guide_Player		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_Waiting_784 ()
{	
	TA_Stand_WP		(08,00,22,00,"LOCATION_23_CAVE_1_OUT");
    	TA_Stand_WP		(22,00,08,00,"LOCATION_23_CAVE_1_OUT");
};

FUNC VOID Rtn_PotionPause_784 ()
{	
	TA_Potion_Alchemy		(08,00,22,00,"LOCATION_23_CAVE_1_02");
    	TA_Potion_Alchemy		(22,00,08,00,"LOCATION_23_CAVE_1_02");
};

FUNC VOID Rtn_FollowToCamp_784 ()
{	
	TA_Follow_Player		(08,00,22,00,"OW_PATH_07_21");
    	TA_Follow_Player		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_FleeToCamp_784 ()
{	
	TA_FleeToWP		(08,00,22,00,"OW_PATH_07_21");
    	TA_FleeToWP		(22,00,08,00,"OW_PATH_07_21");
};

FUNC VOID Rtn_FMC_784 ()
{
	TA_Sit_Campfire 	(08,00,22,00,"FMC_PATH08");
	TA_Sit_Campfire		(22,00,08,00,"FMC_PATH08");		
};

FUNC VOID Rtn_Aufstellung_784 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_784 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};