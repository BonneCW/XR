instance Mod_1953_EIS_Gellit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gellit";
	guild 		= GIL_OUT;
	id 			= 1953;
	voice 		= 3;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars -------
	aivar[AIV_ToughGuyNewsOverride] = TRUE; //wegen Stimme!
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_SharpSchwert);
	EquipItem			(self, ItRw_Sld_Bow);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", 183, BodyTex_N, ITAR_Eisgebiet_Miliz);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 60); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1953;
};

FUNC VOID Rtn_PreStart_1953 ()
{
	TA_Stand_Guarding			(08,00,22,00,"EIS_40");
 	TA_Stand_Guarding			(22,00,08,00,"EIS_40");		
};

FUNC VOID Rtn_Start_1953 ()
{
	TA_Stand_Guarding			(08,00,22,00,"EIS_42");
 	TA_Stand_Guarding			(22,00,08,00,"EIS_41");		
};