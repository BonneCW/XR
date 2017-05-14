instance Mod_943_GRD_Bloodwyn_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bloodwyn";
	guild 		= GIL_OUT;
	id 			= 943;
	voice		= 0;//Stimme Lee
	flags      	= 2;
	npctype		= NPCTYPE_main;
	
	//aivars
	aivar[AIV_StoryBandit]	= TRUE; 	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_Sturmbringer);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bloodwyn, BodyTex_N, GRD_ARMOR_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_943;
};

FUNC VOID Rtn_Start_943 ()
{
	TA_Stand_Guarding	(06,00,07,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(07,00,08,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(08,00,09,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(09,00,10,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(10,00,11,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(11,00,12,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(12,00,13,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(13,00,14,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(14,00,15,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(15,00,16,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(16,00,17,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(17,00,18,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(18,00,19,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(19,00,20,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(20,00,21,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(21,00,22,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(22,00,23,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(23,00,00,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(00,00,01,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(01,00,02,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(02,00,03,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(03,00,04,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(04,00,05,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(05,00,06,00,"OCR_OUTSIDE_HUT_63");
};

FUNC VOID Rtn_Dieb_943()
{
	TA_Stand_Guarding	(06,00,07,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(07,00,08,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(08,00,09,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(09,00,10,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(10,00,11,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(11,00,12,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(12,00,13,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(13,00,14,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(14,00,15,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(15,00,16,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(16,00,17,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(17,00,18,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(18,00,19,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(19,00,20,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(20,00,21,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(21,00,22,00,"OCR_OUTSIDE_HUT_63");
	
	TA_Stand_Guarding	(22,00,23,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(23,00,00,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(00,00,01,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(01,00,02,00,"OCC_BARONS_HALLWAY_FRONT");
	TA_Pick_FP	(02,00,03,00,"OCC_BARONS_UPSTAIRS_RIGHT_ROOM_FRONT");
	
	TA_Stand_Guarding	(03,00,04,00,"OCR_OUTSIDE_HUT_63");
	TA_Stand_Guarding	(04,00,05,00,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Stand_Guarding	(05,00,06,00,"OCR_OUTSIDE_HUT_63");
};

FUNC VOID Rtn_Flucht_943 ()
{
	TA_FleeToWP		(23,35,08,35,"TOT");
	TA_FleeToWP		(08,35,23,35,"TOT");	
};

FUNC VOID Rtn_knast_943 ()
{
	TA_Sit_Campfire		(23,35,08,35,"OCC_CELLAR_BACK_RIGHT_CELL");
	TA_Sit_Campfire		(08,35,23,35,"OCC_CELLAR_BACK_RIGHT_CELL");	
};

FUNC VOID Rtn_Tot_943 ()
{
	TA_Sit_Campfire		(23,35,08,35,"TOT");
	TA_Sit_Campfire		(08,35,23,35,"TOT");	
};