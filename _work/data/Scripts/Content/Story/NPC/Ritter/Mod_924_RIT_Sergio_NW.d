instance Mod_924_RIT_Sergio_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sergio";
	guild 		= GIL_OUT;
	id 			= 924;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItPo_Health_02,4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal_Erpresser, BodyTex_N, ITAR_PAL_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_924;
};

FUNC VOID Rtn_Start_924 ()
{
	TA_Pray_Innos  	(08,00,23,00,"NW_MONASTERY_CHAPELL_02");
	TA_Practice_Sword 	(23,00,08,00,"NW_MONASTERY_TRAIN_01");	
};

FUNC VOID Rtn_Dragon_924 ()
{
	TA_Stand_Guarding  	(08,00,23,00,"NW_FOREST_PATH_67");
	TA_Stand_Guarding 	(23,00,08,00,"NW_FOREST_PATH_67");	
};

FUNC VOID Rtn_DragonFight_924 ()
{
	TA_Follow_Player  	(08,00,23,00,"NW_FOREST_TO_DRAGON_07");
	TA_Follow_Player 	(23,00,08,00,"NW_FOREST_TO_DRAGON_07");	
};

FUNC VOID Rtn_AtSee_924 ()
{
	TA_Stand_Guarding  	(08,00,23,00,"NW_LAKE__WATER_02");
	TA_Stand_Guarding 	(23,00,08,00,"NW_LAKE__WATER_02");	
};

FUNC VOID Rtn_AtSee2_924 ()
{
	TA_Sit_Campfire  	(08,00,23,00,"NW_LAKE__WATER_02");
	TA_Sit_Campfire 	(23,00,08,00,"NW_LAKE__WATER_02");	
};