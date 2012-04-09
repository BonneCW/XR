instance Mod_776_NONE_Orlan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Orlan";
	guild 		= GIL_NONE;
	id 			= 776;
	voice 		= 5;
	flags       = 2;	//Joly:bis das Ranger treffen war.																//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_B_Normal_Sharky, BodyTex_B, ITAR_Bau_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_776;
};

FUNC VOID Rtn_Start_776 ()
{	
	TA_Stand_WP		(08,00,22,00,"NW_TAVERNE_IN_04");  
	TA_Stand_WP		(22,00,08,00,"NW_TAVERNE_IN_04");
};

FUNC VOID Rtn_Daemonisch_776 ()
{	
	TA_RunToWP		(08,00,22,00,"WP_TAVERNE_ZIMMER_07");  
	TA_RunToWP		(22,00,08,00,"WP_TAVERNE_ZIMMER_07");
};

FUNC VOID Rtn_Daemonisch2_776 ()
{	
	TA_RunToWP		(08,00,22,00,"NW_TAVERNE_IN_04");  
	TA_RunToWP		(22,00,08,00,"NW_TAVERNE_IN_04");
};

FUNC VOID Rtn_VorTaverne_776 ()
{	
	TA_Stand_WP		(08,00,22,00,"NW_TAVERNE");  
	TA_Stand_WP		(22,00,08,00,"NW_TAVERNE");
};