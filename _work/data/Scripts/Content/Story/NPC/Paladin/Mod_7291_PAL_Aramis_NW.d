instance Mod_7291_PAL_Aramis_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Aramis";
	guild 		= GIL_pal;
	id 			= 7291;
	voice		= 0;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
	aivar[AIV_IGNORE_Murder]		= TRUE;																//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 35); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																				//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_pal_h);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7291;
};

FUNC VOID Rtn_Start_7291 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"NW_FARM2_TAVERNCAVE1_02");
	TA_Stand_Guarding		(22,05,08,05,"NW_FARM2_TAVERNCAVE1_02");
};

FUNC VOID Rtn_Lich_7291 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"NW_TROLLAREA_TROLLROCKCAVE_02");
	TA_Stand_Guarding		(22,05,08,05,"NW_TROLLAREA_TROLLROCKCAVE_02");
};

FUNC VOID Rtn_Tot_7291 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"TOT");
	TA_Stand_Guarding		(22,05,08,05,"TOT");
};