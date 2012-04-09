INSTANCE Mod_528_SLD_Cord_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cord";
	guild 		= GIL_MIL;
	id 			= 528;
	voice 		= 14;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Orkschlaechter);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Cord, BodyTex_N, ITAR_SLD_H);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh‰ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen f¸r Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_528;
};

FUNC VOID Rtn_Start_528 ()
{
	TA_Practice_Sword 	(07,40,22,40,"NW_BIGFARM_CORD");
    TA_Sleep			(22,40,07,40,"NW_BIGFARM_HOUSE_08");
};

FUNC VOID Rtn_Hexen_528()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_528()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Dragon_528()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_SHEEP2_02");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_SHEEP2_02");
};

FUNC VOID Rtn_Hexe_528 ()
{	
	TA_Practice_Sword		(07,30,20,30,"NW_BIGFARM_CORD"); 	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Drained		(20,30,22,00,"NW_BIGFARM_SHEEP2_02");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Stand_Guarding		(22,00,05,00,"NW_BIGFARM_CORD");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
    TA_Drained		(05,00,07,30,"NW_BIGFARM_SHEEP2_02");	//Joly: muﬂ hier tag und nacht stehen!!!!!!!!!!!!!
};

FUNC VOID Rtn_Schiff_528 ()
{
	TA_Practice_Sword 	(07,40,22,40,"SHIP_DECK_15");
	TA_Practice_Sword	(22,40,07,40,"SHIP_DECK_15");
};