instance Mod_7357_VMG_Dean_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dean";
	guild 		= GIL_out;
	id 			= 7357;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBald, BodyTex_P, ItAr_Naturmagier2);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7357;
};

FUNC VOID Rtn_Start_7357 ()
{	
	TA_Sleep		(05,00,23,00,"TUG_53");
	TA_Sleep		(23,00,05,00,"TUG_53");
};

FUNC VOID Rtn_Ermordet_7357 ()
{	
	TA_Sleep		(05,00,23,00,"TUG_82");
	TA_Sleep		(23,00,05,00,"TUG_82");
};