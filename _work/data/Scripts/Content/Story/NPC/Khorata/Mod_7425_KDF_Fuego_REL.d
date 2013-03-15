instance Mod_7425_KDF_Fuego_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fuego";
	guild 		= GIL_OUT;
	id 			= 7425;
	voice 		= 32;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																				//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Gilbert, BodyTex_P, ITAR_KDF_h);			
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7425;
};

FUNC VOID Rtn_Start_7425 ()
{	
	TA_Stand_Guarding_WP		(08,05,22,05,"REL_CITY_272");
	TA_Stand_Guarding_WP		(22,05,08,05,"REL_CITY_272");
};

FUNC VOID Rtn_Tot_7425 ()
{	
	TA_Sit_Throne		(08,00,20,00,"TOT");
	TA_Sit_Throne		(20,00,08,00,"TOT");
};