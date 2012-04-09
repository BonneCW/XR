INSTANCE Mod_7068_DMR_Raven_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Raven";
	guild 		= GIL_DMT;
	id 			= 7068;
	voice 		= 10;
	flags      	= 0;
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
	daily_routine 	= Rtn_Start_7068;
};

FUNC VOID Rtn_Start_7068()
{
	TA_Stand_Guarding		(08,00,20,00,"SPAWN_SIT_OW");
	TA_Stand_Guarding		(20,00,08,00,"SPAWN_SIT_OW");
};

FUNC VOID Rtn_Tot_7068()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};