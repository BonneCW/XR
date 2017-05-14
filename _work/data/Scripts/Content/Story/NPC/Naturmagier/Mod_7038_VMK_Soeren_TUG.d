instance Mod_7038_VMK_Soeren_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sören";
	guild 		= GIL_OUT;
	id 			= 7038;
	voice		= 0;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Schwert1);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItWr_SoerensPBrief, 1);							
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_Normal03, BodyTex_P, ITAR_Verwandlungskrieger);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7038;
};

FUNC VOID Rtn_PreStart_7038 ()
{	
	TA_Smalltalk		(05,00,21,00,"TUG_03");
	TA_Smalltalk		(21,00,05,00,"TUG_03");
};

FUNC VOID Rtn_Start_7038 ()
{	
    TA_Stand_Guarding	(05,00,21,00,"TUG_09");
    TA_Stand_Guarding	(21,00,05,00,"TUG_09");
};