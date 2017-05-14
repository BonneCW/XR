instance Mod_7451_RIT_Tengron_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Tengron";
	guild 		= GIL_OUT;
	id 			= 7451;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Schwert_03);
	EquipItem			(self, ItRw_Mil_Crossbow_Schmetter);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_ToughBald01, BodyTex_L, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7451;
};

FUNC VOID Rtn_Start_7451 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"SHIP_IN_25");
	TA_Stand_Guarding		(23,00,08,00,"SHIP_IN_25");
};

FUNC VOID Rtn_Follow_7451 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_IN_25");
	TA_Follow_Player	(20,00,08,00,"SHIP_IN_25");
};

FUNC VOID Rtn_Waiting_7451 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};