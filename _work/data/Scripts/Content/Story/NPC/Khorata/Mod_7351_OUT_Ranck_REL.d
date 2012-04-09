instance Mod_7351_OUT_Ranck_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ranck";
	guild 		= GIL_OUT;
	id 			= 7351;
	voice 		= 12;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, ITAR_VLK_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 0); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7351;
};

FUNC VOID Rtn_PreStart_7351 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"REL_CITY_110");
  	TA_Stand_ArmsCrossed		(22,00,08,00,"REL_CITY_110");
};

FUNC VOID Rtn_Flee_7351 ()
{	
	TA_FleeToWP		(08,00,22,00,"TOT");
  	TA_FleeToWP		(22,00,08,00,"TOT");
};

FUNC VOID Rtn_TOT_7351 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"TOT");
  	TA_Sleep		(22,00,08,00,"TOT");
};