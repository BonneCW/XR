instance Mod_781_SLD_Cipher_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cipher";
	guild 		= GIL_MIL;
	id 			= 781;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);														//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_GrobesKurzschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	CreateInvItems (self, ItRw_Arrow, 50);
	CreateInvItems (self, ItRw_Bow_L_02, 1);
	CreateInvItems (self, ItRw_Sld_Bow, 1);
	CreateInvItems (self, ItMw_2H_OrcAxe_01, 1);
	
	CreateInvItems (self, ItLsTorch, 8);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_SLD_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_781;
};

FUNC VOID Rtn_Start_781 ()
{
	TA_Smalltalk	(07,35,10,30,"NC_PATH67");
	TA_Stand_Drinking	(10,30,11,00,"NC_TAVERN_BAR");
	TA_Smalltalk	(11,00,12,00,"NC_PATH67");
	TA_Stand_Eating	(12,00,12,30,"NC_TAVERN_BAR");
	TA_Smalltalk	(12,30,15,00,"NC_PATH67");
	TA_Smoke_Joint	(15,00,15,30,"NC_TAVERN_SIDE01");
	TA_Smalltalk	(15,30,22,00,"NC_PATH67");
	TA_Sleep		(22,00,07,35,"NC_HUT07_IN");			
};

FUNC VOID Rtn_FMC_781 ()
{
	TA_Smalltalk 	(08,00,22,00,"FMC_HUT01_OUT");
	TA_Smalltalk	(22,00,08,00,"FMC_HUT01_OUT");		
};

FUNC VOID Rtn_Aufstellung_781 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_781 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};