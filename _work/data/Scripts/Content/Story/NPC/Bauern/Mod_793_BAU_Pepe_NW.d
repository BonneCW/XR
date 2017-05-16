instance Mod_793_BAU_Pepe_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pepe";
	guild 		= GIL_NONE;
	id 			= 793;
	voice 		= 2;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Markus_Kark, BodyTex_N, ITAR_Bau_L);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh‰ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 10); //Grenzen f¸r Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_793;
};

FUNC VOID Rtn_Start_793 ()
{	
	TA_Stand_Eating		(08,00,22,00,"NW_BIGFARM_SHEEP2_02"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Stand_Eating		(22,00,08,00,"NW_BIGFARM_SHEEP2_02");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};

FUNC VOID Rtn_AtHof_793 ()
{	
	TA_FleeToWP		(08,00,22,00,"NW_BIGFARM_KITCHEN_SYLVIO"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_FleeToWP		(22,00,08,00,"NW_BIGFARM_KITCHEN_SYLVIO");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};

FUNC VOID Rtn_SchafeTot_793 ()
{	
	TA_Sit_Chair		(08,00,22,00,"NW_BIGFARM_KITCHEN_SYLVIO"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Sit_Chair		(22,00,08,00,"NW_BIGFARM_KITCHEN_SYLVIO");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};

FUNC VOID Rtn_Hexe_793 ()
{	
	TA_Stand_Eating		(07,30,20,30,"NW_BIGFARM_SHEEP2_02"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Drained		(20,30,22,00,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_Eating		(22,00,05,00,"NW_BIGFARM_SHEEP2_02"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Drained		(05,00,07,30,"NW_BIGFARM_SHEEP2_02");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};

FUNC VOID Rtn_Daemonisch_793 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_CASTLEMINE_TROLL_04_A"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Sit_Campfire		(22,00,08,00,"NW_CASTLEMINE_TROLL_04_A");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};