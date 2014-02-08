INSTANCE Mod_115_NONE_Eremit_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Eremit";
	guild 		= GIL_OUT;
	id 			= 115;
	voice 		= 4;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Nagelknueppel);
		
	// ------ Inventory ------

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_BaalNetbek, BodyTex_N, NO_ARMOR);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_115;
};

FUNC VOID Rtn_Start_115 ()
{	
	TA_Sit_Bench  	(07,00,09,00,"ADW_VALLEY_BENCH");
	TA_Cook_Pan 	(09,00,11,00,"ADW_VALLEY_BENCH");
	TA_Stand_Eating (11,00,13,00,"ADW_VALLEY_BENCH"); 
	TA_Sit_Bench  	(13,00,15,00,"ADW_VALLEY_BENCH");
	TA_Cook_Pan 	(15,00,17,00,"ADW_VALLEY_BENCH");
	TA_Stand_Eating (17,00,19,00,"ADW_VALLEY_BENCH"); 
	TA_Sit_Bench  	(19,00,01,00,"ADW_VALLEY_BENCH");
	TA_Sleep 	(01,00,07,00,"ADW_VALLEY_PATH_031_HUT");
};

FUNC VOID Rtn_AtWMs_115 ()
{	
	TA_Eremit_Kichern  	(19,00,07,00,"WP_TEMPEL_START_EREMIT_07");
	TA_Eremit_Kichern 	(07,00,19,00,"WP_TEMPEL_START_EREMIT_07");
};

FUNC VOID Rtn_Ritualhoehle_115 ()
{	
	TA_Guide_Player  	(19,00,07,00,"ADW_VALLEY_PATH_020_CAVE_05");
	TA_Guide_Player 	(07,00,19,00,"ADW_VALLEY_PATH_020_CAVE_05");
};

FUNC VOID Rtn_Ritual_115 ()
{	
	TA_Circle  	(19,00,07,00,"WP_AW_EREMIT_STATUE");
	TA_Circle 	(07,00,19,00,"WP_AW_EREMIT_STATUE");
};