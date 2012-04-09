INSTANCE Mod_7415_OUT_Axon_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Axon";
	guild 		= GIL_OUT;
	id 			= 7415;
	voice 		= 6;
	flags       = 0;	//Joly: NPC_FLAG_IMMORTAL	wegen Kapitel 3 Schmied der das Auge Innos repariert!		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Chemo);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_CoolPock, BodyTex_N, ITAR_VLK_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 40); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7415;
};

FUNC VOID Rtn_Start_7415 ()
{	
	TA_Sit_Throne	(07,00,22,00,"REL_CITY_321");
	TA_Sleep	(22,00,07,00,"REL_CITY_321"); 
};

FUNC VOID Rtn_VorStadt_7415 ()
{	
	TA_Stand_ArmsCrossed	(07,00,22,00,"REL_CITY_001");
	TA_Stand_ArmsCrossed	(22,00,07,00,"REL_CITY_001"); 
};

FUNC VOID Rtn_Guide_7415 ()
{	
	TA_Guide_Player	(07,00,22,00,"REL_SURFACE_117");
	TA_Guide_Player	(22,00,07,00,"REL_SURFACE_117"); 
};

FUNC VOID Rtn_Bug_7415 ()
{	
	TA_Guide_Player	(07,00,22,00,"REL_SURFACE_120");
	TA_Guide_Player	(22,00,07,00,"REL_SURFACE_120"); 
};

FUNC VOID Rtn_Pause_7415 ()
{	
	TA_Smoke_Joint	(07,00,22,00,"REL_SURFACE_120");
	TA_Smoke_Joint	(22,00,07,00,"REL_SURFACE_120"); 
};