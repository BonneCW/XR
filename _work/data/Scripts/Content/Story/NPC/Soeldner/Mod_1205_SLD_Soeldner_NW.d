instance Mod_1205_SLD_Soeldner_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_SOELDNER; 
	guild 		= GIL_mil;
	id 			= 1205;
	voice		= 0;
	flags       = 2;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_nw_soeldner;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------		
	EquipItem	(self, ItMw_GrobesKurzschwert);
	EquipItem			(self, ItRw_Sld_Bow);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Gomez, BodyTex_N, ITAR_SLD_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1205;
};

FUNC VOID Rtn_Start_1205 ()
{
	TA_Smalltalk		(07,30,23,30,"NW_BIGFARM_PATH_04_1");
	TA_Sleep			(23,30,07,30,"NW_BIGFARM_HOUSE_08");
};

FUNC VOID Rtn_Dung_1205 ()
{
	TA_Sleep		(07,30,23,30,"NW_BIGFARM_HOUSE_08");
	TA_Sleep		(23,30,07,30,"NW_BIGFARM_HOUSE_08");
};

FUNC VOID Rtn_Hexen_1205()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_1205()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Knucker_1205()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};

FUNC VOID Rtn_Daemonisch_1205()
{
	TA_Stand_WP		(08,00,20,00,"WP_SOELDNER_DAEMONISCH_TOT");
	TA_Stand_WP		(20,00,08,00,"WP_SOELDNER_DAEMONISCH_TOT");
};