instance Mod_1031_DMR_Kurgan_OM (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kurgan";
	guild 		= GIL_KDF;
	id 			= 1031;
	voice 		= 1;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItWr_KurganNotiz, 1);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ImportantGrey, BodyTex_N, ITAR_Raven_Addon);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1031;
};

FUNC VOID Rtn_Start_1031()
{
	TA_Stand_Drinking	(23,00,01,00,"OM_CAVE1_47_IAN");
	TA_Stand_Drinking	(01,00,23,00,"OM_CAVE1_47_IAN");	
};

FUNC VOID Rtn_Alarm_1031()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"OM_CAVE1_47");
	TA_Smalltalk_Plaudern	(23,00,08,00,"OM_CAVE1_47");
};