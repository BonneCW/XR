instance Mod_1204_SLD_Soeldner_NW (Npc_Default) //Türwache Onars Haus
{
	// ------ NSC ------
	name 		= NAME_SOELDNER; 
	guild 		= GIL_mil;
	id 			= 1204;
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
	daily_routine 		= Rtn_Start_1204;
};

FUNC VOID Rtn_Start_1204 ()
{
	TA_Stand_Guarding				(08,00,22,00,"NW_BIGFARM_HOUSE_OUT_03");
    TA_Stand_Guarding				(22,00,08,00,"NW_BIGFARM_HOUSE_OUT_03");		
};

FUNC VOID Rtn_Hexen_1204()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_1204()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Knucker_1204()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};

FUNC VOID Rtn_Daemonisch_1204()
{
	TA_Stand_Eating		(08,00,20,00,"NW_BIGFARM_KITCHEN_09");
	TA_Stand_Eating		(20,00,08,00,"NW_BIGFARM_KITCHEN_09");
};


