instance Mod_7385_OUT_August_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "August";
	guild 		= GIL_OUT;
	id 			= 7385;
	voice 		= 13;
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
	
	// ------ Equippte Waffen ------																		//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																				//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Normal_Orik, BodyTex_B, KhorataWache_01);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7385;
};

FUNC VOID Rtn_PreStart_7385 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"REL_CITY_002");
	TA_Stand_Guarding		(22,05,08,05,"REL_CITY_002");
};

FUNC VOID Rtn_Start_7385 ()
{	
	TA_Stand_Guarding		(08,05,22,05,"REL_CITY_357");
	TA_Stand_Guarding		(22,05,08,05,"REL_CITY_357");
};

FUNC VOID Rtn_Fremdgang_7385 ()
{	
	TA_Stand_Guarding		(06,00,22,00,"REL_CITY_357");
	TA_Smalltalk_Fremdgang		(22,00,06,00,"REL_SURFACE_153");
};

FUNC VOID Rtn_Theodorus_7385 ()
{	
	TA_Smalltalk_Plaudern		(06,00,22,00,"REL_CITY_002");
	TA_Smalltalk_Plaudern		(22,00,06,00,"REL_CITY_002");
};