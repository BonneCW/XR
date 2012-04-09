instance Mod_7352_OUT_Trador_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Trador";
	guild 		= GIL_DMT;
	id 			= 7352;
	voice 		= 8;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_P_Normal03, BodyTex_P, itar_naturmagier2);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	CreateInvItems	(self, ItSc_SumGol_Fake, 5);
	CreateInvItems	(self, ItRu_SumGol_Fake, 2);

	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7352;
};

FUNC VOID Rtn_Start_7352 ()
{	
    TA_Stand_Guarding	(05,00,21,00,"TUG_09");
    TA_Stand_Guarding	(21,00,05,00,"TUG_09");
};

FUNC VOID Rtn_Tot_7352 ()
{	
    TA_Stand_Guarding	(05,00,21,00,"TOT");
    TA_Stand_Guarding	(21,00,05,00,"TOT");
};

FUNC VOID Rtn_Portal_7352 ()
{	
    TA_Stand_Guarding	(05,00,21,00,"TUG_82");
    TA_Stand_Guarding	(21,00,05,00,"TUG_82");
};