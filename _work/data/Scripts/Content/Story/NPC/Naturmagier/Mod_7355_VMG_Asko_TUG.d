instance Mod_7355_VMG_Asko_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Asko";
	guild 		= GIL_out;
	id 			= 7355;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 233, BodyTex_P, itar_naturmagier2);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7355;
};

FUNC VOID Rtn_Start_7355 ()
{	
	TA_Sit_Chair		(08,00,10,00,"TUG_46");
	TA_Practice_Magic	(10,00,12,00,"TUG_70");
	TA_Sit_Chair		(12,00,20,00,"TUG_46");
	TA_Sleep		(20,00,08,00,"TUG_53");
};

FUNC VOID Rtn_Studieren_7355 ()
{	
	TA_Study_WP		(08,00,20,00,"TUG_76");
	TA_Study_WP		(20,00,08,00,"TUG_76");
};