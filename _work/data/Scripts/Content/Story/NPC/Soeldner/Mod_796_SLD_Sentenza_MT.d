instance Mod_796_SLD_Sentenza_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sentenza";
	guild 		= GIL_MIL;
	id 			= 796;
	voice 		= 9;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------	
	aivar[AIV_MM_FollowTime] = 60;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Orkschlaechter);

	// ------ Inventory ------
	CreateInvItems (self, itfo_apple, 1); //KEIN Ambient-Inv
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Tough_Okyl, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_796;
};

FUNC VOID Rtn_Start_796 ()
{
	TA_Stand_Eating 	(08,00,22,00,"NC_HUT02_IN");
	TA_Sleep		(22,00,08,00,"NC_HUT02_IN");		
};

FUNC VOID Rtn_WaitForPlayer_796 ()
{
	TA_Stand_Guarding 	(08,00,22,00,"NC_ENTRANCE_WP01");
	TA_Stand_Guarding	(22,00,08,00,"NC_ENTRANCE_WP01");		
};

FUNC VOID Rtn_Wettstreit_796 ()
{
	TA_Stand_WP 	(08,00,22,00,"PATH_WALD_OC_WOLFSPAWN2");
	TA_Stand_WP	(22,00,08,00,"PATH_WALD_OC_WOLFSPAWN2");		
};

FUNC VOID Rtn_Ueberfall_796 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"WP_SENTENZA_BULLCO_CUTSCENE");
	TA_Smalltalk_Plaudern	(22,00,08,00,"WP_SENTENZA_BULLCO_CUTSCENE");		
};