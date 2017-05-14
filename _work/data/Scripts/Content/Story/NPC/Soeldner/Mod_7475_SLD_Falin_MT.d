instance Mod_7475_SLD_Falin_MT (Npc_Default) //Türwache Onars Haus
{
	// ------ NSC ------
	name 		= "Falin"; 
	guild 		= GIL_OUT;
	id 			= 7475;
	voice		= 0;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------		
	EquipItem	(self, ItMw_GrobesKurzschwert);
	EquipItem			(self, ItRw_Sld_Bow);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Normal01, BodyTex_P, ITAR_SLD_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7475;
};

FUNC VOID Rtn_Start_7475 ()
{
	TA_Stand_Guarding		(08,00,22,00,"WP_MT_JAEGERLAGER_05");
	TA_Stand_Guarding		(22,00,08,00,"WP_MT_JAEGERLAGER_05");		
};

FUNC VOID Rtn_Lager_7475()
{
	TA_Stand_WP		(08,00,20,00,"WP_MT_JAEGERLAGER_04");
	TA_Stand_WP		(20,00,08,00,"WP_MT_JAEGERLAGER_04");
};

FUNC VOID Rtn_Tot_7475()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};