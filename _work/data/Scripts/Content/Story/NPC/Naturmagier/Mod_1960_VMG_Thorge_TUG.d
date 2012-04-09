instance Mod_1960_VMG_Thorge_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thorge";
	guild 		= GIL_out;
	id 			= 1960;
	voice 		= 13;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_Partymember] = TRUE;
	
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
	daily_routine 		= Rtn_Start_1960;
};

FUNC VOID Rtn_AtCity_1960 ()
{	
	TA_Cook_Cauldron	(08,00,10,00,"TUG_33");
	TA_Sit_Chair		(10,00,12,00,"TUG_46");
	TA_Cook_Cauldron	(12,00,20,00,"TUG_33");
	TA_Sleep		(20,00,08,00,"TUG_58");
};

FUNC VOID Rtn_Start_1960 ()
{	
	TA_Follow_Player	(08,00,20,00,"START_TUGETTSO");
	TA_Follow_Player	(20,00,08,00,"START_TUGETTSO");
};