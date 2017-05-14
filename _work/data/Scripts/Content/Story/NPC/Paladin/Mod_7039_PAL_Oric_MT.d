instance Mod_7039_PAL_Oric_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Oric";
	guild 		= GIL_PAL;
	id 			= 7039;
	voice		= 0;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Paladinschwert);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Tough_Lee_ähnlich, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 80); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7039;
};

FUNC VOID Rtn_Start_7039 ()
{	
	TA_Smalltalk		(08,00,21,00,"OW_SAWHUT_GREENGOBBO_SPAWN");
	TA_Smalltalk		(21,00,08,00,"OW_SAWHUT_GREENGOBBO_SPAWN");
};

FUNC VOID Rtn_ToVM_7039 ()
{	
	TA_Guide_Player		(08,00,21,00,"OW_PATH_1_16");
	TA_Guide_Player		(21,00,08,00,"OW_PATH_1_16");
};

FUNC VOID Rtn_ToAustausch_7039 ()
{	
	TA_Guide_Player		(08,00,21,00,"WP_INTRO_FALL3");
	TA_Guide_Player		(21,00,08,00,"WP_INTRO_FALL3");
};

FUNC VOID Rtn_AtAM_7039 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"OW_OM_ENTRANCE03");
	TA_Stand_Guarding		(21,00,08,00,"OW_OM_ENTRANCE03");
};

FUNC VOID Rtn_Outdoor_7039()
{
	TA_RunToWP		(08,00,20,00,"SPAWN_SIT_OW");
	TA_RunToWP		(20,00,08,00,"SPAWN_SIT_OW");
};

FUNC VOID Rtn_Drained_7039()
{
	TA_Drained		(08,00,20,00,"SPAWN_SIT_OW");
	TA_Drained		(20,00,08,00,"SPAWN_SIT_OW");
};

FUNC VOID Rtn_Tot_7039()
{
	TA_Drained		(08,00,20,00,"TOT");
	TA_Drained		(20,00,08,00,"TOT");
};