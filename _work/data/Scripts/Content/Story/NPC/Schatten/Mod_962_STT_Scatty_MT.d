instance Mod_962_STT_Scatty_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Scatty";
	guild 		= GIL_OUT;
	id 			= 962;
	voice 		= 1;
	flags      	= 2;
	npctype		= NPCTYPE_main;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Schwert5);
	
	// ------ Inventory ------
	
	CreateInvItems (self,ItMi_GoldNugget_Addon,5);
	CreateInvItems (self,ItPo_Health_03,2);
	
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_L_Scatty, BodyTex_L, STT_ARMOR_H);	
	Mdl_SetModelFatness	(self, 1.6);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_962;
};

FUNC VOID Rtn_PreStart_962 ()
{
	TA_Stand_WP		(20,00,08,00,"OCR_MAINGATE_OUTSIDE");
	TA_Stand_WP	(08,00,20,00,"OCR_MAINGATE_OUTSIDE");
}; 

FUNC VOID Rtn_Start_962 ()
{
	TA_Sleep		(00,00,08,00,"OCR_HUT_19");
	TA_Sit_Bench		(08,00,10,00,"OCR_ARENABATTLE_BENCH");
	TA_Smalltalk		(10,00,16,00,"OCR_SMALLTALK_A_OC_ARENA");	// mit ???
	TA_Stand_ArmsCrossed	(16,00,20,00,"OCR_STAND_WETT");
	TA_Stand_Drinking	(20,00,00,00,"OCR_ARENA_01");
}; 

FUNC VOID Rtn_ArenaFight_962 ()
{
	TA_Stand_WP	(20,00,08,00,"OCR_ARENA_01");
	TA_Stand_WP	(08,00,20,00,"OCR_ARENA_01");
}; 

FUNC VOID Rtn_Sabitsch_962 ()
{
	TA_Smoke_Joint		(20,00,08,00,"OCR_CAMPFIRE_I_1");
	TA_Smoke_Joint		(08,00,20,00,"OCR_CAMPFIRE_I_1");
}; 

FUNC VOID Rtn_Sumpflager_962 ()
{
	TA_Stand_Guarding	(20,00,08,00,"WP_MT_SUMPF_TEMPLER_02");
	TA_Stand_Guarding	(08,00,20,00,"WP_MT_SUMPF_TEMPLER_02");
}; 