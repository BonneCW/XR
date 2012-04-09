INSTANCE Mod_520_DMR_Raven_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Raven";
	guild 		= GIL_DMT;
	id 			= 520;
	voice 		= 10;
	flags      	= 2;
	npctype		= NPCTYPE_MAIN;
	
	level = 50;
	
	attribute[ATR_STRENGTH] 		= 160; 
	attribute[ATR_DEXTERITY] 		= 50;
	attribute[ATR_MANA_MAX] 		= 100;
	attribute[ATR_MANA] 			= 100;
	attribute[ATR_HITPOINTS_MAX]	= 500;
	attribute[ATR_HITPOINTS] 		= 500;

	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;

	attribute[ATR_MANA_MAX] = 10; //Joly:für die Waffe

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, Rabenrecht);  

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Raven, BodyTex_N, ITAR_Raven_Addon);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_520;
};

FUNC VOID Rtn_Start_520()
{
	TA_Practice_Sword	(08,30,12,00,"PALTOBURG_4");
	TA_Stand_Eating		(12,00,12,30,"PALTOBURG_4");
	TA_Practice_Sword	(12,30,20,00,"PALTOBURG_4");
	TA_Sit_Chair		(20,00,22,30,"PALTOBURGRECHTS_1_4");
	TA_Sleep		(22,30,07,00,"PALTOBURGLINKSOBEN_45");
	TA_Stand_Eating		(07,00,08,30,"PALTOBURG_4");
};

FUNC VOID Rtn_Rat_520()
{
	TA_Stand_Guarding		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
	TA_Stand_Guarding		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_XARDAS");
};

FUNC VOID Rtn_Tot_520()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Aufstellung_520 ()
{
	TA_Smalltalk_Plaudern 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Smalltalk_Plaudern	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_520 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};

FUNC VOID Rtn_Schiff_520()
{
	TA_Stand_Guarding		(08,00,20,00,"SHIP_CREW_04");
	TA_Stand_Guarding		(20,00,08,00,"SHIP_CREW_04");
};