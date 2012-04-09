instance Mod_527_SLD_Torlof_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Torlof";
	guild 		= GIL_MIL;
	id 			= 527;
	voice 		= 1;
	flags = 2;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	aivar[AIV_IgnoresArmor] 	= TRUE;


	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, Torlofs_Axt);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Torlof, BodyTex_N, ITAR_SLD_H2);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_527;
};

FUNC VOID Rtn_PreStart_527 ()
{
	TA_Stand_Guarding		(08,00,22,00,"NW_BIGFARM_TORLOF");
	TA_Stand_Guarding		(22,00,08,00,"NW_BIGFARM_TORLOF");
};

FUNC VOID Rtn_Rat_527()
{
	TA_Stand_Guarding		(08,00,20,00,"NW_KDF_LIBRARY_16");
	TA_Stand_Guarding		(20,00,08,00,"NW_KDF_LIBRARY_16");
};

FUNC VOID Rtn_Aufstellung_527()
{
	TA_Stand_WP		(08,00,20,00,"WP_AUFSTELLUNG_09");
	TA_Stand_WP		(20,00,08,00,"WP_AUFSTELLUNG_09");
};

FUNC VOID Rtn_Angriff_527()
{
	TA_RunToWP		(08,00,20,00,"NW_BIGMILL_05");
	TA_RunToWP		(20,00,08,00,"NW_BIGMILL_05");
};

FUNC VOID Rtn_Hexen_527()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_527()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Knucker_527()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};

FUNC VOID Rtn_Dragon_527()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CHAPEL_01");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CHAPEL_01");
};

FUNC VOID Rtn_Tot_527()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};