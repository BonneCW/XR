instance Mod_7178_VMG_Albert_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Albert";
	guild 		= GIL_out;
	id 			= 7178;
	voice 		= 7;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	aivar[AIV_Partymember] = TRUE;

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 235, BodyTex_L, ITAR_DRUIDEWALDMAGIER);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7178;
};

FUNC VOID Rtn_Start_7178 ()
{	
	TA_Follow_Player		(08,00,23,00,"WP_OCC_257");
    TA_Follow_Player		(23,00,08,00,"WP_OCC_257");
};

FUNC VOID Rtn_TransformToRabbit_7178 ()
{	
	TA_Transform_Albert_Rabbit		(08,00,23,00,"WP_OCC_106");
    TA_Transform_Albert_Rabbit		(23,00,08,00,"WP_OCC_106");
};

FUNC VOID Rtn_Tot_7178 ()
{	
	TA_Stand_Guarding		(08,00,23,00,"TOT");
    TA_Stand_Guarding		(23,00,08,00,"TOT");
};

FUNC VOID Rtn_Rettung_7178 ()
{	
	TA_Rettung_Albert		(08,00,23,00,"WP_OCC_258");
	TA_Rettung_Albert		(23,00,08,00,"WP_OCC_258");
};