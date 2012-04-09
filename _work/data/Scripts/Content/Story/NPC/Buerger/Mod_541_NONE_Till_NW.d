instance Mod_541_NONE_Till_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Till";
	guild 		= GIL_OUT;
	id 			= 541;
	voice 		= 3;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Cutter, BodyTex_P, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 0); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_541;
};

FUNC VOID Rtn_PreStart_541 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"NW_FLEEDMT_KAP3");
  	TA_Stand_Guarding		(22,00,08,00,"NW_FLEEDMT_KAP3");
};

FUNC VOID Rtn_Start_541 ()
{	
	TA_Saw			(08,00,22,00,"NW_FARM4_TILL");
  	TA_Sit_Throne		(22,00,08,00,"NW_FARM4_SEKOB");
};

FUNC VOID Rtn_Turnier_541()
{
	TA_RunToWP		(08,00,22,00,"NW_CITY_HABOUR_KASERN_CENTRE_03");
	TA_RunToWP		(22,00,08,00,"NW_CITY_HABOUR_KASERN_CENTRE_03");
};

FUNC VOID Rtn_Daemonisch_541()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_HABOUR_TAVERN01_IN");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_HABOUR_TAVERN01_IN");
};

FUNC VOID Rtn_Daemonisch2_541()
{	
	TA_FleeToWP	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_FleeToWP	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Daemonisch3_541()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_FARM1_BANDITS_CAVE_02");
   	TA_Smalltalk_Plaudern	(20,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Nase_541()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis_541()
{	
	TA_Follow_Player	(08,00,20,00,"NW_CITY_CONNECT_FOREST");
   	TA_Follow_Player	(20,00,08,00,"NW_CITY_CONNECT_FOREST");
};

FUNC VOID Rtn_Assis2_541()
{	
	TA_Pick_FP		(08,00,20,00,"WP_ASSASSINE_08");
   	TA_Pick_FP		(20,00,08,00,"WP_ASSASSINE_08");
};