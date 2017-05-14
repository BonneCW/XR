instance Mod_779_SLD_Bullco_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bullco";
	guild 		= GIL_MIL;
	id 			= 779;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ----- aivars -----
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller]  	= TRUE;
	aivar[AIV_IGNORE_Theft]			= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Drachentoeter);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N, ITAR_DJG_M);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_779;
};

FUNC VOID Rtn_Start_779 ()
{
	TA_Smalltalk	(07,35,10,30,"NC_PATH67");
	TA_Stand_Drinking	(10,30,11,00,"NC_TAVERN_BAR");
	TA_Smalltalk	(11,00,12,00,"NC_PATH67");
	TA_Stand_Eating	(12,00,12,30,"NC_TAVERN_BAR");
	TA_Smalltalk	(12,30,15,00,"NC_PATH67");
	TA_Smoke_Joint	(15,00,15,30,"NC_TAVERN_SIDE01");
	TA_Smalltalk	(15,30,22,00,"NC_PATH67");
	TA_Sleep		(22,00,07,35,"NC_HUT07_IN");			
};

FUNC VOID Rtn_Ueberfall_779 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"WP_SENTENZA_BULLCO_CUTSCENE");
	TA_Smalltalk_Plaudern	(22,00,08,00,"WP_SENTENZA_BULLCO_CUTSCENE");		
};

FUNC VOID Rtn_FMC_779 ()
{
	TA_Smalltalk 	(08,00,22,00,"FMC_HUT01_OUT");
	TA_Smalltalk	(22,00,08,00,"FMC_HUT01_OUT");		
};

FUNC VOID Rtn_Aufstellung_779 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Smalltalk_Plaudern	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_779 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};