INSTANCE Mod_525_SLD_Lee_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lee";
	guild 		= GIL_MIL;
	id 			= 525;
	voice		= 0;																		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, Lees_Axt);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Lee, BodyTex_N, ITAR_SLD_H2);		
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_525;
};

FUNC VOID Rtn_Start_525 ()
{
	TA_Stand_Guarding		(08,00,19,00,"NC_DAM2");
	TA_Stand_Guarding		(19,00,22,00,"NC_DAM2");
    	TA_Stand_Guarding		(22,00,08,00,"NC_DAM2");	
};

FUNC VOID Rtn_Gardisten_525 ()
{
	TA_Stand_ArmsCrossed	(20,50,07,10,"OW_PATH_07_21");
	TA_Stand_ArmsCrossed	(07,10,20,50,"OW_PATH_07_21");
};

FUNC VOID Rtn_Ueberfall_525 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"OW_PATH_07_15_CAVE2");
	TA_Smalltalk_Plaudern	(22,00,08,00,"OW_PATH_07_15_CAVE2");		
};