INSTANCE Mod_7516_OUT_Lukas_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lukas";
	guild 		= GIL_OUT;
	id 			= 7516;
	voice 		= 6;
	flags       = 0;	//Joly: NPC_FLAG_IMMORTAL	wegen Kapitel 3 Schmied der das Auge Innos repariert!		//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------				

	
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
	daily_routine 		= Rtn_Start_7516;
};

FUNC VOID Rtn_Start_7516 ()
{
	TA_Repair_Hut		(08,00,20,00,"REL_CITY_372");
	TA_Sleep		(20,00,08,00,"REL_CITY_229"); 
};

FUNC VOID Rtn_Theodorus_7516 ()
{
	TA_RunToWP		(08,00,20,00,"REL_CITY_107");
	TA_RunToWP		(20,00,08,00,"REL_CITY_107"); 
};

FUNC VOID Rtn_Stadthalter_7516 ()
{
	TA_Sit_Throne	(08,00,23,00,"RATHAUSUNENTBURGERMEISTER");
	TA_Pick_FP	(23,00,02,00,"REL_CITY_255");
	TA_Sit_Chair	(02,00,08,00,"REL_CITY_026");
};

FUNC VOID Rtn_Andre_7516 ()
{
	TA_Sit_Chair	(08,00,23,00,"REL_CITY_026");
	TA_Sit_Chair	(23,00,08,00,"REL_CITY_026");
};