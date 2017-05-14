instance Mod_504_PAL_Parcival_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Parcival";
	guild 		= GIL_OUT;
	id 			= 504;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_Tough_Drago, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 65); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_504;
};

FUNC VOID Rtn_Start_504 ()
{	
	TA_Stand_Guarding	(08,00,21,00,"REL_MOOR_206");
	TA_Stand_Guarding	(21,00,08,00,"REL_MOOR_206");
};

FUNC VOID Rtn_VorKneipe_504 ()
{	
	TA_Smalltalk_Plaudern	(08,00,21,00,"REL_MOOR_141");
	TA_Smalltalk_Plaudern	(21,00,08,00,"REL_MOOR_141");
};

FUNC VOID Rtn_InKneipe_504 ()
{	
	TA_Stand_Drinking	(08,00,21,00,"REL_MOOR_144");
	TA_Stand_Drinking	(21,00,08,00,"REL_MOOR_144");
};

FUNC VOID Rtn_Siedlung_504 ()
{	
	TA_Stand_Guarding	(08,00,21,00,"REL_MOOR_008");
	TA_Stand_Guarding	(21,00,08,00,"REL_MOOR_008");
};