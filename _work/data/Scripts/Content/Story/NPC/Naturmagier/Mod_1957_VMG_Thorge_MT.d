instance Mod_1957_VMG_Thorge_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thorge";
	guild 		= GIL_out;
	id 			= 1957;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																				//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 240, BodyTex_P, itar_naturmagier2);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1957;
};

FUNC VOID Rtn_Start_1957 ()
{	
	TA_Circle		(08,05,22,05,"WP_VK_BOHJANN_PM");
	TA_Circle		(22,05,08,05,"WP_VK_BOHJANN_PM");
};

FUNC VOID Rtn_ATGATE_1957 ()
{	
	TA_Smalltalk	(08,00,20,00,"OW_PATH_176_TEMPELFOCUS2");
	TA_Smalltalk	(20,00,08,00,"OW_PATH_176_TEMPELFOCUS2");
};

FUNC VOID Rtn_FollowPlayer_1957 ()
{	
	TA_Follow_Player	(08,00,20,00,"OW_PATH_176_TEMPELFOCUS4");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_176_TEMPELFOCUS4");
};

FUNC VOID Rtn_TOT_1957 ()
{	
	TA_Smalltalk	(08,00,20,00,"TOT");
	TA_Smalltalk	(20,00,08,00,"TOT");
};