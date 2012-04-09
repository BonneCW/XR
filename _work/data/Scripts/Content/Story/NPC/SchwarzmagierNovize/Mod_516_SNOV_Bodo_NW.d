INSTANCE Mod_516_SNOV_Bodo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bodo";
	guild 		= GIL_OUT;
	id 			= 516;
	voice 		= 12;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_1h_SNov_Mace);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal16, BodyTex_N, ITAR_VLK_H);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 25); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_516;
};

FUNC VOID Rtn_Start_516()
{
	TA_Stand_Drinking	(20,00,22,00,"NW_CITY_MERCHANT_PATH_33");
	TA_Sleep		(22,00,06,00,"NW_CITY_HOTEL_BED_07");
	TA_Stand_Eating		(06,00,06,30,"NW_CITY_MERCHANT_PATH_30");
	TA_Sit_Chair		(06,30,12,00,"NW_CITY_TAVERN_IN_08");
	TA_Stand_Eating		(12,00,12,30,"NW_CITY_MERCHANT_PATH_30");
	TA_Stand_WP		(12,30,18,00,"NW_CITY_MAINSTREET_02");
	TA_Stand_Eating		(18,00,18,30,"NW_CITY_MERCHANT_PATH_30");
	TA_Smoke_Waterpipe	(18,30,20,00,"NW_CITY_RAUCH_02");
};

FUNC VOID Rtn_GuideToErol_516()
{
	TA_Guide_Player		(08,00,20,00,"NW_BIGFARM_HUT_02");
	TA_Guide_Player		(20,00,08,00,"NW_BIGFARM_HUT_02");
};

FUNC VOID Rtn_Tot_516()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};