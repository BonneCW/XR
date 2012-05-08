INSTANCE Mod_566_NONE_Brian_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brian"; 
	guild 		= GIL_PAL;
	id 			= 566;
	voice 		= 27;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B,ITAR_SMITH);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_566;
};

FUNC VOID Rtn_Start_566()
{	
	TA_Smith_Sharp		(07,05,20,35,"NW_CITY_SMITH_SHARP");
	TA_Smalltalk		(20,35,00,25,"NW_CITY_MERCHANT_PATH_14");
    TA_Sleep			(00,25,07,05,"NW_CITY_BED_BRIAN");
};

FUNC VOID Rtn_Daemonisch_566()
{	
	TA_Stand_ArmsCrossed		(07,05,20,35,"NW_CITY_TO_FOREST_04_03");
	TA_Stand_ArmsCrossed		(20,35,07,05,"NW_CITY_TO_FOREST_04_03");
};

FUNC VOID Rtn_Fischer_566()
{	
	TA_Cook_Pan			(07,05,20,35,"NW_CITY_WAY_TO_SHIP_FISCHER_02");
	TA_Smoke_Joint			(20,35,07,05,"NW_CITY_WAY_TO_SHIP_FISCHER_02");
};