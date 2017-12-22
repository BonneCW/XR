instance Mod_7234_OUT_Giselle_NW  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Giselle";
	guild 		= GIL_PAL;
	id 			= 7234;
	voice		= 43;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTexBabe_N, ITAR_VlkBabe_M_6);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7234;
};

FUNC VOID Rtn_Start_7234 ()
{	
	TA_Sleep  	(08,00,22,00,"NW_CITY_SONJA_BED");
	TA_Sleep 		(22,00,08,00,"NW_CITY_SONJA_BED");
};

FUNC VOID Rtn_Laterne_7234 ()
{	
	TA_Sit_Throne  	(08,00,22,00,"NW_CITY_PUFF_THRONE");
	TA_Sit_Throne	(22,00,08,00,"NW_CITY_PUFF_THRONE");
};

FUNC VOID Rtn_Zimmer_7234 ()
{	
	TA_FleeToWP  	(08,00,22,00,"NW_CITY_BROMOR_THRONE");
	TA_FleeToWP	(22,00,08,00,"NW_CITY_BROMOR_THRONE");
};

FUNC VOID Rtn_Galf_7234 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,22,00,"NW_CITY_BROMOR_THRONE");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_BROMOR_THRONE");
};

FUNC VOID Rtn_Knast_7234 ()
{	
	TA_Stand_ArmsCrossed  	(08,00,22,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Stand_ArmsCrossed	(22,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};