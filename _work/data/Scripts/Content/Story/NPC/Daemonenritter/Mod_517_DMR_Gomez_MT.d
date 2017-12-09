INSTANCE Mod_517_DMR_Gomez_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gomez";
	guild 		= GIL_DMT;
	id 			= 517;
	voice		= 16;
	flags       = 2;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_FRIEND;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Streitaxt2);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Gomez, BodyTex_N, ITAR_RAVEN_ADDON);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_MILITIA.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_517;
};

FUNC VOID Rtn_PreStart_517()
{
	TA_Stand_Guarding		(08,00,20,00,"PALTOBURG_2");
	TA_Stand_Guarding		(20,00,08,00,"PALTOBURG_2");
};

FUNC VOID Rtn_Start_517()
{
	TA_Circle		(08,30,12,00,"PALTOBURGAUSEN1");
	TA_Stand_Eating		(12,00,12,30,"PALTOBURGAUSEN1");
	TA_Practice_Sword	(12,30,18,00,"PALTOBURGAUSEN1");
	TA_Stand_Eating		(18,00,18,30,"PALTOBURGAUSEN1");
	TA_Circle		(18,30,20,00,"PALTOBURGAUSEN1");
	TA_Sleep		(20,00,08,00,"PALTOBURGLINKSOBEN_46");
	TA_Stand_Eating		(08,00,08,30,"PALTOBURGAUSEN1");
};

FUNC VOID Rtn_Rat_517()
{
	TA_Stand_Guarding		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
	TA_Stand_Guarding		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
};

FUNC VOID Rtn_Tot_517()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Angebot_517()
{
	TA_Stand_WP		(08,00,20,00,"NW_CASTLEMINE_TOWER_STAND_02");
	TA_Stand_WP		(20,00,08,00,"NW_CASTLEMINE_TOWER_STAND_02");
};

FUNC VOID Rtn_Aufstellung_517 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_517 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};

FUNC VOID Rtn_Jagd_517()
{
	TA_Guide_Player		(08,00,20,00,"PALTO_25");
	TA_Guide_Player		(20,00,08,00,"PALTO_25");
};

FUNC VOID Rtn_InAL_7067()
{
	TA_Stand_Guarding		(08,00,20,00,"OCC_BARONS_DOOR");
	TA_Stand_Guarding		(20,00,08,00,"OCC_BARONS_DOOR");
};

FUNC VOID Rtn_Outdoor_7067()
{
	TA_RunToWP		(08,00,20,00,"OC_ROUND_20");
	TA_RunToWP		(20,00,08,00,"OC_ROUND_20");
};

FUNC VOID Rtn_Hasenjagd_517()
{
	TA_Hasenjagd		(08,00,20,00,"PALTO_25");
	TA_Hasenjagd		(20,00,08,00,"PALTO_25");
};