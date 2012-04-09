instance Mod_764_PIR_Greg_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Greg";
	guild 		= GIL_OUT;
	id 			= 764;
	voice 		= 1;
	flags       = 2;															
	npctype		= NPCTYPE_MAIN;

		
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);		 														//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_ToughGuy] = TRUE;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Piratensaebel);
	//EquipItem			(self, ItRw_Bow_H_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_Greg, BodyTex_P, ITAR_PIR_H_Addon);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_764;
};

FUNC VOID Rtn_Start_764 ()
{
	TA_Sit_Bench		(22,00,12,00,"ADW_PIRATECAMP_HUT4_01");
	TA_Sit_Bench		(12,00,22,00,"ADW_PIRATECAMP_HUT4_01");
};

FUNC VOID Rtn_Plaudern_764 ()
{
	TA_Smalltalk_Plaudern		(22,00,12,00,"ADW_PIRATECAMP_HUT4_01");
	TA_Smalltalk_Plaudern		(12,00,22,00,"ADW_PIRATECAMP_HUT4_01");
};

FUNC VOID Rtn_Sammeln_764 ()
{	
	TA_Stand_WP			(08,00,20,00,"ADW_PIRATECAMP_WAY_02");
	TA_Stand_WP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_02");
};

FUNC VOID Rtn_Artefakt_764 ()
{	
	TA_RunToWP			(08,00,20,00,"ADW_PIRATECAMP_WAY_06");
	TA_RunToWP 	(20,00,08,00,"ADW_PIRATECAMP_WAY_06");
};

FUNC VOID Rtn_Beerdigung_764 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_BEACH_13");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"ADW_PIRATECAMP_BEACH_13");
};

FUNC VOID Rtn_Training_764 ()
{
	TA_Sit_Bench		(22,00,12,00,"ADW_PIRATECAMP_HUT4_01");
	TA_Practice_Sword	(12,00,22,00,"ADW_PIRATECAMP_TRAIN_01");
};