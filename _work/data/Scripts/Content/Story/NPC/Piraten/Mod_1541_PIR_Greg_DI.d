instance Mod_1541_PIR_Greg_DI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Greg";
	guild 		= GIL_out;
	id 			= 1541;
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
	daily_routine 		= Rtn_Start_1541;
};

FUNC VOID Rtn_Start_1541 ()
{
	TA_Stand_Guarding		(22,00,12,00,"WP_DI_GREGWARTETAUFHERO");
	TA_Stand_Guarding		(12,00,22,00,"WP_DI_GREGWARTETAUFHERO");
};

FUNC VOID Rtn_Skelett_1541 ()
{	
	TA_Follow_Player (06,00,14,00,"WP_DI_HOEHLE_RITUAL");
	TA_Follow_Player (14,00,06,00,"WP_DI_HOEHLE_RITUAL");
};

FUNC VOID Rtn_Circle_1541 ()
{	
	TA_Stand_ArmsCrossed (06,00,14,00,"WP_DI_HOEHLE_RITUAL_GREG");
	TA_Stand_ArmsCrossed (14,00,06,00,"WP_DI_HOEHLE_RITUAL_GREG");
};