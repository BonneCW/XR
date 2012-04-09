instance Mod_798_SLD_Wolf_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wolf";
	guild 		= GIL_MIL;
	id 			= 798;
	voice 		= 8;
	flags       = 2;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_GrobesKurzschwert);
	EquipItem			(self, ItRw_Sld_Bow);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Wolf, BodyTex_N, ITAR_SLD_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_798;
};

FUNC VOID Rtn_Start_798 ()
{
	TA_Sit_Bench				(08,00,22,00,"NW_BIGFARM_PATH_03");
    TA_Stand_Eating 		(22,00,08,00,"NW_BIGFARM_KITCHEN_03");	
};

FUNC VOID Rtn_Aufstellung_798()
{
	TA_Stand_WP		(08,00,20,00,"WP_AUFSTELLUNG_10");
	TA_Stand_WP		(20,00,08,00,"WP_AUFSTELLUNG_10");
};

FUNC VOID Rtn_Angriff_798()
{
	TA_RunToWP		(08,00,20,00,"NW_BIGMILL_05");
	TA_RunToWP		(20,00,08,00,"NW_BIGMILL_05");
};

FUNC VOID Rtn_Hexen_798()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_798()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Knucker_798()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};