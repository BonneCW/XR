instance Mod_760_NONE_Attila_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Attila";
	guild 		= GIL_OUT;
	id 			= 760;
	voice 		= 9;
	flags       = 0;									//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	//---------- Aivars ------------------
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Sturmbringer);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	CreateInvItem (self, ItKe_ThiefGuildKey_MIS);  // Schlüssel zur geheimen Diebesgilde
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough_Santino, BodyTex_L, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 30); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA ------
	daily_routine 		= Rtn_Start_760;
};

FUNC VOID Rtn_Start_760 ()
{	
	TA_Stand_Guarding (04,00,22,00,"NW_CITY_HABOUR_KASERN_HALVOR");	
	TA_Stand_Guarding (22,00,04,00,"NW_CITY_HABOUR_KASERN_HALVOR"); 
};

FUNC VOID Rtn_Flucht_760()
{	
	TA_Schleichen		(07,00,23,00,"NW_CITY_KANAL_ROOM_05_03");
	TA_Schleichen		(23,00,07,00,"NW_CITY_KANAL_ROOM_05_03");
};

FUNC VOID Rtn_Free_760()
{	
	TA_Stand_Eating		(07,00,23,00,"NW_CITY_KANAL_ROOM_05_03");
	TA_Stand_Drinking	(23,00,07,00,"NW_CITY_KANAL_ROOM_05_03");
};

FUNC VOID Rtn_Moechtegern_760()
{	
	TA_Guide_Player		(07,00,23,00,"NW_CITY_HABOUR_KASERN_05_01");
	TA_Guide_Player		(23,00,07,00,"NW_CITY_HABOUR_KASERN_05_01");
};

FUNC VOID Rtn_ToMeldor_760()
{	
	TA_Guide_Player		(07,00,23,00,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	TA_Guide_Player		(23,00,07,00,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
};

FUNC VOID Rtn_ToLager_760()
{	
	TA_Guide_Player		(07,00,23,00,"NW_CITY_KANAL_ROOM_05_03");
	TA_Guide_Player		(23,00,07,00,"NW_CITY_KANAL_ROOM_05_03");
};