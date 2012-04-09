instance Mod_910_BAU_Lobart_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lobart";
	guild 		= GIL_OUT;
	id 			= 910;
	voice 		= 5;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Senyan, BodyTex_N, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 20); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_910;
};

FUNC VOID Rtn_Start_910 ()
{	
	TA_Stand_Guarding		(07,30,23,00,"NW_FARM1_LOBART");	
   	TA_Sleep 				(23,00,07,30,"NW_FARM1_INHOUSE_BED_01");
};

FUNC VOID Rtn_DemonWalker_910 ()
{
	TA_Sit_Throne	(08,00,20,00,"NW_FARM1_INHOUSE_03_SIT");
	TA_Sit_Throne	(20,00,08,00,"NW_FARM1_INHOUSE_03_SIT");
};

FUNC VOID Rtn_LobartAlwin_910 ()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"WP_ALWIN_SEQUENZ");
	TA_Smalltalk_Plaudern	(20,00,08,00,"WP_ALWIN_SEQUENZ");
};