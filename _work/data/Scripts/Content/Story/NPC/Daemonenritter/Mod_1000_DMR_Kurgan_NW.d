instance Mod_1000_DMR_Kurgan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kurgan";
	guild 		= GIL_KDF;
	id 			= 1000;
	voice		= 0;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	attribute[ATR_STRENGTH]	=	100000;																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Sld_Sword);
	EquipItem			(self, ItRw_Crossbow_M_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ImportantGrey, BodyTex_N, ITAR_Raven_Addon);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1000;
};

FUNC VOID Rtn_PreStart_1000()
{
	TA_Smalltalk_Plaudern						(23,00,01,00,"NW_CITY_HABOUR_SMALLTALK_02");
	TA_Smalltalk_Plaudern					(01,00,23,00,"NW_CITY_HABOUR_SMALLTALK_02");	
};

FUNC VOID Rtn_TOT_1000()
{
	TA_Sleep	(08,00,22,00,"TOT");
	TA_Sleep	(22,00,08,00,"TOT");
};

FUNC VOID Rtn_Angebot_1000()
{
	TA_Stand_WP		(08,00,20,00,"NW_CASTLEMINE_TOWER_STAND_02");
	TA_Stand_WP		(20,00,08,00,"NW_CASTLEMINE_TOWER_STAND_02");
};