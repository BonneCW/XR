INSTANCE Mod_7452_SLD_Cord_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cord";
	guild 		= GIL_OUT;
	id 			= 7452;
	voice 		= 14;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Orkschlaechter);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Cord, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7452;
};

FUNC VOID Rtn_Start_7452 ()
{
	TA_Practice_Sword 	(07,40,22,40,"SHIP_DECK_15");
	TA_Practice_Sword	(22,40,07,40,"SHIP_DECK_15");
};

FUNC VOID Rtn_Follow_7452 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_DECK_15");
	TA_Follow_Player	(20,00,08,00,"SHIP_DECK_15");
};

FUNC VOID Rtn_Waiting_7452 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};