instance Mod_587_NONE_Jesper_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jesper"; 
	guild 		= GIL_OUT;
	id 			= 587;
	voice 		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_Hotel, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal07, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_587;
};

FUNC VOID Rtn_Start_587()
{	
	TA_Cook_Stove			(07,00,14,00,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne 			(14,00,18,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Cook_Stove			(18,00,21,00,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne 			(21,00,23,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Sleep				(23,00,07,00,"NW_CITY_KANAL_ROOM_05_BED_02");
};

FUNC VOID Rtn_Hehler_587 ()
{	
	TA_Cook_Stove		(07,00,14,00,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne 		(14,00,18,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Cook_Stove		(18,00,21,00,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sit_Throne 		(21,00,23,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Smalltalk		(23,00,04,00,"NW_CITY_HEROLD_02");
	TA_Sleep		(04,00,07,00,"NW_CITY_KANAL_ROOM_05_BED_02");
};

FUNC VOID Rtn_Flucht_587 ()
{	
	TA_FleeToWP	(08,00,22,00,"WP_ASSASSINE_08");
	TA_FleeToWP	(22,00,08,00,"WP_ASSASSINE_08");
};

FUNC VOID Rtn_Tot_587 ()
{	
	TA_RunToWP	(08,00,22,00,"TOT");
	TA_RunToWP	(22,00,08,00,"TOT");
};